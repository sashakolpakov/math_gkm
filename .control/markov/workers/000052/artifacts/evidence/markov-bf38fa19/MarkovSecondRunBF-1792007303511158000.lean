import MarkovRunJet487
import MarkovSecondJet8934
/-! Machine-authored bf38fa19. Exact second run jets; no log-concavity premise. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def runBf (m : Mat16 BiPoly) : ℤ[X] := m.c.coeff 0
def runDeltaBF (m : Mat16 BiPoly) : ℤ[X] := m.a.coeff 1-m.c.coeff 0
def runBetaBF (m : Mat16 BiPoly) : ℤ[X] := m.b.coeff 2-m.d.coeff 1
def runKBF (m : Mat16 BiPoly) : ℤ[X] := m.d.coeff 2+m.c.coeff 1
def runLBF (m : Mat16 BiPoly) : ℤ[X] := runBetaBF m+runDeltaBF m

theorem second_run_mulBF (m n : Mat16 BiPoly)
 (hm : LowerShape487 m) (hn : LowerShape487 n) :
 runBf (mm16 m n)=runBf n ∧
 runDeltaBF (mm16 m n)=0 ∧
 runBetaBF (mm16 m n)=runLBF m ∧
 runKBF (mm16 m n)=runKBF m+runKBF n+
   lowerJet487 m*lowerJet487 n+runBf m*runLBF n ∧
 (tr16 (mm16 m n)).coeff 2=runKBF (mm16 m n)+
   runDeltaBF m*n.a.coeff 1+runBetaBF m*runBf n := by
 obtain ⟨ma,mb,md,mb1⟩ := hm
 obtain ⟨na,nb,nd,nb1⟩ := hn
 simp [runBf,runDeltaBF,runBetaBF,runLBF,runKBF,lowerJet487,mm16,tr16,
   Polynomial.coeff_add,Polynomial.mul_coeff_zero,coeff_mul_one46,
   coeff_mul_two8934,ma,mb,md,mb1,na,nb,nd,nb1] <;> ring

theorem lowerMatrix_second_relationBF (n : ℕ) :
 runLBF (lowerMatrix487 n)=X-1+X*(2*runSumA27 X n) := by
 induction n with
 | zero =>
   norm_num [runLBF,runBetaBF,runDeltaBF,lowerMatrix487,lowerRun487,
     ambientWord5c,ambientT5c,mm16,U,V,runSumA27,Polynomial.coeff_one]
   ring
 | succ n ih =>
   obtain ⟨ha,hb,hc,hd,hb1,ha1,hh⟩ := lowerMatrix_jets487 n
   have ih' := ih
   unfold runLBF runBetaBF runDeltaBF at ih' ⊢
   rw [lowerMatrix_step487]
   simp only [mm16,ambientT5c,if_true,Polynomial.coeff_add,
     Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,U,V,
     Polynomial.coeff_X,Polynomial.coeff_C,Polynomial.coeff_one,
     Polynomial.coeff_mul_X,Polynomial.coeff_mul_C,Polynomial.coeff_C_mul,
     ha,hb,hc,hd,hb1,ha1]
   simp only [Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ,
     Polynomial.coeff_one,if_true,if_false,zero_ne_one,one_ne_zero,
     zero_mul,mul_zero,one_mul,mul_one,add_zero,zero_add]
   rw [runSum_succA27,pow_succ]
   have hs := runSum_clear487 n
   linear_combination ih'+hs

theorem second_run_tripleBF (m n p : Mat16 BiPoly)
 (hm : LowerShape487 m) (hn : LowerShape487 n) (hp : LowerShape487 p) :
 (tr16 (mm16 (mm16 m n) p)).coeff 2=
 runKBF m+runKBF n+runKBF p+
 lowerJet487 m*lowerJet487 n+lowerJet487 m*lowerJet487 p+
 lowerJet487 n*lowerJet487 p+
 runBf m*runLBF n+runBf n*runLBF p+runBf p*runLBF m := by
 have hmn := lowerShape_mul487 m n hm hn
 obtain ⟨hb,hd,he,hk,ht⟩ := second_run_mulBF m n hm hn
 have h := (second_run_mulBF (mm16 m n) p hmn.1 hp)
 rw [h.2.2.2.2,h.2.2.2.1,hk,hmn.2.1,hb,hd,he]
 ring

theorem second_run_fourBF (m n p q : Mat16 BiPoly)
 (hm : LowerShape487 m) (hn : LowerShape487 n)
 (hp : LowerShape487 p) (hq : LowerShape487 q) :
 (tr16 (mm16 (mm16 (mm16 m n) p) q)).coeff 2=
 runKBF m+runKBF n+runKBF p+runKBF q+
 lowerJet487 m*lowerJet487 n+lowerJet487 m*lowerJet487 p+
 lowerJet487 m*lowerJet487 q+lowerJet487 n*lowerJet487 p+
 lowerJet487 n*lowerJet487 q+lowerJet487 p*lowerJet487 q+
 runBf m*runLBF n+runBf n*runLBF p+runBf p*runLBF q+runBf q*runLBF m := by
 have hmn := lowerShape_mul487 m n hm hn
 have hmnp := lowerShape_mul487 (mm16 m n) p hmn.1 hp
 obtain ⟨hb,hd,he,hk,ht⟩ := second_run_mulBF m n hm hn
 obtain ⟨pb,pd,pe,pk,pt⟩ := second_run_mulBF (mm16 m n) p hmn.1 hp
 have h := second_run_mulBF (mm16 (mm16 m n) p) q hmnp.1 hq
 rw [h.2.2.2.2,h.2.2.2.1,pk,hk,hmnp.2.1,hmn.2.1,pb,hb,pd,pe]
 simp only [runLBF,he,hd]
 ring

theorem second_run_order_gapBF (m n : Mat16 BiPoly)
 (hm : LowerShape487 m) (hn : LowerShape487 n) :
 (tr16 (mm16 (mm16 (mm16 m m) n) n)).coeff 2-
 (tr16 (mm16 (mm16 (mm16 m n) m) n)).coeff 2=
 (runBf m-runBf n)*(runLBF m-runLBF n) := by
 rw [second_run_fourBF m m n n hm hm hn hn,
   second_run_fourBF m n m n hm hn hm hn]
 ring

theorem adjacent_run_order_gapBF (n : ℕ) :
 (tr16 (mm16 (mm16 (mm16 (lowerMatrix487 n) (lowerMatrix487 n))
   (lowerMatrix487 (n+1))) (lowerMatrix487 (n+1)))).coeff 2-
 (tr16 (mm16 (mm16 (mm16 (lowerMatrix487 n) (lowerMatrix487 (n+1)))
   (lowerMatrix487 n)) (lowerMatrix487 (n+1)))).coeff 2=4*X^(2*n+3) := by
 rw [second_run_order_gapBF _ _ (lowerShape_run487 n) (lowerShape_run487 (n+1)),
   lowerMatrix_second_relationBF,lowerMatrix_second_relationBF]
 have hn := (lowerMatrix_jets487 n).2.2.1
 have hs := (lowerMatrix_jets487 (n+1)).2.2.1
 simp only [runBf,hn,hs,runSum_succA27]
 have he : 2*n+3=(n+1)+(n+1)+1 := by omega
 rw [he,pow_succ,pow_add]
 ring

#print axioms second_run_mulBF
#print axioms lowerMatrix_second_relationBF
#print axioms adjacent_run_order_gapBF
end
end MathGKM.Markov
