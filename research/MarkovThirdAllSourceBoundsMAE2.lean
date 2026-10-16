import MarkovThirdAlllow_0_4M03
import MarkovThirdAlllow_1_1MAE2
import MarkovThirdAlllow_2_0MAE2
import MarkovThirdAllmidlow_0_4MAE2
import MarkovThirdAllmidhigh_0_4MAE2
import MarkovThirdAllmidlow_1_2MAE2
import MarkovThirdAllmidhigh_1_2MAE2
import MarkovThirdAllmidlow_2_1MAE2
import MarkovThirdAllmidhigh_2_1MAE2
import MarkovThirdAllmidlow_3_0MAE2
import MarkovThirdAllmidhigh_3_0MAE2
import MarkovThirdAllhigh_1_4MAE2
import MarkovThirdAllhigh_2_1MAE2
import MarkovThirdAllhigh_3_0MAE2
/-! Machine-authored 1152282d. Exhaustive source-count coverage. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

theorem vAllnat_low_0_4MAE2 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have ex : ((x-0:ℕ):ℤ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_low_0_4M03 ((x-0:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_low_1_1MAE2 (x y : ℕ) (hx : 1≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_low_1_1MAE2 ((x-1:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_low_2_0MAE2 (x y : ℕ) (hx : 2≤x) (hy : 0≤y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℤ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_low_2_0MAE2 ((x-2:ℕ):ℤ) ((y-0:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_lowMAE2 (x y : ℕ) (hb : 7≤3*(x+1)+y) :
 vAllBoundsM115 (3*((x:ℤ)+1)+y) ((x:ℤ)+1) 0 0 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 1≤y) ∨ (2≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vAllnat_low_0_4MAE2 x y hx hy
 · exact vAllnat_low_1_1MAE2 x y hx hy
 · exact vAllnat_low_2_0MAE2 x y hx hy

theorem vAllnat_midlow_0_4MAE2 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have ex : ((x-0:ℕ):ℤ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midlow_0_4MAE2 ((x-0:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midlow_1_2MAE2 (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℤ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midlow_1_2MAE2 ((x-1:ℕ):ℤ) ((y-2:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midlow_2_1MAE2 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midlow_2_1MAE2 ((x-2:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midlow_3_0MAE2 (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have ex : ((x-3:ℕ):ℤ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℤ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midlow_3_0MAE2 ((x-3:ℕ):ℤ) ((y-0:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midlowMAE2 (x y : ℕ) (hb : 7≤3*x+2*y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) ((x:ℤ)+y) 0 y 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vAllnat_midlow_0_4MAE2 x y hx hy
 · exact vAllnat_midlow_1_2MAE2 x y hx hy
 · exact vAllnat_midlow_2_1MAE2 x y hx hy
 · exact vAllnat_midlow_3_0MAE2 x y hx hy

theorem vAllnat_midhigh_0_4MAE2 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have ex : ((x-0:ℕ):ℤ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midhigh_0_4MAE2 ((x-0:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midhigh_1_2MAE2 (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℤ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midhigh_1_2MAE2 ((x-1:ℕ):ℤ) ((y-2:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midhigh_2_1MAE2 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midhigh_2_1MAE2 ((x-2:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midhigh_3_0MAE2 (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have ex : ((x-3:ℕ):ℤ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℤ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_midhigh_3_0MAE2 ((x-3:ℕ):ℤ) ((y-0:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_midhighMAE2 (x y : ℕ) (hb : 7≤3*x+2*y) :
 vAllBoundsM115 (3*(x:ℤ)+2*y) (2*(x:ℤ)+y) x ((x:ℤ)+y) 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vAllnat_midhigh_0_4MAE2 x y hx hy
 · exact vAllnat_midhigh_1_2MAE2 x y hx hy
 · exact vAllnat_midhigh_2_1MAE2 x y hx hy
 · exact vAllnat_midhigh_3_0MAE2 x y hx hy

theorem vAllnat_high_1_4MAE2 (x y : ℕ) (hx : 1≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*(x:ℤ)+y) (2*(x:ℤ)+y) ((x:ℤ)+y) x y := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_high_1_4MAE2 ((x-1:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_high_2_1MAE2 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+y) (2*(x:ℤ)+y) ((x:ℤ)+y) x y := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_high_2_1MAE2 ((x-2:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_high_3_0MAE2 (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 vAllBoundsM115 (3*(x:ℤ)+y) (2*(x:ℤ)+y) ((x:ℤ)+y) x y := by
 have ex : ((x-3:ℕ):ℤ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℤ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_high_3_0MAE2 ((x-3:ℕ):ℤ) ((y-0:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllnat_highMAE2 (x y : ℕ) (hx : 1≤x) (hb : 7≤3*x+y) :
 vAllBoundsM115 (3*(x:ℤ)+y) (2*(x:ℤ)+y) ((x:ℤ)+y) x y := by
 have h : (1≤x ∧ 4≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vAllnat_high_1_4MAE2 x y hx hy
 · exact vAllnat_high_2_1MAE2 x y hx hy
 · exact vAllnat_high_3_0MAE2 x y hx hy

theorem vAllboundsMAE2 (a b : ℕ) (ha : 1≤a) (hb : 7≤b) (hab : a<b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases h0 : 3*a≤b
 · let x := a-1
   let y := b-3*a
   have ea : a=x+1 := by dsimp [x]; omega
   have eb : b=3*(x+1)+y := by dsimp [x,y]; omega
   have eq : 2*a-b=0 := by omega
   have et : min (b-a) (3*a-b)=0 := by omega
   have eu : 3*a-2*b=0 := by omega
   have h := vAllnat_lowMAE2 x y (by omega)
   rw [eq,et,eu,ea,eb]
   push_cast
   exact h
 · by_cases h1 : 2*a≤b
   · let x := b-2*a
     let y := 3*a-b
     have ea : a=x+y := by dsimp [x,y]; omega
     have eb : b=3*x+2*y := by dsimp [x,y]; omega
     have eq : 2*a-b=0 := by omega
     have et : min (b-a) (3*a-b)=y := by dsimp [y]; omega
     have eu : 3*a-2*b=0 := by omega
     have h := vAllnat_midlowMAE2 x y (by omega)
     rw [eq,et,eu,ea,eb]
     push_cast
     exact h
   · by_cases h2 : 3*a≤2*b
     · let x := 2*a-b
       let y := 2*b-3*a
       have ea : a=2*x+y := by dsimp [x,y]; omega
       have eb : b=3*x+2*y := by dsimp [x,y]; omega
       have eq : 2*a-b=x := rfl
       have et : min (b-a) (3*a-b)=x+y := by dsimp [x,y]; omega
       have eu : 3*a-2*b=0 := by omega
       have h := vAllnat_midhighMAE2 x y (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
     · let x := b-a
       let y := 3*a-2*b
       have ea : a=2*x+y := by dsimp [x,y]; omega
       have eb : b=3*x+y := by dsimp [x,y]; omega
       have eq : 2*a-b=x+y := by dsimp [x,y]; omega
       have et : min (b-a) (3*a-b)=x := by dsimp [x,y]; omega
       have eu : 3*a-2*b=y := rfl
       have h := vAllnat_highMAE2 x y (by dsimp [x]; omega) (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
end
end MathGKM.Markov
