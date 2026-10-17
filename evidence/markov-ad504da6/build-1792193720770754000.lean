import MarkovRationalBridgeMAD5
/-! Machine-authored ad504da6. Exact denominator clearing and nonnegative
parameterization. Polynomial nonnegativity is an explicit unproved premise. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

def pairAnMAD5 (j t m : ℚ) : ℚ := m*liftDenMAE9 t m*(liftWeightMAE9 j t m-2)
def pairBnMAD5 (j t m : ℚ) : ℚ := (j-m)*liftDenMAE9 t m*(liftWeightMAE9 j t m+2)
def pairAdMAD5 (j t m : ℚ) : ℚ := (j-m+1)*(t+m+2)*(t+m+3)*liftWeightMAE9 j t m
def pairBdMAD5 (j t m : ℚ) : ℚ := (m+1)*(t+m+6)*(t+m+7)*liftWeightMAE9 j t m
def pairProductNMAD5 (j t m n : ℚ) : ℚ := pairAnMAD5 j t m*pairBnMAD5 j t n
def pairProductDMAD5 (j t m n : ℚ) : ℚ := pairAdMAD5 j t m*pairBdMAD5 j t n

theorem pair_product_ratioMAD5 (j t m n : ℚ) :
 pairAMAD5 j t m*pairBMAD5 j t n=pairProductNMAD5 j t m n/pairProductDMAD5 j t m n := by
 unfold pairAMAD5 pairBMAD5 pairProductNMAD5 pairProductDMAD5 pairAnMAD5 pairBnMAD5 pairAdMAD5 pairBdMAD5
 exact div_mul_div_comm _ _ _ _

theorem pair_product_den_posMAD5 (j t m n : ℚ) (ht : 0 ≤ t)
 (hm : 0 ≤ m) (hn : 0 ≤ n) (hmj : m ≤ j) (hnj : n ≤ j) :
 0 < pairProductDMAD5 j t m n := by
 have hw0 := lift_weight_positiveMAE9 j t m ht hm hmj
 have hw1 := lift_weight_positiveMAE9 j t n ht hn hnj
 have ha : 0 < j-m+1 := by linarith
 unfold pairProductDMAD5 pairAdMAD5 pairBdMAD5
 positivity

def pairNumeratorMAD5 (j t m n : ℚ) : ℚ :=
 pairProductNMAD5 j t m n*pairProductDMAD5 j t n m*
   pairProductDMAD5 j t (m-1) (n+1)*pairProductDMAD5 j t (n+1) (m-1)+
 pairProductNMAD5 j t n m*pairProductDMAD5 j t m n*
   pairProductDMAD5 j t (m-1) (n+1)*pairProductDMAD5 j t (n+1) (m-1)-
 pairProductNMAD5 j t (m-1) (n+1)*pairProductDMAD5 j t m n*
   pairProductDMAD5 j t n m*pairProductDMAD5 j t (n+1) (m-1)-
 pairProductNMAD5 j t (n+1) (m-1)*pairProductDMAD5 j t m n*
   pairProductDMAD5 j t n m*pairProductDMAD5 j t (m-1) (n+1)

theorem four_fraction_signMAD5 (a b c d e f g h : ℚ)
 (hb : 0 < b) (hd : 0 < d) (hf : 0 < f) (hh : 0 < h) :
 e/f+g/h ≤ a/b+c/d ↔ 0 ≤ a*d*f*h+c*b*f*h-e*b*d*h-g*b*d*f := by
 have hp : 0 < b*d*f*h := by positivity
 have he : (b*d*f*h)*(a/b+c/d-e/f-g/h)=a*d*f*h+c*b*f*h-e*b*d*h-g*b*d*f := by
   field_simp
   <;> ring
 rw [←he,mul_nonneg_iff_of_pos_left hp]
 constructor <;> intro H <;> linarith

theorem pair_numerator_iffMAD5 (j t m n : ℚ) (ht : 0 ≤ t)
 (hn : 0 ≤ n) (hnm : n+2 ≤ m) (hmj : m ≤ j) :
 (pairAMAD5 j t (m-1)*pairBMAD5 j t (n+1)+pairAMAD5 j t (n+1)*pairBMAD5 j t (m-1) ≤
 pairAMAD5 j t m*pairBMAD5 j t n+pairAMAD5 j t n*pairBMAD5 j t m) ↔
 0 ≤ pairNumeratorMAD5 j t m n := by
 simp only [pair_product_ratioMAD5]
 exact four_fraction_signMAD5 _ _ _ _ _ _ _ _
   (pair_product_den_posMAD5 j t m n ht (by linarith) hn hmj (by linarith))
   (pair_product_den_posMAD5 j t n m ht hn (by linarith) (by linarith) hmj)
   (pair_product_den_posMAD5 j t (m-1) (n+1) ht (by linarith) (by linarith) (by linarith) (by linarith))
   (pair_product_den_posMAD5 j t (n+1) (m-1) ht (by linarith) (by linarith) (by linarith) (by linarith))

def ParametricPairPositiveMAD5 : Prop := ∀ T x g z : ℕ,
 0 ≤ pairNumeratorMAD5 ((x:ℚ)+g+2+z) (T+1) (x+g+2) x

theorem rational_step_iff_polynomialMAD5 : RationalPairStepMAD5 ↔ ParametricPairPositiveMAD5 := by
 constructor
 · intro H T x g z
   have hh := H (x+g+2+z) (T+1) (x+g+2) x (by omega) (by omega) (by omega)
   simp only [Nat.cast_add,Nat.cast_ofNat,Nat.cast_one] at hh
   exact (pair_numerator_iffMAD5 _ _ _ _ (by positivity) (by positivity)
     (by have hg : (0:ℚ) ≤ g := by positivity; linarith)
     (by have hz : (0:ℚ) ≤ z := by positivity; linarith)).mp hh
 · intro H j t m n ht hnm hmj
   have hh := H (t-1) n (m-n-2) (j-m)
   have htq : (1:ℚ) ≤ t := by exact_mod_cast ht
   have hnmq : (n:ℚ)+2 ≤ m := by exact_mod_cast hnm
   have hmjq : (m:ℚ) ≤ j := by exact_mod_cast hmj
   simp only [Nat.cast_sub (show 1 ≤ t by omega),Nat.cast_sub (show n ≤ m by omega),
     Nat.cast_sub (show 2 ≤ m-n by omega),Nat.cast_sub hmj,Nat.cast_one,Nat.cast_ofNat] at hh
   have he0 : (n:ℚ)+(m-n-2)+2+(j-m)=j := by ring
   have he1 : (t:ℚ)-1+1=t := by ring
   have he2 : (n:ℚ)+(m-n-2)+2=m := by ring
   rw [he0,he1,he2] at hh
   exact (pair_numerator_iffMAD5 _ _ _ _ (by positivity) (by positivity) hnmq hmjq).mpr hh

theorem lower_horizontal_of_polynomialMAD5 (H : ParametricPairPositiveMAD5) : LowerHorizontalMFEE :=
 lower_horizontal_of_rationalMAD5 (rational_step_iff_polynomialMAD5.mpr H)

theorem root_of_polynomial_and_remainingMAD5 (H : ParametricPairPositiveMAD5)
 (ho : ThreeOutsideLowerMFEE) (h4 : OtherFourM9E2) : Conjecture63 :=
 root_of_rational_and_remainingMAD5 (rational_step_iff_polynomialMAD5.mpr H) ho h4

theorem lower_horizontal_paths_of_polynomialMAD5 (H : ParametricPairPositiveMAD5)
 (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1 ≤ q ∧ (frame path).mid.b=sourceNME9C q r ∧
 ∀ i j, j ≤ q → coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 refine ⟨q,r,hq,hb,?_⟩
 intro i j hj
 simp only [hp]
 exact lower_horizontal_of_polynomialMAD5 H q hq r i j hj

end
end MathGKM.Markov
