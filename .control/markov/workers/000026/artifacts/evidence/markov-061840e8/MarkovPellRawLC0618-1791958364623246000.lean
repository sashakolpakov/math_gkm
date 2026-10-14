import MarkovPellSource0618
import MarkovPellDiagonal0618
/-! Machine-authored 061840e8. All raw diagonals for the entire Pell source
family a/(a+1). This is one direction of a subfamily, not Conjecture63. -/
namespace MathGKM.Markov
noncomputable section

theorem right_quotient_match0618 (n r i : ℕ) (hi : i≤r) :
 (quotientSlice774 (List.replicate n true) r).coeff i=
 coeff (matchPair0618 U V (n+1)).2 i (r-i) := by
 have h := right_quotient_coeff0618 n i (r-i)
 rw [Nat.add_sub_of_le hi] at h
 rw [h,(match_coeff0618 _ _ _).2]
 congr 2
 omega

theorem right_residual_lc0618 (n r i : ℕ) :
 (quotientSlice774 (List.replicate n true) r).coeff i*
 (quotientSlice774 (List.replicate n true) r).coeff (i+2) ≤
 (quotientSlice774 (List.replicate n true) r).coeff (i+1)^2 := by
 by_cases hi : i+2≤r
 · rw [right_quotient_match0618 n r i (by omega),
     right_quotient_match0618 n r (i+2) hi,
     right_quotient_match0618 n r (i+1) (by omega)]
   have h := match_diagonal0618 (n+1) i (r-i-2)
   have e0 : r-i-2+2=r-i := by omega
   have e1 : r-i-2+1=r-(i+1) := by omega
   have e2 : r-i-2=r-(i+2) := by omega
   simpa only [e0,e1,e2] using h
 · rw [quotient_slice_degree725 _ r (i+2) (by omega),mul_zero]
   exact sq_nonneg _

theorem right_raw_diagonal0618 (n i j : ℕ)
 (h0 : InPolygon (n+1) (n+2) i (j+2))
 (h1 : InPolygon (n+1) (n+2) (i+1) (j+1))
 (h2 : InPolygon (n+1) (n+2) (i+2) j) :
 coeff (frame (List.replicate n true)).mid.p i (j+2)*
 coeff (frame (List.replicate n true)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true)).mid.p (i+1) (j+1)^2 := by
 have hs : n+1≤i+j+2 := by
   have h := h2.1
   by_contra hh
   have he : i+j+2≤n := by omega
   have hm := Nat.mul_le_mul_left (n+2) he
   nlinarith
 have ht := h2.2
 have hd : i+j+2≤2*n+2 := by omega
 apply upper_raw_lc_of_natural_adjacent725 (List.replicate n true)
   (2*n+2-(i+j+2)) i j
 · rw [(right_labels650 n).1,(right_labels650 n).2]
   omega
 · rw [(right_labels650 n).1,(right_labels650 n).2]
   omega
 · exact right_residual_lc0618 n _

theorem source_near_one_diagonal0618 (path : List Bool)
 (hb : (frame path).mid.b=(frame path).mid.a+1) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i (j+2))
 (h1 : InPolygon (frame path).mid.a (frame path).mid.b (i+1) (j+1))
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1,(right_labels650 n).2] at h0 h1 h2
 exact right_raw_diagonal0618 n i j h0 h1 h2

#print axioms right_residual_lc0618
#print axioms right_raw_diagonal0618
#print axioms source_near_one_diagonal0618
end
end MathGKM.Markov
