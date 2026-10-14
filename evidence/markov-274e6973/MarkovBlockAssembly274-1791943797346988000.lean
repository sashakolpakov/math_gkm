import MarkovVerticalRun025
import MarkovVerticalPoly025

/-! Machine-authored request 274e6973. Cleared first-vertical block formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def blockH274 (a r : Polynomial ℤ) (q : ℕ) : Polynomial ℤ :=
  4*(a*weightedSum025 q+r*plainSum025 q)+
    3*(a*(q:Polynomial ℤ)+r)*X^q+(a*((q:Polynomial ℤ)+1)+r)*X^(q+1)

theorem blockH_add274 (a b r s : Polynomial ℤ) (q : ℕ) :
    blockH274 (a+b) (r+s) q=blockH274 a r q+blockH274 b s q := by
  unfold blockH274; ring

theorem runK_short274 (n : ℕ) : runK025 n=blockH274 1 0 (n+1) := by
  unfold runK025 blockH274
  push_cast
  rw [show n+2=n+1+1 by omega]
  ring

theorem runK_long274 (n : ℕ) : runK025 (n+1)=X*blockH274 1 1 (n+1) := by
  have hs := sum_relation025 (n+1)
  unfold runK025 blockH274
  rw [show n+1+1=(n+1)+1 by omega]
  simp only [weightedSum025,Finset.sum_range_succ] at *
  push_cast at *
  simp only [show n+1+2=n+1+1+1 by omega,pow_succ] at *
  linear_combination 4*hs

theorem run_scaled274 (n : ℕ) (r : Bool) :
    X^(n+1)*(X+1)*columnJet025 (runMatrix025 (n+if r then 1 else 0))=
      (runMatrix025 (n+if r then 1 else 0)).a.coeff 0*
        blockH274 1 (if r then 1 else 0) (n+1) := by
  cases r
  · simp only [Bool.false_eq_true,if_false,Nat.add_zero]
    rw [(run_jet025 n).2,runK_short274,run_a_zero025]
  · simp only [if_true]
    rw [(run_jet025 (n+1)).2,runK_long274,run_a_zero025,pow_succ]
    ring

theorem block_shape274 (n : ℕ) (z : List Bool) (hz : z≠[]) :
    ZeroShape025 (rawWord80 (blockSub025 n z)) := by
  induction z with
  | nil => exact (hz rfl).elim
  | cons r rs ih =>
    have hs : ZeroShape025 (runMatrix025 (n+if r then 1 else 0)) :=
      rawWord_last_shape025 _
    by_cases he : rs=[]
    · subst rs; simpa [blockSub025,runMatrix025] using hs
    · have hh := shape_mul025 _ _ hs (ih he)
      simpa [blockSub025,List.flatMap_cons,rawWord_append80,runMatrix025] using hh

theorem blocks_scaled274 (n : ℕ) (z : List Bool) :
    X^(n+1)*(X+1)*columnJet025 (rawWord80 (blockSub025 n z))=
      (rawWord80 (blockSub025 n z)).a.coeff 0*
        blockH274 z.length (z.count true) (n+1) := by
  induction z with
  | nil => simp [blockSub025,rawWord80,columnJet025,Polynomial.coeff_one,blockH274]
  | cons r rs ih =>
    by_cases he : rs=[]
    · subst rs
      simpa [blockSub025,runMatrix025,List.count_cons] using run_scaled274 n r
    · have hh := columnJet_scaled_mul025
        (runMatrix025 (n+if r then 1 else 0)) (rawWord80 (blockSub025 n rs))
        (rawWord_last_shape025 _) (block_shape274 n rs he)
        (X^(n+1)*(X+1)) (blockH274 1 (if r then 1 else 0) (n+1))
        (blockH274 rs.length (rs.count true) (n+1)) (run_scaled274 n r) ih
      rw [← blockH_add274] at hh
      cases r <;> simpa [blockSub025,List.flatMap_cons,rawWord_append80,
        runMatrix025,List.count_cons,add_comm] using hh

#print axioms blocks_scaled274
end
end MathGKM.Markov
