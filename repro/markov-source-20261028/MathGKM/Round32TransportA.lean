import MathGKM.Round32ConeA
import MathGKM.Acceptedb8df3e2c5c06edf954fe0b4e
import MathGKM.Accepted2a25528ee0e7d7d14c2bb9e8

/-! Machine-authored round32: conditional same-layer transport, raw zeros retained. -/
namespace SmoothingR32
open MathGKM.Markov RightR30 RightLayersR31
noncomputable section
set_option maxHeartbeats 2000000

def Hom (P : BiPoly) (m : ℕ) : Prop := ∀ i j, coeff P i j≠0 → i+j=m

def az (n h : ℕ) (s : ℤ) : ℤ := if 0 ≤ s then a n h s.toNat else 0

theorem residual_integer_cone (n h : ℕ) (hh : 1≤h) (hn : h≤n) :
    (∀ s : ℤ, ConvolutionR19.zcoeff (spec (RightExpansionR31.residual n h)) s=az n h s) ∧
    (∀ s : ℤ, 0≤az n h s) ∧
    (∀ s : ℤ, 0<az n h s ↔ 0 ≤ s ∧ s ≤ (n-h : ℕ)) ∧
    (∀ i j k : ℤ, i<j → j<k → 0<az n h i → 0<az n h k → 0<az n h j) ∧
    (∀ s : ℤ, az n h s*az n h (s+2)≤az n h (s+1)^2) := by
  have he (s : ℤ) : ConvolutionR19.zcoeff (spec (RightExpansionR31.residual n h)) s=az n h s := by
    simp only [ConvolutionR19.zcoeff,az,spec_residual]
  have hp (s : ℤ) : 0<az n h s ↔ 0 ≤ s ∧ s ≤ (n-h : ℕ) := by
    by_cases hs : 0 ≤ s
    · simp only [az,if_pos hs,a_pos n h s.toNat hh hn]
      omega
    · simp [az,hs]
  refine ⟨he,?_,hp,?_,?_⟩
  · intro s
    unfold az
    split_ifs
    · exact a_nonneg _ _ _
    · omega
  · intro i j k hij hjk hi hk
    have := (hp i).mp hi
    have := (hp k).mp hk
    apply (hp j).mpr
    constructor <;> omega
  · intro s
    rcases residual_cone n h hh hn with ⟨hc,hpos,hint,hlc⟩
    have hz := (Accepted2a25528ee0e7d7d14c2bb9e8.obligation
      (spec (RightExpansionR31.residual n h)) hpos hint hlc 0).2 s
    simpa only [pow_zero,one_mul,he] using hz

theorem homogeneous_spec (P : BiPoly) (m : ℕ) (hP : Hom P m)
    (i j : ℕ) (hij : i+j=m) : (spec P).coeff i=coeff P i j := by
  classical
  simp only [spec,Polynomial.coe_mapRingHom,Polynomial.coeff_map,
    Polynomial.coe_evalRingHom]
  change (P.coeff i).eval 1=(P.coeff i).coeff j
  rw [Polynomial.eval_eq_sum]
  simp only [Polynomial.sum,one_pow,mul_one]
  apply Finset.sum_eq_single j
  · intro t ht htj
    by_contra hz
    have he := hP i t hz
    omega
  · intro hj
    simpa only [Polynomial.mem_support_iff,not_not] using hj

theorem layer_hom (P : BiPoly) (m : ℕ) : Hom ((grade P).coeff m) m := by
  intro i j hij
  have hc := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.1 P m i j
  by_contra hn
  rw [if_neg hn] at hc
  exact hij hc

theorem generic_layer_transport (P R : BiPoly) (b r m : ℕ)
    (hm : m=b+r) (hR : Hom R r)
    (hfactor : (grade P).coeff m=T^b*R)
    (hn : ∀ k, 0≤(spec R).coeff k)
    (hg : ∀ i j k, i<j → j<k → 0<(spec R).coeff i →
      0<(spec R).coeff k → 0<(spec R).coeff j)
    (hl : ∀ k, (spec R).coeff k*(spec R).coeff (k+2)≤(spec R).coeff (k+1)^2) :
    (∀ i j, i+j=r → (spec R).coeff i=coeff R i j) ∧
    (∀ i j, i+j=m → ((1+Polynomial.X)^b*spec R).coeff i=coeff P i j) ∧
    (∀ i j, i+j+2=m → coeff P i (j+2)*coeff P (i+2) j≤coeff P (i+1) (j+1)^2) := by
  have hs : spec (T^b*R)=(1+Polynomial.X)^b*spec R := by
    simp only [map_mul,map_pow]
    congr 2
    simp [spec,T,U,V,add_comm]
  have recover (i j : ℕ) (hij : i+j=m) :
      ((1+Polynomial.X)^b*spec R).coeff i=coeff P i j := by
    rw [← hs,← hfactor,homogeneous_spec _ m (layer_hom P m) i j hij]
    have hc := Acceptedb8df3e2c5c06edf954fe0b4e.obligation.2.1 P m i j
    simpa only [if_pos hij] using hc
  refine ⟨fun i j hij => homogeneous_spec R r hR i j hij,recover,?_⟩
  intro i j hij
  have hc := (Accepted2a25528ee0e7d7d14c2bb9e8.obligation (spec R) hn hg hl b).2 (i : ℤ)
  have ez (s : ℕ) : ConvolutionR19.zcoeff ((1+Polynomial.X)^b*spec R) (s : ℤ)=
      ((1+Polynomial.X)^b*spec R).coeff s := by simp [ConvolutionR19.zcoeff]
  have e1 : (i:ℤ)+1=((i+1:ℕ):ℤ) := by omega
  have e2 : (i:ℤ)+2=((i+2:ℕ):ℤ) := by omega
  rw [e1,e2,ez,ez,ez] at hc
  rw [recover i (j+2) (by omega),recover (i+2) j (by omega),
    recover (i+1) (j+1) (by omega)] at hc
  exact hc

end
end SmoothingR32
