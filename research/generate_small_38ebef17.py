"""Machine-authored fixed-run quotient certificates and source adapters."""
from pathlib import Path
from fractions import Fraction
import json,sys
R=Path('/Users/sasha/math_gkm');D=R/'research';O=R/'evidence/markov-38ebef17'
data=json.loads((O/'small-run-candidates.json').read_text())['rows']
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
head='/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 16000000\nset_option maxRecDepth 65536\nset_option linter.unusedSimpArgs false\n'
end='end\nend MathGKM.Markov\n'
def horner(p,names):
 if not p:return '0'
 if not names:
  v=sum(p.values());assert v.denominator==1;return str(v.numerator) if v>=0 else '('+str(v.numerator)+')'
 groups={}
 for k,v in p.items():groups.setdefault(k[0],{})[k[1:]]=v
 m=max(groups);s=horner(groups[m],names[1:])
 for k in reversed(range(m)):
  t=horner(groups.get(k,{}),names[1:]);s=f'({s}*{names[0]} + {t})' if t!='0' else f'({s}*{names[0]})'
 return s
def expr(rows):return horner({tuple(k):Fraction(v) for k,v in rows},['c','r'])
def save(m,s):
 p=D/f'{m}.lean';assert not p.exists();p.write_text(s)
def generate(row):
 n,ch=row['n'],row['chamber'];tag=f'{n}_{ch}M38E';m=f'MarkovSmallQuot{tag}';qs=row['quotient'];d=max(j for j,v in enumerate(qs) if v)
 q=f'smallValue{tag}';p=f'smallPoly{tag}';identity=f'small_identity{tag}';co=f'small_coeff{tag}'
 s=f'import MarkovFullSourceChamber{ch}M06\n'+head
 s+=f'\ndef {q} (c r : ℤ) (j : ℕ) : ℤ :=\n match j with\n'+''.join(f' | {j} => {expr(v)}\n' for j,v in enumerate(qs[:d+1]))+' | _ => 0\n'
 s+=f'\ndef {p} (c r : ℤ) : ℤ[X] :=\n '+' + '.join(f'C ({q} c r {j})*X^{j}' for j in range(d+1))+'\n'
 defs=[f'chamberNumerator{ch}FA','fullH0FA','fullH1FA']+[f'runH0n{k}FA' for k in range(5)]+[f'runH1n{k}FA' for k in range(4)]+[f'chamberH{ch}{k}FA' for k in range(2,5)]+[p,q]
 s+=f'\ntheorem {identity} (c r : ℤ) :\n chamberNumerator{ch}FA ({n}:ℤ[X]) (X^{n}) (C c) (C r) X =\n (1-X)^8*{p} c r := by\n unfold '+ ' '.join(defs)+'\n simp only [map_add,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]\n ring\n'
 s+=f'\ntheorem {co} (c r : ℤ) (j : ℕ) : ({p} c r).coeff j={q} c r j := by\n simp only [{p},Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]\n by_cases hj : j≤{d}\n · interval_cases j <;> norm_num [{q}]\n · have h : ∀ k, k≤{d} → j≠k := by omega\n   simp only ['+','.join(f'if_neg (h {k} (by omega))' for k in range(d+1))+',zero_add]\n   unfold '+q+'\n   split <;> omega\n'
 (a,b),(u,v)=bounds[ch:ch+2]
 s+=f'\ntheorem source_small_coeff{tag} (rest : List Bool)\n (hc : 5≤(frame rest).mid.b) (hl : {a}*(frame rest).mid.b<{b}*(frame rest).mid.a)\n (hu : {v}*(frame rest).mid.a<{u}*(frame rest).mid.b) (i j : ℕ)\n (hs : i+j=(frame (List.replicate {n} true++false::rest)).mid.a+4) :\n 24*coeff (frame (List.replicate {n} true++false::rest)).mid.p i j=\n {q} (frame rest).mid.b (frame rest).mid.a j := by\n have h := source_fourth_chamber{ch}_clearedM06 {n} rest hc hl hu\n have hid := {identity} ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ)\n simp only [C_eq_natCast] at hid\n norm_num only [Nat.cast_zero,Nat.cast_one,Nat.cast_ofNat] at h\n rw [hid] at h\n have hn : (1-(X:ℤ[X]))^8≠0 := by\n  apply pow_ne_zero\n  intro he\n  have he1 := congrArg (fun p : ℤ[X] => p.coeff 1) he\n  norm_num [Polynomial.coeff_one] at he1\n have he := mul_left_cancel₀ hn h\n have hh := congrArg (fun p : ℤ[X] => p.coeff j) he\n simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs,{co}] using hh\n'
 s=s.replace(f"chamberNumerator{ch}FA", f"chamberNumerator{ch}M06") if ch>=2 else s
 for k in range(2,5):
  s=s.replace(f"chamberH{ch}{k}FA",f"chamberHM06{ch}{k}FA") if ch>=2 else s
 save(m,s+end)
 return m
if __name__=='__main__':
 rows=data if len(sys.argv)==1 else [row for row in data if row['n']==int(sys.argv[1]) and row['chamber']==int(sys.argv[2])]
 print([generate(row) for row in rows])
