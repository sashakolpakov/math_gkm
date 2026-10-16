import MarkovThirdAllhigh_1_4M762
import MarkovThirdAllhigh_2_1M762
import MarkovThirdHighCoverM9FC
import MarkovThirdThirdBoundsM9FC
/-! Machine-authored 762ebbae. All third-column count cones for reduced labels. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000

theorem vThirdNat_high_1_4M762 (x y : ℕ) (hx : 1≤x) (hy : 4≤y) :
 vAllBoundsM115 (3*(x:ℤ)+y) (2*(x:ℤ)+y) ((x:ℤ)+y) x y := by
 have ex : ((x-1:ℕ):ℤ)+1=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-4:ℕ):ℤ)+4=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_high_1_4M762 ((x-1:ℕ):ℤ) ((y-4:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vThirdNat_high_2_1M762 (x y : ℕ) (hx : 2≤x) (hy : 1≤y) :
 vAllBoundsM115 (3*(x:ℤ)+y) (2*(x:ℤ)+y) ((x:ℤ)+y) x y := by
 have ex : ((x-2:ℕ):ℤ)+2=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-1:ℕ):ℤ)+1=y := by exact_mod_cast Nat.sub_add_cancel hy
 have h := vAllchart_high_2_1M762 ((x-2:ℕ):ℤ) ((y-1:ℕ):ℤ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]

theorem vAllbounds_reducedM762 (a b : ℕ) (ha : 1≤a) (hb : 7≤b)
 (hab : a<b) (hc : Nat.Coprime a b) :
 vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases hh : 3*a<2*b
 · exact vAllbounds_thirdM9FC a b ha hb hh
 · obtain ⟨eb,ea,hxy⟩ := third_high_chart_coverM9FC a b hb hab hc (by omega)
   let x := b-a
   let y := 3*a-2*b
   change b=3*x+y at eb
   change a=2*x+y at ea
   have eq : 2*a-b=x+y := by dsimp [x,y]; omega
   have et : min (b-a) (3*a-b)=x := by dsimp [x]; omega
   have h : vAllBoundsM115 (3*(x:ℤ)+y) (2*(x:ℤ)+y) ((x:ℤ)+y) x y := by
     rcases hxy with ⟨hx,hy⟩|⟨hx,hy⟩
     · exact vThirdNat_high_1_4M762 x y hx hy
     · exact vThirdNat_high_2_1M762 x y hx hy
   change vAllBoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) y
   rw [eq,et,eb,ea]
   push_cast
   exact h
end
end MathGKM.Markov
