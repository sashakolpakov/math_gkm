import MarkovMiddleGap3_0M8AE
import MarkovMiddleValue3_0M722
import MarkovMiddleValue3_1M722
import MarkovMiddleValue3_2M722
import MarkovMiddleCanonicalM722
import MarkovFourthCentralM253
import MarkovResidualM253
/-! Machine-authored request 5dc9c88d. Exact fourth-slice coefficient certificate; no root closure. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 32000000
set_option maxRecDepth 65536
set_option linter.unusedVariables false
attribute [local irreducible] midP3_0_0_0M722 midP3_0_1_0M722 midP3_0_2_0M722 midP3_0_3_0M722 midP3_0_4_0M722 midP3_1_0_0M722 midP3_1_1_0M722 midP3_1_2_0M722 midP3_1_3_0M722 midP3_1_4_0M722 midP3_2_0_0M722 midP3_2_1_0M722 midP3_2_2_0M722 midP3_2_3_0M722 midP3_2_4_0M722

attribute [local irreducible] midG3_0_0M8AE midG3_1_0M8AE midG3_2_0M8AE midG3_3_0M8AE midG3_4_0M8AE midG3_5_0M8AE midG3_6_0M8AE midG3_7_0M8AE midG3_8_0M8AE

theorem middle_high_directM8AE (R J E : ℤ) (hR : 0 ≤ R) (hJ : 0 ≤ J) (hE : 0 ≤ E) : middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+6)*middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+8) ≤ middleShape3M722 (J+E+6) (R+5) (R+4) (2*(J+E+6)+J+7)^2 := by
 apply sub_nonneg.mp
 rw [middle_value3_0M722 0 R J E,middle_value3_1M722 0 R J E,middle_value3_2M722 0 R J E]
 simp only [pow_zero,pow_succ,zero_mul,mul_zero,add_zero,mul_one]
 unfold midCol3_0_0M722 midCol3_1_0M722 midCol3_2_0M722
 have he : (midP3_1_0_0M722 J E*R^0 + midP3_1_1_0M722 J E*R^1 + midP3_1_2_0M722 J E*R^2 + midP3_1_3_0M722 J E*R^3 + midP3_1_4_0M722 J E*R^4)^2-(midP3_0_0_0M722 J E*R^0 + midP3_0_1_0M722 J E*R^1 + midP3_0_2_0M722 J E*R^2 + midP3_0_3_0M722 J E*R^3 + midP3_0_4_0M722 J E*R^4)*(midP3_2_0_0M722 J E*R^0 + midP3_2_1_0M722 J E*R^1 + midP3_2_2_0M722 J E*R^2 + midP3_2_3_0M722 J E*R^3 + midP3_2_4_0M722 J E*R^4)=midG3_0_0M8AE J E*R^0 + midG3_1_0M8AE J E*R^1 + midG3_2_0M8AE J E*R^2 + midG3_3_0M8AE J E*R^3 + midG3_4_0M8AE J E*R^4 + midG3_5_0M8AE J E*R^5 + midG3_6_0M8AE J E*R^6 + midG3_7_0M8AE J E*R^7 + midG3_8_0M8AE J E*R^8 := by
  rw [←middle_gap_eq3_0_0M8AE,←middle_gap_eq3_1_0M8AE,←middle_gap_eq3_2_0M8AE,←middle_gap_eq3_3_0M8AE,←middle_gap_eq3_4_0M8AE,←middle_gap_eq3_5_0M8AE,←middle_gap_eq3_6_0M8AE,←middle_gap_eq3_7_0M8AE,←middle_gap_eq3_8_0M8AE]
  ring
 have h0 := middle_gap_nonneg3_0_0M8AE J E hJ hE
 have h1 := middle_gap_nonneg3_1_0M8AE J E hJ hE
 have h2 := middle_gap_nonneg3_2_0M8AE J E hJ hE
 have h3 := middle_gap_nonneg3_3_0M8AE J E hJ hE
 have h4 := middle_gap_nonneg3_4_0M8AE J E hJ hE
 have h5 := middle_gap_nonneg3_5_0M8AE J E hJ hE
 have h6 := middle_gap_nonneg3_6_0M8AE J E hJ hE
 have h7 := middle_gap_nonneg3_7_0M8AE J E hJ hE
 have h8 := middle_gap_nonneg3_8_0M8AE J E hJ hE
 have hp : 0 ≤ midG3_0_0M8AE J E*R^0 + midG3_1_0M8AE J E*R^1 + midG3_2_0M8AE J E*R^2 + midG3_3_0M8AE J E*R^3 + midG3_4_0M8AE J E*R^4 + midG3_5_0M8AE J E*R^5 + midG3_6_0M8AE J E*R^6 + midG3_7_0M8AE J E*R^7 + midG3_8_0M8AE J E*R^8 := by positivity
 nlinarith only [he,hp]
end
end MathGKM.Markov

/-! Machine-authored 8ae35b59. The predecessor numerator c-1 subfamily. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleShape0M722 middleShape3M722
theorem middleRawValue_top_lcM8AE (n c j : ℤ) (hc : 5≤c)
 (hj : 2*n+6≤j) (hju : j≤3*n) :
 middleRawValueM722 n c (c-1) j*middleRawValueM722 n c (c-1) (j+2)≤
 middleRawValueM722 n c (c-1) (j+1)^2 := by
 let J := j-2*n-6
 let E := 3*n-j
 have h := middle_high_directM8AE (c-5) J E (by omega)
   (by dsimp [J]; omega) (by dsimp [E]; omega)
 have en : J+E+6=n := by dsimp [J,E]; ring
 have ej : 2*(J+E+6)+J+6=j := by dsimp [J,E]; ring
 have ej1 : 2*(J+E+6)+J+7=j+1 := by dsimp [J,E]; ring
 have ej2 : 2*(J+E+6)+J+8=j+2 := by dsimp [J,E]; ring
 have ec : c-5+5=c := by ring
 have er : c-5+4=c-1 := by ring
 rw [ej,ej1,ej2,en,ec,er] at h
 simpa only [middleRawValueM722, if_neg (by omega : ¬2*(c-1)<c)] using h

theorem source_fourth_middle_topM8AE (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a+1=(frame rest).mid.b)
 (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := middleRawValue_top_lcM8AE (n:ℤ) ((frame rest).mid.b:ℤ)
   (j:ℤ) (by omega) (by omega) (by omega)
 have h0 := source_fourth_middle_canonicalM722 n rest hc (i+2) j hj (by omega) (by omega)
 have h1 := source_fourth_middle_canonicalM722 n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_middle_canonicalM722 n rest hc i (j+2) (by omega) (by omega) (by omega)
 have er : ((frame rest).mid.b:ℤ)-1=(frame rest).mid.a := by omega
 rw [er] at h
 norm_num only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov

/-! Machine-authored 8ae35b59. Top-predecessor fourth slice; exact scope. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem run_fourth_topM8AE (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hr : (frame rest).mid.a+1=(frame rest).mid.b) : RunFourthLCM94 n rest := by
 apply (run_fourth_iff_centralM253 n rest hn hc).mpr
 intro i j _ _ _ hs hj hju
 exact source_fourth_middle_topM8AE n rest hc hr i j hj hju hs
end
end MathGKM.Markov

/-! Machine-authored request 8ae35b59. Exact pinned-root residual, still unproved. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def TopFourthRegionM8AE (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧ 7≤n ∧
  5≤(frame rest).mid.b ∧ i+j+2=(frame path).mid.a+4 ∧
  (frame rest).mid.a+1=(frame rest).mid.b

def InteriorCore63TopM8AE : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionM722 path i j → ¬MiddleFourthOneRegionM5DC path i j → ¬SolvedFourthRegionM253 path i j → ¬TopFourthRegionM8AE path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)


theorem root_iff_coreTopM8AE : Conjecture63 ↔ InteriorCore63TopM8AE := by
 rw [root_iff_coreM253]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon
   by_cases he : TopFourthRegionM8AE path i j
   · obtain ⟨n,rest,hpath,hn,hc,hdiag,hr⟩ := he
     subst path
     exact run_fourth_topM8AE n rest hn hc hr i j h0 h1 h2 hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf hfm hm hon he
end
end MathGKM.Markov
