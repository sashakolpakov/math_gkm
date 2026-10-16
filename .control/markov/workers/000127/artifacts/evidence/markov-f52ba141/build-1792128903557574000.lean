import MarkovSecondWordMF52
import MarkovMechanical3eda
/-! Machine-authored f52ba141. Infinite raw LC family with a non-LC
unsmoothed cubic. These words are explicitly excluded from the source family. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def rescueCoreMF52 (n : ℕ) : List Bool := true::List.replicate n false
def rescueWordMF52 (n : ℕ) : List Bool := false::(rescueCoreMF52 n++[true])
def rescueSeedMF52 (n : ℕ) : ℤ[X] := secondExpr8934 X (n+1) 1 1

theorem false_run_statsMF52 (n : ℕ) :
 adj8934 false (List.replicate n false)=0 ∧
 last8934 false (List.replicate n false)=false := by
 induction n with
 | zero => exact ⟨rfl,rfl⟩
 | succ n ih => simpa [List.replicate_succ,adj8934,last8934] using ih

theorem rescue_statsMF52 (n : ℕ) (hn : 1 ≤ n) :
 stat8934 true (List.replicate n false)=1 := by
 cases n with
 | zero => omega
 | succ n => simp [List.replicate_succ,stat8934,adj8934,last8934,
     (false_run_statsMF52 n).1,(false_run_statsMF52 n).2]

theorem rescue_factorMF52 (n : ℕ) (hn : 2 ≤ n) :
 2*(hword46 (X:ℤ[X]) (rescueCoreMF52 n)).coeff 2=
 X*(X+1)^(n-2)*rescueSeedMF52 n := by
 have h := word_second8934 true (List.replicate n false) (by simp; omega)
 rw [rescue_statsMF52 n (by omega)] at h
 simpa [rescueCoreMF52,rescueSeedMF52,List.count_replicate] using h

theorem rescue_seed_coeffMF52 (n : ℕ) :
 (rescueSeedMF52 n).coeff 0=4 ∧ (rescueSeedMF52 n).coeff 1=28 ∧
 (rescueSeedMF52 n).coeff 2=12*(n:ℤ)+32 := by
 have he : rescueSeedMF52 n=C 4+C 28*X+C (12*(n:ℤ)+32)*X^2+
   C (((n:ℤ)+4)*(n+3))*X^3 := by
   simp [rescueSeedMF52,secondExpr8934]
   push_cast
   ring
 rw [he]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_C,Polynomial.coeff_X]
 norm_num

theorem rescue_seed_failureMF52 (n : ℕ) (hn : 14 ≤ n) :
 (rescueSeedMF52 n).coeff 1^2 < (rescueSeedMF52 n).coeff 0*(rescueSeedMF52 n).coeff 2 := by
 obtain ⟨h0,h1,h2⟩ := rescue_seed_coeffMF52 n
 rw [h0,h1,h2]
 have h : (14:ℤ) ≤ n := by exact_mod_cast hn
 nlinarith

theorem rescue_word_rawMF52 (n i : ℕ) :
 coeff (rawWord80 (rescueWordMF52 n)).b i 2*
 coeff (rawWord80 (rescueWordMF52 n)).b (i+2) 2 ≤
 coeff (rawWord80 (rescueWordMF52 n)).b (i+1) 2^2 := by
 exact raw_word_second_allMF52 (rescueCoreMF52 n) i

theorem rescue_not_sourceMF52 (n : ℕ) (hn : 2 ≤ n) (path : List Bool) :
 sourceWord28 path ≠ rescueWordMF52 n := by
 intro he
 obtain ⟨ha,hb⟩ := source_word_counts28 path
 rw [he] at ha hb
 have ha' : (frame path).mid.a=2 := by
   simpa [rescueWordMF52,rescueCoreMF52,List.count_replicate] using ha.symm
 have hb' : (frame path).mid.b=n+3 := by
   simpa [rescueWordMF52,rescueCoreMF52,add_assoc,add_comm,add_left_comm] using hb.symm
 have h := source_take_floor3eda path 2 (by omega)
 rw [he,ha',hb'] at h
 have hdiv : 2*2/(n+3)=0 := Nat.div_eq_of_lt (by omega)
 rw [hdiv] at h
 norm_num [rescueWordMF52,rescueCoreMF52,List.take] at h
end
end MathGKM.Markov
