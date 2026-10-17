import MarkovFibShapeM831
import MarkovDiagonalRowsMDAB
/-! Machine-authored 831d426f. The coefficient formula extends the parameter
shift to the range needed at the d=0 boundary. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem fib_band_shiftM831 (n j : ℕ) (hn : j+1 ≤ n) :
 fibBandM139 (n+2) (j+1)+fibBandM139 n j=
 fibBandM139 (n+1) (j+1)+(X+1)*fibBandM139 (n+1) j := by
 ext k
 simp only [coeff_add,add_mul,one_mul]
 cases k with
 | zero => simp [fib_band_closed_coeffM831]
 | succ k =>
   simp only [coeff_add,coeff_X_mul,fib_band_closed_coeffM831]
   have e1 : n+2-(j+1)-1+(k+1)+1=(n-j+k+1)+1 := by omega
   have e2 : n-j-1+(k+1)+1=n-j+k+1 := by omega
   have e3 : n+1-(j+1)-1+(k+1)+1=n-j+k+1 := by omega
   have e4 : n+1-j-1+k+1=n-j+k+1 := by omega
   have e5 : n+1-j-1+(k+1)+1=(n-j+k+1)+1 := by omega
   rw [e1,e2,e3,e4,e5]
   have h1 : ((j+1+1).choose (k+1+1):ℤ)=
     ((j+1).choose (k+1):ℤ)+((j+1).choose (k+1+1):ℤ) := by
     exact_mod_cast Nat.choose_succ_succ (j+1) (k+1)
   have h2 : (((n-j+k+1)+1).choose (k+1):ℤ)=
     ((n-j+k+1).choose k:ℤ)+((n-j+k+1).choose (k+1):ℤ) := by
     exact_mod_cast Nat.choose_succ_succ (n-j+k+1) k
   rw [h1,h2]
   ring

theorem band_gain_shiftM831 (q k : ℕ) (r : Bool) (hq : k+1 ≤ q) :
 bandGainM139 (q+2) r (k+1)=bandGainM139 (q+1) r (k+1)+
   (X+1)*bandGainM139 (q+1) r k-bandGainM139 q r k := by
 cases k with
 | zero =>
   have h0 := fib_band_shiftM831 q 0 (by omega)
   have h1 := fib_band_shiftM831 (q+1) 0 (by omega)
   simp only [fib_band_zeroM139] at h0 h1
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true,fib_band_zeroM139]
   · linear_combination h1
   · linear_combination h0+h1
 | succ k =>
   have h0 := fib_band_shiftM831 q k (by omega)
   have h1 := fib_band_shiftM831 (q+1) k (by omega)
   have h2 := fib_band_shiftM831 q (k+1) (by omega)
   have h3 := fib_band_shiftM831 (q+1) (k+1) (by omega)
   cases r <;> simp only [bandGainM139,Bool.false_eq_true,if_false,if_true]
   · linear_combination h0+h3+(X+1)*h1
   · linear_combination h2+h3+(X+1)*h0

theorem band_Q_shiftM831 (q k : ℕ) (r : Bool) (hq : k+1 ≤ q) :
 bandQM139 (q+2) r (k+1)+bandQM139 q r k=
   bandQM139 (q+1) r (k+1)+(X+1)*bandQM139 (q+1) r k := by
 have hg0 (n : ℕ) : bandGainM139 n r 0=(if r then 2 else 1) := rfl
 have hr (n j : ℕ) : bandQM139 n r (j+2)=4*bandGainM139 n r (j+2)+
   2*(1-X)*bandQM139 n r (j+1)-(X+1)^2*bandQM139 n r j := rfl
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · have hg := band_gain_shiftM831 q 0 r hq
     simp only [bandQM139,hg0] at hg ⊢
     linear_combination 4*hg
   · have hg1 := band_gain_shiftM831 q 0 r (by omega)
     have hg2 := band_gain_shiftM831 q 1 r hq
     simp only [bandQM139,hg0] at hg1 hg2 ⊢
     linear_combination 4*hg2+8*(1-X)*hg1
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     have hg := band_gain_shiftM831 q (k+2) r hq
     have r0 := hr (q+2) (k+1)
     have r1 := hr (q+1) (k+1)
     have r2 := hr (q+1) k
     have r3 := hr q k
     linear_combination r0-r1-(X+1)*r2+r3+4*hg+2*(1-X)*h1-(X+1)^2*h0

theorem band_Q_diagonalM831 (q k : ℕ) (r : Bool) (hq : k+1 ≤ q) :
 bandQM139 (q+4) r (k+2)-2*bandQM139 (q+2) r (k+1)+bandQM139 q r k=
   4*bandGainM139 (q+2) r (k+2) := by
 have h := row_diagonal_operatorMDAB (fun n j => bandQM139 n r j) q k
   (band_Q_shiftM831 q k r hq)
   (band_Q_shiftM831 (q+1) k r (by omega))
   (band_Q_shiftM831 (q+1) (k+1) r (by omega))
   (band_Q_shiftM831 (q+2) (k+1) r (by omega))
 have he : bandQM139 (q+2) r (k+2)=4*bandGainM139 (q+2) r (k+2)+
   2*(1-X)*bandQM139 (q+2) r (k+1)-(X+1)^2*bandQM139 (q+2) r k := rfl
 linear_combination h+he

theorem band_at_diagonalM831 (d k : ℕ) (r : Bool) :
 bandAtM139 d (k+2) r-2*bandAtM139 d (k+1) r+bandAtM139 d k r=
 4*bandGainM139 (d+2*k+(if r then 2 else 1)+2) r (k+2) := by
 have h := band_Q_diagonalM831 (d+2*k+(if r then 2 else 1)) k r
   (by cases r <;> simp <;> omega)
 unfold bandAtM139
 rw [show d+2*(k+2)+(if r then 2 else 1)=d+2*k+(if r then 2 else 1)+4 by omega,
   show d+2*(k+1)+(if r then 2 else 1)=d+2*k+(if r then 2 else 1)+2 by omega]
 exact h

end
end MathGKM.Markov
