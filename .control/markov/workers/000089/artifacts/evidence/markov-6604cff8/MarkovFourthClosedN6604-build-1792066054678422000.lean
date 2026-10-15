import MarkovRunJetFourth1N6604
import MarkovRunJetFourth3N6604
import MarkovThirdClosedBDEE
import MarkovFourthRunMomentBE
import MarkovGaugeCoeff6604
/-! Machine-authored 6604cff8. Exact rational fourth-slice expression for
arbitrary run length and predecessor denominator at least five. No LC claim. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def closedB4N6604 (n : ℕ) : RunFieldBDEE :=
 runEmbedBDEE (jetClosed14N6604 n)/(24*(1-runXBDEE)^9)
def closedD4N6604 (n : ℕ) : RunFieldBDEE :=
 runEmbedBDEE (jetClosed34N6604 n)/(24*(1-runXBDEE)^9)
theorem map_b4N6604 (n : ℕ) :
 runEmbedBDEE ((lowerMatrix487 n).b.coeff 4)=closedB4N6604 n := by
 have h := congrArg runEmbedBDEE (jet_closed_14N6604 n)
 change runEmbedBDEE (24*(1-X)^9*(lowerMatrix487 n).b.coeff 4)=_ at h
 simp only [map_mul,map_pow,map_sub,map_one,map_ofNat] at h
 unfold closedB4N6604
 apply (eq_div_iff (mul_ne_zero (by norm_num) (pow_ne_zero _ one_sub_runX_neBDEE))).2
 change _*(24*(1-runEmbedBDEE X)^9)=_
 linear_combination h
theorem map_d4N6604 (n : ℕ) :
 runEmbedBDEE ((lowerMatrix487 n).d.coeff 4)=closedD4N6604 n := by
 have h := congrArg runEmbedBDEE (jet_closed_34N6604 n)
 change runEmbedBDEE (24*(1-X)^9*(lowerMatrix487 n).d.coeff 4)=_ at h
 simp only [map_mul,map_pow,map_sub,map_one,map_ofNat] at h
 unfold closedD4N6604
 apply (eq_div_iff (mul_ne_zero (by norm_num) (pow_ne_zero _ one_sub_runX_neBDEE))).2
 change _*(24*(1-runEmbedBDEE X)^9)=_
 linear_combination h
def closedGaugeD4N6604 (n : ℕ) (p q : Bool) : RunFieldBDEE :=
 closedJetBDEE 2 0 (n+if p then 1 else 0)*closedB4N6604 (n+if q then 1 else 0)+
 closedD4N6604 (n+if q then 1 else 0)
theorem map_gauge_d4N6604 (n : ℕ) (p q : Bool) :
 runEmbedBDEE ((runBooleanGaugeADB2 n p q).d.coeff 4)=closedGaugeD4N6604 n p q := by
 unfold runBooleanGaugeADB2
 rw [gauge_coeff_d6604,map_add,map_mul,map_b4N6604,map_d4N6604]
 have h := map_run_jetBDEE 2 0 (n+if p then 1 else 0)
 change runEmbedBDEE ((lowerMatrix487 (n+if p then 1 else 0)).c.coeff 0)=_ at h
 rw [(lowerMatrix_jets487 _).2.2.1] at h
 rw [h]
 rfl

def closedLocalFourN6604 (n : ℕ) (p q r s : Bool) : RunFieldBDEE :=
 let m₁ := closedGaugeJetBDEE n p q 1
 let m₂ := closedGaugeJetBDEE n p q 2
 let m₃ := closedGaugeJetBDEE n p q 3
 let k₁ := closedGaugeJetBDEE n q r 1
 let k₂ := closedGaugeJetBDEE n q r 2
 let k₃ := closedGaugeJetBDEE n q r 3
 let l₁ := closedGaugeJetBDEE n r s 1
 let l₂ := closedGaugeJetBDEE n r s 2
 let v₂ := k₂.b+k₁.a-k₁.d
 let v₃ := k₃.b+k₁.a*(l₂.b+l₁.a-l₁.d)+k₂.a-
   (k₂.b+k₁.a)*k₁.d+k₁.d^2-k₂.d-k₁.c
 let g₁ := m₁.d
 let g₂ := m₂.d+m₁.c
 let g₃ := m₃.d+m₁.c*v₂+m₂.c
 let g₄ := closedGaugeD4N6604 n p q+m₁.c*v₃+m₂.c*v₂+m₃.c
 24*g₄-24*g₁*g₃-12*g₂^2+24*g₁^2*g₂-6*g₁^4

theorem map_local_fourN6604 (n : ℕ) (p q r s : Bool) :
 runEmbedBDEE (runLocalFourBE n p q r s)=closedLocalFourN6604 n p q r s := by
 have hm1 := map_gauge_coeffsBDEE n p q 1
 have hm2 := map_gauge_coeffsBDEE n p q 2
 have hm3 := map_gauge_coeffsBDEE n p q 3
 have hk1 := map_gauge_coeffsBDEE n q r 1
 have hk2 := map_gauge_coeffsBDEE n q r 2
 have hk3 := map_gauge_coeffsBDEE n q r 3
 have hl1 := map_gauge_coeffsBDEE n r s 1
 have hl2 := map_gauge_coeffsBDEE n r s 2
 norm_num at hm1 hm2 hm3 hk1 hk2 hk3 hl1 hl2
 unfold runLocalFourBE localFour01F closedLocalFourN6604
 simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,mul_one,
   hm1.2.2.1,hm1.2.2.2,hm2.2.2.1,hm2.2.2.2,hm3.2.2.1,hm3.2.2.2,
   hk1.1,hk1.2.2.1,hk1.2.2.2,hk2.1,hk2.2.1,hk2.2.2.2,hk3.2.1,
   hl1.1,hl1.2.2.2,hl2.2.1,map_gauge_d4N6604]

theorem map_four_momentN6604 (f : Bool → Bool → Bool → Bool → ℤ[X]) (c r : ℕ) :
 runEmbedBDEE (fourMomentBE f c r)=
 fourMomentBE (fun a b d e => runEmbedBDEE (f a b d e)) c r := by
 unfold fourMomentBE fourSourceMoment897
 split_ifs <;>
 simp only [map_add,map_sub,map_mul,map_natCast,map_zero,boolMomentADB2,boolJetADB2,
   fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE]
 all_goals simp only [map_add,map_sub,map_mul,map_natCast,map_zero]

def closedFourthN6604 (n c r : ℕ) : RunFieldBDEE :=
 let F := closedFirstBDEE n c r
 let S := closedSecondBDEE n c r
 let T := correctedClosedThirdBDEE n c r
 fourMomentBE (closedLocalFourN6604 n) c r+6*(1+runXBDEE)^4+
 4*F*T+3*S^2-12*F^2*S+6*F^4

theorem map_fourthN6604 (n c r : ℕ) :
 runEmbedBDEE (fourthExplicitRunBE n c r)=closedFourthN6604 n c r := by
 simp only [fourthExplicitRunBE,closedFourthN6604,map_add,map_sub,map_mul,map_pow,
   map_ofNat,map_one,map_firstBDEE,map_secondBDEE,map_corrected_thirdBDEE,
   map_four_momentN6604,map_local_fourN6604,runXBDEE]

theorem source_fourth_closedN6604 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 runEmbedBDEE (24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 closedFourthN6604 n (frame rest).mid.b (frame rest).mid.a := by
 rw [source_fourth_explicitBE n rest hc,map_fourthN6604]

theorem source_fourth_closed_iffN6604 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (P : ℤ[X]) :
 runEmbedBDEE P=closedFourthN6604 n (frame rest).mid.b (frame rest).mid.a ↔
 P=24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4 := by
 rw [←source_fourth_closedN6604 n rest hc]
 exact run_embed_injectiveBDEE.eq_iff
end
end MathGKM.Markov
