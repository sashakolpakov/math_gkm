import MarkovWeighted5611
/-! Machine-authored request 56112359. Exact weighting threshold at one
horizontal triple. This does not refute the source conjecture. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 10000
set_option maxHeartbeats 1000000

def weightGap561 (t : ℤ) :=
 -2*t^5+304*t^4+4036*t^3+16208*t^2+21726*t+11360

theorem weight_gap561 (t : ℤ) :
 coeff (weightedP561 [t,1,t,1,t]) 5 3^2-
 coeff (weightedP561 [t,1,t,1,t]) 4 3*
 coeff (weightedP561 [t,1,t,1,t]) 6 3=weightGap561 t := by
 obtain ⟨h0,h1,h2⟩ := weighted_triple561 t
 rw [h0,h1,h2,weightGap561]
 ring

theorem weight_gap_positive561 (t : ℤ) (h0 : 0≤t) (h1 : t≤164) :
 0<weightGap561 t := by
 have he : weightGap561 t=
   t^3*((164-t)*(2*t+24)+100)+16208*t^2+21726*t+11360 := by
   unfold weightGap561; ring
 rw [he]
 have hd : 0≤164-t := by omega
 positivity

theorem weight_gap_negative561 (n : ℕ) : weightGap561 (n+165)<0 := by
 have he : weightGap561 (n+165)=
   -2*(n:ℤ)^5-1346*(n:ℤ)^4-339824*(n:ℤ)^3-
   38170072*(n:ℤ)^2-1614571584*(n:ℤ)-696140800 := by
   unfold weightGap561; ring
 rw [he]
 have h1 : (0:ℤ)≤n := Int.natCast_nonneg n
 have h2 : (0:ℤ)≤(n:ℤ)^2 := pow_nonneg h1 _
 have h3 : (0:ℤ)≤(n:ℤ)^3 := pow_nonneg h1 _
 have h4 : (0:ℤ)≤(n:ℤ)^4 := pow_nonneg h1 _
 have h5 : (0:ℤ)≤(n:ℤ)^5 := pow_nonneg h1 _
 nlinarith

theorem weight_gap_iff561 (t : ℤ) (h0 : 0≤t) :
 0≤weightGap561 t ↔ t≤164 := by
 constructor
 · intro h
   by_contra hn
   have ht : 165≤t := by omega
   obtain ⟨n,hn⟩ := Int.eq_ofNat_of_zero_le (show 0≤t-165 by omega)
   have he : t=(n:ℤ)+165 := by omega
   have hb := weight_gap_negative561 n
   rw [← he] at hb
   omega
 · intro h
   exact le_of_lt (weight_gap_positive561 t h0 h)

theorem weighted_horizontal_iff561 (t : ℤ) (ht : 0≤t) :
 (coeff (weightedP561 [t,1,t,1,t]) 4 3*
   coeff (weightedP561 [t,1,t,1,t]) 6 3 ≤
   coeff (weightedP561 [t,1,t,1,t]) 5 3^2) ↔ t≤164 := by
 rw [← weight_gap_iff561 t ht,← weight_gap561]
 omega

theorem uniform_horizontal_strict561 (t : ℤ) (ht : 0≤t) :
 coeff (weightedP561 [t,t,t,t,t]) 4 3*
 coeff (weightedP561 [t,t,t,t,t]) 6 3 <
 coeff (weightedP561 [t,t,t,t,t]) 5 3^2 := by
 obtain ⟨h0,h1,h2⟩ := uniform_triple561 t
 rw [h0,h1,h2]
 have he : (60+120*t+72*t^2+12*t^3)^2-
     (5*t+8*t^2+3*t^3)*(400+450*t+144*t^2+10*t^3)=
     3600+12400*t+17590*t^2+13200*t^3+5512*t^4+1216*t^5+114*t^6 := by ring
 have hp : 0<(3600+12400*t+17590*t^2+13200*t^3+5512*t^4+1216*t^5+114*t^6) := by
   positivity
 linarith

theorem source_horizontal_strict561 :
 let p := (frame (List.replicate 5 true)).mid.p
 coeff p 4 3*coeff p 6 3 < coeff p 5 3^2 := by
 have h := uniform_horizontal_strict561 1 (by norm_num)
 simpa only [weighted_source561] using h

theorem source_polygon561 :
 let l := (frame (List.replicate 5 true)).mid
 InPolygon l.a l.b 4 3 ∧ InPolygon l.a l.b 5 3 ∧ InPolygon l.a l.b 6 3 := by
 norm_num [frame,initial,advance,InPolygon,List.replicate_succ]

/-- An unbounded family of nonnegative, palindromically weighted deformations.
The actual source weights are all one, so this is not a source refutation. -/
theorem nonnegative_weighted_failure561 (n : ℕ) :
 let ts : List ℤ := [n+165,1,n+165,1,n+165]
 ts.reverse=ts ∧ PolyNonneg16 (weightedP561 ts) ∧
 coeff (weightedP561 ts) 5 3^2 <
   coeff (weightedP561 ts) 4 3*coeff (weightedP561 ts) 6 3 := by
 dsimp
 refine ⟨by rfl,weighted_coeff_nonneg561 _ ?_,?_⟩
 · intro t ht
   simp only [List.mem_cons,List.mem_singleton] at ht
   rcases ht with rfl | rfl | rfl | rfl | rfl <;> omega
 · have h := weight_gap_negative561 n
   rw [← weight_gap561] at h
   omega

theorem actual_raw_triple561 :
 let p := (frame (List.replicate 5 true)).mid.p
 coeff p 4 3=16 ∧ coeff p 5 3=264 ∧ coeff p 6 3=1004 := by
 rw [← weighted_source561]
 have h := uniform_triple561 1
 norm_num at h
 exact h

#print axioms weighted_horizontal_iff561
#print axioms uniform_horizontal_strict561
#print axioms source_horizontal_strict561
#print axioms source_polygon561
#print axioms nonnegative_weighted_failure561
#print axioms actual_raw_triple561
end
end MathGKM.Markov
