"""Machine-authored terminal coefficient bridges; generated proofs require Lean validation."""
from pathlib import Path
out='''import MarkovTerminalExtractE2
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000
'''
for ch in ['lo','mid','hi']:
 for k in range(4 if ch=='hi' else 3):
  off=k+2;tail='low' if ch=='lo' else 'high'
  hyps='(hlo : 2*r ≤ c) (hhi : c ≤ 3*r)' if ch=='lo' else ('(hlo : c ≤ 2*r) (hhi : 3*r ≤ 2*c)' if ch=='mid' else '(hlo : r ≤ c) (hhi : 2*c ≤ 3*r)')
  out+=f'''theorem terminal_{ch}_coeff{k}E2 (n c r : ℕ) (hn : 3 ≤ n) (hc : c ≠ 2)
 {hyps} :
 terminal{ch}{k}E2 c r=15*(thirdRunPolyADB2 n c r).coeff (3*n+{off}) := by
'''
  if k<2:
   out+=f''' have he := tail_{tail}_run_coeff53D n c r (3*n+{off}) hc (by omega) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+{off}:ℕ)={1-k} := by omega
 rw [hk,terminal_{ch}_{k}_formulaE2] at he
 exact he
'''
  else:
   out+=f''' have he := extract_four_bandsE2 n c r (3*n+{off}) hc (by omega)
 have hs := tail_{tail}_seriesE2 n c r (3*n+{off}) (by omega) (by omega)
 have hk : 3*(n:ℤ)+3-(3*n+{off}:ℕ)={1-k} := by omega
 have hj : 3*n+{off}-(3*n+4)={k-2} := by omega
 rw [hk] at hs
 rw [hj,fourth_series{k-2}E2] at he
 have hg := terminal_{ch}_{k}_formulaE2 (c:ℤ) r
'''
   q='0' if ch=='lo' else '2*(r:ℤ)-c';t='(c:ℤ)-r' if ch!='lo' else '3*(r:ℤ)-c'
   out+=f''' have hq : ((2*r-c:ℕ):ℤ)={q} := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ)={t} := by omega
 rw [hq,ht] at he
'''
   if k==3:out+=' have hu : ((3*r-2*c:ℕ):ℤ)=3*(r:ℤ)-2*c := by omega\n rw [hu] at he\n'
   out+=' omega\n'
out+='end\nend MathGKM.Markov\n';Path('research/MarkovTerminalCoefficientsE2.lean').write_text(out)
