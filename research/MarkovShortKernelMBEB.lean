import MarkovUpperThreeM9F23
import MarkovBandPolynomialM657
/-! Machine-authored bebe7940. Exact short binomial expression for the ramp
kernel. No log-concavity is assumed and all zero terms are retained. -/
namespace MathGKM.Markov
noncomputable section
open Finset Finset.Nat
set_option maxHeartbeats 8000000

def shortSeedMBEB (H t s : ℕ) : ℤ :=
 (s.choose t:ℤ)*((H+(s-t)).choose (t+3):ℤ)
def shortMassMBEB (H T t : ℕ) : ℤ := topLinearM55C T (shortSeedMBEB H t)
def shortValueMBEB (H T t : ℕ) : ℤ :=
 ∑ l ∈ range (t+4), ((t+l).choose t:ℤ)*(H.choose (t+3-l):ℤ)*
 ((T.choose (t+l):ℤ)+4*((T+1).choose (t+l+2):ℤ))

theorem short_seed_vandermondeMBEB (H t s : ℕ) :
 shortSeedMBEB H t s=∑ l ∈ range (t+4),
 ((t+l).choose t:ℤ)*(H.choose (t+3-l):ℤ)*(s.choose (t+l):ℤ) := by
 by_cases ht : t ≤ s
 · have hv := Nat.add_choose_eq (s-t) H (t+3)
   rw [sum_antidiagonal_eq_sum_range_succ_mk] at hv
   have hv' := congrArg (fun z : ℕ => (z:ℤ)) hv
   push_cast at hv'
   unfold shortSeedMBEB
   rw [Nat.add_comm H (s-t),hv',mul_sum]
   apply sum_congr rfl
   intro l hl
   have hz := congrArg (fun z : ℕ => (z:ℤ))
     (Nat.choose_mul (n:=s) (k:=t+l) (s:=t) (by omega))
   rw [show t+l-t=l by omega] at hz
   push_cast at hz
   linear_combination -(H.choose (t+3-l):ℤ)*hz
 · unfold shortSeedMBEB
   rw [Nat.choose_eq_zero_of_lt (by omega : s<t)]
   simp only [Nat.cast_zero,zero_mul]
   symm
   apply sum_eq_zero
   intro l hl
   rw [Nat.choose_eq_zero_of_lt (by omega : s<t+l)]
   simp

theorem short_mass_valueMBEB (H T t : ℕ) : shortMassMBEB H T t=shortValueMBEB H T t := by
 unfold shortMassMBEB
 have he : shortSeedMBEB H t=fun s => ∑ l ∈ range (t+4),
   ((t+l).choose t:ℤ)*(H.choose (t+3-l):ℤ)*(s.choose (t+l):ℤ) := by
   funext s; exact short_seed_vandermondeMBEB H t s
 rw [he,top_linear_sumMEB6]
 unfold shortValueMBEB
 apply sum_congr rfl
 intro l hl
 rw [top_linear_smulM55C,top_linear_chooseMEB6]

theorem top_linear_reverseMBEB (f : ℕ → ℤ) (T : ℕ) :
 (topLinearM55C T f:ℝ)=
 ∑ r ∈ range (T+1), rampWeightMF88 r*(f (T-r):ℝ) := by
 rw [sum_range_succ']
 have hz : rampWeightMF88 (0:ℤ)=1 := by norm_num [rampWeightMF88]
 simp only [Nat.cast_zero,Nat.sub_zero,hz,one_mul]
 unfold topLinearM55C
 rw [←sum_range_reflect (fun s => ((T:ℤ)-s)*f s) T]
 push_cast
 rw [mul_sum]
 have hs : (∑ r ∈ range T, 4*((T:ℝ)-(T-1-r:ℕ))*(f (T-1-r):ℝ))=
   ∑ r ∈ range T, rampWeightMF88 ((r+1:ℕ):ℤ)*(f (T-(r+1)):ℝ) := by
   apply sum_congr rfl
   intro r hr
   have hrT := mem_range.mp hr
   have he : (T:ℝ)-(T-1-r:ℕ)=r+1 := by
     exact_mod_cast (show (T:ℤ)-(T-1-r:ℕ)=(r:ℤ)+1 by omega)
   have hw : rampWeightMF88 ((r+1:ℕ):ℤ)=4*(r+1:ℝ) := by
     simp [rampWeightMF88]; norm_cast
   rw [hw,he,show T-(r+1)=T-1-r by omega]
 simp only [Nat.cast_add,Nat.cast_one,mul_assoc] at hs ⊢
 rw [hs]
 ring

theorem lower_shortMBEB (t j k H : ℕ) (hH : H+k=j+t+3) :
 lowerDiagMF88 t j k=(shortValueMBEB H (t+k) t:ℝ) := by
 rw [←short_mass_valueMBEB,shortMassMBEB,top_linear_reverseMBEB]
 unfold lowerDiagMF88
 rw [diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (chooseSeq_zeroMDB9 _)
   j (t+k) (t+k+1) (by omega)]
 apply sum_congr rfl
 intro r hr
 by_cases hrk : r≤k
 · have hrt : r≤t+k := by omega
   have hM : ((t+k:ℕ):ℤ)-r=((t+k-r:ℕ):ℤ) := by omega
   rw [hM,chooseSeq_natMDB9,shortSeedMBEB]
   push_cast
   by_cases hrj : r≤j
   · have hJ : (j:ℤ)-r=((j-r:ℕ):ℤ) := by omega
     rw [hJ,nbSeq_natMDB9]
     rw [show H+(t+k-r-t)=j-r+(t+3) by omega]
     ring
   · rw [nbSeq_zeroMDB9 _ _ (by omega),
       Nat.choose_eq_zero_of_lt (by omega : H+(t+k-r-t)<t+3)]
     simp
 · rw [chooseSeqMDB9]
   have hz : ((t+k:ℕ):ℤ)-r-(t:ℤ)<0 := by omega
   rw [nbSeq_zeroMDB9 _ _ hz,shortSeedMBEB,
     Nat.choose_eq_zero_of_lt (by have := mem_range.mp hr; omega : t+k-r<t)]
   simp

theorem lower_liftMBEB (t j k : ℕ) (h : j≤t+k) :
 lowerDiagMF88 t j k=(liftOutputMAE9 (t+k-j) j t:ℝ) := by
 have he := lower_row_diagonalMF88 (j+t+k+1) j t (by omega) (by omega)
 rw [show j+t+k+1-j-t-1=k by omega] at he
 rw [←he]
 have heN : j+t+k+1=2*j+1+(t+k-j) := by omega
 rw [heN,lower_row_liftMAE9]
 rfl

end
end MathGKM.Markov
