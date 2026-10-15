"""Machine-authored exact sparse nonnegative gap certificates and raw-coefficient transport."""
from generate_small_38ebef17 import *
def generate_lc(row):
 n,ch=row['n'],row['chamber'];tag=f'{n}_{ch}M38E';m=f'MarkovSmallLC{tag}'
 q=f'smallValue{tag}';d=max(j for j,v in enumerate(row['quotient']) if v)
 (a,b),(u,v)=bounds[ch:ch+2];cv=f'({b+v}+{b}*c+{v}*r)';rv=f'({a+u}+{a}*c+{u}*r)'
 val=lambda j:f'{q} {cv} {rv} {j}'
 s=f'import MarkovSmallQuot{tag}\n'+head
 for g in row['gaps'][:max(0,d-1)]:
  assert g['nonnegative'];j=g['j'];gn=f'smallGap{n}_{ch}_{j}M38E';th=f'small_gap{n}_{ch}_{j}M38E'
  s+=f'\ndef {gn} (c r : ℤ) : ℤ := {expr(g["terms"])}\n'
  s+=f'\ntheorem {th} (c r : ℤ) (hc : 0≤c) (hr : 0≤r) :\n {val(j)}*{val(j+2)}≤({val(j+1)})^2 := by\n apply sub_nonneg.mp\n have he : ({val(j+1)})^2-{val(j)}*{val(j+2)}={gn} c r := by\n  unfold {q} {gn}\n  simp only [pow_two]\n  ring_nf\n rw [he]\n unfold {gn}\n positivity\n'
 s+=f'\ntheorem small_lc{tag} (c r : ℤ) (hc : 0≤c) (hr : 0≤r) (j : ℕ) :\n {val("j")}*{val("(j+2)")}≤({val("(j+1)")})^2 := by\n by_cases hj : j≤{d-2}\n · interval_cases j\n'+''.join(f'   · exact small_gap{n}_{ch}_{j}M38E c r hc hr\n' for j in range(d-1))
 s+=f' · have hv : {val("(j+2)")}=0 := by\n    unfold {q}\n    split <;> omega\n   rw [hv,mul_zero]\n   exact sq_nonneg _\n'
 source=lambda ij,jj:f'coeff (frame (List.replicate {n} true++false::rest)).mid.p {ij} {jj}'
 s+=f'\ntheorem source_small_lc{tag} (rest : List Bool)\n (hc : 5≤(frame rest).mid.b) (hl : {a}*(frame rest).mid.b<{b}*(frame rest).mid.a)\n (hu : {v}*(frame rest).mid.a<{u}*(frame rest).mid.b) (i j : ℕ)\n (hs : i+j+2=(frame (List.replicate {n} true++false::rest)).mid.a+4) :\n {source("i","(j+2)")}*{source("(i+2)","j")}≤{source("(i+1)","(j+1)")}^2 := by\n let x : ℤ := {u}*((frame rest).mid.b:ℤ)-{v}*((frame rest).mid.a:ℤ)-1\n let y : ℤ := {b}*((frame rest).mid.a:ℤ)-{a}*((frame rest).mid.b:ℤ)-1\n have hx : 0≤x := by dsimp [x]; omega\n have hy : 0≤y := by dsimp [y]; omega\n have ec : {b+v}+{b}*x+{v}*y=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring\n have er : {a+u}+{a}*x+{u}*y=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring\n have h := small_lc{tag} x y hx hy j\n rw [ec,er] at h\n have h0 := source_small_coeff{tag} rest hc hl hu (i+2) j (by omega)\n have h1 := source_small_coeff{tag} rest hc hl hu (i+1) (j+1) (by omega)\n have h2 := source_small_coeff{tag} rest hc hl hu i (j+2) (by omega)\n rw [←h0,←h1,←h2] at h\n nlinarith only [h]\n'
 save(m,s+end);return m
if __name__=='__main__':
 rows=data if len(sys.argv)==1 else [row for row in data if row['n']==int(sys.argv[1]) and row['chamber']==int(sys.argv[2])]
 print([generate_lc(row) for row in rows])
