import MarkovSupport725
import MarkovHorizontalB46
import MarkovCross774

/-! Machine-authored request 7252232b. Exact no-internal-zero statements for
the two coordinate directions, and the corresponding CrossLC bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem positive_in_polygon725 (path : List Bool) (i j : ℕ)
    (h : 0 < coeff (frame path).mid.p i j) :
    InPolygon (frame path).mid.a (frame path).mid.b i j := by
  by_contra hn
  rw [raw_outside_polygon18 path i j hn] at h
  omega

theorem horizontal_interval_nat725 (path : List Bool) (i k l j : ℕ)
    (hik : i≤k) (hkl : k≤l)
    (hi : 0<coeff (frame path).mid.p i j)
    (hl : 0<coeff (frame path).mid.p l j) : 0<coeff (frame path).mid.p k j := by
  have hb := (positive_in_polygon725 path l j hl).2
  exact source_filled725 path i j hi k j hik le_rfl (by omega)

theorem vertical_interval_nat725 (path : List Bool) (i j k l : ℕ)
    (hjk : j≤k) (hkl : k≤l)
    (hj : 0<coeff (frame path).mid.p i j)
    (hl : 0<coeff (frame path).mid.p i l) : 0<coeff (frame path).mid.p i k := by
  have hb := (positive_in_polygon725 path i l hl).2
  exact source_filled725 path i j hj i k le_rfl hjk (by omega)

def zeroSeq725 (f : ℕ → ℤ) (k : ℤ) : ℝ := if k<0 then 0 else (f k.toNat : ℝ)

theorem zeroSeq_interval725 (f : ℕ → ℤ)
    (hs : ∀ i k l, i≤k → k≤l → 0<f i → 0<f l → 0<f k) :
    IntervalSupport774 (zeroSeq725 f) := by
  intro i k l hik hkl hi hl
  have hin : ¬i<0 := by intro h; simp [zeroSeq725,h] at hi
  have hln : ¬l<0 := by omega
  have hkn : ¬k<0 := by omega
  simp only [zeroSeq725,hin,hln,hkn,if_false] at hi hl ⊢
  have hi' : 0<f i.toNat := by exact_mod_cast hi
  have hl' : 0<f l.toNat := by exact_mod_cast hl
  exact_mod_cast hs i.toNat k.toNat l.toNat (by omega) (by omega) hi' hl'

theorem zeroSeq_cross_iff725 (f : ℕ → ℤ) (hn : ∀ k, 0≤f k)
    (hs : IntervalSupport774 (zeroSeq725 f)) :
    CrossLC (zeroSeq725 f) ↔ ∀ i, f i*f (i+2)≤f (i+1)^2 := by
  constructor
  · intro h i
    have hh := crossLC_adjacent h ((i:ℤ)+1)
    have h0 : ¬(i:ℤ)<0 := by omega
    have h1 : ¬(i:ℤ)+1<0 := by omega
    have h2 : ¬(i:ℤ)+1+1<0 := by omega
    simp only [zeroSeq725,add_sub_cancel_right,h0,h1,h2,if_false,
      Int.toNat_natCast] at hh
    have he1 : ((i:ℤ)+1).toNat=i+1 := by omega
    have he2 : ((i:ℤ)+1+1).toNat=i+2 := by omega
    rw [he1,he2] at hh
    exact_mod_cast hh
  · intro h
    apply crossLC_of_adjacent_interval774 _ ?_ ?_ hs
    · intro k
      unfold zeroSeq725
      split_ifs
      · exact le_rfl
      · exact_mod_cast hn k.toNat
    · intro k
      by_cases hk : k≤0
      · have hkm : k-1<0 := by omega
        simp only [zeroSeq725,hkm,if_true,zero_mul]
        positivity
      · have hk0 : ¬k<0 := by omega
        have hkm : ¬k-1<0 := by omega
        have hkp : ¬k+1<0 := by omega
        simp only [zeroSeq725,hk0,hkm,hkp,if_false]
        have he0 : (k-1).toNat+1=k.toNat := by omega
        have he1 : (k-1).toNat+2=(k+1).toNat := by omega
        have hh := h (k-1).toNat
        rw [he0,he1] at hh
        exact_mod_cast hh

theorem horizontal_sequence725 (path : List Bool) (j : ℕ) :
    CoeffSeq (((Bivariate.swap (frame path).mid.p).coeff j).map (Int.castRingHom ℝ)) =
      zeroSeq725 (fun i => coeff (frame path).mid.p i j) := by
  funext k
  simp only [CoeffSeq,zeroSeq725,Polynomial.coeff_map,swap_coeff46]
  rfl

theorem vertical_sequence725 (path : List Bool) (i : ℕ) :
    CoeffSeq (((frame path).mid.p.coeff i).map (Int.castRingHom ℝ)) =
      zeroSeq725 (fun j => coeff (frame path).mid.p i j) := by
  funext k
  simp only [CoeffSeq,zeroSeq725,Polynomial.coeff_map,coeff]
  rfl

theorem horizontal_interval725 (path : List Bool) (j : ℕ) :
    IntervalSupport774
      (CoeffSeq (((Bivariate.swap (frame path).mid.p).coeff j).map (Int.castRingHom ℝ))) := by
  rw [horizontal_sequence725]
  exact zeroSeq_interval725 _ (fun i k l => horizontal_interval_nat725 path i k l j)

theorem vertical_interval725 (path : List Bool) (i : ℕ) :
    IntervalSupport774 (CoeffSeq (((frame path).mid.p.coeff i).map (Int.castRingHom ℝ))) := by
  rw [vertical_sequence725]
  exact zeroSeq_interval725 _ (fun j k l => vertical_interval_nat725 path i j k l)

/-- A universal equivalence, not a proof of either inequality side. -/
theorem horizontal_cross_iff725 (path : List Bool) (j : ℕ) :
    CrossLC (CoeffSeq (((Bivariate.swap (frame path).mid.p).coeff j).map (Int.castRingHom ℝ))) ↔
      ∀ i, coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j≤
        coeff (frame path).mid.p (i+1) j^2 := by
  rw [horizontal_sequence725]
  exact zeroSeq_cross_iff725 _ (fun i => raw_coeff_nonneg18 path i j)
    (zeroSeq_interval725 _ (fun i k l => horizontal_interval_nat725 path i k l j))

theorem vertical_cross_iff725 (path : List Bool) (i : ℕ) :
    CrossLC (CoeffSeq (((frame path).mid.p.coeff i).map (Int.castRingHom ℝ))) ↔
      ∀ j, coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2)≤
        coeff (frame path).mid.p i (j+1)^2 := by
  rw [vertical_sequence725]
  exact zeroSeq_cross_iff725 _ (raw_coeff_nonneg18 path i)
    (zeroSeq_interval725 _ (fun j k l => vertical_interval_nat725 path i j k l))

#print axioms horizontal_interval725
#print axioms vertical_interval725
#print axioms horizontal_cross_iff725
#print axioms vertical_cross_iff725
end
end MathGKM.Markov
