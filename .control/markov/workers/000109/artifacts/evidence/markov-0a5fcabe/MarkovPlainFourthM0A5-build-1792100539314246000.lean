import MarkovTwoCycleM0A5
/-! Machine-authored 0a5fcabe. Isolate the short-cycle source defects algebraically. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option synthInstance.maxHeartbeats 4000000
set_option maxRecDepth 32768
attribute [local irreducible] frame coeff firstRunPolyADB2 secondCompressed446
  fourthExplicitRunBE correctedThirdRun8BBB thirdRunPolyADB2 runLocalFourBE runLocalLADB2
  fourMomentBE boolMomentADB2

def plainSecondM0A5 (n c r : ℕ) : ℤ[X] :=
 secondCompressed446 n c r-if c=2 then 2*X^(2*n+3) else 0

def plainFourthM0A5 (n c r : ℕ) : ℤ[X] :=
 let F := firstRunPolyADB2 n c r
 fourMomentBE (runLocalFourBE n) c r+6*(1+X)^4+
 4*F*boolMomentADB2 (runLocalLADB2 n) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)-8*F*(1+X)^3+
 3*(plainSecondM0A5 n c r)^2-2*F^4

attribute [local irreducible] plainFourthM0A5 plainSecondM0A5

theorem explicit_plain_ge_fourM0A5 (n c r : ℕ) (hc : 4 ≤ c) :
 fourthExplicitRunBE n c r=plainFourthM0A5 n c r := by
 simp only [fourthExplicitRunBE,plainFourthM0A5,plainSecondM0A5,
   correctedThirdRun8BBB,thirdRunPolyADB2,
   if_neg (by omega : ¬c=2),if_neg (by omega : ¬c=3),sub_zero,add_zero]
 ring

theorem source_plain_fourM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=4) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 plainFourthM0A5 n 4 (frame rest).mid.a+
   24*X^(4*(n+1)+(frame rest).mid.a) := by
 rw [source_fourth_correction_fourM0A5 n rest hc,
   explicit_plain_ge_fourM0A5 n 4 _ (by decide),(source_run_indicesBF n rest).2,hc]

theorem source_plain_threeM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=3) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 plainFourthM0A5 n 3 (frame rest).mid.a-
   24*(firstRunPolyADB2 n 3 (frame rest).mid.a+2*(1+X))*
   X^(3*(n+1)+(frame rest).mid.a) := by
 rw [source_fourth_correction_threeM0A5 n rest hc,(source_run_indicesBF n rest).2,hc]
 simp only [fourthExplicitRunBE,plainFourthM0A5,plainSecondM0A5,
   correctedThirdRun8BBB,thirdRunPolyADB2,show ¬(3:ℕ)=2 by decide,
   if_false,if_true,sub_zero]
 ring

theorem source_plain_twoM0A5 (n : ℕ) (rest : List Bool)
 (hc : (frame rest).mid.b=2) :
 24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4=
 plainFourthM0A5 n 2 1+
   12*(2*(firstRunPolyADB2 n 2 1)^2+4*firstRunPolyADB2 n 2 1*(1+X)+
       6*(1+X)^2-plainSecondM0A5 n 2 1)*X^(2*n+3) := by
 rw [source_fourth_correction_twoM0A5 n rest hc]
 simp only [fourthExplicitRunBE,plainFourthM0A5,plainSecondM0A5,
   correctedThirdRun8BBB,thirdRunPolyADB2,if_true,
   show 2*(n+1)+1=2*n+3 by omega]
 ring
end
end MathGKM.Markov
