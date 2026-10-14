import MarkovCubicJet5a7
import MarkovCubicBounds5a7
import MarkovLowSlices5a7

/-! Machine-authored worker 5a7c193a. Fourth upper diagonal, via the exact
source matrix word. All coefficient positivity used below is source-linked. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem switches_bound5a7 (e : Bool) (w : List Bool) :
    switchesFrom5a7 e w ≤ 2*w.count false+(if e then 0 else 1) := by
  induction w generalizing e with
  | nil => simp [switchesFrom5a7]
  | cons r rs ih =>
    have h := ih r
    cases e <;> cases r <;> simp [switchesFrom5a7,List.count_cons] at h ⊢ <;> omega

theorem bool_counts5a7 (w : List Bool) : w.count false+w.count true=w.length := by
  induction w with
  | nil => simp
  | cons e w ih => cases e <;> simp [List.count_cons] <;> omega

theorem switches_core_bound5a7 (e : Bool) (w : List Bool) :
    switchesFrom5a7 e w ≤ 2*((e::w).length-(e::w).count true) := by
  have h := switches_bound5a7 e w
  have hcnt := bool_counts5a7 w
  cases e <;> simp [List.count_cons] at h ⊢ <;> omega

theorem cubicExpr_map5a7 (n m s : ℕ) :
    (cubicExpr5a7 (X : Polynomial ℤ) n m s).map (Int.castRingHom ℝ)=
      CubicPoly5a7 (cubicA5a7 m) (cubicB5a7 n m s) (cubicC5a7 n m) (cubicD5a7 n) := by
  simp [cubicExpr5a7,CubicPoly5a7,cubicA5a7,cubicB5a7,cubicC5a7,cubicD5a7,
    _root_.map_natCast,_root_.map_ofNat]

theorem fourth_source_formula5a7 (path : List Bool)
    (hr : 6 ≤ (frame path).mid.a+(frame path).mid.b-1) :
    ∃ n m s : ℕ, n+2=(frame path).mid.b ∧ m+1=(frame path).mid.a ∧
      m ≤ n ∧ 4 ≤ m+n ∧ s ≤ 2*(n-m) ∧
      6*((quotientSlice774 path 3).map (Int.castRingHom ℝ))=
        CubicPoly5a7 (cubicA5a7 m) (cubicB5a7 n m s) (cubicC5a7 n m) (cubicD5a7 n) := by
  obtain ⟨w,hl,hc,he⟩ := source_word774 (X : Polynomial ℤ) path
  obtain ⟨ha,hab,_⟩ := frame_reduced path
  cases w with
  | nil => simp only [List.length_nil,List.count_nil] at hl hc; omega
  | cons e w =>
    refine ⟨(e::w).length,(e::w).count true,switchesFrom5a7 e w,
      hl,hc,List.count_le_length,by omega,switches_core_bound5a7 e w,?_⟩
    have h := word_cubic5a7 (X : Polynomial ℤ) e w
    have hn : (1+(w.length : Polynomial ℤ))=((e::w).length : Polynomial ℤ) := by simp; ring
    have hm : ((if e then 1 else 0)+(w.count true : Polynomial ℤ))=
        ((e::w).count true : Polynomial ℤ) := by cases e <;> simp [List.count_cons]; ring
    rw [hn,hm] at h
    have hi : 6*quotientSlice774 path 3 =
        cubicExpr5a7 (X : Polynomial ℤ) (e::w).length ((e::w).count true)
          (switchesFrom5a7 e w) := by
      unfold quotientSlice774
      rw [he]
      exact h
    have hh := congrArg (Polynomial.map (Int.castRingHom ℝ)) hi
    simpa only [Polynomial.map_mul,Polynomial.map_ofNat,cubicExpr_map5a7] using hh

theorem fourth_quotient_crossLC5a7 (path : List Bool)
    (hr : 6 ≤ (frame path).mid.a+(frame path).mid.b-1) :
    CrossLC (CoeffSeq ((quotientSlice774 path 3).map (Int.castRingHom ℝ))) := by
  obtain ⟨n,m,s,hn,hm,hmn,hsize,hbound,he⟩ := fourth_source_formula5a7 path hr
  let p := (quotientSlice774 path 3).map (Int.castRingHom ℝ)
  have hpos (k : ℕ) : 0 ≤ (6*p).coeff k := by
    have hp : 0 ≤ p.coeff k := by
      dsimp [p]
      simp only [Polynomial.coeff_map]
      change (0:ℝ) ≤ ((quotientSlice774 path 3).coeff k : ℝ)
      exact_mod_cast quotient_slice_nonneg774 path 3 k
    rw [show (6 : Polynomial ℝ)=C (6 : ℝ) by rw [_root_.map_ofNat],Polynomial.coeff_C_mul]
    positivity
  change 6*p=_ at he
  have hA : 0 ≤ cubicA5a7 m := by
    have h := hpos 0; rw [he] at h; simpa [CubicPoly5a7] using h
  have hB : 0 ≤ cubicB5a7 n m s := by
    have h := hpos 1; rw [he] at h; simpa [CubicPoly5a7] using h
  have hC : 0 ≤ cubicC5a7 n m := by
    have h := hpos 2; rw [he] at h; simpa [CubicPoly5a7] using h
  have hD : 0 ≤ cubicD5a7 n := by
    have h := hpos 3; rw [he] at h; simpa [CubicPoly5a7] using h
  have hs : (s:ℝ) ≤ 2*((n:ℝ)-m) := by
    have h : (s:ℝ) ≤ 2*((n-m:ℕ):ℝ) := by exact_mod_cast hbound
    simpa [Nat.cast_sub hmn] using h
  obtain ⟨h1,h2,h3⟩ := cubic_inequalities5a7 n m s hmn hsize (by positivity) hs hB hC hD
  have hcross : CrossLC (CoeffSeq (6*p)) := by
    rw [he,coeffSeq_cubic5a7]
    exact cubic_crossLC5a7 hA hB hC hD h1 h2 h3
  have hscale (k : ℤ) : CoeffSeq (6*p) k=6*CoeffSeq p k := by
    rw [show (6 : Polynomial ℝ)=C (6 : ℝ) by rw [_root_.map_ofNat]]
    simp only [CoeffSeq]
    split_ifs <;> simp [Polynomial.coeff_C_mul]
  intro i j hij
  have h := hcross i j hij
  simp only [hscale] at h
  change CoeffSeq p i*CoeffSeq p (j+1) ≤ CoeffSeq p (i+1)*CoeffSeq p j
  nlinarith

/-- Literal raw fourth-upper-diagonal inequality, all source paths with d>=6. -/
theorem fourth_raw_logConcave5a7 (path : List Bool) (i j : ℕ)
    (hr : 6 ≤ (frame path).mid.a+(frame path).mid.b-1)
    (hd : i+j+5=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  exact upper_raw_lc_of_quotient774 path 3 i j hr (by omega)
    (fourth_quotient_crossLC5a7 path hr)

/-- The small-degree exclusion follows from the actual polygon premise. -/
theorem fourth_polygon_logConcave5a7 (path : List Bool) (i j : ℕ)
    (hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
    (hd : i+j+5=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  apply fourth_raw_logConcave5a7 path i j ?_ hd
  by_contra h
  obtain ⟨ha,hab,_⟩ := frame_reduced path
  have hi : i=0 := by omega
  have hj : j=0 := by omega
  have hb : 3 ≤ (frame path).mid.b := by omega
  have hp' := hp.1
  rw [hi,hj] at hp'
  simp only [Nat.mul_zero,zero_add] at hp'
  have hm := Nat.mul_le_mul_left (frame path).mid.a hb
  nlinarith

/-- All valid third-direction triples on the first four upper diagonals. -/
theorem first_four_polygon_logConcave5a7 (path : List Bool) (r i j : ℕ)
    (hr : r ≤ 3)
    (hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
    (hd : i+j+2+r=(frame path).mid.a+(frame path).mid.b-1) :
    coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
      coeff (frame path).mid.p (i+1) (j+1)^2 := by
  by_cases h : r ≤ 2
  · exact first_three_raw_logConcave5a7 path r i j h hd
  · have he : r=3 := by omega
    exact fourth_polygon_logConcave5a7 path i j hp (by omega)

#print axioms fourth_source_formula5a7
#print axioms fourth_quotient_crossLC5a7
#print axioms fourth_raw_logConcave5a7
#print axioms first_four_polygon_logConcave5a7
end
end MathGKM.Markov
