import MarkovOffsetTermM58E
/-! Machine-authored 58e57003. A local midpoint certificate for row j≥2.
This does not establish the global midpoint condition or its summation bridge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def lowerMixedGapM58E (j i h : ℤ) : ℤ :=
 (j+i+1)*(i+2)*(2*i-1-h)*(2*i+2-h)-
 (j+i+2)*(i+1)*(2*i+1-h)*(2*i-h)

theorem lower_mixed_gapM58E (h k t : ℤ) (hh : 0 ≤ h) (hk : 0 ≤ k)
 (ht : 1 ≤ t) (hj : 2 ≤ k+t) :
 0 ≤ lowerMixedGapM58E (k+t) (k+h+2) h := by
 by_cases hk0 : k=0
 · subst k
   have he : lowerMixedGapM58E (0+t) (0+h+2) h=(t-2)*(h+3)*(h+4) := by
     unfold lowerMixedGapM58E
     ring
   rw [he]
   have : 0 ≤ t-2 := by omega
   positivity
 · have hk1 : 0 ≤ k-1 := by omega
   have ht1 : 0 ≤ t-1 := by omega
   have he : lowerMixedGapM58E (k+t) (k+h+2) h=
     24+32*(t-1)+62*(k-1)+24*(k-1)*(t-1)+30*(k-1)^2+
     4*(k-1)^2*(t-1)+4*(k-1)^3+4*h+11*h*(t-1)+15*h*(k-1)+
     4*h*(k-1)*(t-1)+4*h*(k-1)^2+h^2*(t-1)+h^2*(k-1) := by
     unfold lowerMixedGapM58E
     ring
   rw [he]
   positivity

theorem lower_mixed_transferM58E (j i h L M N R : ℤ)
 (h0 : (i+1)*(2*i-h)*(2*j+3+h)*N=(j+i+1)*(2*i-1-h)*(2*j+4+h)*L)
 (h1 : (i+2)*(2*i+2-h)*(2*j+3+h)*R=(j+i+2)*(2*i+1-h)*(2*j+4+h)*M) :
 ((i+1)*(2*i-h)*(2*j+3+h))*((i+2)*(2*i+2-h)*(2*j+3+h))*(M*N-L*R)=
 (2*j+3+h)*(2*j+4+h)*lowerMixedGapM58E j i h*L*M := by
 unfold lowerMixedGapM58E
 linear_combination ((i+2)*(2*i+2-h)*(2*j+3+h))*M*h0-
   ((i+1)*(2*i-h)*(2*j+3+h))*L*h1

theorem lower_core_mixedM58E (j i h : ℕ) (hj : 2 ≤ j)
 (hh : h+2 ≤ i) (hi : i ≤ j+h+1) :
 lowerCoreM58E j i h*lowerCoreM58E j (i+2) (h+1) ≤
 lowerCoreM58E j (i+1) h*lowerCoreM58E j (i+1) (h+1) := by
 have h0 := lower_core_diagonalM58E j i h hh (by omega)
 have h1 := lower_core_diagonalM58E j (i+1) h (by omega) (by omega)
 push_cast at h1
 have hg := lower_mixed_transferM58E j i h
   (lowerCoreM58E j i h) (lowerCoreM58E j (i+1) h)
   (lowerCoreM58E j (i+1) (h+1)) (lowerCoreM58E j (i+2) (h+1)) h0
   (by convert h1 using 1 <;> ring_nf)
 have hsign : 0 ≤ lowerMixedGapM58E j i h := by
   have ht := lower_mixed_gapM58E (h:ℤ) ((i:ℤ)-h-2) ((j:ℤ)-i+h+2)
     (by omega) (by omega) (by omega) (by omega)
   convert ht using 1 <;> congr 1 <;> ring
 have hL := lower_core_nonnegM58E j i h
 have hM := lower_core_nonnegM58E j (i+1) h
 have hp : 0 ≤ (2*(j:ℤ)+3+h)*(2*j+4+h)*lowerMixedGapM58E j i h*
   lowerCoreM58E j i h*lowerCoreM58E j (i+1) h := by positivity
 have hpos : 0 < (((i:ℤ)+1)*(2*i-h)*(2*j+3+h))*
   ((i+2)*(2*i+2-h)*(2*j+3+h)) := by
   have hp0 : 0 < 2*(i:ℤ)-h := by omega
   have hp1 : 0 < 2*(i:ℤ)+2-h := by omega
   positivity
 rw [←hg] at hp
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hpos).mp hp)

end
end MathGKM.Markov
