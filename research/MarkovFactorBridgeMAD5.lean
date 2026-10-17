import MarkovClearingBridgeMAD5
/-! Machine-authored ad504da6. Exact compact factor bridge; no positivity claim for the difference. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
def pf0MAD5 (T x g z : ℚ) : ℚ := (2+1*g+1*x)
def pf1MAD5 (T x g z : ℚ) : ℚ := (7+1*T+1*g+1*x)
def pf2MAD5 (T x g z : ℚ) : ℚ := (8+1*T+1*g+1*x)
def pf3MAD5 (T x g z : ℚ) : ℚ := (54+15*T+1*T^2+28*z+4*z*T+4*z^2+15*g+2*g*T+4*g*z+1*g^2+15*x+2*x*T+4*x*z+2*x*g+1*x^2)
def pf4MAD5 (T x g z : ℚ) : ℚ := (1*x)
def pf5MAD5 (T x g z : ℚ) : ℚ := (5+1*T+1*x)
def pf6MAD5 (T x g z : ℚ) : ℚ := (6+1*T+1*x)
def pf7MAD5 (T x g z : ℚ) : ℚ := (84+19*T+1*T^2+36*z+4*z*T+4*z^2+36*g+4*g*T+8*g*z+4*g^2+19*x+2*x*T+4*x*z+4*x*g+1*x^2)
def pf8MAD5 (T x g z : ℚ) : ℚ := (1+1*g+1*x)
def pf9MAD5 (T x g z : ℚ) : ℚ := (6+1*T+1*g+1*x)
def pf10MAD5 (T x g z : ℚ) : ℚ := (68+17*T+1*T^2+32*z+4*z*T+4*z^2+17*g+2*g*T+4*g*z+1*g^2+17*x+2*x*T+4*x*z+2*x*g+1*x^2)
def pf11MAD5 (T x g z : ℚ) : ℚ := (1+1*x)
def pf12MAD5 (T x g z : ℚ) : ℚ := (7+1*T+1*x)
def pf13MAD5 (T x g z : ℚ) : ℚ := (68+17*T+1*T^2+32*z+4*z*T+4*z^2+32*g+4*g*T+8*g*z+4*g^2+17*x+2*x*T+4*x*z+4*x*g+1*x^2)
def pf14MAD5 (T x g z : ℚ) : ℚ := (1*z)
def pf15MAD5 (T x g z : ℚ) : ℚ := (58+15*T+1*T^2+28*z+4*z*T+4*z^2+15*g+2*g*T+4*g*z+1*g^2+15*x+2*x*T+4*x*z+2*x*g+1*x^2)
def pf16MAD5 (T x g z : ℚ) : ℚ := (2+1*z+1*g)
def pf17MAD5 (T x g z : ℚ) : ℚ := (88+19*T+1*T^2+36*z+4*z*T+4*z^2+36*g+4*g*T+8*g*z+4*g^2+19*x+2*x*T+4*x*z+4*x*g+1*x^2)
def pf18MAD5 (T x g z : ℚ) : ℚ := (1+1*z)
def pf19MAD5 (T x g z : ℚ) : ℚ := (72+17*T+1*T^2+32*z+4*z*T+4*z^2+17*g+2*g*T+4*g*z+1*g^2+17*x+2*x*T+4*x*z+2*x*g+1*x^2)
def pf20MAD5 (T x g z : ℚ) : ℚ := (1+1*z+1*g)
def pf21MAD5 (T x g z : ℚ) : ℚ := (72+17*T+1*T^2+32*z+4*z*T+4*z^2+32*g+4*g*T+8*g*z+4*g^2+17*x+2*x*T+4*x*z+4*x*g+1*x^2)
def pf22MAD5 (T x g z : ℚ) : ℚ := (5+1*T+1*g+1*x)
def pf23MAD5 (T x g z : ℚ) : ℚ := (56+15*T+1*T^2+28*z+4*z*T+4*z^2+15*g+2*g*T+4*g*z+1*g^2+15*x+2*x*T+4*x*z+2*x*g+1*x^2)
def pf24MAD5 (T x g z : ℚ) : ℚ := (3+1*z+1*g)
def pf25MAD5 (T x g z : ℚ) : ℚ := (3+1*T+1*x)
def pf26MAD5 (T x g z : ℚ) : ℚ := (4+1*T+1*x)
def pf27MAD5 (T x g z : ℚ) : ℚ := (86+19*T+1*T^2+36*z+4*z*T+4*z^2+36*g+4*g*T+8*g*z+4*g^2+19*x+2*x*T+4*x*z+4*x*g+1*x^2)
def pf28MAD5 (T x g z : ℚ) : ℚ := (2+1*z)
def pf29MAD5 (T x g z : ℚ) : ℚ := (4+1*T+1*g+1*x)
def pf30MAD5 (T x g z : ℚ) : ℚ := (70+17*T+1*T^2+32*z+4*z*T+4*z^2+17*g+2*g*T+4*g*z+1*g^2+17*x+2*x*T+4*x*z+2*x*g+1*x^2)
def pf31MAD5 (T x g z : ℚ) : ℚ := (70+17*T+1*T^2+32*z+4*z*T+4*z^2+32*g+4*g*T+8*g*z+4*g^2+17*x+2*x*T+4*x*z+4*x*g+1*x^2)
def pf32MAD5 (T x g z : ℚ) : ℚ := (3+1*g+1*x)
def pf33MAD5 (T x g z : ℚ) : ℚ := (9+1*T+1*g+1*x)
def pf34MAD5 (T x g z : ℚ) : ℚ := (10+1*T+1*g+1*x)
def pf35MAD5 (T x g z : ℚ) : ℚ := (8+1*T+1*x)
def pf36MAD5 (T x g z : ℚ) : ℚ := (2+1*x)
def pf37MAD5 (T x g z : ℚ) : ℚ := (9+1*T+1*x)
def pairReducedMAD5 (T x g z : ℚ) : ℚ :=
 (pf0MAD5 T x g z*pf2MAD5 T x g z*pf3MAD5 T x g z*pf16MAD5 T x g z*pf5MAD5 T x g z*pf17MAD5 T x g z*pf32MAD5 T x g z*pf34MAD5 T x g z*pf24MAD5 T x g z*pf25MAD5 T x g z*pf28MAD5 T x g z*pf29MAD5 T x g z*pf0MAD5 T x g z*pf2MAD5 T x g z*pf33MAD5 T x g z*pf30MAD5 T x g z*pf16MAD5 T x g z*pf26MAD5 T x g z*pf5MAD5 T x g z*pf36MAD5 T x g z*pf37MAD5 T x g z*pf31MAD5 T x g z)+(pf4MAD5 T x g z*pf5MAD5 T x g z*pf7MAD5 T x g z*pf14MAD5 T x g z*pf2MAD5 T x g z*pf15MAD5 T x g z*pf18MAD5 T x g z*pf9MAD5 T x g z*pf11MAD5 T x g z*pf12MAD5 T x g z*pf28MAD5 T x g z*pf29MAD5 T x g z*pf22MAD5 T x g z*pf0MAD5 T x g z*pf2MAD5 T x g z*pf30MAD5 T x g z*pf16MAD5 T x g z*pf5MAD5 T x g z*pf36MAD5 T x g z*pf35MAD5 T x g z*pf37MAD5 T x g z*pf31MAD5 T x g z)-(pf8MAD5 T x g z*pf9MAD5 T x g z*pf10MAD5 T x g z*pf20MAD5 T x g z*pf12MAD5 T x g z*pf21MAD5 T x g z*pf18MAD5 T x g z*pf9MAD5 T x g z*pf32MAD5 T x g z*pf34MAD5 T x g z*pf23MAD5 T x g z*pf24MAD5 T x g z*pf25MAD5 T x g z*pf11MAD5 T x g z*pf12MAD5 T x g z*pf27MAD5 T x g z*pf0MAD5 T x g z*pf2MAD5 T x g z*pf33MAD5 T x g z*pf16MAD5 T x g z*pf26MAD5 T x g z*pf5MAD5 T x g z)-(pf11MAD5 T x g z*pf12MAD5 T x g z*pf13MAD5 T x g z*pf18MAD5 T x g z*pf9MAD5 T x g z*pf19MAD5 T x g z*pf18MAD5 T x g z*pf9MAD5 T x g z*pf32MAD5 T x g z*pf34MAD5 T x g z*pf23MAD5 T x g z*pf24MAD5 T x g z*pf25MAD5 T x g z*pf11MAD5 T x g z*pf12MAD5 T x g z*pf27MAD5 T x g z*pf28MAD5 T x g z*pf29MAD5 T x g z*pf22MAD5 T x g z*pf36MAD5 T x g z*pf35MAD5 T x g z*pf37MAD5 T x g z)
def pairPrefactorMAD5 (T x g z : ℚ) : ℚ := pf1MAD5 T x g z*pf6MAD5 T x g z*pf33MAD5 T x g z*pf26MAD5 T x g z*pf22MAD5 T x g z*pf35MAD5 T x g z*pf23MAD5 T x g z*pf27MAD5 T x g z*pf30MAD5 T x g z*pf31MAD5 T x g z
theorem normAn0MAD5 (T x g z : ℚ) : pairAnMAD5 (x+g+2+z) (T+1) (x+g+2)=pf0MAD5 T x g z*pf1MAD5 T x g z*pf2MAD5 T x g z*pf3MAD5 T x g z := by
 unfold pairAnMAD5 liftWeightMAE9 liftDenMAE9 pf0MAD5 pf1MAD5 pf2MAD5 pf3MAD5
 ring
theorem normAn1MAD5 (T x g z : ℚ) : pairAnMAD5 (x+g+2+z) (T+1) x=pf4MAD5 T x g z*pf5MAD5 T x g z*pf6MAD5 T x g z*pf7MAD5 T x g z := by
 unfold pairAnMAD5 liftWeightMAE9 liftDenMAE9 pf4MAD5 pf5MAD5 pf6MAD5 pf7MAD5
 ring
theorem normAn2MAD5 (T x g z : ℚ) : pairAnMAD5 (x+g+2+z) (T+1) (x+g+2-1)=pf8MAD5 T x g z*pf9MAD5 T x g z*pf1MAD5 T x g z*pf10MAD5 T x g z := by
 unfold pairAnMAD5 liftWeightMAE9 liftDenMAE9 pf8MAD5 pf9MAD5 pf1MAD5 pf10MAD5
 ring
theorem normAn3MAD5 (T x g z : ℚ) : pairAnMAD5 (x+g+2+z) (T+1) (x+1)=pf11MAD5 T x g z*pf6MAD5 T x g z*pf12MAD5 T x g z*pf13MAD5 T x g z := by
 unfold pairAnMAD5 liftWeightMAE9 liftDenMAE9 pf11MAD5 pf6MAD5 pf12MAD5 pf13MAD5
 ring
theorem normBn0MAD5 (T x g z : ℚ) : pairBnMAD5 (x+g+2+z) (T+1) (x+g+2)=pf14MAD5 T x g z*pf1MAD5 T x g z*pf2MAD5 T x g z*pf15MAD5 T x g z := by
 unfold pairBnMAD5 liftWeightMAE9 liftDenMAE9 pf14MAD5 pf1MAD5 pf2MAD5 pf15MAD5
 ring
theorem normBn1MAD5 (T x g z : ℚ) : pairBnMAD5 (x+g+2+z) (T+1) x=pf16MAD5 T x g z*pf5MAD5 T x g z*pf6MAD5 T x g z*pf17MAD5 T x g z := by
 unfold pairBnMAD5 liftWeightMAE9 liftDenMAE9 pf16MAD5 pf5MAD5 pf6MAD5 pf17MAD5
 ring
theorem normBn2MAD5 (T x g z : ℚ) : pairBnMAD5 (x+g+2+z) (T+1) (x+g+2-1)=pf18MAD5 T x g z*pf9MAD5 T x g z*pf1MAD5 T x g z*pf19MAD5 T x g z := by
 unfold pairBnMAD5 liftWeightMAE9 liftDenMAE9 pf18MAD5 pf9MAD5 pf1MAD5 pf19MAD5
 ring
theorem normBn3MAD5 (T x g z : ℚ) : pairBnMAD5 (x+g+2+z) (T+1) (x+1)=pf20MAD5 T x g z*pf6MAD5 T x g z*pf12MAD5 T x g z*pf21MAD5 T x g z := by
 unfold pairBnMAD5 liftWeightMAE9 liftDenMAE9 pf20MAD5 pf6MAD5 pf12MAD5 pf21MAD5
 ring
theorem normAd0MAD5 (T x g z : ℚ) : pairAdMAD5 (x+g+2+z) (T+1) (x+g+2)=pf18MAD5 T x g z*pf22MAD5 T x g z*pf9MAD5 T x g z*pf23MAD5 T x g z := by
 unfold pairAdMAD5 liftWeightMAE9 liftDenMAE9 pf18MAD5 pf22MAD5 pf9MAD5 pf23MAD5
 ring
theorem normAd1MAD5 (T x g z : ℚ) : pairAdMAD5 (x+g+2+z) (T+1) x=pf24MAD5 T x g z*pf25MAD5 T x g z*pf26MAD5 T x g z*pf27MAD5 T x g z := by
 unfold pairAdMAD5 liftWeightMAE9 liftDenMAE9 pf24MAD5 pf25MAD5 pf26MAD5 pf27MAD5
 ring
theorem normAd2MAD5 (T x g z : ℚ) : pairAdMAD5 (x+g+2+z) (T+1) (x+g+2-1)=pf28MAD5 T x g z*pf29MAD5 T x g z*pf22MAD5 T x g z*pf30MAD5 T x g z := by
 unfold pairAdMAD5 liftWeightMAE9 liftDenMAE9 pf28MAD5 pf29MAD5 pf22MAD5 pf30MAD5
 ring
theorem normAd3MAD5 (T x g z : ℚ) : pairAdMAD5 (x+g+2+z) (T+1) (x+1)=pf16MAD5 T x g z*pf26MAD5 T x g z*pf5MAD5 T x g z*pf31MAD5 T x g z := by
 unfold pairAdMAD5 liftWeightMAE9 liftDenMAE9 pf16MAD5 pf26MAD5 pf5MAD5 pf31MAD5
 ring
theorem normBd0MAD5 (T x g z : ℚ) : pairBdMAD5 (x+g+2+z) (T+1) (x+g+2)=pf32MAD5 T x g z*pf33MAD5 T x g z*pf34MAD5 T x g z*pf23MAD5 T x g z := by
 unfold pairBdMAD5 liftWeightMAE9 liftDenMAE9 pf32MAD5 pf33MAD5 pf34MAD5 pf23MAD5
 ring
theorem normBd1MAD5 (T x g z : ℚ) : pairBdMAD5 (x+g+2+z) (T+1) x=pf11MAD5 T x g z*pf12MAD5 T x g z*pf35MAD5 T x g z*pf27MAD5 T x g z := by
 unfold pairBdMAD5 liftWeightMAE9 liftDenMAE9 pf11MAD5 pf12MAD5 pf35MAD5 pf27MAD5
 ring
theorem normBd2MAD5 (T x g z : ℚ) : pairBdMAD5 (x+g+2+z) (T+1) (x+g+2-1)=pf0MAD5 T x g z*pf2MAD5 T x g z*pf33MAD5 T x g z*pf30MAD5 T x g z := by
 unfold pairBdMAD5 liftWeightMAE9 liftDenMAE9 pf0MAD5 pf2MAD5 pf33MAD5 pf30MAD5
 ring
theorem normBd3MAD5 (T x g z : ℚ) : pairBdMAD5 (x+g+2+z) (T+1) (x+1)=pf36MAD5 T x g z*pf35MAD5 T x g z*pf37MAD5 T x g z*pf31MAD5 T x g z := by
 unfold pairBdMAD5 liftWeightMAE9 liftDenMAE9 pf36MAD5 pf35MAD5 pf37MAD5 pf31MAD5
 ring
theorem pair_reduced_identityMAD5 (T x g z : ℚ) :
 pairNumeratorMAD5 (x+g+2+z) (T+1) (x+g+2) x=pairPrefactorMAD5 T x g z*pairReducedMAD5 T x g z := by
 unfold pairNumeratorMAD5 pairProductNMAD5 pairProductDMAD5
 rw [normAn0MAD5,normAn1MAD5,normAn2MAD5,normAn3MAD5,normBn0MAD5,normBn1MAD5,normBn2MAD5,normBn3MAD5,normAd0MAD5,normAd1MAD5,normAd2MAD5,normAd3MAD5,normBd0MAD5,normBd1MAD5,normBd2MAD5,normBd3MAD5]
 unfold pairPrefactorMAD5 pairReducedMAD5
 ring
theorem pair_prefactor_positiveMAD5 (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) :
 0 < pairPrefactorMAD5 T x g z := by
 unfold pairPrefactorMAD5 pf1MAD5 pf6MAD5 pf33MAD5 pf26MAD5 pf22MAD5 pf35MAD5 pf23MAD5 pf27MAD5 pf30MAD5 pf31MAD5
 positivity
def ReducedPairPositiveMAD5 : Prop := ∀ T x g z : ℕ, 0 ≤ pairReducedMAD5 T x g z
theorem reduced_pair_iff_polynomialMAD5 : ReducedPairPositiveMAD5 ↔ ParametricPairPositiveMAD5 := by
 constructor
 · intro H T x g z
   rw [pair_reduced_identityMAD5]
   exact mul_nonneg (pair_prefactor_positiveMAD5 T x g z (by positivity) (by positivity) (by positivity) (by positivity)).le (H T x g z)
 · intro H T x g z
   have hh := H T x g z
   rw [pair_reduced_identityMAD5] at hh
   exact (mul_nonneg_iff_of_pos_left (pair_prefactor_positiveMAD5 T x g z (by positivity) (by positivity) (by positivity) (by positivity))).mp hh
theorem lower_horizontal_of_reducedMAD5 (H : ReducedPairPositiveMAD5) : LowerHorizontalMFEE :=
 lower_horizontal_of_polynomialMAD5 (reduced_pair_iff_polynomialMAD5.mp H)
end
end MathGKM.Markov
