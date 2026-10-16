"""Machine-authored uniform high-slope chart coverage and gap transfer."""
from pathlib import Path
s='import MarkovStripHalfGapMCE8\nimport MarkovStripHighGapMCE8\n/-! Machine-authored ce882be3. Complete high-slope chart coverage. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 8000000\n'
for cone in ['Half','High']:
 v='q' if cone=='Half' else 'u';b='((k:ℝ)+l+2)'
 a=f'(({b}+q)/2)' if cone=='Half' else f'((2*{b}+u)/3)'
 q='q' if cone=='Half' else f'(({b}+2*u)/3)'
 t=f'(({b}-q)/2)' if cone=='Half' else f'(({b}-u)/3)'
 u='0' if cone=='Half' else 'u'
 s+=f'\ntheorem strip{cone}_nonnegMCE8 (k l : ℕ) ({v} : ℝ) (hl : 2 ≤ l) (hN : 5 ≤ k+l) (hv : 0 ≤ {v}) :\n 0 ≤ stripGeneralGapMCE8 {a} k l {q} {t} {u} := by\n'
 s+=f''' by_cases h5 : 5 ≤ l
 · have hlR : 0 ≤ (l:ℝ)-5 := by
     have : (5:ℝ) ≤ l := by exact_mod_cast h5
     linarith
   simpa only [sub_add_cancel] using strip{cone}_largeMCE8 k ((l:ℝ)-5) {v} (by positivity) hlR hv
 · have hc : l=2 ∨ l=3 ∨ l=4 := by omega
   rcases hc with rfl|rfl|rfl
'''
 for l,kk,chart in [(2,3,'two'),(3,2,'three'),(4,1,'four')]:
  s+=f'''   · have hk : ({kk}:ℝ) ≤ k := by exact_mod_cast (show {kk} ≤ k by omega)
     simpa only [sub_add_cancel,Nat.cast_ofNat] using strip{cone}_{chart}MCE8 ((k:ℝ)-{kk}) 0 {v} (by linarith) (by norm_num) hv
'''
s+='''
theorem strip_general_gap_nonnegMCE8 (a b k l : ℕ) (hab : a ≤ b) (hs : b ≤ 2*a)
 (hbl : b=k+l+2) (hl : 2 ≤ l) (hN : 5 ≤ k+l) :
 0 ≤ stripGeneralGapMCE8 a k l (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 have ht : min (b-a) (3*a-b)=b-a := by omega
 rw [ht]
 have hqR : 2*(a:ℝ)=(k:ℝ)+l+2+(2*a-b:ℕ) := by exact_mod_cast (show 2*a=k+l+2+(2*a-b) by omega)
 have htR : (a:ℝ)+(b-a:ℕ)=(k:ℝ)+l+2 := by exact_mod_cast (show a+(b-a)=k+l+2 by omega)
 by_cases hu : 3*a ≤ 2*b
 · have hz : 3*a-2*b=0 := by omega
   rw [hz]
   have he : (a:ℝ)=((k:ℝ)+l+2+(2*a-b:ℕ))/2 := by linarith
   have he' : ((b-a:ℕ):ℝ)=((k:ℝ)+l+2-(2*a-b:ℕ))/2 := by linarith
   rw [he,he']
   exact stripHalf_nonnegMCE8 k l (2*a-b:ℕ) hl hN (by positivity)
 · have huR : 3*(a:ℝ)=2*((k:ℝ)+l+2)+(3*a-2*b:ℕ) := by exact_mod_cast (show 3*a=2*(k+l+2)+(3*a-2*b) by omega)
   have he : (a:ℝ)=(2*((k:ℝ)+l+2)+(3*a-2*b:ℕ))/3 := by linarith
   have he' : ((b-a:ℕ):ℝ)=((k:ℝ)+l+2-(3*a-2*b:ℕ))/3 := by linarith
   have heq : ((2*a-b:ℕ):ℝ)=((k:ℝ)+l+2+2*(3*a-2*b:ℕ))/3 := by linarith
   rw [he,he',heq]
   exact stripHigh_nonnegMCE8 k l (3*a-2*b:ℕ) hl hN (by positivity)

theorem strip_general_transferMCE8 (a k l q t u C c₁ c₂ c₃ : ℝ)
 (hk : 0 ≤ k) (hl : 2 ≤ l) (hN : 5 ≤ k+l)
 (h₁ : (k+l)*c₁=C*stripTMB9D a k l)
 (h₂ : 2*(k+l)*(k+l-1)*(k+l-2)*(k+1)*c₂=C*l*stripGeneralJMCE8 a k l q)
 (h₃ : 6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*(k+2)*c₃=C*l*(l-1)*stripGeneralHMCE8 a k l q t u)
 (hg : 0 ≤ stripGeneralGapMCE8 a k l q t u) : c₁*c₃ ≤ c₂^2 := by
 have he : 12*((k+l)*(k+l-1)*(k+l-2))^2*(k+l-3)*(k+l-4)*(k+1)^2*(k+2)*(c₂^2-c₁*c₃)=
   C^2*l*stripGeneralGapMCE8 a k l q t u := by
   unfold stripGeneralGapMCE8
   linear_combination
     3*(k+l-3)*(k+l-4)*(k+2)*(2*(k+l)*(k+l-1)*(k+l-2)*(k+1)*c₂+C*l*stripGeneralJMCE8 a k l q)*h₂-
     2*(k+l-1)*(k+l-2)*(k+1)*(6*(k+l)*(k+l-1)*(k+l-2)*(k+l-3)*(k+l-4)*(k+1)*(k+2)*c₃*h₁+C*stripTMB9D a k l*h₃)
 have hp : 0 < 12*((k+l)*(k+l-1)*(k+l-2))^2*(k+l-3)*(k+l-4)*(k+1)^2*(k+2) := by
   have : 0<k+l := by linarith
   have : 0<k+l-1 := by linarith
   have : 0<k+l-2 := by linarith
   have : 0<k+l-3 := by linarith
   have : 0<k+l-4 := by linarith
   positivity
 have hn : 0 ≤ C^2*l*stripGeneralGapMCE8 a k l q t u := mul_nonneg (by positivity) hg
 rw [←he] at hn
 have := nonneg_of_mul_nonneg_right hn hp
 linarith
end
end MathGKM.Markov
'''
Path('research/MarkovStripGeneralLCMCE8.lean').write_text(s)
