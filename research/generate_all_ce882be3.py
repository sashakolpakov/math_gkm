"""Machine-authored assembly of exact source strip; validation is separate."""
from pathlib import Path
p=Path('research/MarkovStripAllMB9D.lean').read_text()
p=p.replace('import MarkovStripLCMB9D\nimport MarkovStripCoefficientsMB9D','import MarkovStripLCMCE8\nimport MarkovStripCoefficientsMCE8\nimport MarkovResidualMF8\nimport MarkovStripAllMB9D')
p=p.replace('b9d0d341. Universal low-slope','ce882be3. Universal middle-slope')
# Keep inherited algebra names, rename the source statements only.
for n in ['source_strip_scaled','source_strip_interior','source_strip_low','source_strip_all_low']:
 p=p.replace(n+'MB9D',n+'MCE8')
p=p.replace('(hs : 3*(frame path).mid.a ≤ (frame path).mid.b)', '(hs : 2*(frame path).mid.a ≤ (frame path).mid.b)')
# Scaled statements require the exact correction, no upper cone bound.
p=p.replace('(k+l-3)*(k+l-4)*(coeff','(k+l-3)*(k+l-4)*(k+1)*(coeff')
p=p.replace('stripHMB9D (frame path).mid.a k l','stripHMCE8 (frame path).mid.a k l (3*(frame path).mid.a-(frame path).mid.b:ℕ)')
p=p.replace('strip_three_coeffMB9D','strip_three_coeffMCE8').replace('strip_cubic_scaledMB9D','strip_seed_scaledMCE8')
p=p.replace('have h := strip_seed_scaledMCE8 k l hl (by omega) (frame path).mid.a','have h := strip_seed_scaledMCE8 k l hl (by omega) (frame path).mid.a (3*(frame path).mid.a-(frame path).mid.b:ℕ)')
# Keep natural t intact while rewriting the source b.
p=p.replace('   push_cast at hc\n   have h := strip_seed','   push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc\n   have h := strip_seed')
p=p.replace('   rw [←hc] at h\n   linear_combination h\n\ntheorem source_strip_interior', '   rw [hbl] at h\n   rw [←hc] at h\n   linear_combination h\n\ntheorem source_strip_interior')
# Interior needs b <= 3a, for t relation.
start=p.index('theorem source_strip_interiorMCE8')
end=p.index('theorem source_strip_all_lowMCE8')
part=p[start:end].replace('(hbl :', '(hu : (frame path).mid.b ≤ 3*(frame path).mid.a)\n (hbl :',1)
part=part.replace('have hg := strip_gap_nonnegMB9D (frame path).mid.a k l (by omega) hl (by omega)', 'have hg := strip_gap_nonnegMCE8 (frame path).mid.a k l (3*(frame path).mid.a-(frame path).mid.b) hl (by omega) (by omega)')
part=part.replace('strip_gap_transferMB9D (frame path).mid.a k l','strip_gap_transferMCE8 (frame path).mid.a k l (3*(frame path).mid.a-(frame path).mid.b:ℕ)')
part=part.replace('(hs : 2*(frame path).mid.a ≤ (frame path).mid.b) (i : ℕ)', '(hs : 2*(frame path).mid.a ≤ (frame path).mid.b)\n (hu : (frame path).mid.b ≤ 3*(frame path).mid.a) (i : ℕ)')
part=part.replace('path k l ha hb hs hbl hl','path k l ha hb hs hu hbl hl')
p=p[:start]+part
p+='''theorem source_strip_all_lowMCE8 (path : List Bool)
 (hs : 2*(frame path).mid.a ≤ (frame path).mid.b) (i : ℕ) :
 coeff (frame path).mid.p i 1*coeff (frame path).mid.p i 3 ≤ coeff (frame path).mid.p i 2^2 := by
 obtain ⟨ha0,hab,hcop⟩ := frame_reduced path
 by_cases ha1 : (frame path).mid.a=1
 · simpa using (source_one_global6 path ha1).2.1 i 1
 have ha : 2 ≤ (frame path).mid.a := by omega
 by_cases hu : 3*(frame path).mid.a ≤ (frame path).mid.b
 · exact source_strip_all_lowMB9D path hu i
 by_cases hb : 7 ≤ (frame path).mid.b
 · exact source_strip_lowMCE8 path ha hb hs (by omega) i
 by_cases hi : i≤3
 · simpa using vertical_first_fourMF8 path i 1 hi
 by_cases ht : (frame path).mid.a+(frame path).mid.b-1 < i+3
 · have hz := raw_outside_polygon18 path i 3 (by unfold InPolygon; omega)
   rw [hz,mul_zero]; exact sq_nonneg _
 simpa using source_top_vertical_largeB5 path i 1 (by omega) (by omega)
end
end MathGKM.Markov
'''
Path('research/MarkovStripAllMCE8.lean').write_text(p)
