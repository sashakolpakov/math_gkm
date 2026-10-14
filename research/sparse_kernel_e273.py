"""Machine-authored exact sparse fourth-difference numerator decomposition."""
from pathlib import Path
import json
class P(dict):
 def __add__(a,b):
  b=b if isinstance(b,P) else P({(0,)*6:b});d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+(-b)
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  b=b if isinstance(b,P) else P({(0,)*6:b});d=P()
  for k,v in a.items():
   for l,w in b.items():
    m=tuple(x+y for x,y in zip(k,l));d[m]=d.get(m,0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  b=P({(0,)*6:1})
  for _ in range(n):b=b*a
  return b
def fmt(p,names):
 return ' + '.join(str(v)+''.join('*'+x+('^'+str(i) if i>1 else '') for x,i in zip(names,k) if i) for k,v in sorted(p.items())) or '0'
N,c,r,q,x,z=[P({tuple(int(i==j) for i in range(6)):1}) for j in range(6)]
raw=json.loads(Path('evidence/markov-e27336bc/kernels.json').read_text())
def H(N,x,z):return eval(raw['H'].replace('^','**'),{'__builtins__':{}},dict(N=N,x=x,z=z))
def K(N,x,z):return eval(raw['twiceK'].replace('^','**'),{'__builtins__':{}},dict(N=N,x=x,z=z))
d=1-x;h=H(N,x,z);hh=H(N+1,x,z*x);k=K(N,x,z);kk=K(N+1,x,z*x);b=2*(x-z);e=2*z*d
p=(c-r)*k+r*kk+((c-r)*h+r*hh)**2-((c-r)*h*h+r*hh*hh)+2*((x-1)*d**3*(c*b+r*e)+x*d*d*(c*b*b+2*r*b*e+q*e*e))-2*(1+x)*d*d*((c-r)*h+r*hh-(1+x)*d*d)
groups={}
for (nn,cc,rr,qq,xx,zz),v in p.items():groups.setdefault((zz,xx),{})[(nn,cc,rr,qq)]=v
rec=dict(status='Exact symbolic decomposition, separately checked in Lean',groups={str(k):fmt(v,['N','c','r','q']) for k,v in sorted(groups.items())})
Path('evidence/markov-e27336bc/sparse-kernel.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
s='''import MarkovSecondKernelE273
/-! Machine-authored e27336bc. Sparse fourth-difference numerator and a
fixed-length exact coefficient formula for every non-Pell source second slice. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
'''
for (a,b),p in sorted(groups.items()):s+=f'def sparse{a}{b}E273 (N c r q : ℤ) := {fmt(p,["N","c","r","q"])}\n'
s+='\ndef sparseKernelE273 (n c r : ℕ) : ℤ[X] :=\n '
s+=' +\n '.join(f'C (sparse{a}{b}E273 n c r (2*r-c:ℕ))*X^({a}*(n+1)+{b})' for a,b in sorted(groups))
s+='''

theorem secondKernel_sparseE273 (n c r : ℕ) :
 secondKernelE273 n c r (2*r-c:ℕ) X (X^(n+1))=sparseKernelE273 n c r := by
 unfold secondKernelE273 sparseKernelE273
 dsimp [hKernelE273,kKernelE273,cKernelE273,dKernelE273]
 simp only [SPARSEDEFS]
 push_cast
 simp only [map_add,map_mul,map_pow,map_neg,map_ofNat,map_natCast,map_one,map_zero]
 simp only [pow_add,pow_mul]
 ring

def chooseShiftE273 (j k : ℕ) : ℤ :=
 if k≤j then (Nat.choose (3+(j-k)) 3:ℤ) else 0
def fourthReadE273 (p : ℤ[X]) (j : ℕ) : ℤ :=
 PowerSeries.coeff j ((PowerSeries.mk (fun n => (Nat.choose (3+n) 3:ℤ)))*
   (p:PowerSeries ℤ))
theorem fourthRead_addE273 (p q : ℤ[X]) (j : ℕ) :
 fourthReadE273 (p+q) j=fourthReadE273 p j+fourthReadE273 q j := by
 simp [fourthReadE273,mul_add]
theorem fourthRead_monomialE273 (a : ℤ) (k j : ℕ) :
 fourthReadE273 (C a*X^k) j=a*chooseShiftE273 j k := by
 simp only [fourthReadE273,Polynomial.coe_mul,Polynomial.coe_C,
   Polynomial.coe_pow,Polynomial.coe_X,← mul_assoc,
   PowerSeries.coeff_mul_X_pow',PowerSeries.coeff_mul_C,PowerSeries.coeff_mk]
 unfold chooseShiftE273
 split_ifs <;> ring

theorem fourthRead_clearE273 (p q : ℤ[X]) (h : (1-X)^4*p=q) (j : ℕ) :
 p.coeff j=fourthReadE273 q j := by
 rw [coeff_of_fourth_differenceE273 p q h j]
 simp [fourthReadE273,PowerSeries.coeff_mul]

def secondExplicitE273 (n c r j : ℕ) : ℤ :=
 EXPLICIT + if c=2 ∧ j=2*n+3 then 2 else 0

theorem secondCompressed_explicitE273 (n c r j : ℕ) :
 (secondCompressed446 n c r).coeff j=secondExplicitE273 n c r j := by
 have he := secondKernel_clearE273 n c r
 rw [secondKernel_sparseE273] at he
 have hh := fourthRead_clearE273 _ _ he j
 rw [fourthRead_addE273] at hh
 have hc : fourthReadE273 (if c=2 then 2*X^(2*n+3)*(1-X)^4 else 0) j=
   if c=2 ∧ j=2*n+3 then 2 else 0 := by
   by_cases h2 : c=2
   · rw [if_pos h2]
     have he' : (1-X)^4*(2*X^(2*n+3):ℤ[X])=2*X^(2*n+3)*(1-X)^4 := by ring
     rw [← fourthRead_clearE273 _ _ he' j]
     simp [h2,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]
   · simp [h2,fourthReadE273]
 rw [hc] at hh
 simpa only [sparseKernelE273,secondExplicitE273,fourthRead_addE273,
   fourthRead_monomialE273] using hh

theorem source_second_explicitE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2) :
 2*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 secondExplicitE273 n (frame rest).mid.b (frame rest).mid.a j := by
 rw [source_second_raw_compressed446 n rest i j hij,secondCompressed_explicitE273]

#print axioms secondKernel_sparseE273
#print axioms secondCompressed_explicitE273
#print axioms source_second_explicitE273
end
end MathGKM.Markov
'''.replace('SPARSEDEFS',','.join(f'sparse{a}{b}E273' for a,b in sorted(groups))).replace('EXPLICIT',' +\n '.join(f'sparse{a}{b}E273 n c r (2*r-c:ℕ)*chooseShiftE273 j ({a}*(n+1)+{b})' for a,b in sorted(groups)))
Path('research/MarkovSparseKernelE273.lean').write_text(s)
