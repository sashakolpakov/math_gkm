import MarkovSecondSource8934
import MarkovAdjacency446
import MarkovSwitchLower7d80
/-! Machine-authored aa6c518b. Exact central second-row statistic for source words. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000

theorem adj_scanMAA6 (w : List Bool) (e : Bool) :
 adj8934 e w=bbScan446 e w := by
 induction w generalizing e with
 | nil => rfl
 | cons r rs ih => simp only [adj8934,bbScan446,ih]

theorem adj_appendMAA6 (w z : List Bool) (e : Bool) :
 adj8934 e (w++z)=adj8934 e w+adj8934 (last8934 e w) z := by
 induction w generalizing e with
 | nil => simp [adj8934,last8934]
 | cons r rs ih => simp [adj8934,last8934,ih,Nat.add_assoc]

theorem central_statMAA6 (path : List Bool) (e : Bool) (w : List Bool)
 (he : central28 path=e::w) :
 stat8934 e w=2*(2*(frame path).mid.a-(frame path).mid.b) := by
 have hp := central_palindrome28 path
 rw [he] at hp
 have hl := palindrome_last7d80 e w hp
 have hb := source_bb_count446 path
 rw [sourceWord_central28,he] at hb
 change bbScan446 false (false::((e::w)++[true]))=_ at hb
 simp only [bbScan446,Bool.false_and,ite_false,Nat.zero_add] at hb
 rw [←adj_scanMAA6,adj_appendMAA6] at hb
 simp only [adj8934,last8934,Bool.false_and,ite_false,Nat.zero_add] at hb
 rw [hl] at hb
 unfold stat8934
 rw [hl]
 cases e <;> simp_all [adj8934]
 all_goals omega

theorem source_second_exactMAA6 (path : List Bool) (hb : 5≤(frame path).mid.b) :
 ∃ n m s : ℕ, n+2=(frame path).mid.b ∧ m+1=(frame path).mid.a ∧
 3≤n ∧ s=2*(2*(frame path).mid.a-(frame path).mid.b) ∧
 2*(Bivariate.swap (frame path).mid.p).coeff 2=
 X^m*(X+1)^(n-3)*secondExpr8934 X n m s := by
 have hc := source_word_counts28 path
 rw [sourceWord_central28] at hc
 cases he : central28 path with
 | nil => simp [he] at hc; omega
 | cons e w =>
   have hn : (e::w).length+2=(frame path).mid.b := by simpa [he] using hc.2
   have hm : (e::w).count true+1=(frame path).mid.a := by simpa [he] using hc.1
   have hn3 : 3≤(e::w).length := by omega
   refine ⟨(e::w).length,(e::w).count true,stat8934 e w,hn,hm,hn3,
     central_statMAA6 path e w he,?_⟩
   have hr := source_word_exact3eda path
   rw [sourceWord_central28,he] at hr
   rw [hr,hword_raw46]
   exact word_second8934 e w hn3
end
end MathGKM.Markov
