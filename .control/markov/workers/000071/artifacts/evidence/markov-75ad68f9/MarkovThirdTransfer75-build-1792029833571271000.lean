import MarkovThirdLow75
import MarkovThirdMidLow75
import MarkovThirdMidHigh75
import MarkovThirdHigh75
import MarkovCyclicTrace487
/-! Machine-authored 75ad68f9. Exact all-cut trace bridge and a conditional
third-slice transfer. The candidate coefficient formula is NOT assumed as an axiom. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source_cut_trace75 (path : List Bool) (s : ℕ) :
 (tr16 (ambientWord5c U V (sourceWord28 path))).coeff (s+1)=
 cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) (s+1)+
 (1+X)*cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) s := by
 rw [source_ambient_trace487]
 have hc (k : ℕ) : (ambientScalar5c U V (central28 path)).coeff k =
     cutCoeffA27 (X : ℤ[X]) X 1 (central28 path++[true]) k := by
   simpa only [map_one,cutEval_scalarA27,U,V] using
     cutCoeff_polynomialA27 (X : ℤ[X]) X 1 (central28 path++[true]) k
 have he : (1+U*(1+V))*ambientScalar5c U V (central28 path)=
   ambientScalar5c U V (central28 path)+
   U*(C (1+X)*ambientScalar5c U V (central28 path)) := by simp [V]; ring
 rw [he,Polynomial.coeff_add]
 simp only [U,Polynomial.coeff_X_mul,Polynomial.coeff_C_mul]
 simpa only [U] using congrArg₂ (fun p q : ℤ[X] => p+(1+X)*q) (hc (s+1)) (hc s)

def ThirdChamber75 (c r q t u : ℤ) : Prop :=
 ∃ x y : ℤ, 0≤x ∧ 0≤y ∧
 ((c=3*(x+1)+y ∧ r=x+1 ∧ q=0 ∧ t=0 ∧ u=0) ∨
 (c=2*(x+1)+3*(y+1) ∧ r=(x+1)+(y+1) ∧ q=0 ∧ t=x+1 ∧ u=0) ∨
 (c=3*(x+1)+2*(y+1) ∧ r=2*(x+1)+(y+1) ∧ q=x+1 ∧ t=x+y+2 ∧ u=0) ∨
 (c=(x+1)+3*(y+1) ∧ r=(x+1)+2*(y+1) ∧ q=x+y+2 ∧ t=y+1 ∧ u=x+1))

theorem third_chamber_lc75 (c r q t u : ℤ) (h : ThirdChamber75 c r q t u) (j : ℕ) :
 thirdSeq75 c r q t u j*thirdSeq75 c r q t u (j+2)≤thirdSeq75 c r q t u (j+1)^2 := by
 obtain ⟨x,y,hx,hy,h⟩ := h
 rcases h with ⟨rfl,rfl,rfl,rfl,rfl⟩ | ⟨rfl,rfl,rfl,rfl,rfl⟩ |
   ⟨rfl,rfl,rfl,rfl,rfl⟩ | ⟨rfl,rfl,rfl,rfl,rfl⟩
 · exact third_low_lc75 x y hx hy j
 · exact third_midlow_lc75 x y hx hy j
 · exact third_midhigh_lc75 x y hx hy j
 · exact third_high_lc75 x y hx hy j

/-- Uniform factor six; all indices and zeros are retained. This is an unproved
source-identification proposition, not a theorem identifying source slices. -/
def ThirdFormula75 (path : List Bool) (c r q t u : ℤ) : Prop :=
 ∀ j : ℕ, 6*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 3).coeff j=
   thirdSeq75 c r q t u j

theorem source_third_of_formula75 (path : List Bool) (c r q t u : ℤ)
 (hf : ThirdFormula75 path c r q t u) (hc : ThirdChamber75 c r q t u)
 (i j : ℕ) (hs : i+j+2=(frame path).mid.a+3) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have h := third_chamber_lc75 c r q t u hc j
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [source_cut_coeffA27 path i (j+2) 3 (by omega),
   source_cut_coeffA27 path (i+2) j 3 (by omega),
   source_cut_coeffA27 path (i+1) (j+1) 3 (by omega)]
 nlinarith

#print axioms source_cut_trace75
#print axioms third_chamber_lc75
#print axioms source_third_of_formula75
end
end MathGKM.Markov
