import MarkovThirdRun2ChartsM115
/-! Machine-authored 1152282d. Exhaustive source-count coverage. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

theorem vR2nat_low_0_4M115 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vR2BoundsM115 (3*((x:ℝ)+1)+y) ((x:ℝ)+1) 0 0 0 := by
 have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℝ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_low_0_4M115 ((x-0:ℕ):ℝ) ((y-4:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_low_1_1M115 (x y : ℕ) (hx : 1≤x) (hy : 1≤y) :
 vR2BoundsM115 (3*((x:ℝ)+1)+y) ((x:ℝ)+1) 0 0 0 := by
 have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_low_1_1M115 ((x-1:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_low_2_0M115 (x y : ℕ) (hx : 2≤x) (hy : 0≤y) :
 vR2BoundsM115 (3*((x:ℝ)+1)+y) ((x:ℝ)+1) 0 0 0 := by
 have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_low_2_0M115 ((x-2:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_lowM115 (x y : ℕ) (hb : 7≤3*(x+1)+y) :
 vR2BoundsM115 (3*((x:ℝ)+1)+y) ((x:ℝ)+1) 0 0 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 1≤y) ∨ (2≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vR2nat_low_0_4M115 x y hx hy
 · exact vR2nat_low_1_1M115 x y hx hy
 · exact vR2nat_low_2_0M115 x y hx hy

theorem vR2nat_midlow_0_4M115 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) ((x:ℝ)+y) 0 y 0 := by
 have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℝ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midlow_0_4M115 ((x-0:ℕ):ℝ) ((y-4:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midlow_1_2M115 (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) ((x:ℝ)+y) 0 y 0 := by
 have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midlow_1_2M115 ((x-1:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midlow_2_1M115 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) ((x:ℝ)+y) 0 y 0 := by
 have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midlow_2_1M115 ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midlow_3_0M115 (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) ((x:ℝ)+y) 0 y 0 := by
 have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midlow_3_0M115 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midlowM115 (x y : ℕ) (hb : 7≤3*x+2*y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) ((x:ℝ)+y) 0 y 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vR2nat_midlow_0_4M115 x y hx hy
 · exact vR2nat_midlow_1_2M115 x y hx hy
 · exact vR2nat_midlow_2_1M115 x y hx hy
 · exact vR2nat_midlow_3_0M115 x y hx hy

theorem vR2nat_midhigh_0_4M115 (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) (2*(x:ℝ)+y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℝ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midhigh_0_4M115 ((x-0:ℕ):ℝ) ((y-4:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midhigh_1_2M115 (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) (2*(x:ℝ)+y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midhigh_1_2M115 ((x-1:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midhigh_2_1M115 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) (2*(x:ℝ)+y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midhigh_2_1M115 ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midhigh_3_0M115 (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) (2*(x:ℝ)+y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_midhigh_3_0M115 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_midhighM115 (x y : ℕ) (hb : 7≤3*x+2*y) :
 vR2BoundsM115 (3*(x:ℝ)+2*y) (2*(x:ℝ)+y) x ((x:ℝ)+y) 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vR2nat_midhigh_0_4M115 x y hx hy
 · exact vR2nat_midhigh_1_2M115 x y hx hy
 · exact vR2nat_midhigh_2_1M115 x y hx hy
 · exact vR2nat_midhigh_3_0M115 x y hx hy

theorem vR2nat_high_1_4M115 (x y : ℕ) (hx : 1≤x) (hy : 4≤y) :
 vR2BoundsM115 (3*(x:ℝ)+y) (2*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℝ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_high_1_4M115 ((x-1:ℕ):ℝ) ((y-4:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_high_2_1M115 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vR2BoundsM115 (3*(x:ℝ)+y) (2*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_high_2_1M115 ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_high_3_0M115 (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 vR2BoundsM115 (3*(x:ℝ)+y) (2*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vR2chart_high_3_0M115 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vR2nat_highM115 (x y : ℕ) (hx : 1≤x) (hb : 7≤3*x+y) :
 vR2BoundsM115 (3*(x:ℝ)+y) (2*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have h : (1≤x ∧ 4≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact vR2nat_high_1_4M115 x y hx hy
 · exact vR2nat_high_2_1M115 x y hx hy
 · exact vR2nat_high_3_0M115 x y hx hy

theorem vR2boundsM115 (a b : ℕ) (ha : 1≤a) (hb : 7≤b) (hab : a<b) :
 vR2BoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases h0 : 3*a≤b
 · let x := a-1
   let y := b-3*a
   have ea : a=x+1 := by dsimp [x]; omega
   have eb : b=3*(x+1)+y := by dsimp [x,y]; omega
   have eq : 2*a-b=0 := by omega
   have et : min (b-a) (3*a-b)=0 := by omega
   have eu : 3*a-2*b=0 := by omega
   have h := vR2nat_lowM115 x y (by omega)
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
     have h := vR2nat_midlowM115 x y (by omega)
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
       have h := vR2nat_midhighM115 x y (by omega)
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
       have h := vR2nat_highM115 x y (by dsimp [x]; omega) (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
end
end MathGKM.Markov
