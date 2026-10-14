"""Machine-authored small-numerator gap certificates; exact symbolic identities."""
import ast,pathlib,json
from vertical_gap_b5db import P,coerce,i,j,b,record
for path in ['research/topnext_7955.py','research/generate_vertical_7d80.py']:
 tree=ast.parse(pathlib.Path(path).read_text())
 exec(compile(ast.Module(body=[n for n in tree.body if isinstance(n,ast.FunctionDef)],type_ignores=[]),'definitions','exec'))
src='''import MarkovVerticalCertificate7d80
/-! Machine-authored 7d80a785. Small-numerator vertical gap identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
'''
rec={}
for B in [1,2]:
 for I in range(3):
  S=2 if I==1 else 0
  shift=max(0,2*B-1-I,3-I)
  p=terms(I,j+shift,B,S)[1]
  assert all(v>0 for v in p.values())
  nm=f'b{B}i{I}'
  expr=horner({(e[1],):int(v) for e,v in p.items()},['t'])
  rec[nm]=record(p)
  src+=f'''
theorem vertical_{nm}_nonneg7d80 (t : ℝ) (ht : 0 ≤ t) :
 0 ≤ verticalGap7d80 {I} (t+{shift}) {B} {S} := by
 have he : verticalGap7d80 {I} (t+{shift}) {B} {S}={expr} := by
   unfold verticalGap7d80 verticalQ7d80 nextT7955 cubicA5a7 cubicB5a7 cubicC5a7 cubicD5a7
   ring
 rw [he]
 all_goals positivity
'''
src+='''
theorem vertical_small_gap7d80 (i j : ℕ) (b : ℕ) (hb : b=1 ∨ b=2)
 (hd : 3 ≤ i+j) (hc : 2*(b:ℝ) ≤ (i:ℝ)+j+1) :
 0 ≤ verticalGap7d80 i j b (if i=1 then 2 else 0) := by
 rcases i with _ | (_ | (_ | i))
 · have hj : 3 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   rcases hb with rfl | rfl
   · simpa [Nat.cast_add,add_comm] using vertical_b1i0_nonneg7d80 k (by positivity)
   · simpa [Nat.cast_add,add_comm] using vertical_b2i0_nonneg7d80 k (by positivity)
 · have hj : 2 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   rcases hb with rfl | rfl
   · simpa [Nat.cast_add,add_comm] using vertical_b1i1_nonneg7d80 k (by positivity)
   · simpa [Nat.cast_add,add_comm] using vertical_b2i1_nonneg7d80 k (by positivity)
 · have hj : 1 ≤ j := by omega
   obtain ⟨k,rfl⟩ := Nat.exists_eq_add_of_le hj
   rcases hb with rfl | rfl
   · simpa [Nat.cast_add,add_comm] using vertical_b1i2_nonneg7d80 k (by positivity)
   · simpa [Nat.cast_add,add_comm] using vertical_b2i2_nonneg7d80 k (by positivity)
 · have hne : i+1+1+1 ≠ 1 := by omega
   simpa [hne,Nat.cast_add,add_comm,add_left_comm,add_assoc] using vertical_large_nonneg7d80 i j b (by positivity) (by positivity) (by positivity) (by push_cast at hc; linarith)
#print axioms vertical_small_gap7d80
end
end MathGKM.Markov
'''
pathlib.Path('research/MarkovVerticalSmall7d80.lean').write_text(src)
pathlib.Path('evidence/markov-7d80a785/small-certificates.json').write_text(json.dumps(rec,indent=2)+'\n')
print({k:v['terms'] for k,v in rec.items()})
