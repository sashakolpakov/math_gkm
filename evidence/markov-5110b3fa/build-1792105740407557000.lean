import MarkovH4ChartLowM511
import MarkovH4ChartQuarterM511
import MarkovH4ChartThirdM511
import MarkovH4ChartHalfM511
import MarkovH4ChartTwothirdsM511
import MarkovH4ChartHighM511
/-! Machine-authored request 5110b3fa. Exhaustive natural parameter coverage. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

theorem h4nat_lowM511 (x y : ℕ) (ha : 3≤1*x+0*y)
 (hb : 9≤4*x+1*y) (hab : 1*x+0*y<4*x+1*y) :
 H4GoodM511 ((x:ℝ)) (4*(x:ℝ)+(y:ℝ)) (0) (0) (0) (0) (0) (0) := by
 have h : (3≤x ∧ 0≤y) := by omega
 obtain ⟨hx,hy⟩ := h
 have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
 convert h4chart_low_3_0M511 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith

theorem h4nat_quarterM511 (x y : ℕ) (ha : 3≤1*x+1*y)
 (hb : 9≤4*x+3*y) (hab : 1*x+1*y<4*x+3*y) :
 H4GoodM511 ((x:ℝ)+(y:ℝ)) (4*(x:ℝ)+3*(y:ℝ)) (0) (0) (0) ((y:ℝ)) (0) (0) := by
 have h : (0≤x ∧ 3≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-3:ℕ):ℝ)+3=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_quarter_0_3M511 ((x-0:ℕ):ℝ) ((y-3:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_quarter_1_2M511 ((x-1:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_quarter_2_1M511 ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_quarter_3_0M511 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith

theorem h4nat_thirdM511 (x y : ℕ) (ha : 3≤1*x+1*y)
 (hb : 9≤3*x+2*y) (hab : 1*x+1*y<3*x+2*y) :
 H4GoodM511 ((x:ℝ)+(y:ℝ)) (3*(x:ℝ)+2*(y:ℝ)) (0) ((y:ℝ)) (0) ((x:ℝ)) (0) (0) := by
 have h : (0≤x ∧ 5≤y) ∨ (1≤x ∧ 3≤y) ∨ (2≤x ∧ 2≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-5:ℕ):ℝ)+5=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_third_0_5M511 ((x-0:ℕ):ℝ) ((y-5:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-3:ℕ):ℝ)+3=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_third_1_3M511 ((x-1:ℕ):ℝ) ((y-3:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_third_2_2M511 ((x-2:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_third_3_0M511 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith

theorem h4nat_halfM511 (x y : ℕ) (ha : 3≤2*x+1*y)
 (hb : 9≤3*x+2*y) (hab : 2*x+1*y<3*x+2*y) :
 H4GoodM511 (2*(x:ℝ)+(y:ℝ)) (3*(x:ℝ)+2*(y:ℝ)) ((x:ℝ)) ((x:ℝ)+(y:ℝ)) (0) (0) ((x:ℝ)) (0) := by
 have h : (0≤x ∧ 5≤y) ∨ (1≤x ∧ 3≤y) ∨ (2≤x ∧ 2≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-5:ℕ):ℝ)+5=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_half_0_5M511 ((x-0:ℕ):ℝ) ((y-5:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-3:ℕ):ℝ)+3=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_half_1_3M511 ((x-1:ℕ):ℝ) ((y-3:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_half_2_2M511 ((x-2:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_half_3_0M511 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith

theorem h4nat_twothirdsM511 (x y : ℕ) (ha : 3≤2*x+3*y)
 (hb : 9≤3*x+4*y) (hab : 2*x+3*y<3*x+4*y) :
 H4GoodM511 (2*(x:ℝ)+3*(y:ℝ)) (3*(x:ℝ)+4*(y:ℝ)) ((x:ℝ)+2*(y:ℝ)) ((x:ℝ)+(y:ℝ)) ((y:ℝ)) (0) ((x:ℝ)+(y:ℝ)) (0) := by
 have h : (0≤x ∧ 3≤y) ∨ (1≤x ∧ 2≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · have ex : ((x-0:ℕ):ℝ)+0=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-3:ℕ):ℝ)+3=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_twothirds_0_3M511 ((x-0:ℕ):ℝ) ((y-3:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-2:ℕ):ℝ)+2=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_twothirds_1_2M511 ((x-1:ℕ):ℝ) ((y-2:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_twothirds_2_1M511 ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_twothirds_3_0M511 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith

theorem h4nat_highM511 (x y : ℕ) (ha : 3≤3*x+1*y)
 (hb : 9≤4*x+1*y) (hab : 3*x+1*y<4*x+1*y) :
 H4GoodM511 (3*(x:ℝ)+(y:ℝ)) (4*(x:ℝ)+(y:ℝ)) (2*(x:ℝ)+(y:ℝ)) ((x:ℝ)) ((x:ℝ)+(y:ℝ)) (0) ((x:ℝ)) ((y:ℝ)) := by
 have h : (1≤x ∧ 5≤y) ∨ (2≤x ∧ 1≤y) ∨ (3≤x ∧ 0≤y) := by omega
 rcases h with ⟨hx,hy⟩ | ⟨hx,hy⟩ | ⟨hx,hy⟩
 · have ex : ((x-1:ℕ):ℝ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-5:ℕ):ℝ)+5=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_high_1_5M511 ((x-1:ℕ):ℝ) ((y-5:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-2:ℕ):ℝ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-1:ℕ):ℝ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_high_2_1M511 ((x-2:ℕ):ℝ) ((y-1:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith
 · have ex : ((x-3:ℕ):ℝ)+3=x := by exact_mod_cast Nat.sub_add_cancel hx
   have ey : ((y-0:ℕ):ℝ)+0=y := by exact_mod_cast Nat.sub_add_cancel hy
   convert h4chart_high_3_0M511 ((x-3:ℕ):ℝ) ((y-0:ℕ):ℝ) (by positivity) (by positivity) using 1 <;> push_cast <;> linarith

theorem h4boundsM511 (a b : ℕ) (ha : 3≤a) (hb : 9≤b) (hab : a<b) :
 H4GoodM511 a b (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ)
   (h4vM511 a b) (h4wM511 a b) (h4zM511 a b) := by
 by_cases h0 : 4*a≤b
 · let x := a
   let y := b-4*a
   have ea : a=1*x+0*y := by dsimp [x,y]; omega
   have eb : b=4*x+1*y := by dsimp [x,y]; omega
   have e0 : 2*a-b=0 := by dsimp [x,y]; omega
   have e1 : min (b-a) (3*a-b)=0 := by dsimp [x,y]; omega
   have e2 : 3*a-2*b=0 := by dsimp [x,y]; omega
   have e3 : h4vM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
   have e4 : h4wM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
   have e5 : h4zM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
   have h := h4nat_lowM511 x y (by omega) (by omega) (by omega)
   rw [e0,e1,e2,e3,e4,e5,ea,eb]
   push_cast
   convert h using 1 <;> ring
 · by_cases h1 : 3*a≤b
   · let x := b-3*a
     let y := 4*a-b
     have ea : a=1*x+1*y := by dsimp [x,y]; omega
     have eb : b=4*x+3*y := by dsimp [x,y]; omega
     have e0 : 2*a-b=0 := by dsimp [x,y]; omega
     have e1 : min (b-a) (3*a-b)=0 := by dsimp [x,y]; omega
     have e2 : 3*a-2*b=0 := by dsimp [x,y]; omega
     have e3 : h4vM511 a b=y := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
     have e4 : h4wM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
     have e5 : h4zM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
     have h := h4nat_quarterM511 x y (by omega) (by omega) (by omega)
     rw [e0,e1,e2,e3,e4,e5,ea,eb]
     push_cast
     convert h using 1 <;> ring
   · by_cases h2 : 2*a≤b
     · let x := b-2*a
       let y := 3*a-b
       have ea : a=1*x+1*y := by dsimp [x,y]; omega
       have eb : b=3*x+2*y := by dsimp [x,y]; omega
       have e0 : 2*a-b=0 := by dsimp [x,y]; omega
       have e1 : min (b-a) (3*a-b)=y := by dsimp [x,y]; omega
       have e2 : 3*a-2*b=0 := by dsimp [x,y]; omega
       have e3 : h4vM511 a b=x := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
       have e4 : h4wM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
       have e5 : h4zM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
       have h := h4nat_thirdM511 x y (by omega) (by omega) (by omega)
       rw [e0,e1,e2,e3,e4,e5,ea,eb]
       push_cast
       convert h using 1 <;> ring
     · by_cases h3 : 3*a≤2*b
       · let x := 2*a-b
         let y := 2*b-3*a
         have ea : a=2*x+1*y := by dsimp [x,y]; omega
         have eb : b=3*x+2*y := by dsimp [x,y]; omega
         have e0 : 2*a-b=x := by dsimp [x,y]; omega
         have e1 : min (b-a) (3*a-b)=x+y := by dsimp [x,y]; omega
         have e2 : 3*a-2*b=0 := by dsimp [x,y]; omega
         have e3 : h4vM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
         have e4 : h4wM511 a b=x := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
         have e5 : h4zM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
         have h := h4nat_halfM511 x y (by omega) (by omega) (by omega)
         rw [e0,e1,e2,e3,e4,e5,ea,eb]
         push_cast
         convert h using 1 <;> ring
       · by_cases h4 : 4*a≤3*b
         · let x := 3*b-4*a
           let y := 3*a-2*b
           have ea : a=2*x+3*y := by dsimp [x,y]; omega
           have eb : b=3*x+4*y := by dsimp [x,y]; omega
           have e0 : 2*a-b=x+2*y := by dsimp [x,y]; omega
           have e1 : min (b-a) (3*a-b)=x+y := by dsimp [x,y]; omega
           have e2 : 3*a-2*b=y := by dsimp [x,y]; omega
           have e3 : h4vM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
           have e4 : h4wM511 a b=x+y := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
           have e5 : h4zM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
           have h := h4nat_twothirdsM511 x y (by omega) (by omega) (by omega)
           rw [e0,e1,e2,e3,e4,e5,ea,eb]
           push_cast
           convert h using 1 <;> ring
         · let x := b-a
           let y := 4*a-3*b
           have ea : a=3*x+1*y := by dsimp [x,y]; omega
           have eb : b=4*x+1*y := by dsimp [x,y]; omega
           have e0 : 2*a-b=2*x+y := by dsimp [x,y]; omega
           have e1 : min (b-a) (3*a-b)=x := by dsimp [x,y]; omega
           have e2 : 3*a-2*b=x+y := by dsimp [x,y]; omega
           have e3 : h4vM511 a b=0 := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
           have e4 : h4wM511 a b=x := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
           have e5 : h4zM511 a b=y := by simp only [h4vM511,h4wM511,h4zM511]; dsimp [x,y]; split_ifs <;> omega
           have h := h4nat_highM511 x y (by omega) (by omega) (by omega)
           rw [e0,e1,e2,e3,e4,e5,ea,eb]
           push_cast
           convert h using 1 <;> ring
end
end MathGKM.Markov
