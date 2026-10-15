import MarkovMiddleChartAll0M5D2
import MarkovMiddleLowDirectM722
import MarkovMiddleChartAll2M5D2
import MarkovMiddleHighDirectM5D2
import MarkovMiddleRawDefM722
import MarkovMiddleCanonicalM722
import MarkovFourthAfterMiddleM722
import MarkovResidualM806
import MarkovResidualM94
import MarkovFourthMiddleM94
/-! Machine-authored request 722898f8. Four parameter charts retain raw scale. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] middleShape0M722 middleShape3M722
theorem middleRawValue_lcM5D2 (n c r j : ℤ) (hc : 5≤c) (hr : 1≤r)
 (hrc : r<c) (hne : 2*r≠c) (hj : 2*n+6≤j) (hju : j≤3*n) :
 middleRawValueM722 n c r j*middleRawValueM722 n c r (j+2)≤
 middleRawValueM722 n c r (j+1)^2 := by
 let J := j-2*n-6
 let E := 3*n-j
 have hJ : 0≤J := by dsimp [J]; omega
 have hE : 0≤E := by dsimp [E]; omega
 have en : J+E+6=n := by dsimp [J,E]; ring
 have ej : 2*(J+E+6)+J+6=j := by dsimp [J,E]; ring
 have ej1 : 2*(J+E+6)+J+7=j+1 := by dsimp [J,E]; ring
 have ej2 : 2*(J+E+6)+J+8=j+2 := by dsimp [J,E]; ring
 unfold middleRawValueM722
 by_cases hl : 2*r<c
 · simp only [if_pos hl]
   by_cases hrr : 2≤r
   · have h := middle_chart0M5D2 (c-2*r-1) (r-2) J E (by omega) (by omega) hJ hE
     have ec : 2*(r-2)+(c-2*r-1)+5=c := by ring
     have er : r-2+2=r := by ring
     rw [ej,ej1,ej2,en,ec,er] at h
     exact h
   · have er : r=1 := by omega
     subst r
     have h := middle_low_directM722 (c-5) J E (by omega) hJ hE
     have ec : c-5+5=c := by ring
     rw [ej,ej1,ej2,en,ec] at h
     exact h
 · simp only [if_neg hl]
   by_cases hd : 2≤c-r
   · have h := middle_chart2M5D2 (c-r-2) (2*r-c-1) J E (by omega) (by omega) hJ hE
     have ec : 2*(c-r-2)+(2*r-c-1)+5=c := by ring
     have er : c-r-2+(2*r-c-1)+3=r := by ring
     rw [ej,ej1,ej2,en,ec,er] at h
     exact h
   · have er : c-r=1 := by omega
     have h := middle_high_directM5D2 (c-5) J E (by omega) hJ hE
     have ec : c-5+5=c := by ring
     have err : c-5+4=r := by omega
     rw [ej,ej1,ej2,en,ec,err] at h
     exact h
end
end MathGKM.Markov

/-! Machine-authored 722898f8. Source middle inequality. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleRawValueM722
set_option maxHeartbeats 4000000
theorem source_fourth_middleM5D2 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ) (hj : 2*n+6≤j) (hju : j≤3*n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 obtain ⟨hr,hrc,hcop⟩ := frame_reduced rest
 have h21 := reduced_chamber_boundary897 _ _ 2 1 hc (by decide) (by decide) hcop
 have h := middleRawValue_lcM5D2 (n:ℤ) ((frame rest).mid.b:ℤ)
   ((frame rest).mid.a:ℤ) (j:ℤ) (by omega) (by omega) (by omega) (by omega)
   (by omega) (by omega)
 have h0 := source_fourth_middle_canonicalM722 n rest hc (i+2) j hj (by omega) (by omega)
 have h1 := source_fourth_middle_canonicalM722 n rest hc (i+1) (j+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_middle_canonicalM722 n rest hc i (j+2) (by omega) (by omega) (by omega)
 norm_num only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h0 h1 h2
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]
end
end MathGKM.Markov

/-! Machine-authored request 722898f8. Assembly remains conditional on compiled imports. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem source_fourth_upperM5D2 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hj : 2*n+6≤j) (hu : j≤4*n+5)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 by_cases hmid : j≤3*n
 · exact source_fourth_middleM5D2 n rest hc i j hj hmid hs
 · exact source_fourth_after_middleM722 n rest hn hc i j (by omega) hu hs
end
end MathGKM.Markov

/-! Machine-authored 722898f8. Exact residual after the proved fourth tail. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
set_option maxHeartbeats 4000000
def FinalFourthRegionFullM5D2 (path : List Bool) (i j : ℕ) : Prop :=
 ∃ n rest, path=List.replicate n true++false::rest ∧
  7≤n ∧ 5≤(frame rest).mid.b ∧ 2*n+6≤j ∧ j≤4*n+5 ∧ i+j+2=(frame path).mid.a+4

def InteriorCore63FullM5D2 : Prop := ∀ path : List Bool,
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
   ¬InitialFourthRegionM806 path i j → ¬FinalFourthRegionM94 path i j → ¬FinalFourthRegionFullM5D2 path i j →
   coeff m.p i (j+2)*coeff m.p (i+2) j ≤ coeff m.p (i+1) (j+1)^2)

theorem root_iff_coreFullM5D2 : Conjecture63 ↔ InteriorCore63FullM5D2 := by
 rw [root_iff_coreM94]
 constructor
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf _
   exact hd i j h0 h1 h2 ht hs hb hx hi hf
 · intro h path
   obtain ⟨hh,hv,hd⟩ := h path
   refine ⟨hh,hv,?_⟩
   intro i j h0 h1 h2 ht hs hb hx hi hf
   by_cases he : FinalFourthRegionFullM5D2 path i j
   · obtain ⟨n,rest,hpath,hn,hc,hj,hju,hdiag⟩ := he
     subst path
     exact source_fourth_upperM5D2 n rest hn hc i j hj hju hdiag
   · exact hd i j h0 h1 h2 ht hs hb hx hi hf he
end
end MathGKM.Markov

/-! Machine-authored 722898f8. Exact residual fourth-slice interval for n≥7. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
def RunFourthFiveM5D2 (n : ℕ) (rest : List Bool) : Prop :=
 let m := (frame (List.replicate n true++false::rest)).mid
 ∀ i j, InPolygon m.a m.b i (j+2) → InPolygon m.a m.b (i+1) (j+1) →
  InPolygon m.a m.b (i+2) j → i+j+2=m.a+4 → 2*n<j → j≤2*n+5 →
  coeff m.p i (j+2)*coeff m.p (i+2) j≤coeff m.p (i+1) (j+1)^2

theorem run_fourth_iff_fiveM5D2 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) :
 RunFourthLCM94 n rest ↔ RunFourthFiveM5D2 n rest := by
 constructor
 · intro h i j h0 h1 h2 hs _ _
   exact h i j h0 h1 h2 hs
 · intro h i j h0 h1 h2 hs
   by_cases hlo : j≤2*n
   · exact source_fourth_prefixM806 n rest hc (by omega) i j hlo hs
   by_cases hhi : 2*n+6≤j
   · exact source_fourth_upperM5D2 n rest hn hc i j hhi
      (source_fourth_polygon_boundM96 n rest i j hs h0) hs
   · exact h i j h0 h1 h2 hs (by omega) (by omega)
end
end MathGKM.Markov
