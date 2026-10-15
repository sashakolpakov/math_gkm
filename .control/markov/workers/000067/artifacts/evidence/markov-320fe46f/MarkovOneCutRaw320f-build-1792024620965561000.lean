import MarkovOneCutTailC416
/-! Machine-authored 320fe46f; completed inherited unfinished bridge. Exact raw-source comparison for the infinite
marked obstruction; the full published inequality is satisfied here. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem oneA_at_one320f (n i j : ℕ) (hij : i+j=2*n+2) :
 (oneADeformedC416 n 1).coeff j=(coeff (frame (oneAPath68 n)).mid.p i j:ℝ) := by
 have h := sourceTerms_coeffFe01 (oneAPath68 n) i j 1
   (by rw [(oneA_labels68 n).1]; omega)
 simp only [oneADeformedC416,map_one,degreeCoeff_forget07a7]
 simpa only [sourceTermsFe01,cutMasks_sumFe01] using h.symm

theorem oneA_raw_top320f (m : ℕ) :
 let n := m+3
 let l := (frame (oneAPath68 n)).mid
 l.a=2*n+1 ∧ l.b=2*n+3 ∧
 InPolygon l.a l.b (n+3) (n-1) ∧
 InPolygon l.a l.b (n+2) n ∧ InPolygon l.a l.b (n+1) (n+1) ∧
 coeff l.p (n+3) (n-1)=20 ∧ coeff l.p (n+2) n=12 ∧
 coeff l.p (n+1) (n+1)=4 ∧
 coeff l.p (n+2) n^2-coeff l.p (n+3) (n-1)*coeff l.p (n+1) (n+1)=64 := by
 obtain ⟨h0,h1,h2⟩ := oneA_top_coeffsC416 m 1
 norm_num at h0 h1 h2
 rw [oneA_at_one320f (m+3) (m+6) (m+2) (by omega)] at h0
 rw [oneA_at_one320f (m+3) (m+5) (m+3) (by omega)] at h1
 rw [oneA_at_one320f (m+3) (m+4) (m+4) (by omega)] at h2
 have h0z : coeff (frame (oneAPath68 (m+3))).mid.p (m+6) (m+2)=20 := by exact_mod_cast h0
 have h1z : coeff (frame (oneAPath68 (m+3))).mid.p (m+5) (m+3)=12 := by exact_mod_cast h1
 have h2z : coeff (frame (oneAPath68 (m+3))).mid.p (m+4) (m+4)=4 := by exact_mod_cast h2
 dsimp only
 obtain ⟨ha,hb⟩ := oneA_labels68 (m+3)
 refine ⟨ha,hb,?_,?_,?_,?_,?_,?_,?_⟩
 · rw [ha,hb]; simp only [InPolygon]; constructor
   · nlinarith
   · omega
 · rw [ha,hb]; simp only [InPolygon]; constructor
   · nlinarith
   · omega
 · rw [ha,hb]; simp only [InPolygon]; constructor
   · nlinarith
   · omega
 · simpa using h0z
 · simpa using h1z
 · simpa using h2z
 · simpa only [Nat.add_assoc,Nat.add_sub_cancel,h0z,h1z,h2z] using
     (show (12:ℤ)^2-20*4=64 by norm_num)

#print axioms oneA_at_one320f
#print axioms oneA_raw_top320f
end
end MathGKM.Markov
