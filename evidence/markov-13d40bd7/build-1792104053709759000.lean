import MarkovHorizontalChartsM13D
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem h3nat_midlow_0_4M13D (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 H3BoundsM13D ((x:ℝ)+y) (3*(x:ℝ)+2*y) 0 y 0 := by
 have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℝ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midlow_0_4M13D ((x-0:ℕ):ℝ) ((y-4:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midlow_1_2M13D (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 H3BoundsM13D ((x:ℝ)+y) (3*(x:ℝ)+2*y) 0 y 0 := by
 have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midlow_1_2M13D ((x-1:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midlow_2_1M13D (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 H3BoundsM13D ((x:ℝ)+y) (3*(x:ℝ)+2*y) 0 y 0 := by
 have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midlow_2_1M13D ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midlow_3_0M13D (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 H3BoundsM13D ((x:ℝ)+y) (3*(x:ℝ)+2*y) 0 y 0 := by
 have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midlow_3_0M13D ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midlowM13D (x y : ℕ) (hb : 7≤3*x+2*y) :
 H3BoundsM13D ((x:ℝ)+y) (3*(x:ℝ)+2*y) 0 y 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact h3nat_midlow_0_4M13D x y hx hy
 · exact h3nat_midlow_1_2M13D x y hx hy
 · exact h3nat_midlow_2_1M13D x y hx hy
 · exact h3nat_midlow_3_0M13D x y hx hy

theorem h3nat_midhigh_0_4M13D (x y : ℕ) (hx : 0≤x) (hy : 4≤y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+2*y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℝ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midhigh_0_4M13D ((x-0:ℕ):ℝ) ((y-4:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midhigh_1_2M13D (x y : ℕ) (hx : 1≤x) (hy : 2≤y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+2*y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midhigh_1_2M13D ((x-1:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midhigh_2_1M13D (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+2*y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midhigh_2_1M13D ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midhigh_3_0M13D (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+2*y) x ((x:ℝ)+y) 0 := by
 have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_midhigh_3_0M13D ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_midhighM13D (x y : ℕ) (hb : 7≤3*x+2*y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+2*y) x ((x:ℝ)+y) 0 := by
 have h : (0≤x ∧ 4≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact h3nat_midhigh_0_4M13D x y hx hy
 · exact h3nat_midhigh_1_2M13D x y hx hy
 · exact h3nat_midhigh_2_1M13D x y hx hy
 · exact h3nat_midhigh_3_0M13D x y hx hy

theorem h3nat_high_1_4M13D (x y : ℕ) (hx : 1≤x) (hy : 4≤y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℝ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_high_1_4M13D ((x-1:ℕ):ℝ) ((y-4:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_high_2_1M13D (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_high_2_1M13D ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_high_3_0M13D (x y : ℕ) (hx : 3≤x) (hy : 0≤y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 simpa only [ex,ey] using h3chart_high_3_0M13D ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity)

theorem h3nat_highM13D (x y : ℕ) (hx : 1≤x) (hb : 7≤3*x+y) :
 H3BoundsM13D (2*(x:ℝ)+y) (3*(x:ℝ)+y) ((x:ℝ)+y) x y := by
 have h : (1≤x ∧ 4≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · exact h3nat_high_1_4M13D x y hx hy
 · exact h3nat_high_2_1M13D x y hx hy
 · exact h3nat_high_3_0M13D x y hx hy

theorem h3boundsM13D (a b : ℕ) (ha : 2≤a) (hb : 7≤b) (hab : a<b) :
 H3BoundsM13D a b (2*a-b:ℕ)
   (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases h0 : 3*a≤b
 · have hq : 2*a-b=0 := by omega
   have ht : min (b-a) (3*a-b)=0 := by omega
   have hu : 3*a-2*b=0 := by omega
   rw [hq,ht,hu]
   norm_num only [Nat.cast_zero]
   by_cases he : a=2
   · subst a
     have eb : 3*(2+((0:ℕ):ℝ)) + (((b-7:ℕ):ℝ)+1)=b := by
       have h : ((b-7:ℕ):ℝ)+7=b := by exact_mod_cast Nat.sub_add_cancel hb
       linarith
     simpa only [eb,Nat.cast_zero,zero_add,add_zero] using
       h3chart_low_0_1M13D 0 ((b-7:ℕ):ℝ) (by norm_num) (by positivity)
   · have ha3 : 3≤a := by omega
     have ea : 2+(((a-3:ℕ):ℝ)+1)=a := by
       have h : ((a-3:ℕ):ℝ)+3=a := by exact_mod_cast Nat.sub_add_cancel ha3
       linarith
     have eb : 3*(a:ℝ)+(((b-3*a:ℕ):ℝ)+0)=b := by
       have h : ((b-3*a:ℕ):ℝ)+3*a=b := by exact_mod_cast Nat.sub_add_cancel h0
       linarith
     simpa only [ea,eb] using
       h3chart_low_1_0M13D ((a-3:ℕ):ℝ) ((b-3*a:ℕ):ℝ) (by positivity) (by positivity)
 · by_cases h1 : 2*a≤b
   · let x := b-2*a
     let y := 3*a-b
     have ea : a=x+y := by dsimp [x,y]; omega
     have eb : b=3*x+2*y := by dsimp [x,y]; omega
     have eq : 2*a-b=0 := by omega
     have et : min (b-a) (3*a-b)=y := by dsimp [y]; omega
     have eu : 3*a-2*b=0 := by omega
     have h := h3nat_midlowM13D x y (by omega)
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
       have h := h3nat_midhighM13D x y (by omega)
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
       have h := h3nat_highM13D x y (by dsimp [x]; omega) (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
end
end MathGKM.Markov
