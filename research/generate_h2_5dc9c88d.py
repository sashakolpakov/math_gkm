"""Machine-authored explicit reflected H2 correction; generated identities checked by Lean."""
from pathlib import Path
from math import comb
import re,json
from rational_third_bdee import P,N,Z,C,Rr,Q,T,U,X,coerce,serialize
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-5dc9c88d'
src=(D/'MarkovFullCoeff2FA.lean').read_text().split(' : A :=\n',1)[1].split('\ntheorem',1)[0]
p=eval(src.replace('^','**'),{'__builtins__':{}},dict(N=N,C=C,R=Rr,Q=Q,T=T,U=U,x=X))
parts=[P() for _ in range(11)]
for ks,v in p.items():
 d=13-ks[7];assert 0<=d<=10 and ks[1]==ks[5]==ks[6]==0
 k=list(ks);k[7]=0;parts[d][tuple(k)]=v
def expr(p):
 terms=[]
 for ks,v in sorted(p.items()):
  assert v.denominator==1
  fs=[str(v.numerator)]
  for x,k in zip(['n','z','c','r','q','t','u','x'],ks):
   if k:fs.append(x if k==1 else f'{x}^{k}')
  terms.append('*'.join(fs))
 return ' + '.join(terms) or '0'
args='n c r q'
part=lambda d:f'h2Part{d}M5DC {args}'
s='import MarkovMiddleCorrectedM5DC\n/-! Machine-authored request 5dc9c88d. Explicit correction identities, not inequalities. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 32768\nset_option linter.unusedSimpArgs false\n'
for d,p in enumerate(parts):s+=f'\ndef h2Part{d}M5DC ({args} : ℤ) : ℤ :=\n {expr(p)}\n'
s+='\ndef h2PolyM5DC (n c r q : ℤ) : ℤ[X] :=\n '+' + '.join(f'Polynomial.C ({part(d)})*X^{d}' for d in range(11))+'\n'
s+='\ntheorem h2_reflectM5DC (n c r q t u : ℤ) :\n reflect 13 (fullH2FA (n:ℤ[X]) c r q t u X)=h2PolyM5DC n c r q := by\n have he : fullH2FA (n:ℤ[X]) c r q t u X='+' + '.join(f'Polynomial.C ({part(d)})*X^{13-d}' for d in range(11))+' := by\n  simp only [fullH2FA,'+','.join(f'h2Part{d}M5DC' for d in range(11))+',map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_zero,map_one,Polynomial.C_eq_intCast]\n  rw ['+', '.join(f'show Polynomial.C {x}=({x}:ℤ[X]) from Polynomial.C_eq_intCast {x}' for x in ['n','c','r','q'])+']\n  ring\n rw [he]\n simp only [reflect_add,reflect_C_mul_X_pow]\n norm_num [revAt,h2PolyM5DC]\n'
cor=[]
for k in range(1,6):
 c=coerce(0)
 for d in range(6-k):c+=5040*comb(12-k-d,7)*parts[d]
 cor.append(c)
 s+=f'\ndef h2Corr{k}M5DC (n c r q : ℤ) : ℤ :=\n {expr(c)}\n'
 s+=f'\ntheorem h2_conv{k}M5DC (n c r q : ℤ) :\n 5040*convSevenK0B (h2PolyM5DC n c r q) {5-k}=h2Corr{k}M5DC n c r q := by\n unfold h2PolyM5DC\n simp only [convSeven_addK0B,convSeven_monomialK0B]\n norm_num [chooseShiftSevenK0B,Nat.choose]\n simp only [h2Corr{k}M5DC,'+','.join(f'h2Part{d}M5DC' for d in range(11))+']\n ring\n'
 s+=f'\ntheorem middleCorrection_onset{k}M5DC (n c r : ℕ) :\n middleCorrectionM5DC n c r (2*n+{k})=h2Corr{k}M5DC n c r ((2*r-c:ℕ):ℤ) := by\n unfold middleCorrectionM5DC\n rw [if_pos (by omega : 2*n+{k}≤2*n+5),show 2*n+5-(2*n+{k})={5-k} by omega]\n have h := h2_reflectM5DC (n:ℤ) (c:ℤ) (r:ℤ) ((2*r-c:ℕ):ℤ)\n  ((min (c-r) (3*r-c):ℕ):ℤ) ((3*r-2*c:ℕ):ℤ)\n simp only [Int.cast_natCast] at h\n rw [h]\n exact h2_conv{k}M5DC n c r ((2*r-c:ℕ):ℤ)\n'
s+='end\nend MathGKM.Markov\n'
f=D/'MarkovH2CorrectionM5DC.lean';assert not f.exists();f.write_text(s)
(O/'h2-polynomials.json').write_text(json.dumps(dict(parts=[serialize(p) for p in parts],corrections=[serialize(p) for p in cor],status='Generated candidates; Lean receipts determine acceptance'),indent=2)+'\n')
print('Generated explicit H2 reflection and five correction bridges')
