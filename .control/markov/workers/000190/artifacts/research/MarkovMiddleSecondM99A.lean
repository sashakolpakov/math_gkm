import MarkovTopSecondSourceM55C
/-! Machine-authored 99a0f3b8. Exact second-column certificate for all nonnegative n-2t. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
set_option maxRecDepth 30000
theorem middle_second_gapM99A (x y : ℚ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 topSecondQM55C x (y-x)*topFourthQM55C x (y-x)<topThirdQM55C x (y-x)^2 := by
 have he : 6300*(topThirdQM55C x (y-x)^2-topSecondQM55C x (y-x)*topFourthQM55C x (y-x))=3447460800
  +2727576600*y
  +905961700*y^2
  +161677950*y^3
  +16341325*y^4
  +886200*y^5
  +20125*y^6
  +6014127720*x
  +4591542520*x*y
  +1474180760*x*y^2
  +254839935*x*y^3
  +25007465*x*y^4
  +1319675*x*y^5
  +29225*x*y^6
  +4404144712*x^2
  +3188855800*x^2*y
  +971669000*x^2*y^2
  +159653655*x^2*y^3
  +14921130*x^2*y^4
  +751625*x^2*y^5
  +15925*x^2*y^6
  +1770362790*x^3
  +1183927255*x^3*y
  +332120425*x^3*y^2
  +50131690*x^3*y^3
  +4298350*x^3*y^4
  +198450*x^3*y^5
  +3850*x^3*y^6
  +433685910*x^4
  +257898305*x^4*y
  +63400435*x^4*y^2
  +8251250*x^4*y^3
  +598150*x^4*y^4
  +22750*x^4*y^5
  +350*x^4*y^6
  +68744550*x^5
  +34681535*x^5*y
  +6954465*x^5*y^2
  +695940*x^5*y^3
  +34860*x^5*y^4
  +700*x^5*y^5
  +7327306*x^6
  +2995825*x^6*y
  +454475*x^6*y^2
  +30520*x^6*y^3
  +770*x^6*y^4
  +523860*x^7
  +163270*x^7*y
  +16650*x^7*y^2
  +560*x^7*y^3
  +24015*x^8
  +5120*x^8*y
  +265*x^8*y^2
  +630*x^9
  +70*x^9*y
  +7*x^10 := by
   unfold topThirdQM55C topSecondQM55C topFourthQM55C weightedChooseQM55C
   norm_num [choose_poly_succM0D3,choose_poly_zeroM0D3]
   ring
 have hp : (0:ℚ)<3447460800
  +2727576600*y
  +905961700*y^2
  +161677950*y^3
  +16341325*y^4
  +886200*y^5
  +20125*y^6
  +6014127720*x
  +4591542520*x*y
  +1474180760*x*y^2
  +254839935*x*y^3
  +25007465*x*y^4
  +1319675*x*y^5
  +29225*x*y^6
  +4404144712*x^2
  +3188855800*x^2*y
  +971669000*x^2*y^2
  +159653655*x^2*y^3
  +14921130*x^2*y^4
  +751625*x^2*y^5
  +15925*x^2*y^6
  +1770362790*x^3
  +1183927255*x^3*y
  +332120425*x^3*y^2
  +50131690*x^3*y^3
  +4298350*x^3*y^4
  +198450*x^3*y^5
  +3850*x^3*y^6
  +433685910*x^4
  +257898305*x^4*y
  +63400435*x^4*y^2
  +8251250*x^4*y^3
  +598150*x^4*y^4
  +22750*x^4*y^5
  +350*x^4*y^6
  +68744550*x^5
  +34681535*x^5*y
  +6954465*x^5*y^2
  +695940*x^5*y^3
  +34860*x^5*y^4
  +700*x^5*y^5
  +7327306*x^6
  +2995825*x^6*y
  +454475*x^6*y^2
  +30520*x^6*y^3
  +770*x^6*y^4
  +523860*x^7
  +163270*x^7*y
  +16650*x^7*y^2
  +560*x^7*y^3
  +24015*x^8
  +5120*x^8*y
  +265*x^8*y^2
  +630*x^9
  +70*x^9*y
  +7*x^10 := by positivity
 linarith only [he,hp]

attribute [local irreducible] topTemplateMB3E
theorem middle_template_second_strictM99A (n t : ℕ) (hn : 2*t ≤ n)
 (ht : 5 ≤ t) :
 (topTemplateMB3E n t).coeff 2*(topTemplateMB3E n t).coeff 4 <
 (topTemplateMB3E n t).coeff 3^2 := by
 let s : ℚ := t-5
 let d : ℚ := n+5-3*t
 have hs : 0 ≤ s := by
   have h : (5:ℚ) ≤ t := by exact_mod_cast ht
   dsimp [s]; linarith
 have h2 := (top_edge_coeffsMB3E n t hn (by omega)).2.2
 have h3 := top_third_coeffMB3E n t hn (by omega)
 have h4 := top_fourth_coeffM55C n t hn (by omega)
 have h2Q : ((topTemplateMB3E n t).coeff 2:ℚ)=topSecondQM55C s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) h2
   push_cast at h
   rw [choose_poly_natM0D3] at h
   simp only [Nat.cast_add,Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topSecondQM55C
   have ha : s+d+6=(n:ℚ)-2*t+6 := by dsimp [s,d]; ring
   rw [ha]
   dsimp [s]
   linear_combination h
 have h3Q : ((topTemplateMB3E n t).coeff 3:ℚ)=topThirdQM55C s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) h3
   push_cast at h
   simp only [choose_poly_natM0D3,Nat.cast_add,
     Nat.cast_sub (show t ≤ n+5 by omega),Nat.cast_sub (show t ≤ n by omega),
     Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topThirdQM55C weightedChooseQM55C
   have h0 : 2*s+d+10=(n:ℚ)+5-t := by dsimp [s,d]; ring
   have h1 : s+d+8+(s+2)+1=(n:ℚ)-t+6 := by dsimp [s,d]; ring
   have h2 : s+d+8+1=(n:ℚ)-2*t+9 := by dsimp [s,d]; ring
   have h3 : s+d+8=(n:ℚ)-2*t+8 := by dsimp [s,d]; ring
   have hm : s+2=(t:ℚ)-3 := by dsimp [s]; ring
   rw [h0,h1,h2,h3,hm]
   exact h
 have h4Q : ((topTemplateMB3E n t).coeff 4:ℚ)=topFourthQM55C s d := by
   have h := congrArg (fun z : ℤ => (z:ℚ)) h4
   push_cast at h
   simp only [weighted_choose_castM55C,choose_poly_natM0D3,Nat.cast_add,
     Nat.cast_sub (show t ≤ n+6 by omega),Nat.cast_sub (show 3 ≤ t by omega),
     Nat.cast_sub hn,Nat.cast_mul,Nat.cast_ofNat] at h
   unfold topFourthQM55C
   have h0 : 2*s+d+11=(n:ℚ)+6-t := by dsimp [s,d]; ring
   have h1 : s+d+9=(n:ℚ)-2*t+9 := by dsimp [s,d]; ring
   have hm : s+2=(t:ℚ)-3 := by dsimp [s]; ring
   have hc : -s-d-5=4-((n:ℚ)-2*t+9) := by dsimp [s,d]; ring
   rw [h0,h1,hm,hc]
   exact h
 have hy : 0 ≤ d+s := by
   have h : (2:ℚ)*t ≤ n := by exact_mod_cast hn
   dsimp [s,d]; linarith
 have hg := middle_second_gapM99A s (d+s) hs hy
 rw [add_sub_cancel_right] at hg
 rw [←h2Q,←h3Q,←h4Q] at hg
 exact_mod_cast hg


end
end MathGKM.Markov
