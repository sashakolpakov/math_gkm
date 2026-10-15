import MarkovNormalBandsFDDA
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem normal_source_firstFDDA (n c r : ℕ) :
 closedFirstBDEE n c r=normalFirstFDDA n (runXBDEE^n) c r runXBDEE := by
 simp only [closedFirstBDEE,closedHBDEE,normalFirstFDDA,normalHFDDA,
   normal_jet_31FDDA,normal_jet_20FDDA,Nat.cast_add,Nat.cast_one,pow_succ]

theorem normal_source_secondFDDA (n c r : ℕ) :
 closedSecondBDEE n c r=
 normalSecondFDDA n (runXBDEE^n) c r (2*r-c:ℕ) runXBDEE+
 (if c=2 then 2*runXBDEE^(2*n+3) else 0) := by
 simp only [closedSecondBDEE,closedHBDEE,closedKBDEE,normalSecondFDDA,
   normalHFDDA,normalKFDDA,normal_jet_31FDDA,normal_jet_20FDDA,
   normal_jet_32FDDA,normal_jet_21FDDA,Nat.cast_add,Nat.cast_one,pow_succ]
 ring
theorem normal_source_local_000FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n false false false=
 normalLocal000FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_000FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_local_001FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n false false true=
 normalLocal001FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_001FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_local_010FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n false true false=
 normalLocal010FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_010FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_local_011FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n false true true=
 normalLocal011FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_011FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_local_100FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n true false false=
 normalLocal100FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_100FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_local_101FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n true false true=
 normalLocal101FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_101FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_local_110FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n true true false=
 normalLocal110FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_110FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_local_111FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n true true true=
 normalLocal111FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_111FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,normal_jet_00FDDA,normal_jet_01FDDA,normal_jet_02FDDA,normal_jet_03FDDA,normal_jet_10FDDA,normal_jet_11FDDA,normal_jet_12FDDA,normal_jet_13FDDA,normal_jet_20FDDA,normal_jet_21FDDA,normal_jet_22FDDA,normal_jet_23FDDA,normal_jet_30FDDA,normal_jet_31FDDA,normal_jet_32FDDA,normal_jet_33FDDA,Nat.cast_add,pow_succ] <;> ring
theorem normal_source_localFDDA (n : ℕ) (p q r : Bool) :
 (1-runXBDEE)^6*closedLocalBDEE n p q r=
 normalLocalFDDA n (runXBDEE^n) runXBDEE p q r := by
 cases p <;> cases q <;> cases r
 · exact normal_source_local_000FDDA n
 · exact normal_source_local_001FDDA n
 · exact normal_source_local_010FDDA n
 · exact normal_source_local_011FDDA n
 · exact normal_source_local_100FDDA n
 · exact normal_source_local_101FDDA n
 · exact normal_source_local_110FDDA n
 · exact normal_source_local_111FDDA n
theorem normal_source_momentFDDA (n : ℕ) (c r q t u : RunFieldBDEE) :
 (1-runXBDEE)^6*boolMomentADB2 (closedLocalBDEE n) c r q t u=
 boolMomentADB2 (normalLocalFDDA n (runXBDEE^n) runXBDEE) c r q t u := by
 calc
  _=boolMomentADB2 (fun p q r => (1-runXBDEE)^6*closedLocalBDEE n p q r) c r q t u := by
   unfold boolMomentADB2 boolJetADB2
   ring
  _=_ := by simp only [normal_source_localFDDA]

end
end MathGKM.Markov
