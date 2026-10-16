import MarkovSecondSource8934
import MarkovAdjacency446
import MarkovSwitchLower7d80
/-! Machine-authored aa6c518b. Exact central second-row statistic for source words. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

theorem last_eqMAA6 (w : List Bool) (e : Bool) :
 last8934 e w=lastFrom5a7 e w := by
 induction w generalizing e with
 | nil => rfl
 | cons r rs ih => exact ih r

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
 have hl : last8934 e w=e := by rw [last_eqMAA6]; exact palindrome_last7d80 e w hp
 have hb := source_bb_count446 path
 rw [sourceWord_central28,he] at hb
 have hscan : bbCount446 (false::((e::w)++[true]))=
   adj8934 e w+(if e then 1 else 0) := by
   unfold bbCount446
   simp only [List.cons_append,bbScan446,Bool.false_and,Bool.false_eq_true,if_false,zero_add]
   rw [←adj_scanMAA6,adj_appendMAA6,hl]
   cases e <;> simp [adj8934]
 rw [hscan] at hb
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
   have hm : (e::w).count true+1=(frame path).mid.a := by
     simpa [he,List.count_cons,List.count_append,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using hc.1
   have hn3 : 3≤(e::w).length := by omega
   refine ⟨(e::w).length,(e::w).count true,stat8934 e w,hn,hm,hn3,
     central_statMAA6 path e w he,?_⟩
   have hr := source_word_exact3eda path
   rw [sourceWord_central28,he] at hr
   rw [hr,hword_raw46]
   exact word_second8934 e w hn3
end
end MathGKM.Markov
