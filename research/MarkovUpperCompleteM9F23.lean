import MarkovUpperEdgesM9F23
import MarkovLowSlices5a7
/-! Machine-authored 9f234835. Complete upper diagonal direction and exact
root reduction to middle transverse inequalities and all larger numerators. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
attribute [local irreducible] threeRawM9E2

theorem source_three_top_diagonalsM9F23 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hn : sourceNME9C q r ≤ i+j+2) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases hd : i+j+2 ≤ sourceNME9C q r+2
 · obtain ⟨s,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
   simp only [Nat.succ_eq_add_one] at hn hd hq ⊢
   let d := sourceNME9C (s+1) r+2-(i+j+2)
   have hdr : d ≤ 2 := by dsimp [d]; omega
   have he : i+j+2+d=(frame (threePathM9E2 s r)).mid.a+
      (frame (threePathM9E2 s r)).mid.b-1 := by
     rw [(three_path_labelsM9E2 s r).1,(three_path_labelsM9E2 s r).2]
     dsimp [d,sourceNME9C]
     dsimp [sourceNME9C] at hd
     omega
   have h := first_three_raw_logConcave5a7 (threePathM9E2 s r) d i j hdr he
   rw [three_path_polynomialM9E2] at h
   simpa only [three_raw_formulaM9E2] using h
 · rw [three_raw_degreeME9C q i (j+2) r hq (by omega),zero_mul]
   exact sq_nonneg _

theorem source_upper_low_diagonalM9F23 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hi : i ≤ 2) (hj : sourceNME9C q r ≤ j+q) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases he : sourceNME9C q r ≤ i+j+2
 · exact source_three_top_diagonalsM9F23 q i j r hq he
 let n := sourceNME9C q r
 have hn : 3*q+1 ≤ n := by dsimp [n]; cases r <;> simp [sourceNME9C] <;> omega
 have hjn : n ≤ j+q := hj
 have hlow : i+j+2 < n := by dsimp [n]; omega
 let t := n-j
 have ht : 3 ≤ t := by dsimp [t]; omega
 have htq : t ≤ q := by dsimp [t]; omega
 have heJ : j+t=n := by dsimp [t]; omega
 have h0 (c : ℕ) : threeRawM9E2 q r c (j+2)=(topTemplateMB3E n t).coeff c := by
   have h := source_top_coeffMB3E q t c r hq (by omega)
   change threeRawM9E2 q r c (n+2-t)=(topTemplateMB3E n t).coeff c at h
   rwa [show n+2-t=j+2 by omega] at h
 have h1 (c : ℕ) : threeRawM9E2 q r c (j+1)=(topTemplateMB3E n (t+1)).coeff c := by
   have h := source_top_coeffMB3E q (t+1) c r hq (by omega)
   change threeRawM9E2 q r c (n+2-(t+1))=(topTemplateMB3E n (t+1)).coeff c at h
   rwa [show n+2-(t+1)=j+1 by omega] at h
 have h2 (c : ℕ) : threeRawM9E2 q r c j=(topTemplateMB3E n (t+2)).coeff c := by
   have h := source_top_coeffMB3E q (t+2) c r hq (by omega)
   change threeRawM9E2 q r c (n+2-(t+2))=(topTemplateMB3E n (t+2)).coeff c at h
   rwa [show n+2-(t+2)=j by omega] at h
 rw [h0,h1,h2]
 by_cases hi0 : i=0
 · subst i
   rw [(top_edge_coeffsMB3E n t (by omega) ht).1,zero_mul]
   exact sq_nonneg _
 let k := t-3
 let e := n-3*t-1
 have heT : t=k+3 := by dsimp [k]; omega
 have heN : n=3*k+e+10 := by dsimp [k,e]; omega
 rw [heN,heT]
 have hii : i=1 ∨ i=2 := by omega
 rcases hii with rfl|rfl
 · simpa only [Nat.reduceAdd,show k+3+1=k+4 by omega,show k+3+2=k+5 by omega] using
     upper_template_edge_oneM9F23 e k
 · simpa only [Nat.reduceAdd,show k+3+1=k+4 by omega,show k+3+2=k+5 by omega] using
     upper_template_edge_twoM9F23 e k

theorem source_upper_diagonal_allM9F23 (q i j : ℕ) (r : Bool) (hq : 1 ≤ q)
 (hj : sourceNME9C q r ≤ j+q) :
 threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
 threeRawM9E2 q r (i+1) (j+1)^2 := by
 by_cases hi : i ≤ 2
 · exact source_upper_low_diagonalM9F23 q i j r hq hi hj
 · exact source_upper_diagonal_ge_threeM9F23 q i j r hq (by omega) hj

theorem path_upper_diagonal_allM9F23 (path : List Bool) (ha : (frame path).mid.a=3)
 (i j : ℕ) (hj : 2*(frame path).mid.b+2 ≤ 3*j) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_rawM9E2 path ha
 have hjq : sourceNME9C q r ≤ j+q := by
   rw [hb] at hj
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 simp only [hp]
 exact source_upper_diagonal_allM9F23 q i j r hq hjq

def ThreeMiddleOnlyM9F23 : Prop := ∀ q : ℕ, 1 ≤ q → ∀ r,
 (∀ i j, 4 ≤ i → q < j+2 → j+q < sourceNME9C q r → ¬(i=4 ∧ j+1 ≤ q) →
   threeRawM9E2 q r i j*threeRawM9E2 q r i (j+2) ≤ threeRawM9E2 q r i (j+1)^2) ∧
 (∀ i j, q < j+2 → j+q < sourceNME9C q r →
   threeRawM9E2 q r i (j+2)*threeRawM9E2 q r (i+2) j ≤
   threeRawM9E2 q r (i+1) (j+1)^2)

theorem middle_only_iffM9F23 : ThreeMiddleLowTransverseM9F23 ↔ ThreeMiddleOnlyM9F23 := by
 constructor
 · intro h q hq r
   exact ⟨(h q hq r).1,fun i j hj ht => (h q hq r).2 i j hj (Or.inl ht)⟩
 · intro h q hq r
   refine ⟨(h q hq r).1,?_⟩
   intro i j hj he
   by_cases ht : sourceNME9C q r ≤ j+q
   · exact source_upper_diagonal_allM9F23 q i j r hq ht
   · exact (h q hq r).2 i j hj (by omega)

theorem root_iff_middle_onlyM9F23 :
 Conjecture63 ↔ ThreeMiddleOnlyM9F23 ∧ OtherFourM9E2 := by
 rw [root_iff_middle_low_transverseM9F23,middle_only_iffM9F23]

end
end MathGKM.Markov
