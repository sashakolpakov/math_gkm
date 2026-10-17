import MarkovBandTopM139
/-! Machine-authored 139fed75. Exact highest nonzero correction coefficient. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

theorem choose_add_twoM139 (n k : ℕ) :
 ((n+2).choose (k+2):ℤ)=(n.choose k:ℤ)+2*(n.choose (k+1):ℤ)+(n.choose (k+2):ℤ) := by
 simp only [show n+2=(n+1)+1 by omega,show k+2=(k+1)+1 by omega,Nat.choose_succ_succ]
 push_cast
 ring

theorem band_Q_topM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 (bandQM139 q r k).coeff k=
 if r then 8*((q-1).choose k:ℤ) else 4*(q.choose k:ℤ) := by
 have hm (j : ℕ) : (2*(1-X)*bandQM139 q r j).coeff (j+1)=
   -2*(bandQM139 q r j).coeff j := by
   have ha : ((2:Polynomial ℤ)*(1-X)).natDegree ≤ 1 := by compute_degree
   rw [show j+1=1+j by omega,coeff_mul_add_eq_of_natDegree_le ha (band_Q_degreeM139 q j r)]
   norm_num [coeff_sub,coeff_one,coeff_ofNat_mul]
 have hp (j : ℕ) : ((X+1)^2*bandQM139 q r j).coeff (j+2)=
   (bandQM139 q r j).coeff j := by
   have ha : ((X+1:Polynomial ℤ)^2).natDegree ≤ 2 := by compute_degree
   rw [show j+2=2+j by omega,coeff_mul_add_eq_of_natDegree_le ha (band_Q_degreeM139 q j r)]
   norm_num [coeff_X_add_one_pow]
 induction k using Nat.strong_induction_on with
 | h k ih =>
   rcases k with _|_|k
   · cases r <;> norm_num [bandQM139,bandGainM139]
   · have h0 := ih 0 (by omega) (by omega)
     rw [bandQM139,coeff_add,coeff_ofNat_mul,show (1:ℕ)=0+1 by omega,hm]
     rw [band_gain_topM139 q 1 r hq hn,h0]
     cases r <;> simp [Nat.cast_sub (by omega : 1 ≤ q)] <;> ring
   · have h0 := ih k (by omega) (by omega)
     have h1 := ih (k+1) (by omega) (by omega)
     rw [bandQM139,coeff_sub,coeff_add,coeff_ofNat_mul,hp,
       show k+2=(k+1)+1 by omega,hm]
     rw [band_gain_topM139 q (k+2) r hq hn,h0,h1]
     cases r
     · simp only [Bool.false_eq_true,if_false]
       rw [choose_add_twoM139]
       ring
     · simp only [if_true]
       have he : q+1=(q-1)+2 := by omega
       rw [he,choose_add_twoM139]
       ring

theorem band_Q_top_posM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 0 < (bandQM139 q r k).coeff k := by
 rw [band_Q_topM139 q k r hq hn]
 have hk : k ≤ q-1 := by cases r <;> simp_all [sourceNME9C] <;> omega
 have h1 : (0:ℤ)<((q-1).choose k:ℤ) := by exact_mod_cast Nat.choose_pos hk
 have h2 : (0:ℤ)<(q.choose k:ℤ) := by exact_mod_cast Nat.choose_pos (show k ≤ q by omega)
 cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> positivity

theorem band_Q_exact_degreeM139 (q k : ℕ) (r : Bool) (hq : 2 ≤ q)
 (hn : 2*(q+k+1)+1 ≤ sourceNME9C q r) :
 (bandQM139 q r k).natDegree=k :=
 natDegree_eq_of_le_of_coeff_ne_zero (band_Q_degreeM139 q k r)
   (ne_of_gt (band_Q_top_posM139 q k r hq hn))

end
end MathGKM.Markov
