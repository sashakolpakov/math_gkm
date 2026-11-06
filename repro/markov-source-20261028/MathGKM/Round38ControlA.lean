import MathGKM.Round30RightCoefficientsA

/-! Machine-authored round38 nonreachable auxiliary control. Universal input
conditions use integer zero extension in both coordinate directions. -/
namespace StateCrossR38
open MathGKM.Markov
noncomputable section
set_option maxHeartbeats 1000000

def zcoeff (P : BiPoly) (i j : ℤ) : ℤ :=
  if 0 ≤ i ∧ 0 ≤ j then coeff P i.toNat j.toNat else 0
def point (a b i j : ℤ) : ℤ := if i=a ∧ j=b then 1 else 0
def auxB : BiPoly := U^2*V
def auxA' : BiPoly := (U+V)^2*1+U*1+V*auxB
def auxB' : BiPoly := (U+V)^2*1+V*auxB

theorem coeff_uv (a b i j : ℕ) :
    coeff (U^a*V^b) i j = if i=a ∧ j=b then 1 else 0 := by
  have h := RightR30.coeff_shift 1 a b i j
  simp only [mul_one] at h
  rw [h]
  simp only [RightR30.shift,RightR30.coeff_one_delta,RightR30.delta]
  split_ifs <;> simp_all <;> omega

theorem z_uv (a b : ℕ) (i j : ℤ) :
    zcoeff (U^a*V^b) i j=point a b i j := by
  simp only [zcoeff,coeff_uv,point]
  by_cases hi : 0 ≤ i
  · by_cases hj : 0 ≤ j
    · simp only [hi,hj,and_self,ite_true]
      have he : (i.toNat=a ∧ j.toNat=b) ↔ (i=(a:ℤ) ∧ j=(b:ℤ)) := by omega
      simp only [he]
    · have he : ¬ (i=(a:ℤ) ∧ j=(b:ℤ)) := by omega
      simp [hj,he]
  · have he : ¬ (i=(a:ℤ) ∧ j=(b:ℤ)) := by omega
    simp [hi,he]

theorem z_one (i j : ℤ) : zcoeff (1 : BiPoly) i j=point 0 0 i j := by
  simpa using z_uv 0 0 i j
theorem z_auxB (i j : ℤ) : zcoeff auxB i j=point 2 1 i j := by
  simpa [auxB] using z_uv 2 1 i j

theorem point_nn (a b i j : ℤ) : 0 ≤ point a b i j := by
  unfold point
  split_ifs <;> norm_num

theorem point_ends (a b c d dx dy : ℤ)
    (h : a+2*dx≠c ∨ b+2*dy≠d) (i j : ℤ) :
    point a b i j*point c d (i+2*dx) (j+2*dy)=0 := by
  by_cases he : i=a ∧ j=b
  · rcases he with ⟨hi,hj⟩
    have hn : ¬ (a+2*dx=c ∧ b+2*dy=d) := by omega
    simp [point,hi,hj,hn]
  · simp [point,he]

def CoordinateInputs (P Q : BiPoly) : Prop :=
  (∀ i j : ℤ, 0 ≤ zcoeff P i j ∧ 0 ≤ zcoeff Q i j) ∧
  ∀ i j dx dy : ℤ, (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1) →
    zcoeff P i j*zcoeff P (i+2*dx) (j+2*dy) ≤ zcoeff P (i+dx) (j+dy)^2 ∧
    zcoeff Q i j*zcoeff Q (i+2*dx) (j+2*dy) ≤ zcoeff Q (i+dx) (j+dy)^2 ∧
    zcoeff P i j*zcoeff Q (i+2*dx) (j+2*dy) ≤
      zcoeff P (i+dx) (j+dy)*zcoeff Q (i+dx) (j+dy) ∧
    zcoeff Q i j*zcoeff P (i+2*dx) (j+2*dy) ≤
      zcoeff P (i+dx) (j+dy)*zcoeff Q (i+dx) (j+dy)

theorem control_inputs : CoordinateInputs 1 auxB := by
  constructor
  · intro i j
    rw [z_one,z_auxB]
    exact ⟨point_nn _ _ _ _,point_nn _ _ _ _⟩
  · intro i j dx dy hd
    simp only [z_one,z_auxB]
    have h00 := point_ends 0 0 0 0 dx dy (by rcases hd with h|h <;> omega) i j
    have h11 := point_ends 2 1 2 1 dx dy (by rcases hd with h|h <;> omega) i j
    have h01 := point_ends 0 0 2 1 dx dy (by rcases hd with h|h <;> omega) i j
    have h10 := point_ends 2 1 0 0 dx dy (by rcases hd with h|h <;> omega) i j
    rw [h00,h11,h01,h10]
    exact ⟨sq_nonneg _,sq_nonneg _,mul_nonneg (point_nn _ _ _ _) (point_nn _ _ _ _),
      mul_nonneg (point_nn _ _ _ _) (point_nn _ _ _ _)⟩

theorem control_output :
    coeff auxA' 0 2=1 ∧ coeff auxA' 1 2=0 ∧ coeff auxA' 2 2=1 ∧
    coeff auxA' 0 2*coeff auxA' 2 2 > coeff auxA' 1 2^2 := by
  have he : auxA'=U^2*V^0+U^1*V^1+U^1*V^1+U^0*V^2+U^1*V^0+U^2*V^2 := by
    dsimp [auxA',auxB]
    ring
  rw [he]
  have hadd (P Q : BiPoly) (i j : ℕ) : coeff (P+Q) i j=coeff P i j+coeff Q i j := by
    simp [coeff]
  simp only [hadd,coeff_uv]
  norm_num

theorem transfer_control : CoordinateInputs 1 auxB ∧
    coeff auxA' 0 2=1 ∧ coeff auxA' 1 2=0 ∧ coeff auxA' 2 2=1 ∧
    coeff auxA' 0 2*coeff auxA' 2 2 > coeff auxA' 1 2^2 :=
  ⟨control_inputs,control_output⟩

theorem transfer_weights (i j : ℕ) :
    0 ≤ coeff ((U+V)^2) i j ∧ 0 ≤ coeff U i j ∧ 0 ≤ coeff V i j := by
  have hd : ∀ i j, 0 ≤ RightR30.delta i j := by
    intro i j
    unfold RightR30.delta
    split_ifs <;> norm_num
  have ht := congrFun (congrFun (RightR30.coeff_quad (1 : BiPoly)) i) j
  simp only [mul_one,RightR30.coeff_one_delta,RightR30.T] at ht
  have hu := RightR30.coeff_U (1 : BiPoly) i j
  have hv := RightR30.coeff_V (1 : BiPoly) i j
  simp only [mul_one,RightR30.coeff_one_delta] at hu hv
  rw [ht,hu,hv]
  exact ⟨RightR30.quad_nonnegative _ hd _ _,
    RightR30.shift_nonnegative _ hd _ _ _ _,RightR30.shift_nonnegative _ hd _ _ _ _⟩

theorem control_state :
    RenewalR28.state ((U+V)^2) U V 1 auxB 1=(auxA',auxB') := by
  rw [show (1 : ℕ)=0+1 from rfl,RenewalR28.state_step,RenewalR28.state_zero]
  apply Prod.ext <;> dsimp [auxA',auxB'] <;> ring

theorem full_transfer_control :
    CoordinateInputs 1 auxB ∧
    (∀ i j : ℕ, 0 ≤ coeff ((U+V)^2) i j ∧ 0 ≤ coeff U i j ∧ 0 ≤ coeff V i j) ∧
    RenewalR28.state ((U+V)^2) U V 1 auxB 1=(auxA',auxB') ∧
    coeff auxA' 0 2=1 ∧ coeff auxA' 1 2=0 ∧ coeff auxA' 2 2=1 ∧
    coeff auxA' 0 2*coeff auxA' 2 2 > coeff auxA' 1 2^2 :=
  ⟨control_inputs,transfer_weights,control_state,control_output⟩

end
end StateCrossR38
