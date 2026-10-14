import MarkovPalindrome28b1
/-! Machine-authored 28b112de. Explicit positive raw monomials for arbitrary
word products. These witnesses will constrain support, not prove LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem coeff_mul_lower28 {p q : BiPoly} (hp : PolyNonneg16 p) (hq : PolyNonneg16 q)
 (i j k l : ℕ) : coeff p i j * coeff q k l ≤ coeff (p*q) (i+k) (j+l) := by
 simp only [coeff,Polynomial.coeff_mul,Polynomial.finsetSum_coeff]
 apply le_trans _ (Finset.single_le_sum (a:=(i,k)) ?_ (Finset.mem_antidiagonal.mpr rfl))
 · exact Finset.single_le_sum (a:=(j,l))
     (fun x _ => mul_nonneg (hp i x.1) (hq k x.2)) (Finset.mem_antidiagonal.mpr rfl)
 · intro x hx
   exact Finset.sum_nonneg (fun y _ => mul_nonneg (hp x.1 y.1) (hq x.2 y.2))

theorem coeff_mul_pos28 {p q : BiPoly} (hp : PolyNonneg16 p) (hq : PolyNonneg16 q)
 {i j k l : ℕ} (hi : 0<coeff p i j) (hk : 0<coeff q k l) :
 0<coeff (p*q) (i+k) (j+l) :=
 lt_of_lt_of_le (mul_pos hi hk) (coeff_mul_lower28 hp hq i j k l)

theorem rawword_nonneg28 (w : List Bool) : MatNonneg16 (rawWord80 w) := by
 induction w with
 | nil => exact ⟨poly_one_nonneg16,(by intro i j; simp [coeff,rawWord80]),
     (by intro i j; simp [coeff,rawWord80]),poly_one_nonneg16⟩
 | cons r w ih =>
   exact mat_mul_nonneg16 (by cases r; exact raw_generators_nonneg18.1; exact raw_generators_nonneg18.2) ih

theorem rawletter_atoms28 (r : Bool) :
 let m := if r then rawB18 else rawA18
 0<coeff m.a 0 1 ∧ 0<coeff m.b 0 (if r then 1 else 0) ∧
 0<coeff m.c 1 1 ∧ 0<coeff m.d (if r then 1 else 0) 0 := by
 cases r <;> norm_num [rawA18,rawB18,S,U,V,coeff,Polynomial.mul_coeff_one,
   Polynomial.mul_coeff_zero,Polynomial.coeff_add,Polynomial.coeff_X,
   Polynomial.coeff_one,Polynomial.coeff_C]

theorem mm_ab_pos28 {p q : Mat16 BiPoly} (hp : MatNonneg16 p) (hq : MatNonneg16 q)
 {i j k l : ℕ} (hi : 0<coeff p.a i j) (hk : 0<coeff q.b k l) :
 0<coeff (mm16 p q).b (i+k) (j+l) := by
 exact add_pos_of_pos_of_nonneg (coeff_mul_pos28 hp.1 hq.2.1 hi hk)
   (poly_mul_nonneg16 hp.2.1 hq.2.2.2 _ _)

theorem mm_bd_pos28 {p q : Mat16 BiPoly} (hp : MatNonneg16 p) (hq : MatNonneg16 q)
 {i j k l : ℕ} (hi : 0<coeff p.b i j) (hk : 0<coeff q.d k l) :
 0<coeff (mm16 p q).b (i+k) (j+l) := by
 exact add_pos_of_nonneg_of_pos (poly_mul_nonneg16 hp.1 hq.2.1 _ _)
   (coeff_mul_pos28 hp.2.1 hq.2.2.2 hi hk)

theorem mm_bc_pos28 {p q : Mat16 BiPoly} (hp : MatNonneg16 p) (hq : MatNonneg16 q)
 {i j k l : ℕ} (hi : 0<coeff p.b i j) (hk : 0<coeff q.c k l) :
 0<coeff (mm16 p q).a (i+k) (j+l) := by
 exact add_pos_of_nonneg_of_pos (poly_mul_nonneg16 hp.1 hq.1 _ _)
   (coeff_mul_pos28 hp.2.1 hq.2.2.1 hi hk)

theorem mm_ca_pos28 {p q : Mat16 BiPoly} (hp : MatNonneg16 p) (hq : MatNonneg16 q)
 {i j k l : ℕ} (hi : 0<coeff p.c i j) (hk : 0<coeff q.a k l) :
 0<coeff (mm16 p q).c (i+k) (j+l) := by
 exact add_pos_of_pos_of_nonneg (coeff_mul_pos28 hp.2.2.1 hq.1 hi hk)
   (poly_mul_nonneg16 hp.2.2.2 hq.2.2.1 _ _)

theorem word_diag_atoms28 (w : List Bool) :
 0<coeff (rawWord80 w).a 0 w.length ∧
 0<coeff (rawWord80 w).d (w.count true) 0 := by
 induction w with
 | nil => norm_num [rawWord80,coeff]
 | cons r w ih =>
   have hn : MatNonneg16 (if r then rawB18 else rawA18) := by
     cases r; exact raw_generators_nonneg18.1; exact raw_generators_nonneg18.2
   have hw := rawword_nonneg28 w
   have ha := coeff_mul_pos28 hn.1 hw.1 (rawletter_atoms28 r).1 ih.1
   have hd := coeff_mul_pos28 hn.2.2.2 hw.2.2.2 (rawletter_atoms28 r).2.2.2 ih.2
   have ha' := add_pos_of_pos_of_nonneg ha (poly_mul_nonneg16 hn.2.1 hw.2.2.1 0 (1+w.length))
   have hd' := add_pos_of_nonneg_of_pos
     (poly_mul_nonneg16 hn.2.2.1 hw.2.1 ((if r then 1 else 0)+w.count true) 0) hd
   constructor
   · simpa [rawWord80,mm16,coeff,List.length_cons,Nat.add_comm] using ha'
   · cases r <;> simpa [rawWord80,mm16,coeff,List.count_cons,Nat.add_comm] using hd'

/-- Stay in the upper state, exit once, then stay in the lower state. -/
theorem word_suffix_atom28 (x y : List Bool) (r : Bool) :
 0<coeff (rawWord80 (x++r::y)).b (y.count true) (x.length+(if r then 1 else 0)) := by
 have hn : MatNonneg16 (if r then rawB18 else rawA18) := by
   cases r; exact raw_generators_nonneg18.1; exact raw_generators_nonneg18.2
 have hb := mm_bd_pos28 hn (rawword_nonneg28 y) (rawletter_atoms28 r).2.1 (word_diag_atoms28 y).2
 have hb' : 0<coeff (rawWord80 (r::y)).b (y.count true) (if r then 1 else 0) := by
   simpa [rawWord80] using hb
 have h := mm_ab_pos28 (rawword_nonneg28 x) (rawword_nonneg28 (r::y))
   (word_diag_atoms28 x).1 hb'
 simpa [rawWord_append80] using h

/-- Exit at the first A, return once, and exit at the final B. -/
theorem word_prefix_atom28 (x y : List Bool) (r : Bool) :
 0<coeff (rawWord80 (false::(x++r::(y++[true])))).b
   (x.count true+1) (y.length+2) := by
 have hn : MatNonneg16 (if r then rawB18 else rawA18) := by
   cases r; exact raw_generators_nonneg18.1; exact raw_generators_nonneg18.2
 have hb : 0<coeff (rawWord80 (false::x)).b (x.count true) 0 := by
   simpa using word_suffix_atom28 [] x false
 have hc : 0<coeff (rawWord80 (r::y)).c 1 (1+y.length) := by
   simpa [rawWord80] using mm_ca_pos28 hn (rawword_nonneg28 y)
     (rawletter_atoms28 r).2.2.1 (word_diag_atoms28 y).1
 have ha := mm_bc_pos28 (rawword_nonneg28 (false::x)) (rawword_nonneg28 (r::y)) hb hc
 have ha' : 0<coeff (rawWord80 ((false::x)++r::y)).a (x.count true+1) (1+y.length) := by
   simpa [rawWord_append80] using ha
 have hz : 0<coeff (rawWord80 [true]).b 0 1 := by
   simpa [rawWord80,mm_one_right774] using (rawletter_atoms28 true).2.1
 have h := mm_ab_pos28 (rawword_nonneg28 ((false::x)++r::y)) (rawword_nonneg28 [true]) ha' hz
 simpa [← rawWord_append80,List.append_assoc,Nat.add_comm,Nat.add_left_comm] using h

#print axioms word_suffix_atom28
#print axioms word_prefix_atom28
end
end MathGKM.Markov
