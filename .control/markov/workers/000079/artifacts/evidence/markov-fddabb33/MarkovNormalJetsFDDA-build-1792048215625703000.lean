import MarkovThirdClosedBDEE
/-! Machine-authored live fddabb33. Exact algebraic normalization;
all generated identities are checked by Lean, not inferred from tests. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
def normalJet00FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (0)
def normalJet01FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (2*x + -1*Z*x + -1*Z*x^2) / (1-x)^1
def normalJet02FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (-1*x + -5*x^2 + -7*x^3 + -3*x^4 + 1*Z*x + 5*Z*x^2 + 7*Z*x^3 + 3*Z*x^4 + 2*N*x + 2*N*x^2 + -2*N*x^3 + -2*N*x^4 + 1*N*Z*x + 2*N*Z*x^2 + -2*N*Z*x^4 + -1*N*Z*x^5) / (1-x)^3
def normalJet03FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (1*x + 11*x^2 + 38*x^3 + 62*x^4 + 53*x^5 + 23*x^6 + 4*x^7 + -1*Z*x + -11*Z*x^2 + -38*Z*x^3 + -62*Z*x^4 + -53*Z*x^5 + -23*Z*x^6 + -4*Z*x^7 + -2*N*x + -10*N*x^2 + -16*N*x^3 + -4*N*x^4 + 14*N*x^5 + 14*N*x^6 + 4*N*x^7 + (-3/2)*N*Z*x + (-17/2)*N*Z*x^2 + (-31/2)*N*Z*x^3 + (-13/2)*N*Z*x^4 + (23/2)*N*Z*x^5 + (29/2)*N*Z*x^6 + (11/2)*N*Z*x^7 + (1/2)*N*Z*x^8 + 1*N^2*x + 2*N^2*x^2 + -1*N^2*x^3 + -4*N^2*x^4 + -1*N^2*x^5 + 2*N^2*x^6 + 1*N^2*x^7 + (-1/2)*N^2*Z*x + (-3/2)*N^2*Z*x^2 + (-1/2)*N^2*Z*x^3 + (5/2)*N^2*Z*x^4 + (5/2)*N^2*Z*x^5 + (-1/2)*N^2*Z*x^6 + (-3/2)*N^2*Z*x^7 + (-1/2)*N^2*Z*x^8) / (1-x)^5
def normalJet10FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (0)
def normalJet11FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (1)
def normalJet12FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (-1*x + -2*x^2 + -1*x^3 + 1*Z*x + 2*Z*x^2 + 1*Z*x^3 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3) / (1-x)^2
def normalJet13FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (2*x + 9*x^2 + 16*x^3 + 14*x^4 + 6*x^5 + 1*x^6 + -2*Z*x + -9*Z*x^2 + -16*Z*x^3 + -14*Z*x^4 + -6*Z*x^5 + -1*Z*x^6 + (-1/2)*N + -3*N*x + (-11/2)*N*x^2 + -2*N*x^3 + (9/2)*N*x^4 + 5*N*x^5 + (3/2)*N*x^6 + -1*N*Z*x + -3*N*Z*x^2 + -2*N*Z*x^3 + 2*N*Z*x^4 + 3*N*Z*x^5 + 1*N*Z*x^6 + (1/2)*N^2 + 1*N^2*x + (-1/2)*N^2*x^2 + -2*N^2*x^3 + (-1/2)*N^2*x^4 + 1*N^2*x^5 + (1/2)*N^2*x^6) / (1-x)^4
def normalJet20FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (2*x + -2*Z*x) / (1-x)^1
def normalJet21FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (1*x + -11*x^2 + -5*x^3 + -1*x^4 + 8*Z*x^2 + 8*Z*x^3 + 2*N*x + 2*N*x^2 + -2*N*x^3 + -2*N*x^4 + 2*N*Z*x + 2*N*Z*x^2 + -2*N*Z*x^3 + -2*N*Z*x^4) / (1-x)^3
def normalJet22FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (11*x^2 + 49*x^3 + 74*x^4 + 46*x^5 + 11*x^6 + 1*x^7 + -11*Z*x^2 + -49*Z*x^3 + -74*Z*x^4 + -46*Z*x^5 + -11*Z*x^6 + -1*Z*x^7 + -14*N*x^2 + -22*N*x^3 + 4*N*x^4 + 20*N*x^5 + 10*N*x^6 + 2*N*x^7 + -1*N*Z*x + -12*N*Z*x^2 + -21*N*Z*x^3 + 21*N*Z*x^5 + 12*N*Z*x^6 + 1*N*Z*x^7 + 1*N^2*x + 2*N^2*x^2 + -1*N^2*x^3 + -4*N^2*x^4 + -1*N^2*x^5 + 2*N^2*x^6 + 1*N^2*x^7 + -1*N^2*Z*x + -2*N^2*Z*x^2 + 1*N^2*Z*x^3 + 4*N^2*Z*x^4 + 1*N^2*Z*x^5 + -2*N^2*Z*x^6 + -1*N^2*Z*x^7) / (1-x)^5
def normalJet23FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (-14*x^2 + -125*x^3 + -421*x^4 + -729*x^5 + -717*x^6 + -407*x^7 + -127*x^8 + -19*x^9 + -1*x^10 + 14*Z*x^2 + 125*Z*x^3 + 421*Z*x^4 + 729*Z*x^5 + 717*Z*x^6 + 407*Z*x^7 + 127*Z*x^8 + 19*Z*x^9 + 1*Z*x^10 + (1/6)*N*x + (41/2)*N*x^2 + 102*N*x^3 + (542/3)*N*x^4 + 93*N*x^5 + -105*N*x^6 + (-518/3)*N*x^7 + -94*N*x^8 + (-45/2)*N*x^9 + (-13/6)*N*x^10 + (2/3)*N*Z*x + 21*N*Z*x^2 + 100*N*Z*x^3 + (536/3)*N*Z*x^4 + 96*N*Z*x^5 + -102*N*Z*x^6 + (-524/3)*N*Z*x^7 + -96*N*Z*x^8 + -22*N*Z*x^9 + (-5/3)*N*Z*x^10 + (-1/2)*N^2*x + (-19/2)*N^2*x^2 + -22*N^2*x^3 + -2*N^2*x^4 + 37*N^2*x^5 + 31*N^2*x^6 + -6*N^2*x^7 + -18*N^2*x^8 + (-17/2)*N^2*x^9 + (-3/2)*N^2*x^10 + 1*N^2*Z*x + 9*N^2*Z*x^2 + 20*N^2*Z*x^3 + 4*N^2*Z*x^4 + -34*N^2*Z*x^5 + -34*N^2*Z*x^6 + 4*N^2*Z*x^7 + 20*N^2*Z*x^8 + 9*N^2*Z*x^9 + 1*N^2*Z*x^10 + (1/3)*N^3*x + 1*N^3*x^2 + (-8/3)*N^3*x^4 + -2*N^3*x^5 + 2*N^3*x^6 + (8/3)*N^3*x^7 + -1*N^3*x^9 + (-1/3)*N^3*x^10 + (1/3)*N^3*Z*x + 1*N^3*Z*x^2 + (-8/3)*N^3*Z*x^4 + -2*N^3*Z*x^5 + 2*N^3*Z*x^6 + (8/3)*N^3*Z*x^7 + -1*N^3*Z*x^9 + (-1/3)*N^3*Z*x^10) / (1-x)^7
def normalJet30FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (1)
def normalJet31FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (1 + -4*x + -1*x^2 + 2*Z*x + 2*Z*x^2 + 1*N + 1*N*x + -1*N*x^2 + -1*N*x^3) / (1-x)^2
def normalJet32FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (2*x + 12*x^2 + 20*x^3 + 12*x^4 + 2*x^5 + -2*Z*x + -12*Z*x^2 + -20*Z*x^3 + -12*Z*x^4 + -2*Z*x^5 + (1/2)*N + -5*N*x + (-17/2)*N*x^2 + 2*N*x^3 + (15/2)*N*x^4 + 3*N*x^5 + (1/2)*N*x^6 + -2*N*Z*x + -4*N*Z*x^2 + 4*N*Z*x^4 + 2*N*Z*x^5 + (1/2)*N^2 + 1*N^2*x + (-1/2)*N^2*x^2 + -2*N^2*x^3 + (-1/2)*N^2*x^4 + 1*N^2*x^5 + (1/2)*N^2*x^6) / (1-x)^4
def normalJet33FDDA (N Z x : RunFieldBDEE) : RunFieldBDEE :=
 (-2*x + -27*x^2 + -104*x^3 + -189*x^4 + -186*x^5 + -101*x^6 + -28*x^7 + -3*x^8 + 2*Z*x + 27*Z*x^2 + 104*Z*x^3 + 189*Z*x^4 + 186*Z*x^5 + 101*Z*x^6 + 28*Z*x^7 + 3*Z*x^8 + (-1/6)*N + 5*N*x + 30*N*x^2 + (172/3)*N*x^3 + 31*N*x^4 + -34*N*x^5 + (-166/3)*N*x^6 + -28*N*x^7 + (-11/2)*N*x^8 + (-1/3)*N*x^9 + 3*N*Z*x + 19*N*Z*x^2 + 39*N*Z*x^3 + 23*N*Z*x^4 + -23*N*Z*x^5 + -39*N*Z*x^6 + -19*N*Z*x^7 + -3*N*Z*x^8 + (-7/2)*N^2*x + -9*N^2*x^2 + -1*N^2*x^3 + 15*N^2*x^4 + 12*N^2*x^5 + -3*N^2*x^6 + -7*N^2*x^7 + -3*N^2*x^8 + (-1/2)*N^2*x^9 + 1*N^2*Z*x + 3*N^2*Z*x^2 + 1*N^2*Z*x^3 + -5*N^2*Z*x^4 + -5*N^2*Z*x^5 + 1*N^2*Z*x^6 + 3*N^2*Z*x^7 + 1*N^2*Z*x^8 + (1/6)*N^3 + (1/2)*N^3*x + (-4/3)*N^3*x^3 + -1*N^3*x^4 + 1*N^3*x^5 + (4/3)*N^3*x^6 + (-1/2)*N^3*x^8 + (-1/6)*N^3*x^9) / (1-x)^6
theorem normal_jet_00FDDA (n : ℕ) :
 closedJetBDEE 0 0 n=normalJet00FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed00BDEE,normalJet00FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_01FDDA (n : ℕ) :
 closedJetBDEE 0 1 n=normalJet01FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed01BDEE,normalJet01FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_02FDDA (n : ℕ) :
 closedJetBDEE 0 2 n=normalJet02FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed02BDEE,normalJet02FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_03FDDA (n : ℕ) :
 closedJetBDEE 0 3 n=normalJet03FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed03BDEE,normalJet03FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_10FDDA (n : ℕ) :
 closedJetBDEE 1 0 n=normalJet10FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed10BDEE,normalJet10FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_11FDDA (n : ℕ) :
 closedJetBDEE 1 1 n=normalJet11FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed11BDEE,normalJet11FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_12FDDA (n : ℕ) :
 closedJetBDEE 1 2 n=normalJet12FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed12BDEE,normalJet12FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_13FDDA (n : ℕ) :
 closedJetBDEE 1 3 n=normalJet13FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed13BDEE,normalJet13FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_20FDDA (n : ℕ) :
 closedJetBDEE 2 0 n=normalJet20FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed20BDEE,normalJet20FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_21FDDA (n : ℕ) :
 closedJetBDEE 2 1 n=normalJet21FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed21BDEE,normalJet21FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_22FDDA (n : ℕ) :
 closedJetBDEE 2 2 n=normalJet22FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed22BDEE,normalJet22FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_23FDDA (n : ℕ) :
 closedJetBDEE 2 3 n=normalJet23FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed23BDEE,normalJet23FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_30FDDA (n : ℕ) :
 closedJetBDEE 3 0 n=normalJet30FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed30BDEE,normalJet30FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_31FDDA (n : ℕ) :
 closedJetBDEE 3 1 n=normalJet31FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed31BDEE,normalJet31FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_32FDDA (n : ℕ) :
 closedJetBDEE 3 2 n=normalJet32FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed32BDEE,normalJet32FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
theorem normal_jet_33FDDA (n : ℕ) :
 closedJetBDEE 3 3 n=normalJet33FDDA n (runXBDEE^n) runXBDEE := by
 have hx : 1-runEmbedBDEE X≠0 := one_sub_runX_neBDEE
 simp only [closedJetBDEE,jetNumeratorBDEE,jetClosed33BDEE,normalJet33FDDA,
   runXBDEE,Fin.val_zero,Fin.val_one,Fin.val_ofNat,map_add,map_sub,map_mul,map_pow,
   map_natCast,map_ofNat,map_neg,map_zero,map_one]
 norm_num only
 field_simp
 <;> ring
end
end MathGKM.Markov
