import MarkovHorizontalBoundsM13D
import MarkovHorizontalLCB46
/-! Machine-authored request 13d40bd7. Unconditional seed inequality;
the actual source third-row formula remains a separate premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def sixSeqM13D (a b c d e f : ℝ) (k : ℤ) :=
 if k=0 then a else if k=1 then b else if k=2 then c else if k=3 then d
 else if k=4 then e else if k=5 then f else 0

theorem six_crossM13D (a b c d e f : ℝ)
 (ha : 0 ≤ a) (hb : 0 ≤ b) (hc : 0 < c) (hd : 0 < d) (he : 0 < e) (hf : 0 < f)
 (h1 : a*c ≤ b^2) (h2 : b*d ≤ c^2) (h3 : c*e ≤ d^2) (h4 : d*f ≤ e^2) :
 CrossLC (sixSeqM13D a b c d e f) := by
 have hn (k : ℤ) : 0 ≤ sixSeqM13D a b c d e f k := by
   unfold sixSeqM13D; split_ifs  <;> positivity
 have hz (k : ℤ) (h : k < 0 ∨ 5 < k) : sixSeqM13D a b c d e f k=0 := by
   unfold sixSeqM13D; split_ifs  <;> first | omega | rfl
 apply crossLC_of_adjacent_interval774 _ hn
 · intro k
   by_cases hk : 0 ≤ k ∧ k ≤ 5
   · obtain ⟨hl,hu⟩ := hk
     interval_cases k  <;> norm_num [sixSeqM13D]  <;> first | assumption | positivity
   · by_cases hl : k < 0
     · rw [hz (k-1) (Or.inl (by omega)),zero_mul]; exact sq_nonneg _
     · rw [hz (k+1) (Or.inr (by omega)),mul_zero]; exact sq_nonneg _
 · intro i k j hik hkj hi hj
   have h0 : 0 ≤ i := by by_contra h; rw [hz i (Or.inl (by omega))] at hi; linarith
   have h5 : j ≤ 5 := by by_contra h; rw [hz j (Or.inr (by omega))] at hj; linarith
   have hk0 : 0 ≤ k := by omega
   have hk5 : k ≤ 5 := by omega
   interval_cases k
   · have ei : i=0 := by omega
     simpa [ei] using hi
   · have hi1 : i=0 ∨ i=1 := by omega
     rcases hi1 with rfl|rfl
     · norm_num [sixSeqM13D] at hi ⊢
       have hp := mul_pos hi hc
       nlinarith
     · simpa using hi
   all_goals norm_num [sixSeqM13D]; assumption

theorem six_coeffM13D (a b c d e f : ℝ) :
 CoeffSeq (C a+C b*X+C c*X^2+C d*X^3+C e*X^4+C f*X^5)=sixSeqM13D a b c d e f := by
 funext k
 by_cases hk : k < 0
 · simp [CoeffSeq,hk,sixSeqM13D,show k≠0 by omega,show k≠1 by omega,
     show k≠2 by omega,show k≠3 by omega,show k≠4 by omega,show k≠5 by omega]
 · lift k to ℕ using (show 0 ≤ k by omega)
   rw [coeffSeq_nat774]
   by_cases hl : k ≤ 5
   · interval_cases k  <;> norm_num [sixSeqM13D,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X]
   · simp [sixSeqM13D,Polynomial.coeff_C_mul_X_pow,Polynomial.coeff_C,Polynomial.coeff_X,
       show k≠0 by omega,show k≠1 by omega,show 1≠k by omega,show k≠2 by omega,
       show k≠3 by omega,show k≠4 by omega,show k≠5 by omega,
       show (k:ℤ)≠0 by omega,show (k:ℤ)≠1 by omega,show (k:ℤ)≠2 by omega,
       show (k:ℤ)≠3 by omega,show (k:ℤ)≠4 by omega,show (k:ℤ)≠5 by omega]

theorem h3seed_crossM13D (a b : ℕ) (ha : 2 ≤ a) (hb : 7 ≤ b) (hab : a < b) :
 CrossLC (CoeffSeq (h3seedM13D (a:ℝ) b (2*a-b:ℕ)
   (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ))) := by
 obtain ⟨h0,h1,h2,h3,h4,h5,h6,h7,h8,h9⟩ := h3boundsM13D a b ha hb hab
 rw [h3seedM13D,six_coeffM13D]
 exact six_crossM13D _ _ _ _ _ _ h0 h1 h2 h3 h4 h5 h6 h7 h8 h9

def HorizontalThirdFormulaM13D (path : List Bool) : Prop :=
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 6*(Bivariate.swap (frame path).mid.p).coeff 3 =
 X^(a-2)*(1+X)^(b-7)*h3seedM13D (a:ℤ) b (2*a-b:ℕ)
   (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ)

theorem horizontal_third_of_formulaM13D (path : List Bool)
 (ha : 2 ≤ (frame path).mid.a) (hb : 7 ≤ (frame path).mid.b)
 (he : HorizontalThirdFormulaM13D path) (i : ℕ) :
 coeff (frame path).mid.p i 3*coeff (frame path).mid.p (i+2) 3  ≤ 
 coeff (frame path).mid.p (i+1) 3^2 := by
 have hab := (frame_reduced path).2.1
 have h := h3seed_crossM13D _ _ ha hb hab
 have hs := crossLC_pascal h ((frame path).mid.b-7)
 rw [←coeffSeq_binomial_mul] at hs
 have ht := crossLC_X_pow_mul46 _ hs ((frame path).mid.a-2)
 have hm := congrArg (Polynomial.map (Int.castRingHom ℝ)) he
 simp only [Polynomial.map_mul,Polynomial.map_pow,Polynomial.map_ofNat,
   Polynomial.map_X,Polynomial.map_add,Polynomial.map_one] at hm
 have hmseed : (h3seedM13D ((frame path).mid.a:ℤ) (frame path).mid.b
     (2*(frame path).mid.a-(frame path).mid.b:ℕ)
     (min ((frame path).mid.b-(frame path).mid.a)
       (3*(frame path).mid.a-(frame path).mid.b):ℕ)
     (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)).map (Int.castRingHom ℝ)=
   h3seedM13D ((frame path).mid.a:ℝ) (frame path).mid.b
     (2*(frame path).mid.a-(frame path).mid.b:ℕ)
     (min ((frame path).mid.b-(frame path).mid.a)
       (3*(frame path).mid.a-(frame path).mid.b):ℕ)
     (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) := by
   have hsmap (a b q t u : ℤ) :
       (h3seedM13D a b q t u).map (Int.castRingHom ℝ)=
       h3seedM13D (a:ℝ) b q t u := by
     simp [h3seedM13D,h3c0M13D,h3c1M13D,h3c2M13D,h3c3M13D,h3c4M13D,h3c5M13D,map_ofNat]
   simpa only [Int.cast_natCast] using hsmap ((frame path).mid.a:ℤ) (frame path).mid.b
     (2*(frame path).mid.a-(frame path).mid.b:ℕ)
     (min ((frame path).mid.b-(frame path).mid.a) (3*(frame path).mid.a-(frame path).mid.b):ℕ)
     (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)
 rw [hmseed] at hm
 rw [mul_assoc] at hm
 rw [←hm] at ht
 have hh := crossLC_adjacent ht ((i:ℤ)+1)
 have h0 : ¬(i:ℤ) < 0 := by omega
 have h1 : ¬(i:ℤ)+1 < 0 := by omega
 have h2 : ¬(i:ℤ)+1+1 < 0 := by omega
 simp only [CoeffSeq,add_sub_cancel_right,h0,h1,h2,if_false,Int.toNat_natCast,
   Polynomial.coeff_ofNat_mul,Polynomial.coeff_map,swap_coeff46] at hh
 rw [show ((i:ℤ)+1).toNat=i+1 by omega,show ((i:ℤ)+1+1).toNat=i+2 by omega] at hh
 change 6*(coeff (frame path).mid.p i 3:ℝ)*(6*(coeff (frame path).mid.p (i+2) 3:ℝ)) ≤ (6*(coeff (frame path).mid.p (i+1) 3:ℝ))^2 at hh
 have hreal : (coeff (frame path).mid.p i 3:ℝ)*coeff (frame path).mid.p (i+2) 3  ≤ 
   (coeff (frame path).mid.p (i+1) 3:ℝ)^2 := by nlinarith
 exact_mod_cast hreal
end
end MathGKM.Markov
