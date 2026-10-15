"""Machine-authored source normalization adapter generation."""
from pathlib import Path
from itertools import product
R=Path('/Users/sasha/math_gkm')
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
'''
s='import MarkovNormalCombineFDDA\n'+head
s+='''theorem normal_source_firstFDDA (n c r : ℕ) :
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
'''
normal_names=','.join(f'normal_jet_{e}{k}FDDA' for e,k in product(range(4),repeat=2))
for a in product((0,1),repeat=3):
 tag=''.join(map(str,a));bs=' '.join('true' if x else 'false' for x in a)
 s+=f'''theorem normal_source_local_{tag}FDDA (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n {bs}=
 normalLocal{tag}FDDA n (runXBDEE^n) runXBDEE := by
 have h := normal_local_generic_{tag}FDDA (n:RunFieldBDEE) (runXBDEE^n) runXBDEE one_sub_runX_neBDEE
 convert h using 1 <;>
 simp [closedLocalBDEE,closedGaugeJetBDEE,closedMatrixJetBDEE,gauge75,mm16,
   shear75,unshear75,{normal_names},Nat.cast_add,pow_succ] <;> ring
'''
s+='''theorem normal_source_localFDDA (n : ℕ) (p q r : Bool) :
 (1-runXBDEE)^6*closedLocalBDEE n p q r=
 normalLocalFDDA n (runXBDEE^n) runXBDEE p q r := by
 cases p <;> cases q <;> cases r
'''
for a in product((0,1),repeat=3):s+=f' · exact normal_source_local_{"".join(map(str,a))}FDDA n\n'
s+='''theorem normal_source_momentFDDA (n : ℕ) (c r q t u : RunFieldBDEE) :
 (1-runXBDEE)^6*boolMomentADB2 (closedLocalBDEE n) c r q t u=
 boolMomentADB2 (normalLocalFDDA n (runXBDEE^n) runXBDEE) c r q t u := by
 calc
  _=boolMomentADB2 (fun p q r => (1-runXBDEE)^6*closedLocalBDEE n p q r) c r q t u := by
   unfold boolMomentADB2 boolJetADB2
   ring
  _=_ := by simp only [normal_source_localFDDA]

theorem normal_source_thirdFDDA (n c r : ℕ) :
 (1-runXBDEE)^6*closedThirdBDEE n c r=
 normalBand0FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 runXBDEE^n*normalBand1FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 (runXBDEE^n)^2*normalBand2FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 (runXBDEE^n)^3*normalBand3FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+
 (1-runXBDEE)^6*3*closedFirstBDEE n c r*(if c=2 then 2*runXBDEE^(2*n+3) else 0) := by
 rw [←normal_combineFDDA]
 have hf := normal_firstFDDA (n:RunFieldBDEE) (runXBDEE^n) c r runXBDEE one_sub_runX_neBDEE
 have hs := normal_secondFDDA (n:RunFieldBDEE) (runXBDEE^n) c r (2*r-c:ℕ) runXBDEE one_sub_runX_neBDEE
 rw [←hf,←hs]
 unfold closedThirdBDEE
 rw [normal_source_firstFDDA,normal_source_secondFDDA]
 have hm := normal_source_momentFDDA n (c:RunFieldBDEE) r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 linear_combination hm
'''
s+='end\nend MathGKM.Markov\n'
(R/'research/MarkovNormalSourceFDDA.lean').write_text(s)
