import MathGKM.Round64CoefficientA
import MathGKM.Markov

/- Machine-authored round64. Color-count projection is a ring homomorphism.
All identities below are unconditional equalities; no sign claim is used. -/
namespace MatchingProjectionR64
set_option maxSynthPendingDepth 5
open MatchingSeparatorR63
open scoped BigOperators
noncomputable section

abbrev Color := Polynomial (Polynomial ℤ)
abbrev Four := Polynomial (Polynomial Color)
def alpha : Color := Polynomial.X
def beta : Color := Polynomial.C Polynomial.X
def fu : Four := Polynomial.X
def fv : Four := Polynomial.C Polynomial.X
def pi (sigma : ℕ) : W →+* Color :=
  MvPolynomial.eval₂Hom (Int.castRingHom Color)
    (fun e => if (e+sigma)%2=0 then alpha else beta)
def project (sigma : ℕ) : WeightedUV →+* Four :=
  Polynomial.mapRingHom (Polynomial.mapRingHom (pi sigma))
def coloredEdge (sigma e : ℕ) : Four :=
  if (e+sigma)%2=0 then Polynomial.C (Polynomial.C alpha)*fu
  else Polynomial.C (Polynomial.C beta)*fv
def F (N sigma : ℕ) : Four :=
  FiniteMatchingR61.finiteSum (fu+fv) (coloredEdge sigma) N
def B (N sigma i j : ℕ) : Color := ((F N sigma).coeff i).coeff j
def defect (N sigma i j : ℕ) : Color :=
  B N sigma (i+1) j ^ 2 - B N sigma i j*B N sigma (i+2) j

theorem finiteSum_map {R S : Type*} [CommRing R] [CommRing S]
    (f : R →+* S) (t : R) (c : ℕ → R) (N : ℕ) :
    f (FiniteMatchingR61.finiteSum t c N) =
      FiniteMatchingR61.finiteSum (f t) (fun e => f (c e)) N := by
  classical
  simp [FiniteMatchingR61.finiteSum,map_sum,map_mul,map_pow,map_prod]

theorem projection_Z (N sigma : ℕ) : project sigma (Z N sigma)=F N sigma := by
  rw [Z,finiteSum_map]
  congr 1
  · simp [project,wu,wv,fu,fv]
  · funext e
    by_cases h : (e+sigma)%2=0
    · simp [project,edge,w,pi,coloredEdge,h,wu,wv,fu,fv]
    · simp [project,edge,w,pi,coloredEdge,h,wu,wv,fu,fv]

theorem coefficient_commutation (sigma : ℕ) (P : WeightedUV) (i j : ℕ) :
    ((project sigma P).coeff i).coeff j = pi sigma ((P.coeff i).coeff j) := by
  simp [project,Polynomial.coeff_map]

theorem projected_C (N sigma i j : ℕ) :
    B N sigma i j = pi sigma (C N sigma i j) := by
  rw [B,← projection_Z,coefficient_commutation,MatchingCoefficientR64.coefficient_identity]

def unit : Color →+* ℤ :=
  (Polynomial.evalRingHom (1 : ℤ)).comp
    (Polynomial.mapRingHom (Polynomial.evalRingHom (1 : ℤ)))
def specialize : Four →+* Polynomial (Polynomial ℤ) :=
  Polynomial.mapRingHom (Polynomial.mapRingHom unit)

theorem unit_alpha : unit alpha = 1 := by simp [unit,alpha]
theorem unit_beta : unit beta = 1 := by simp [unit,beta]

theorem unit_matching (N sigma : ℕ) :
    specialize (F N sigma) =
      FiniteMatchingR61.finiteSum (MathGKM.Markov.U+MathGKM.Markov.V)
        (fun e => if (e+sigma)%2=0 then MathGKM.Markov.U else MathGKM.Markov.V) N := by
  rw [F,finiteSum_map]
  congr 1
  · simp [specialize,fu,fv,MathGKM.Markov.U,MathGKM.Markov.V]
  · funext e
    by_cases h : (e+sigma)%2=0
    · simp [specialize,coloredEdge,h,unit_alpha,fu,fv,MathGKM.Markov.U]
    · simp [specialize,coloredEdge,h,unit_beta,fu,fv,MathGKM.Markov.V]

theorem unit_coefficient (P : Four) (i j : ℕ) :
    ((specialize P).coeff i).coeff j = unit ((P.coeff i).coeff j) := by
  simp [specialize,Polynomial.coeff_map]

/- Reversing the edge colors requires swapping u/v AND alpha/beta.
This exact homomorphism retains the two distinct fugacities. -/
def colorSwap : Color →+* Color := Polynomial.Bivariate.swap.toRingHom
def swapUV : Four →+* Four := Polynomial.Bivariate.swap.toRingHom
def swapAll : Four →+* Four :=
  swapUV.comp (Polynomial.mapRingHom (Polynomial.mapRingHom colorSwap))

attribute [local simp] Polynomial.Bivariate.swap_X Polynomial.Bivariate.swap_Y
  Polynomial.Bivariate.swap_C_C

theorem orientation_swap (N : ℕ) : swapAll (F N 0)=F N 1 := by
  rw [F,finiteSum_map]
  congr 1
  · simp [swapAll,swapUV,colorSwap,fu,fv,add_comm]
  · funext e
    have hp : e%2=0 ∨ e%2=1 := by omega
    rcases hp with h|h
    · have h1 : (e+1)%2=1 := by omega
      simp [swapAll,swapUV,colorSwap,coloredEdge,h,h1,alpha,beta,fu,fv]
    · have h1 : (e+1)%2=0 := by omega
      simp [swapAll,swapUV,colorSwap,coloredEdge,h,h1,alpha,beta,fu,fv]

end
end MatchingProjectionR64
