"""Machine-authored cast and zero-index proof-script fixes."""
from pathlib import Path
for c in range(3):
 p=Path(f'research/MarkovHighCone{c}GapM81F.lean');s=p.read_text()
 s=s.replace('(by have hh : (9:ℝ) ≤ l := by exact_mod_cast h9; linarith)','(sub_nonneg.mpr (by exact_mod_cast h9))')
 s=s.replace('(by have hh : (1:ℝ) ≤ k := by exact_mod_cast hk1; linarith)','(sub_nonneg.mpr (by exact_mod_cast hk1))')
 s=s.replace('· exact high','· simpa only [Nat.cast_zero,Nat.cast_ofNat] using high')
 p.write_text(s)
p=Path('research/MarkovHighCoefficientsM81F.lean');s=p.read_text().replace(' rw [←hc] at h',' simp only [Nat.add_zero] at h\n rw [←hc] at h');p.write_text(s)
