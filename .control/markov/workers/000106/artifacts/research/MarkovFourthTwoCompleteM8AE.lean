import MarkovMiddleValue0_0M722
import MarkovMiddleValue0_1M722
import MarkovMiddleValue0_2M722
import MarkovMiddleGap0_0_0M8AE
import MarkovMiddleTwoGap1M8AE
import MarkovMiddleTwoGap2M8AE
import MarkovMiddleTwoGap3M8AE
import MarkovMiddleTwoGap4M8AE
import MarkovMiddleGap0_5_0M8AE
import MarkovMiddleGap0_6_0M8AE
import MarkovMiddleGap0_7_0M8AE
import MarkovMiddleGap0_8_0M8AE
import MarkovMiddleCanonicalM722
import MarkovFourthCentralM253
import MarkovFourthTopCompleteM8AE
import MarkovResidualM253
/-! Machine-authored 8ae35b59. Direct numerator-two middle inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 8000000
set_option maxRecDepth 65536
attribute [local irreducible] midP0_0_0_0M722 midP0_0_0_1M722 midP0_0_0_2M722 midP0_0_0_3M722 midP0_0_0_4M722 midP0_1_0_0M722 midP0_1_0_1M722 midP0_1_0_2M722 midP0_1_0_3M722 midP0_1_0_4M722 midP0_2_0_0M722 midP0_2_0_1M722 midP0_2_0_2M722 midP0_2_0_3M722 midP0_2_0_4M722 midG0_0_0M8AE midTwoG1M8AE midTwoG2M8AE midTwoG3M8AE midTwoG4M8AE midG0_0_5M8AE midG0_0_6M8AE midG0_0_7M8AE midG0_0_8M8AE
theorem middle_two_directM8AE (C J E : ℤ) (hC : 0≤C) (hJ : 0≤J) (hE : 0≤E) : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+6)*middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+8) ≤ middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+7)^2 := by
 have hv0 : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+6)=(midP0_0_0_0M722 J E*C^0 + midP0_0_0_1M722 J E*C^1 + midP0_0_0_2M722 J E*C^2 + midP0_0_0_3M722 J E*C^3 + midP0_0_0_4M722 J E*C^4) := by
  have h := middle_value0_0M722 C 0 J E
  simpa only [midCol0_0_0M722,midCol0_0_1M722,midCol0_0_2M722,midCol0_0_3M722,midCol0_0_4M722,pow_zero,pow_succ,zero_mul,mul_zero,add_zero,zero_add,mul_one,add_assoc] using h
 have hv1 : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+7)=(midP0_1_0_0M722 J E*C^0 + midP0_1_0_1M722 J E*C^1 + midP0_1_0_2M722 J E*C^2 + midP0_1_0_3M722 J E*C^3 + midP0_1_0_4M722 J E*C^4) := by
  have h := middle_value0_1M722 C 0 J E
  simpa only [midCol0_1_0M722,midCol0_1_1M722,midCol0_1_2M722,midCol0_1_3M722,midCol0_1_4M722,pow_zero,pow_succ,zero_mul,mul_zero,add_zero,zero_add,mul_one,add_assoc] using h
 have hv2 : middleShape0M722 (J+E+6) (C+5) 2 (2*(J+E+6)+J+8)=(midP0_2_0_0M722 J E*C^0 + midP0_2_0_1M722 J E*C^1 + midP0_2_0_2M722 J E*C^2 + midP0_2_0_3M722 J E*C^3 + midP0_2_0_4M722 J E*C^4) := by
  have h := middle_value0_2M722 C 0 J E
  simpa only [midCol0_2_0M722,midCol0_2_1M722,midCol0_2_2M722,midCol0_2_3M722,midCol0_2_4M722,pow_zero,pow_succ,zero_mul,mul_zero,add_zero,zero_add,mul_one,add_assoc] using h
 apply sub_nonneg.mp
 rw [hv0,hv1,hv2]
 have he : (midP0_1_0_0M722 J E*C^0 + midP0_1_0_1M722 J E*C^1 + midP0_1_0_2M722 J E*C^2 + midP0_1_0_3M722 J E*C^3 + midP0_1_0_4M722 J E*C^4)^2-(midP0_0_0_0M722 J E*C^0 + midP0_0_0_1M722 J E*C^1 + midP0_0_0_2M722 J E*C^2 + midP0_0_0_3M722 J E*C^3 + midP0_0_0_4M722 J E*C^4)*(midP0_2_0_0M722 J E*C^0 + midP0_2_0_1M722 J E*C^1 + midP0_2_0_2M722 J E*C^2 + midP0_2_0_3M722 J E*C^3 + midP0_2_0_4M722 J E*C^4)=(midG0_0_0M8AE J E*C^0 + midTwoG1M8AE J E*C^1 + midTwoG2M8AE J E*C^2 + midTwoG3M8AE J E*C^3 + midTwoG4M8AE J E*C^4 + midG0_0_5M8AE J E*C^5 + midG0_0_6M8AE J E*C^6 + midG0_0_7M8AE J E*C^7 + midG0_0_8M8AE J E*C^8) := by
  rw [←middle_gap_eq0_0_0M8AE,←middle_two_gap_eq1M8AE,←middle_two_gap_eq2M8AE,←middle_two_gap_eq3M8AE,←middle_two_gap_eq4M8AE,←middle_gap_eq0_0_5M8AE,←middle_gap_eq0_0_6M8AE,←middle_gap_eq0_0_7M8AE,←middle_gap_eq0_0_8M8AE]
  ring
 rw [he]
 have hp0 := middle_gap_nonneg0_0_0M8AE J E hJ hE
 have hp1 := middle_two_gap_nonneg1M8AE J E hJ hE
 have hp2 := middle_two_gap_nonneg2M8AE J E hJ hE
 have hp3 := middle_two_gap_nonneg3M8AE J E hJ hE
 have hp4 := middle_two_gap_nonneg4M8AE J E hJ hE
 have hp5 := middle_gap_nonneg0_0_5M8AE J E hJ hE
 have hp6 := middle_gap_nonneg0_0_6M8AE J E hJ hE
 have hp7 := middle_gap_nonneg0_0_7M8AE J E hJ hE
 have hp8 := middle_gap_nonneg0_0_8M8AE J E hJ hE
 positivity
end
end MathGKM.Markov

/-! Machine-authored 722898f8. The predecessor numerator-one subfamily. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleShape0M722 middleShape3M722
theorem middleRawValue_two_lcM8AE (n c j : ℤ) (hc : 5≤c)
 (hj : 2*n+6≤j) (hju : j≤3*n) :
 middleRawValueM722 n c 2 j*middleRawValueM722 n c 2 (j+2)≤
 middleRawValueM722 n c 2 (j+1)^2 := by
 let J := j-2*n-6
 let E := 3*n-j
 have h := middle_two_directM8AE (c-5) J E (by omega)
   (by dsimp [J]; omega) (by dsimp [E]; omega)
 have en : J+E+6=n := by dsimp [J,E]; ring
 have ej : 2*(J+E+6)+J+6=j := by dsimp [J,E]; ring
 have ej1 : 2*(J+E+6)+J+7=j+1 := by dsimp [J,E]; ring
 have ej2 : 2*(J+E+6)+J+8=j+2 := by dsimp [J,E]; ring
 have ec : c-5+5=c := by ring
 rw [ej,ej1,ej2,en,ec] at h
 simpa only [middleRawValueM722, if_pos (by omega : 2*(2:ℤ)<c)] using h

theorem source_fourth_middle_twoM8AE (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=2)
 (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := middleRawValue_two_lcM8AE (n:ℤ) ((frame rest).mid.b:ℤ)
   (j:ℤ) (by omega) (by omega) (by omega)
 have h0 := source_fourth_middle_canonicalM722 n rest hc (i+2) j hj (by omega) (by omega)
 have h1 := source_fourth_middle_canonicalM722 n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_middle_canonicalM722 n rest hc i (j+2) (by omega) (by omega) (by omega)
 rw [hr] at h0 h1 h2
 norm_num only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov

/-! Machine-authored 8ae35b59. Top-predecessor fourth slice; exact scope. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem run_fourth_twoM8AE (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hr : (frame rest).mid.a=2) : RunFourthLCM94 n rest := by
 apply (run_fourth_iff_centralM253 n rest hn hc).mpr
 intro i j _ _ _ hs hj hju
 exact source_fourth_middle_twoM8AE n rest hc hr i j hj hju hs
end
end MathGKM.Markov

/-! Machine-authored request 8ae35b59. Exact pinned-root residual, still unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def TwoFourthRegionM8AE (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 7≤n ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4 ∧
  (frame rest).mid.a=2

def InteriorCore63TwoM8AE : Prop := ∀ path : List Bool,
 let m := (frame path).mid
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b (i+1) j →
   InPolygon m.a m.b (i+2) j → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p (i+2) j ≤ coeff m.p (i+1) j^2) ∧
 (∀ i j, InPolygon m.a m.b i j → InPolygon m.a m.b i (j+1) →
   InPolygon m.a m.b i (j+2) → i+j+4 ≤ m.a+m.b-1 →
   coeff m.p i j*coeff m.p i (j+2) ≤ coeff m.p i (j+1)^2) ∧
 (∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
   InPolygon m.a m.b (i+2) j → i+j+8 ≤ m.a+m.b-1 → m.a+4 ≤ i+j+2 →
   m.a+2 ≤ m.b → (m.a+5 ≤ i+j+2 ∨ 4*m.b < 5*m.a) →
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j → ¬SolvedFourthRegionM253 path i j → ¬TopFourthRegionM8AE path i j → ¬TwoFourthRegionM8AE path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)


theorem root_iff_coreTwoM8AE : Conjecture63 ↔ InteriorCore63TwoM8AE := by
 rw [root_iff_coreTopM8AE]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop
   by_cases he : TwoFourthRegionM8AE path i j
   · obtain ⟨n,rest,hpath,hn,hc,hdiag,hr⟩ := he
     subst path
     exact run_fourth_twoM8AE n rest hn hc hr i j h0 h1 h2 hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon htop he
end
end MathGKM.Markov
