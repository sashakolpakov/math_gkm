import MarkovFibShiftM139
/-! Machine-authored 139fed75. Parameter-shift recurrence for arbitrary
correction factors. This will allow positivity to propagate from boundary data. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000

theorem band_Q_shiftM139 (q k : ℕ) (r : Bool) (hq : 2*(k+1) ≤ q) :
 bandQM139 (q+2) r (k+1)=bandQM139 (q+1) r (k+1)+
   (X+1)*bandQM139 (q+1) r k-bandQM139 q r k := by
 have hg0 (n : ℕ) : bandGainM139 n r 0=(if r then 2 else 1) := rfl
 have hr (n j : ℕ) : bandQM139 n r (j+2)=4*bandGainM139 n r (j+2)+
   2*(1-X)*bandQM139 n r (j+1)-(X+1)^2*bandQM139 n r j := rfl
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · have hg := band_gain_shiftM139 q 0 r hq
     simp only [bandQM139,hg0] at hg ⊢
     linear_combination 4*hg
   · have hg1 := band_gain_shiftM139 q 0 r (by omega)
     have hg2 := band_gain_shiftM139 q 1 r hq
     simp only [bandQM139,hg0] at hg1 hg2 ⊢
     linear_combination 4*hg2+8*(1-X)*hg1
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     have hg := band_gain_shiftM139 q (k+2) r hq
     have r0 := hr (q+2) (k+1)
     have r1 := hr (q+1) (k+1)
     have r2 := hr (q+1) k
     have r3 := hr q k
     linear_combination r0-r1-(X+1)*r2+r3+4*hg+2*(1-X)*h1-(X+1)^2*h0

def bandAtM139 (d k : ℕ) (r : Bool) : Polynomial ℤ :=
 bandQM139 (d+2*k+(if r then 2 else 1)) r k

theorem band_differenceM139 (d k : ℕ) (r : Bool) :
 bandAtM139 (d+1) (k+1) r-bandAtM139 d (k+1) r=
   bandAtM139 (d+2) k r-bandAtM139 (d+1) k r+X*bandAtM139 (d+2) k r := by
 have h := band_Q_shiftM139 (d+2*(k+1)+(if r then 2 else 1)-1) k r (by cases r <;> simp <;> omega)
 have h1 : d+2*(k+1)+(if r then 2 else 1)-1+2=
   d+1+2*(k+1)+(if r then 2 else 1) := by cases r <;> simp <;> omega
 have h2 : d+2*(k+1)+(if r then 2 else 1)-1+1=
   d+2*(k+1)+(if r then 2 else 1) := by cases r <;> simp <;> omega
 have h3 : d+2*(k+1)+(if r then 2 else 1)-1=
   d+1+2*k+(if r then 2 else 1) := by cases r <;> simp <;> omega
 rw [h1,h2,h3] at h
 unfold bandAtM139
 rw [show d+2+2*k+(if r then 2 else 1)=d+2*(k+1)+(if r then 2 else 1) by omega]
 linear_combination h

end
end MathGKM.Markov
