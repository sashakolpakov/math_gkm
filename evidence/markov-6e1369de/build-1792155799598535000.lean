import MarkovCentralValuesM6E1
/-! Machine-authored 6e1369de. Exact gap certificate for the full raw
central-row expression, including all out-of-support zeros. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def centralAM6E1 (k : ℤ) : ℤ := (2*k+5)*(k+1)*(k+3)
def centralBM6E1 (q k : ℤ) : ℤ := (q+k+3)*(q-k)*(2*k+3)

theorem central_ratio_gapM6E1 (k r : ℤ) (hk : 0 ≤ k) (hr : 0 ≤ r) :
 0 ≤ centralBM6E1 (k+2+r) k*centralAM6E1 (k+1)-
   centralBM6E1 (k+2+r) (k+1)*centralAM6E1 k := by
 have he : centralBM6E1 (k+2+r) k*centralAM6E1 (k+1)-
   centralBM6E1 (k+2+r) (k+1)*centralAM6E1 k=
   1230+651*r+93*r^2+2422*k+1068*k*r+126*k*r^2+
   1852*k^2+644*k^2*r+56*k^2*r^2+682*k^3+168*k^3*r+8*k^3*r^2+
   120*k^4+16*k^4*r+8*k^5 := by
   unfold centralAM6E1 centralBM6E1
   ring
 rw [he]
 positivity

theorem central_gapM6E1 (q k L M R : ℤ)
 (h0 : centralAM6E1 k*M=centralBM6E1 q k*L)
 (h1 : centralAM6E1 (k+1)*R=centralBM6E1 q (k+1)*M) :
 centralAM6E1 k*centralAM6E1 (k+1)*(M^2-L*R)=
 (centralBM6E1 q k*centralAM6E1 (k+1)-centralBM6E1 q (k+1)*centralAM6E1 k)*L*M := by
 linear_combination centralAM6E1 (k+1)*M*h0-centralAM6E1 k*L*h1

theorem central_lcM6E1 (q k : ℕ) :
 centralValM6E1 q k*centralValM6E1 q (k+2) ≤ centralValM6E1 q (k+1)^2 := by
 by_cases hk : k+2 ≤ q
 · have h0 := central_stepM6E1 q k (by omega)
   have h1 := central_stepM6E1 q (k+1) (by omega)
   push_cast at h1
   have h := central_gapM6E1 q k (centralValM6E1 q k)
     (centralValM6E1 q (k+1)) (centralValM6E1 q (k+2)) h0 (by
       simpa [centralAM6E1,centralBM6E1,Nat.add_assoc] using h1)
   have hd : (q:ℤ)=(k:ℤ)+2+(q-k-2:ℕ) := by omega
   have hg : 0 ≤ centralBM6E1 q k*centralAM6E1 ((k:ℤ)+1)-
     centralBM6E1 q ((k:ℤ)+1)*centralAM6E1 k := by
     rw [hd]
     exact central_ratio_gapM6E1 k (q-k-2) (by positivity) (by positivity)
   have hp := mul_nonneg (mul_nonneg hg (central_nonnegM6E1 q k))
     (central_nonnegM6E1 q (k+1))
   have ha : 0 < centralAM6E1 k*centralAM6E1 ((k:ℤ)+1) := by
     unfold centralAM6E1
     positivity
   nlinarith only [h,hp,ha]
 · rw [central_zeroM6E1 q (k+2) (by omega),mul_zero]
   exact sq_nonneg _

end
end MathGKM.Markov
