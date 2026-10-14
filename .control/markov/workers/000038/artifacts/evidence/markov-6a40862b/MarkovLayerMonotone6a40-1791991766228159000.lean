import MarkovLayerIdentity6a40
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 0
theorem layer_cleared_monotone6 (a j s q r : ℝ)
 (hq : 0≤q) (hqr : q+2≤r) (hrj : r≤j) (hj : j≤2*s+q)
 (ha : s+r≤a) :
 layerN6 a j s (q+1) (r-1) * layerD6 a j s q r ≤
 layerN6 a j s q r * layerD6 a j s (q+1) (r-1) := by
 let x := q+(j-r)/2
 let d := r-q-2
 let e := 2*s-j+q
 let h := a-s-r
 have hx : 0≤x := by dsimp [x]; linarith
 have hd : 0≤d := by dsimp [d]; linarith
 have he : 0≤e := by dsimp [e]; linarith
 have hh : 0≤h := by dsimp [h]; linarith
 have hp := layerCert6_nonneg x d e h hx hd he hh
 have hi := layer_certificate_identity6 x d e h
 have ht : 0≤(d+1)*(e+2)*(d+e+3)*layerCert6 x d e h := by positivity
 rw [← hi] at ht
 have hn0 : layerN6 ((d+e+2)/2+(x+d+2)+h) (x+d+2) ((d+e+2)/2) x (x+d+2) = layerN6 a j s q r := by
   dsimp [x,d,e,h,layerN6,layerAN6,layerAD6,layerBN6,layerBD6]
   ring
 have hn1 : layerN6 ((d+e+2)/2+(x+d+2)+h) (x+d+2) ((d+e+2)/2) (x+1) (x+d+2-1) = layerN6 a j s (q+1) (r-1) := by
   dsimp [x,d,e,h,layerN6,layerAN6,layerAD6,layerBN6,layerBD6]
   ring
 have hd0 : layerD6 ((d+e+2)/2+(x+d+2)+h) (x+d+2) ((d+e+2)/2) x (x+d+2) = layerD6 a j s q r := by
   dsimp [x,d,e,h,layerD6,layerAD6,layerBD6]
   ring
 have hd1 : layerD6 ((d+e+2)/2+(x+d+2)+h) (x+d+2) ((d+e+2)/2) (x+1) (x+d+2-1) = layerD6 a j s (q+1) (r-1) := by
   dsimp [x,d,e,h,layerD6,layerAD6,layerBD6]
   ring
 dsimp only at ht
 rw [hn0,hn1,hd0,hd1] at ht
 linarith

#print axioms layer_cleared_monotone6

theorem layerD_positive6 (a j s q r : ℝ) (hs : 1<s)
 (hq : 0≤q) (hqr : q≤r) (hj : j≤2*s+q) (ha : s+r≤a) :
 0<layerD6 a j s q r := by
 unfold layerD6 layerAD6 layerBD6
 repeat' apply mul_pos
 all_goals linarith

/-- The rational endpoint-to-middle ratio decreases toward the center.
The identification with the binomial products is a separate bridge. -/
theorem layer_ratio_monotone6 (a j s q r : ℝ) (hs : 1<s)
 (hq : 0≤q) (hqr : q+2≤r) (hrj : r≤j) (hj : j≤2*s+q)
 (ha : s+r≤a) :
 layerN6 a j s (q+1) (r-1)/layerD6 a j s (q+1) (r-1) ≤
 layerN6 a j s q r/layerD6 a j s q r := by
 have h0 := layerD_positive6 a j s q r hs hq (by linarith) hj ha
 have h1 := layerD_positive6 a j s (q+1) (r-1) hs (by linarith)
   (by linarith) (by linarith) (by linarith)
 apply (div_le_div_iff₀ h1 h0).mpr
 exact layer_cleared_monotone6 a j s q r hq hqr hrj hj ha

#print axioms layer_ratio_monotone6
end
end MathGKM.Markov
