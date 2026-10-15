import MarkovTailLC53D
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
theorem tail_edge_Large53D (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 tailLow53D (2*u+(1*v+4)) (1*u+2) 0*tailLow53D (2*u+(1*v+4)) (1*u+2) 2 ≤ (tailLow53D (2*u+(1*v+4)) (1*u+2) 1)^2 := by
 have he : (tailLow53D (2*u+(1*v+4)) (1*u+2) 1)^2-tailLow53D (2*u+(1*v+4)) (1*u+2) 0*tailLow53D (2*u+(1*v+4)) (1*u+2) 2=((((((35942400*u+(27648000*v+370483200))*u+((5529600*v+269568000)*v+1555545600))*u+((51148800*v+1033344000)*v+3393100800))*u+((177984000*v+1935187200)*v+4038854400))*u+((275961600*v+1754438400)*v+2477952000))*u+((160833600*v+606528000)*v+611712000)) := by unfold tailLow53D; ring
 have hp : 0 ≤ ((((((35942400*u+(27648000*v+370483200))*u+((5529600*v+269568000)*v+1555545600))*u+((51148800*v+1033344000)*v+3393100800))*u+((177984000*v+1935187200)*v+4038854400))*u+((275961600*v+1754438400)*v+2477952000))*u+((160833600*v+606528000)*v+611712000)) := by positivity
 omega
theorem tail_edge_One53D (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 tailLow53D (1*v+4) 1 0*tailLow53D (1*v+4) 1 2 ≤ (tailLow53D (1*v+4) 1 1)^2 := by
 have he : (tailLow53D (1*v+4) 1 1)^2-tailLow53D (1*v+4) 1 0*tailLow53D (1*v+4) 1 2=((17236800*v+64800000)*v+61171200) := by unfold tailLow53D; ring
 have hp : 0 ≤ ((17236800*v+64800000)*v+61171200) := by positivity
 omega
theorem tail_low_lc_extended53D (c r k : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r)
 (hch : 2*r ≤ c) (hk : 1 ≤ k) :
 tailLow53D c r (k-1)*tailLow53D c r (k+1) ≤ (tailLow53D c r k)^2 := by
 by_cases h : k=1
 · subst k
   by_cases h1 : r=1
   · subst r
     have hh := tail_edge_One53D 0 (c-4) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := tail_edge_Large53D (r-2) (c-2*r) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
 · exact tail_low_lc53D c r k hc hr hch (by omega)
end
end MathGKM.Markov
