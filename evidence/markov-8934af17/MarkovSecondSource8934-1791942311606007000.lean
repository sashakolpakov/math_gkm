import MarkovSecondWord8934
import MarkovPolygon18
import MarkovSecondBounds8934
import MarkovHorizontalLCB46

/-! Machine-authored worker 8934af17. Exact source and support bridge for
the second horizontal jet. Raw coefficients and zeros are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem second_source_formula8934 (path : List Bool) (hb : 5 ≤ (frame path).mid.b) :
    ∃ n m s : ℕ, n+2=(frame path).mid.b ∧ m+1=(frame path).mid.a ∧
      3 ≤ n ∧ m ≤ n ∧ s ≤ 2*m ∧ (n ≤ 2*m ∨ s=0) ∧
      2*(Bivariate.swap (frame path).mid.p).coeff 2 =
        X^m*(X+1)^(n-3)*secondExpr8934 X n m s := by
  obtain ⟨w,hn,hm,he⟩ := source_hword46 path
  cases w with
  | nil => simp at hn; omega
  | cons e w =>
    let n := (e::w).length
    let m := (e::w).count true
    let s := stat8934 e w
    have hn3 : 3 ≤ n := by change 3 ≤ (e::w).length; omega
    have hf : 2*(Bivariate.swap (frame path).mid.p).coeff 2 =
        X^m*(X+1)^(n-3)*secondExpr8934 X n m s := by
      rw [he]; exact word_second8934 e w hn3
    refine ⟨n,m,s,hn,hm,hn3,List.count_le_length,stat_bound8934 e w,?_,hf⟩
    by_cases hz : n ≤ 2*m
    · exact Or.inl hz
    · right
      have hout : coeff (frame path).mid.p m 2=0 := by
        apply raw_outside_polygon18
        intro hp
        have hp1 := hp.1
        rw [← hn,← hm] at hp1
        change (m+1)*(n+2) ≤ (n+2)*m+(m+1)*2 at hp1
        nlinarith
      have hc := congrArg (fun p : Polynomial ℤ => p.coeff m) hf
      rw [show (2 : Polynomial ℤ)=C (2 : ℤ) by norm_num,
        Polynomial.coeff_C_mul,swap_coeff46,hout,mul_zero] at hc
      rw [mul_assoc] at hc
      have hshift := Polynomial.coeff_X_pow_mul ((X+1)^(n-3)*secondExpr8934 (X : Polynomial ℤ) n m s) m 0
      simp only [zero_add] at hshift
      rw [hshift] at hc
      simp [Polynomial.coeff_zero_eq_eval_zero,secondExpr8934] at hc
      exact_mod_cast (show (s:ℤ)=0 by omega)

theorem secondExpr_map8934 (n m s : ℕ) :
    (secondExpr8934 (X : Polynomial ℤ) n m s).map (Int.castRingHom ℝ)=
      CubicPoly5a7 (4*s) (secondB8934 m) (secondC8934 n m) (secondD8934 n m) := by
  simp [secondExpr8934,CubicPoly5a7,secondB8934,secondC8934,secondD8934,
    _root_.map_natCast,_root_.map_ofNat]

theorem second_large_crossLC8934 (path : List Bool) (hb : 5 ≤ (frame path).mid.b) :
    CrossLC (CoeffSeq (((Bivariate.swap (frame path).mid.p).coeff 2).map
      (Int.castRingHom ℝ))) := by
  obtain ⟨n,m,s,hn,hm,hn3,hmn,hs,hz,he⟩ := second_source_formula8934 path hb
  have hz' : (n:ℝ) ≤ 2*m ∨ (s:ℝ)=0 := by
    rcases hz with hz | hz
    · left; exact_mod_cast hz
    · right; exact_mod_cast hz
  obtain ⟨hA,hB,hC,hD,h1,h2,h3⟩ := second_inequalities8934 n m s (by positivity)
    (by exact_mod_cast hmn) (by positivity) (by exact_mod_cast hs) hz'
  have hcross := cubic_crossLC5a7 hA hB.le hC.le hD h1 h2 h3
  rw [← coeffSeq_cubic5a7] at hcross
  have hp := crossLC_pascal hcross (n-3)
  rw [← coeffSeq_binomial_mul] at hp
  have hshift := crossLC_X_pow_mul46 _ hp m
  have hh := congrArg (Polynomial.map (Int.castRingHom ℝ)) he
  simp only [Polynomial.map_mul,Polynomial.map_ofNat,Polynomial.map_pow,
    Polynomial.map_add,Polynomial.map_X,Polynomial.map_one,secondExpr_map8934] at hh
  have hfinal : CrossLC (CoeffSeq
      (2*((Bivariate.swap (frame path).mid.p).coeff 2).map (Int.castRingHom ℝ))) := by
    rw [hh]
    simpa [add_comm,mul_assoc] using hshift
  have hscale (p : Polynomial ℝ) (k : ℤ) : CoeffSeq (2*p) k=2*CoeffSeq p k := by
    rw [show (2 : Polynomial ℝ)=C (2 : ℝ) by rw [_root_.map_ofNat]]
    simp only [CoeffSeq]; split_ifs <;> simp [Polynomial.coeff_C_mul]
  intro i j hij
  have h := hfinal i j hij
  simp only [hscale] at h
  nlinarith

#print axioms second_source_formula8934
#print axioms second_large_crossLC8934
end
end MathGKM.Markov
