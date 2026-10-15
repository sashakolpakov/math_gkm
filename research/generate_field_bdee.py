"""Machine-authored exact rational-function adapter generation."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s='''import MarkovRunJets0BDEE
import MarkovRunJets1BDEE
import MarkovRunJets2BDEE
import MarkovRunJets3BDEE
/-! Machine-authored bdee9a64. Exact closed rational run jets. The embedding
is injective; it is not a numerical specialization or coefficient rescaling. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000
set_option maxRecDepth 8192
abbrev RunFieldBDEE := FractionRing ℤ[X]
def runEmbedBDEE : ℤ[X] →+* RunFieldBDEE := algebraMap _ _
def runXBDEE : RunFieldBDEE := runEmbedBDEE X
def jetNumeratorBDEE (e k : Fin 4) (n : ℕ) : ℤ[X] :=
 match e.val,k.val with
'''
for e in range(4):
 for k in range(4):s+=f' | {e},{k} => jetClosed{e}{k}BDEE n\n'
s+=''' | _,_ => 0
def closedJetBDEE (e k : Fin 4) (n : ℕ) : RunFieldBDEE :=
 runEmbedBDEE (jetNumeratorBDEE e k n)/(6*(1-runXBDEE)^(2*k.val+1))

theorem jet_numeratorBDEE (e k : Fin 4) (n : ℕ) :
 6*(1-X)^(2*k.val+1)*(runEntryBDEE e n).coeff k.val=jetNumeratorBDEE e k n := by
 fin_cases e <;> fin_cases k
'''
for e in range(4):
 for k in range(4):s+=f' · exact jet_closed_{e}{k}BDEE n\n'
s+='''
theorem run_embed_injectiveBDEE : Function.Injective runEmbedBDEE :=
 IsFractionRing.injective ℤ[X] RunFieldBDEE

theorem one_sub_runX_neBDEE : (1-runXBDEE)≠0 := by
 intro h
 have he : runEmbedBDEE (1-X)=runEmbedBDEE 0 := by simpa [runXBDEE] using h
 have hp := run_embed_injectiveBDEE he
 have hc := congrArg (fun p : ℤ[X] => p.coeff 0) hp
 norm_num at hc

theorem map_run_jetBDEE (e k : Fin 4) (n : ℕ) :
 runEmbedBDEE ((runEntryBDEE e n).coeff k.val)=closedJetBDEE e k n := by
 have h := congrArg runEmbedBDEE (jet_numeratorBDEE e k n)
 simp only [map_mul,map_pow,map_sub,map_one,map_ofNat] at h
 unfold closedJetBDEE
 apply (eq_div_iff (mul_ne_zero (by norm_num) (pow_ne_zero _ one_sub_runX_neBDEE))).2
 change _*(6*(1-runEmbedBDEE X)^(2*k.val+1))=_
 linear_combination h

def closedMatrixJetBDEE (n : ℕ) (k : Fin 4) : Mat16 RunFieldBDEE :=
 ⟨closedJetBDEE 0 k n,closedJetBDEE 1 k n,closedJetBDEE 2 k n,closedJetBDEE 3 k n⟩
def mappedMatrixJetBDEE (m : Mat16 BiPoly) (k : ℕ) : Mat16 RunFieldBDEE :=
 ⟨runEmbedBDEE (m.a.coeff k),runEmbedBDEE (m.b.coeff k),
 runEmbedBDEE (m.c.coeff k),runEmbedBDEE (m.d.coeff k)⟩

theorem map_matrix_jetBDEE (n : ℕ) (k : Fin 4) :
 mappedMatrixJetBDEE (lowerMatrix487 n) k.val=closedMatrixJetBDEE n k := by
 apply Mat16.ext
 · exact map_run_jetBDEE 0 k n
 · exact map_run_jetBDEE 1 k n
 · exact map_run_jetBDEE 2 k n
 · exact map_run_jetBDEE 3 k n

theorem map_constant_gauge_jetBDEE (a b : ℤ[X]) (m : Mat16 BiPoly) (k : ℕ) :
 mappedMatrixJetBDEE (gauge75 (C a) (C b) m) k=
 gauge75 (runEmbedBDEE a) (runEmbedBDEE b) (mappedMatrixJetBDEE m k) := by
 have hn (P : BiPoly) : runEmbedBDEE ((P * -C b).coeff k)=
     -(runEmbedBDEE (P.coeff k)*runEmbedBDEE b) := by
   rw [←map_neg C b,Polynomial.coeff_mul_C]
   simp
 apply Mat16.ext <;>
 simp [mappedMatrixJetBDEE,gauge75,mm16,shear75,unshear75,
   Polynomial.coeff_add,Polynomial.coeff_sub,Polynomial.coeff_C_mul,
   Polynomial.coeff_mul_C,map_add,map_sub,map_mul,hn]

def closedGaugeJetBDEE (n : ℕ) (p q : Bool) (k : Fin 4) : Mat16 RunFieldBDEE :=
 gauge75 (closedJetBDEE 2 0 (n+if p then 1 else 0))
   (closedJetBDEE 2 0 (n+if q then 1 else 0))
   (closedMatrixJetBDEE (n+if q then 1 else 0) k)

theorem map_run_gauge_jetBDEE (n : ℕ) (p q : Bool) (k : Fin 4) :
 mappedMatrixJetBDEE (runBooleanGaugeADB2 n p q) k.val=closedGaugeJetBDEE n p q k := by
 rw [runBooleanGaugeADB2,map_constant_gauge_jetBDEE,map_matrix_jetBDEE]
 unfold closedGaugeJetBDEE
 have hs (a : ℕ) : runEmbedBDEE (2*runSumA27 X a)=closedJetBDEE 2 0 a := by
   have h := map_run_jetBDEE 2 0 a
   change runEmbedBDEE ((lowerMatrix487 a).c.coeff 0)=_ at h
   rw [(lowerMatrix_jets487 a).2.2.1] at h
   exact h
 rw [hs,hs]

#print axioms map_run_jetBDEE
#print axioms map_run_gauge_jetBDEE
end
end MathGKM.Markov
'''
(R/'research/MarkovRunFieldBDEE.lean').write_text(s)
