import Mathlib
/-! Machine-authored f1e4fe3b. A uniform mixed-binomial gap criterion.
The hypothesis is distance from both ends at least the square of the
separation of the two shifts. No seed log-concavity is assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def mixedNumeratorMF1E (a b t : ℝ) : ℝ :=
 2*(a+2)*(b+2)*(a+t+2)*(b+t+2)-
 (a+t+1)*(b+t+1)*(a+t+2)*(b+t+2)-
 (a+1)*(b+1)*(a+2)*(b+2)

theorem mixed_numerator_nonnegMF1E (a b t : ℝ)
 (ht : 0 ≤ t) (ha : t^2≤a) (hb : t^2≤b) :
 0 ≤ mixedNumeratorMF1E a b t := by
 let x := a-t^2
 let y := b-t^2
 have hx : 0≤x := sub_nonneg.mpr ha
 have hy : 0≤y := sub_nonneg.mpr hb
 have he : mixedNumeratorMF1E a b t =
   24+20*t+35*t^2+16*t^3+11*t^4+2*t^5+
   (x+y)*(20+11*t+17*t^2+4*t^3+2*t^4)+
   (x^2+y^2)*(4+t+t^2)+x*y*(14+4*t+6*t^2)+
   2*x*y^2+2*x^2*y := by
   dsimp [mixedNumeratorMF1E,x,y]
   ring
 rw [he]
 positivity

theorem mixed_tripleMF1E (a b t L M R l m r : ℝ)
 (ht : 0 ≤ t) (ha : t^2≤a) (hb : t^2≤b)
 (hM : 0 ≤ M) (hm : 0 ≤ m)
 (hL : L*(b+2)=(a+t+1)*M)
 (hR : R*(a+t+2)=(b+1)*M)
 (hl : l*(b+t+2)=(a+1)*m)
 (hr : r*(a+2)=(b+t+1)*m) :
 L*r+l*R ≤ 2*M*m := by
 have ha0 : 0≤a := le_trans (sq_nonneg t) ha
 have hb0 : 0≤b := le_trans (sq_nonneg t) hb
 have hp : 0<(a+2)*(b+2)*(a+t+2)*(b+t+2) := by positivity
 have he1 := congrArg₂ (fun x y : ℝ => x*y) hL hr
 have he2 := congrArg₂ (fun x y : ℝ => x*y) hl hR
 have he : (a+2)*(b+2)*(a+t+2)*(b+t+2)*(2*M*m-(L*r+l*R))=
   mixedNumeratorMF1E a b t*M*m := by
   unfold mixedNumeratorMF1E
   linear_combination -(a+t+2)*(b+t+2)*he1-(a+2)*(b+2)*he2
 have hn : 0 ≤ mixedNumeratorMF1E a b t*M*m :=
   mul_nonneg (mul_nonneg (mixed_numerator_nonnegMF1E a b t ht ha hb) hM) hm
 rw [←he] at hn
 exact sub_nonneg.mp ((mul_nonneg_iff_of_pos_left hp).mp hn)

theorem choose_stepMF1E (n k : ℕ) :
 (n.choose (k+1):ℝ)*(k+1)=(n.choose k:ℝ)*((n-k:ℕ):ℝ) := by
 exact_mod_cast Nat.choose_succ_right_eq n k

theorem binomial_mixedMF1E (a b t : ℕ) (ha : t^2≤a) (hb : t^2≤b) :
 let n := a+b+t+2
 (n.choose (a+t):ℝ)*(n.choose (a+2):ℝ)+
 (n.choose a:ℝ)*(n.choose (a+t+2):ℝ) ≤
 2*(n.choose (a+t+1):ℝ)*(n.choose (a+1):ℝ) := by
 dsimp only
 apply mixed_tripleMF1E a b t
 · positivity
 · exact_mod_cast ha
 · exact_mod_cast hb
 · positivity
 · positivity
 · have h := choose_stepMF1E (a+b+t+2) (a+t)
   rw [show a+b+t+2-(a+t)=b+2 by omega] at h
   push_cast at h
   nlinarith only [h]
 · have h := choose_stepMF1E (a+b+t+2) (a+t+1)
   rw [show a+b+t+2-(a+t+1)=b+1 by omega] at h
   rw [show a+t+1+1=a+t+2 by omega] at h
   push_cast at h
   nlinarith only [h]
 · have h := choose_stepMF1E (a+b+t+2) a
   rw [show a+b+t+2-a=b+t+2 by omega] at h
   push_cast at h
   nlinarith only [h]
 · have h := choose_stepMF1E (a+b+t+2) (a+1)
   rw [show a+b+t+2-(a+1)=b+t+1 by omega] at h
   rw [show a+1+1=a+2 by omega] at h
   push_cast at h
   nlinarith only [h]
end
end MathGKM.Markov
