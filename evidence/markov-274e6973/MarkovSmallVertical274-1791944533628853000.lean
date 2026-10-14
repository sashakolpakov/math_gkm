import MarkovVerticalLC274
import MarkovTruncated274

/-! Machine-authored request 274e6973. Small-numerator first vertical rows. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def truncInt274 (c t : ℤ) (q : ℕ) : Polynomial ℤ :=
  C c*(weightedSum025 q+plainSum025 q)+C t*X^q

theorem truncInt_map274 (c t : ℤ) (q : ℕ) :
    (truncInt274 c t q).map (Int.castRingHom ℝ)=truncPoly274 c t q := by
  unfold truncInt274 truncPoly274 weightedSum025 plainSum025
  simp only [Polynomial.map_add,Polynomial.map_mul,Polynomial.map_C,
    Polynomial.map_sum,Polynomial.map_natCast,Polynomial.map_pow,Polynomial.map_X,
    ← C_mul_X_pow_eq_monomial,Finset.sum_add_distrib,← Finset.sum_add_distrib,
    mul_add,Finset.mul_sum]
  congr 1
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro k hk
  simp only [map_mul,map_add,map_natCast,map_one]
  ring

theorem run_b_jet274 (n : ℕ) :
    (runMatrix025 n).b.coeff 1=weightedSum025 (n+1)+plainSum025 (n+1) ∧
    (runMatrix025 n).d.coeff 1=plainSum025 (n+2) := by
  induction n with
  | zero =>
    constructor <;> simp [runMatrix025,runBlock025,rawWord80,mm_one_right774,
      rawB18,S,U,V,coeff_mul_one46,Polynomial.coeff_one,plainSum025,weightedSum025]
    ring
  | succ n ih =>
    have hb : (runMatrix025 n).b.coeff 0=X^(n+1) := by
      have hh := rawWord_last_zero46 (List.replicate n false)
      simpa [runMatrix025,runBlock025,List.count_replicate] using hh
    have hd : (runMatrix025 n).d.coeff 0=0 := (rawWord_last_shape025 _).2.2
    have hs := sum_relation025 (n+1)
    have hw : weightedSum025 (n+1+1)=weightedSum025 (n+1)+((n+1:ℕ):Polynomial ℤ)*X^(n+1) := by
      simp [weightedSum025,Finset.sum_range_succ]
    have hp : plainSum025 (n+2)=plainSum025 (n+1)+X^(n+1) := by
      simp [plainSum025,show n+2=n+1+1 by omega,Finset.sum_range_succ]
    rw [run_step025]
    simp only [mm16,rawA18,U,V,Polynomial.coeff_add,coeff_mul_one46,
      Polynomial.coeff_C,Polynomial.coeff_X,Polynomial.coeff_one,one_ne_zero,zero_ne_one,
      if_false,if_true,mul_zero,zero_mul,add_zero,zero_add,mul_one,one_mul,ih.1,ih.2,hb,hd]
    constructor
    · rw [hw,show n+1+1=n+2 by omega,hp]
      linear_combination -hs
    · simp only [plainSum025,show n+1+2=n+2+1 by omega,Finset.sum_range_succ]
      rw [show n+2=n+1+1 by omega,pow_succ]
      ring

theorem source_one_spine274 (path : List Bool) (ha : (frame path).mid.a=1) :
    ∃ n, path=List.replicate n false := by
  rcases source_block_counts274 path with h | ⟨n,z,ht,hf,hm,hza,hzb⟩
  · exact h
  · have hp : 0<z.count true := List.count_pos_iff.mpr ht
    have hl : z.count true<z.length := List.count_lt_length_iff.mpr ⟨false,hf,by decide⟩
    omega

theorem source_spine_matrix274 (n : ℕ) :
    sourceMatrix025 (List.replicate n false)=runMatrix025 (n+1) := by
  have hm := rawWord_pairs80 (List.replicate n false) ([false],runBlock025 0)
  rw [false_fold025] at hm
  simp only [Nat.add_zero] at hm
  have hinit : (rawWord80 [false],rawWord80 (runBlock025 0))=(rawA18,rawB18) := by
    simp [runBlock025,rawWord80,mm_one_right774]
  rw [hinit] at hm
  unfold sourceMatrix025
  rw [← hm]
  change mm16 (rawWord80 [false]) (runMatrix025 n)=_
  simp [rawWord80,mm_one_right774,run_step025]

theorem source_one_formula274 (path : List Bool) (ha : (frame path).mid.a=1) :
    ∃ q : ℕ, ((frame path).mid.p).coeff 1=truncInt274 1 (q+1) q := by
  obtain ⟨n,rfl⟩ := source_one_spine274 path ha
  refine ⟨n+1,?_⟩
  rw [show (frame (List.replicate n false)).mid.p=
    (sourceMatrix025 (List.replicate n false)).b from raw_matrix18 _,source_spine_matrix274,
    (run_b_jet274 (n+1)).1]
  simp only [truncInt274,weightedSum025,plainSum025,Finset.sum_range_succ]
  push_cast
  simp only [map_one,one_mul,map_add,map_natCast]
  ring

theorem two_residual274 (q : ℕ) :
    blockH274 2 1 q-X^q*(X+1)=(X+1)*truncInt274 4 (2*(q+1)) q := by
  have hs := sum_relation025 q
  unfold blockH274 truncInt274
  push_cast
  simp only [map_mul,map_add,map_natCast,map_ofNat,map_one,pow_succ]
  linear_combination 4*hs

theorem source_two_formula274 (path : List Bool) (ha : (frame path).mid.a=2) :
    ∃ q : ℕ, ((frame path).mid.p).coeff 1=
      X^(q+1)*truncInt274 4 (2*(q+1)) q := by
  obtain ⟨q,r,hq,hr,hb,he⟩ := source_cleared274 path (by omega)
  have hc := (frame_reduced path).2.2
  rw [ha] at hr hb he hc
  have hcop : Nat.Coprime 2 r := by
    rw [hb,Nat.coprime_mul_left_add_right] at hc
    exact hc
  have hre : r=1 := by
    interval_cases r <;> norm_num at hcop ⊢
  subst r
  refine ⟨q,?_⟩
  rw [two_residual274,hb] at he
  have hne : (X^q*(X+1)^3 : Polynomial ℤ)≠0 :=
    mul_ne_zero (pow_ne_zero _ X_ne_zero)
      (pow_ne_zero _ (by simpa using X_add_C_ne_zero (1:ℤ)))
  apply mul_left_cancel₀ hne
  rw [he,show 2*q+1=q+(q+1) by omega,pow_add]
  ring

theorem raw_vertical_of_cross274 (P : BiPoly)
    (h : CrossLC (CoeffSeq ((P.coeff 1).map (Int.castRingHom ℝ)))) (j : ℕ) :
    coeff P 1 j*coeff P 1 (j+2) ≤ coeff P 1 (j+1)^2 := by
  have hh := crossLC_adjacent h (↑j+1)
  simp only [CoeffSeq,add_sub_cancel_right,
    show ¬(↑j:ℤ)<0 by omega,show ¬(↑j+1:ℤ)<0 by omega,
    show ¬(↑j+1+1:ℤ)<0 by omega,if_false,Int.toNat_natCast,Polynomial.coeff_map] at hh
  change (coeff P 1 j:ℝ)*(coeff P 1 (j+2):ℝ) ≤ (coeff P 1 (j+1):ℝ)^2 at hh
  exact_mod_cast hh

theorem vertical_one_all274 (path : List Bool) (j : ℕ) :
    coeff (frame path).mid.p 1 j*coeff (frame path).mid.p 1 (j+2) ≤
      coeff (frame path).mid.p 1 (j+1)^2 := by
  have hp := (frame_reduced path).1
  by_cases hbig : 3 ≤ (frame path).mid.a
  · exact vertical_one_raw274 path hbig j
  apply raw_vertical_of_cross274
  by_cases hone : (frame path).mid.a=1
  · obtain ⟨q,he⟩ := source_one_formula274 path hone
    rw [he,truncInt_map274]
    have hh := truncPoly_cross274 1 (q+1) q 0 (by norm_num) (by positivity) (by simp)
    simpa using hh
  · have htwo : (frame path).mid.a=2 := by omega
    obtain ⟨q,he⟩ := source_two_formula274 path htwo
    rw [he,Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_X,truncInt_map274]
    apply truncPoly_cross274
    · norm_num
    · positivity
    · push_cast; nlinarith

#print axioms source_one_formula274
#print axioms source_two_formula274
#print axioms vertical_one_all274
end
end MathGKM.Markov
