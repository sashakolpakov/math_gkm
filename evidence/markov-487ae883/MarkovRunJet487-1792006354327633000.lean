import MarkovLowerBlocks487
import MarkovCutGapsA27
/-! Machine-authored 487ae883. First ambient trace jet of cyclic B runs. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def lowerMatrix487 (n : ℕ) : Mat16 BiPoly := ambientWord5c U V (lowerRun487 n)
def lowerH487 : ℕ → ℤ[X]
 | 0 => 1
 | n+1 => lowerH487 n + 1+3*X+4*X*runSumA27 X n

theorem runSum_clear487 (n : ℕ) :
 (1-X)*runSumA27 (X : ℤ[X]) n=X-X^(n+1) := by
 induction n with
 | zero => simp [runSumA27]
 | succ n ih =>
   rw [runSum_succA27,pow_succ]
   linear_combination X*ih

theorem lowerMatrix_step487 (n : ℕ) :
 lowerMatrix487 (n+1)=mm16 (lowerMatrix487 n) (ambientT5c U V true) := by
 have he : lowerRun487 (n+1)=lowerRun487 n++[true] := by
   simp [lowerRun487,List.replicate_succ']
 simp [lowerMatrix487,he,ambient_word_appendB5,ambientWord5c,mm_one_right774]

theorem lowerMatrix_jets487 (n : ℕ) :
 (lowerMatrix487 n).a.coeff 0=0 ∧
 (lowerMatrix487 n).b.coeff 0=0 ∧
 (lowerMatrix487 n).c.coeff 0=2*runSumA27 X n ∧
 (lowerMatrix487 n).d.coeff 0=1 ∧
 (lowerMatrix487 n).b.coeff 1=1 ∧
 (lowerMatrix487 n).a.coeff 1=2*runSumA27 X n+X^(n+1) ∧
 (lowerMatrix487 n).d.coeff 1+2*runSumA27 X n=lowerH487 n := by
 induction n with
 | zero =>
   norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,lowerH487,coeff_mul_one46]
 | succ n ih =>
   obtain ⟨ha,hb,hc,hd,hb1,ha1,hh⟩ := ih
   rw [lowerMatrix_step487]
   simp only [mm16,ambientT5c,if_true,Polynomial.coeff_add,Polynomial.mul_coeff_zero,
     coeff_mul_one46,U,V,Polynomial.coeff_X,Polynomial.coeff_C,
     Polynomial.coeff_one,Polynomial.coeff_mul_X,Polynomial.coeff_mul_C,
     Polynomial.coeff_C_mul,ha,hb,hc,hd,hb1,ha1]
   norm_num only at *
   have hs := runSum_clear487 n
   rw [runSum_succA27,lowerH487,pow_succ]
   constructor
   · ring
   constructor
   · ring
   constructor
   · ring
   constructor
   · ring
   constructor
   · ring
   constructor
   · ring
   · linear_combination hh+2*hs

def LowerShape487 (m : Mat16 BiPoly) : Prop :=
 m.a.coeff 0=0 ∧ m.b.coeff 0=0 ∧ m.d.coeff 0=1 ∧ m.b.coeff 1=1
def lowerJet487 (m : Mat16 BiPoly) : ℤ[X] := m.d.coeff 1+m.c.coeff 0

theorem lowerShape_run487 (n : ℕ) : LowerShape487 (lowerMatrix487 n) := by
 obtain ⟨ha,hb,hc,hd,hb1,ha1,hh⟩ := lowerMatrix_jets487 n
 exact ⟨ha,hb,hd,hb1⟩

theorem lowerShape_mul487 (m n : Mat16 BiPoly)
 (hm : LowerShape487 m) (hn : LowerShape487 n) :
 LowerShape487 (mm16 m n) ∧
 lowerJet487 (mm16 m n)=lowerJet487 m+lowerJet487 n ∧
 (tr16 (mm16 m n)).coeff 1=lowerJet487 m+lowerJet487 n := by
 obtain ⟨ma,mb,md,mb1⟩ := hm
 obtain ⟨na,nb,nd,nb1⟩ := hn
 simp [LowerShape487,lowerJet487,mm16,tr16,Polynomial.coeff_add,
   Polynomial.mul_coeff_zero,coeff_mul_one46,ma,mb,md,mb1,na,nb,nd,nb1]
 ring

theorem lowerShape_word487 (ns : List ℕ) (hne : ns≠[]) :
 LowerShape487 (ambientWord5c U V (ns.flatMap lowerRun487)) ∧
 lowerJet487 (ambientWord5c U V (ns.flatMap lowerRun487))=
   (ns.map lowerH487).sum := by
 induction ns with
 | nil => exact (hne rfl).elim
 | cons n ns ih =>
   by_cases he : ns=[]
   · subst ns
     simp only [List.flatMap_cons,List.flatMap_nil,List.append_nil,
       List.map_cons,List.map_nil,List.sum_cons,List.sum_nil,add_zero]
     refine ⟨lowerShape_run487 n,?_⟩
     obtain ⟨_,_,hc,_,_,_,hh⟩ := lowerMatrix_jets487 n
     simpa only [lowerJet487,← lowerMatrix487,hc] using hh
   · obtain ⟨hs,hj⟩ := ih he
     have h := lowerShape_mul487 (lowerMatrix487 n)
       (ambientWord5c U V (ns.flatMap lowerRun487)) (lowerShape_run487 n) hs
     simp only [List.flatMap_cons,ambient_word_appendB5,List.map_cons,List.sum_cons]
     refine ⟨h.1,?_⟩
     rw [h.2.1,hj]
     obtain ⟨_,_,hc,_,_,_,hh⟩ := lowerMatrix_jets487 n
     simpa only [lowerJet487,hc] using congrArg (fun p => p+(ns.map lowerH487).sum) hh

theorem lower_trace_sum487 (ns : List ℕ) (hlen : 2≤ns.length) :
 (tr16 (ambientWord5c U V (ns.flatMap lowerRun487))).coeff 1=
 (ns.map lowerH487).sum := by
 cases ns with
 | nil => simp at hlen
 | cons n ns =>
   have hne : ns≠[] := by intro he; simp [he] at hlen
   obtain ⟨hs,hj⟩ := lowerShape_word487 ns hne
   have h := lowerShape_mul487 (lowerMatrix487 n)
     (ambientWord5c U V (ns.flatMap lowerRun487)) (lowerShape_run487 n) hs
   simp only [List.flatMap_cons,ambient_word_appendB5,List.map_cons,List.sum_cons]
   rw [h.2.2,hj]
   obtain ⟨_,_,hc,_,_,_,hh⟩ := lowerMatrix_jets487 n
   simpa only [lowerJet487,hc] using congrArg (fun p => p+(ns.map lowerH487).sum) hh

#print axioms lowerMatrix_jets487
#print axioms lower_trace_sum487
end
end MathGKM.Markov
