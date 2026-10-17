import MarkovShortKernelMBEB
import MarkovAffineKernelM13E
/-! Machine-authored bebe7940. Exact finite-degree affine convolution formula. -/
namespace MathGKM.Markov
noncomputable section
open Finset Finset.Nat
set_option maxHeartbeats 8000000

def affineShortMBEB (e : ℝ) (a b J H : ℕ) : ℝ :=
 ∑ l ∈ range (b+1), ((a+l).choose a:ℝ)*(H.choose (b-l):ℝ)*
   (e*((J+a+1).choose (a+l+1):ℝ)+3*((J+a+1).choose (a+l+2):ℝ))

theorem product_vandermondeMBEB (a b H s : ℕ) :
 ((s+a).choose a:ℝ)*((H+s).choose b:ℝ)=
 ∑ l ∈ range (b+1), ((a+l).choose a:ℝ)*(H.choose (b-l):ℝ)*
   ((s+a).choose (a+l):ℝ) := by
 have hv := Nat.add_choose_eq s H b
 rw [sum_antidiagonal_eq_sum_range_succ_mk] at hv
 have hv' := congrArg (fun n : ℕ => (n:ℝ)) hv
 push_cast at hv'
 rw [Nat.add_comm H s,hv',mul_sum]
 apply sum_congr rfl
 intro l hl
 have hp := congrArg (fun n : ℕ => (n:ℝ))
   (Nat.choose_mul (n:=s+a) (k:=a+l) (s:=a) (by omega))
 rw [show s+a-a=s by omega,show a+l-a=l by omega] at hp
 push_cast at hp
 nlinarith only [congrArg (fun z : ℝ => z*(H.choose (b-l):ℝ)) hp]

theorem affine_choose_sumMBEB (e : ℝ) (a l J : ℕ) :
 (∑ s ∈ range (J+1), (3*((J:ℝ)-s)+e)*((s+a).choose (a+l):ℝ))=
 e*((J+a+1).choose (a+l+1):ℝ)+3*((J+a+1).choose (a+l+2):ℝ) := by
 have hp := prefix_chooseMDAB a (a+l) (J+1) (by omega)
 have hw := weighted_chooseMDAB a (a+l) J (by omega)
 have hpR : (∑ s ∈ range (J+1), ((s+a).choose (a+l):ℝ))=
   ((J+a+1).choose (a+l+1):ℝ) := by exact_mod_cast hp
 have hwR : (∑ s ∈ range J, ((J:ℝ)-s)*((s+a).choose (a+l):ℝ))=
   ((J+a+1).choose (a+l+2):ℝ) := by exact_mod_cast hw
 have hwR' : (∑ s ∈ range (J+1), ((J:ℝ)-s)*((s+a).choose (a+l):ℝ))=
   ((J+a+1).choose (a+l+2):ℝ) := by rw [sum_range_succ]; simpa using hwR
 calc
  _ = e*(∑ s ∈ range (J+1), ((s+a).choose (a+l):ℝ))+
    3*(∑ s ∈ range (J+1), ((J:ℝ)-s)*((s+a).choose (a+l):ℝ)) := by
      rw [mul_sum,mul_sum,←sum_add_distrib]
      apply sum_congr rfl
      intro s hs
      ring
  _ = _ := by rw [hpR,hwR']

theorem affine_shortMBEB (e : ℝ) (a b J K H : ℕ) (hH : H+J=K+b) :
 affineKernelM13E e a b J K=affineShortMBEB e a b J H := by
 unfold affineKernelM13E
 rw [diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _) J K (J+1) (by omega)]
 have ht : (∑ r ∈ range (J+1), affineWeightM13E e r*nbSeqMDB9 a ((J:ℤ)-r)*
     nbSeqMDB9 b ((K:ℤ)-r))=
   ∑ r ∈ range (J+1), (3*(r:ℝ)+e)*((J-r+a).choose a:ℝ)*((H+(J-r)).choose b:ℝ) := by
   apply sum_congr rfl
   intro r hr
   have hrJ : r≤J := by simpa using hr
   have hJ : (J:ℤ)-r=((J-r:ℕ):ℤ) := by omega
   rw [affineWeightM13E,if_neg (by omega),hJ,nbSeq_natMDB9]
   by_cases hrK : r≤K
   · have hK : (K:ℤ)-r=((K-r:ℕ):ℤ) := by omega
     rw [hK,nbSeq_natMDB9,show H+(J-r)=K-r+b by omega]
     simp
   · rw [nbSeq_zeroMDB9 b _ (by omega),Nat.choose_eq_zero_of_lt (by omega : H+(J-r)<b)]
     simp
 rw [ht,←sum_range_reflect (fun r => (3*(r:ℝ)+e)*((J-r+a).choose a:ℝ)*
   ((H+(J-r)).choose b:ℝ)) (J+1)]
 have hs : (∑ s ∈ range (J+1),
   (3*((J+1-1-s:ℕ):ℝ)+e)*((J-(J+1-1-s)+a).choose a:ℝ)*
      ((H+(J-(J+1-1-s))).choose b:ℝ))=
   ∑ s ∈ range (J+1), (3*((J:ℝ)-s)+e)*
     (((s+a).choose a:ℝ)*((H+s).choose b:ℝ)) := by
   apply sum_congr rfl
   intro s hs
   have hsJ : s≤J := by simpa using hs
   rw [show J+1-1-s=J-s by omega,show J-(J-s)=s by omega,Nat.cast_sub hsJ]
   ring
 rw [hs]
 simp_rw [product_vandermondeMBEB,mul_sum]
 rw [sum_comm]
 unfold affineShortMBEB
 apply sum_congr rfl
 intro l hl
 calc
  _ = ((a+l).choose a:ℝ)*(H.choose (b-l):ℝ)*
    ∑ s ∈ range (J+1), (3*((J:ℝ)-s)+e)*((s+a).choose (a+l):ℝ) := by
      rw [mul_sum]
      apply sum_congr rfl
      intro s hs
      ring
  _ = _ := by rw [affine_choose_sumMBEB]

end
end MathGKM.Markov
