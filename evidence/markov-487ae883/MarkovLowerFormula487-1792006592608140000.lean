import MarkovRunJet487
/-! Machine-authored 487ae883. Exact unnormalized first lower-slice formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem runSum_coeff487 (n j : ℕ) :
 (runSumA27 (X : ℤ[X]) n).coeff (j+1)=if j<n then 1 else 0 := by
 simp [runSumA27,Polynomial.finset_sum_coeff,Polynomial.coeff_X_pow,eq_comm]

theorem lowerH_coeff487 (n : ℕ) :
 (lowerH487 n).coeff 0=(n+1:ℕ) ∧
 (lowerH487 n).coeff 1=3*(n:ℤ) ∧
 ∀ j, (lowerH487 n).coeff (j+2)=4*((n-(j+1):ℕ):ℤ) := by
 induction n with
 | zero => simp [lowerH487]
 | succ n ih =>
   obtain ⟨h0,h1,hj⟩ := ih
   constructor
   · simp [lowerH487,Polynomial.coeff_add,Polynomial.coeff_mul_X,
       Polynomial.coeff_X_mul,Polynomial.coeff_ofNat_mul,h0]; ring
   constructor
   · simp [lowerH487,Polynomial.coeff_add,Polynomial.coeff_mul_X,
       Polynomial.coeff_X_mul,Polynomial.coeff_ofNat_mul,h1,runSumA27,
       Polynomial.finset_sum_coeff]; ring
   · intro j
     have he : 4*X*runSumA27 (X : ℤ[X]) n=X*(4*runSumA27 X n) := by ring
     rw [lowerH487,he]
     simp only [Polynomial.coeff_add,Polynomial.coeff_X_mul,
       Polynomial.coeff_ofNat_mul]
     rw [hj,show j+2-1=j+1 by omega,runSum_coeff487]
     simp only [Polynomial.coeff_one,Polynomial.coeff_X,
       show j+2≠0 by omega,show j+2≠1 by omega,if_false,mul_zero,add_zero]
     by_cases h : j<n
     · rw [if_pos h]
       have hs : n+1-(j+1)=(n-(j+1))+1 := by omega
       rw [hs]; push_cast; ring
     · rw [if_neg h]
       have hs : n-(j+1)=0 := by omega
       have ht : n+1-(j+1)=0 := by omega
       simp [hs,ht]

theorem lower_trace_two_lengths487 (n : ℕ) (z : List Bool) (hz : 2≤z.length) :
 (tr16 (ambientWord5c U V (lowerSub487 n z))).coeff 1=
 (z.length:ℤ[X])*lowerH487 n+
 (z.count true:ℤ[X])*(1+3*X+4*X*runSumA27 X n) := by
 have he : lowerSub487 n z=(z.map (fun r => n+if r then 1 else 0)).flatMap lowerRun487 := by
   simp [lowerSub487,List.flatMap_map]
 rw [he,lower_trace_sum487 _ (by simpa using hz)]
 simp only [List.map_map]
 induction z with
 | nil => simp at hz
 | cons r rs ih =>
   -- The sum identity is independent of the length guard.
   have hall (w : List Bool) :
     (w.map (fun r => lowerH487 (n+if r then 1 else 0))).sum=
     (w.length:ℤ[X])*lowerH487 n+
     (w.count true:ℤ[X])*(1+3*X+4*X*runSumA27 X n) := by
     induction w with
     | nil => simp
     | cons d ds hi => cases d <;> simp [hi,lowerH487,List.count_cons] <;> ring
   exact hall (r::rs)

theorem source_lower_slice487 (path : List Bool) :
 (∃ k, path=List.replicate k true) ∨
 ∃ n c r : ℕ, 2≤c ∧ 0<r ∧ r<c ∧
 (frame path).mid.a=c*n+r ∧ (frame path).mid.b=c*(n+1)+r ∧
 cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) 1 =
 (c:ℤ[X])*lowerH487 n+(r:ℤ[X])*(1+3*X+4*X*runSumA27 X n)-1-X := by
 rcases source_lower_blocks487 path with h | ⟨n,z,hf,ht,hw,ha,hb⟩
 · exact Or.inl h
 · right
   have hr0 : 0<z.count true := List.count_pos_iff.mpr ht
   have hr : z.count true<z.length := List.count_lt_length_iff.mpr ⟨false,hf,by decide⟩
   have hz : 2≤z.length := by omega
   refine ⟨n,z.length,z.count true,hz,hr0,hr,ha,hb,?_⟩
   have he := source_first_cut_trace487 path
   rw [hw,lower_trace_two_lengths487 n z hz] at he
   linear_combination -he

#print axioms lowerH_coeff487
#print axioms source_lower_slice487
end
end MathGKM.Markov
