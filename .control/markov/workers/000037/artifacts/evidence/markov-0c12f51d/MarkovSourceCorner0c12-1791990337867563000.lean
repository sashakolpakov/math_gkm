import MarkovMidpoint0c12
/-! Machine-authored 0c12f51d. Actual raw source triples on row j=a+3
for every Pell source a/(a+1), a>=7. This is a proper subfamily and slice. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def cornerL0c12 (m : ℕ) : ℤ := (m+6).choose 2
def cornerM0c12 (m : ℕ) : ℤ := 5*((m+5).choose 3 : ℤ)+8*((m+6).choose 3 : ℤ)
def cornerR0c12 (m : ℕ) : ℤ :=
 21*((m+4).choose 4 : ℤ)+60*((m+5).choose 4 : ℤ)+45*((m+6).choose 4 : ℤ)

theorem source_corner_values0c12 (m : ℕ) :
 coeff (frame (List.replicate (m+6) true)).mid.p 0 (m+10)=cornerL0c12 m ∧
 coeff (frame (List.replicate (m+6) true)).mid.p 1 (m+10)=cornerM0c12 m ∧
 coeff (frame (List.replicate (m+6) true)).mid.p 2 (m+10)=cornerR0c12 m := by
 have h0 : 2*(m+6)+2-(0+(m+10))=m+4 := by omega
 have h1 : 2*(m+6)+2-(1+(m+10))=m+3 := by omega
 have h2 : 2*(m+6)+2-(2+(m+10))=m+2 := by omega
 have hc (t k : ℕ) (h : k ≤ t) : t.choose (t-k)=t.choose k := Nat.choose_symm h
 simp only [right_coeff_sum9a72,pellSum9a72,h0,h1,h2]
 norm_num [show m+6+1 ≤ 0+(m+10) by omega,
   show 0+(m+10) ≤ 2*(m+6)+2 by omega,
   show m+6+1 ≤ 1+(m+10) by omega,
   show 1+(m+10) ≤ 2*(m+6)+2 by omega,
   show m+6+1 ≤ 2+(m+10) by omega,
   show 2+(m+10) ≤ 2*(m+6)+2 by omega,
   Finset.sum_range_succ,cornerL0c12,cornerM0c12,cornerR0c12]

theorem source_corner_gap0c12 (m : ℕ) :
 72*((cornerM0c12 m : ℚ)^2-(cornerL0c12 m : ℚ)*cornerR0c12 m)=
 149*(m:ℚ)^6+4491*m^5+55919*m^4+367965*m^3+1349732*m^2+2618064*m+2099520 := by
 simp only [cornerL0c12,cornerM0c12,cornerR0c12]
 push_cast
 simp only [choose_two_rat26ca,choose_three_rat26ca,choose_four_rat0c12]
 push_cast
 ring

theorem source_corner_strict0c12 (m : ℕ) :
 coeff (frame (List.replicate (m+6) true)).mid.p 0 (m+10)*
 coeff (frame (List.replicate (m+6) true)).mid.p 2 (m+10) <
 coeff (frame (List.replicate (m+6) true)).mid.p 1 (m+10)^2 := by
 obtain ⟨h0,h1,h2⟩ := source_corner_values0c12 m
 rw [h0,h1,h2]
 have h := source_corner_gap0c12 m
 have hp : (0:ℚ)<149*(m:ℚ)^6+4491*m^5+55919*m^4+367965*m^3+
     1349732*m^2+2618064*m+2099520 := by positivity
 have ht : (cornerL0c12 m : ℚ)*cornerR0c12 m < (cornerM0c12 m : ℚ)^2 := by linarith
 exact_mod_cast ht

theorem source_corner_polygon0c12 (m : ℕ) (i : ℕ) (hi : i ≤ 2) :
 InPolygon (m+7) (m+8) i (m+10) := by
 constructor
 · nlinarith
 · omega

#print axioms source_corner_values0c12
#print axioms source_corner_strict0c12
#print axioms source_corner_polygon0c12
end
end MathGKM.Markov
