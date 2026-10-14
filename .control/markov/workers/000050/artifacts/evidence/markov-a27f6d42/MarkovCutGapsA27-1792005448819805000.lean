import MarkovCutPartitionA27
/-! Machine-authored a27f6d42. Closed run weights and exact cut-insertion defect. -/
namespace MathGKM.Markov
noncomputable section

def gapChargeA27 {R : Type*} [CommRing R] (y p q : R) : List Bool → R
 | [] => p
 | r::rs => gapChargeA27 y (cutChargeA27 y p q r) q rs

theorem gapCharge_appendA27 {R : Type*} [CommRing R] (y p q : R)
 (u v : List Bool) : gapChargeA27 y p q (u++v)=
 gapChargeA27 y (gapChargeA27 y p q u) q v := by
 induction u generalizing p with
 | nil => rfl
 | cons r rs ih => simpa only [List.cons_append,gapChargeA27] using ih _

def runSumA27 {R : Type*} [CommRing R] (y : R) (n : ℕ) : R :=
 ∑ k ∈ Finset.range n, y^(k+1)

theorem runSum_succA27 {R : Type*} [CommRing R] (y : R) (n : ℕ) :
 runSumA27 y (n+1)=y*(runSumA27 y n+1) := by
 rw [runSumA27,Finset.sum_range_succ']
 simp only [Nat.zero_add,pow_one,runSumA27,mul_add,mul_one,Finset.mul_sum]
 congr 1
 apply Finset.sum_congr rfl
 intro k hk
 ring

theorem gapCharge_runA27 {R : Type*} [CommRing R] (y p q : R) (n : ℕ) :
 gapChargeA27 y p q (List.replicate n true)=y^n*p+2*q*runSumA27 y n := by
 induction n generalizing p with
 | zero => simp [gapChargeA27,runSumA27]
 | succ n ih =>
   rw [List.replicate_succ',gapCharge_appendA27]
   simp only [gapChargeA27,cutChargeA27,if_true]
   rw [ih,runSum_succA27,pow_succ]
   ring

def gapWeightA27 {R : Type*} [CommRing R] (y : R) (w : List Bool) : R :=
 gapChargeA27 y y 1 w+1

theorem gapWeight_pureA27 {R : Type*} [CommRing R] (y : R) (n : ℕ) :
 gapWeightA27 y (List.replicate n true)=1+2*runSumA27 y n+y^(n+1) := by
 rw [gapWeightA27,gapCharge_runA27]
 ring

theorem gapWeight_resetA27 {R : Type*} [CommRing R] (y : R)
 (u : List Bool) (n : ℕ) :
 gapWeightA27 y (u++false::List.replicate n true)=1+2*runSumA27 y n := by
 rw [gapWeightA27,gapCharge_appendA27,gapChargeA27]
 simp [cutChargeA27,gapCharge_runA27,add_comm]

/-- Every gap map is affine in its incoming first state, preserving q. -/
theorem gapCharge_affineA27 {R : Type*} [CommRing R] (y p q : R)
 (w : List Bool) :
 gapChargeA27 y p q w =
 p*gapChargeA27 y 1 0 w+q*gapChargeA27 y 0 1 w := by
 induction w generalizing p q with
 | nil => simp [gapChargeA27]
 | cons r rs ih =>
   simp only [gapChargeA27]
   rw [ih (cutChargeA27 y p q r) q, ih (cutChargeA27 y 1 0 r) 0,
     ih (cutChargeA27 y 0 1 r) 1]
   cases r <;> simp [cutChargeA27] <;> ring

/-- Splitting a gap has no uniform sign, even though each weight is positive. -/
theorem gapWeight_splitA27 {R : Type*} [CommRing R] (y : R)
 (u v : List Bool) :
 gapWeightA27 y u*gapWeightA27 y v-(1+y)*gapWeightA27 y (u++v)=
 (gapChargeA27 y y 1 u-y)*
   (1+gapChargeA27 y 0 1 v-gapChargeA27 y 1 0 v) := by
 simp only [gapWeightA27,gapCharge_appendA27]
 rw [gapCharge_affineA27 y (gapChargeA27 y y 1 u) 1 v,
   gapCharge_affineA27 y y 1 v]
 ring

theorem gapWeight_split_falseA27 {R : Type*} [CommRing R] (y : R) :
 gapWeightA27 y [false]*gapWeightA27 y [false] -
   (1+y)*gapWeightA27 y [false,false] = -y := by
 simp [gapWeightA27,gapChargeA27,cutChargeA27] <;> ring

theorem gapWeight_split_true_falseA27 {R : Type*} [CommRing R] (y : R) :
 gapWeightA27 y [true]*gapWeightA27 y [false] -
   (1+y)*gapWeightA27 y [true,false] = y+y^2 := by
 simp [gapWeightA27,gapChargeA27,cutChargeA27] <;> ring

#print axioms gapWeight_pureA27
#print axioms gapWeight_resetA27
#print axioms gapWeight_splitA27
#print axioms gapWeight_split_falseA27
#print axioms gapWeight_split_true_falseA27
end
end MathGKM.Markov
