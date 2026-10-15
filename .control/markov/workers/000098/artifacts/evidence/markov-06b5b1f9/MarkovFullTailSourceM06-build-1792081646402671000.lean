import MarkovFullSourceFA
import MarkovFullDegree0M06
import MarkovFullDegree1M06
import MarkovFullDegree2M06
import MarkovFullDegree3M06
import MarkovTailExtractM06
/-! Machine-authored 06b5b1f9. Source transport from a top-shift decomposition. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
attribute [local irreducible] fullH0FA fullH1FA fullH2FA fullH3FA fullH4FA
  fullNumeratorFA coeff frame
theorem source_fourth_tail_of_splitM06 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (R L : ℤ[X])
 (h4 : fullH4FA (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) X+
   96*(1-X)^8*fourthCountCorrectionFA X (frame rest).mid.b (frame rest).mid.a=
   (1-X)^8*R+L)
 (hld : L.natDegree≤7) (i k : ℕ)
 (hs : i+(4*n+k)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k)=R.coeff k := by
 have hh := source_fourth_full_clearedFA n rest hc
 unfold fullNumeratorFA at hh
 dsimp only at hh
 have hh' : (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
   fullH0FA (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a
    (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
    (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
    (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) X+
   X^n*fullH1FA (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a
    (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
    (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
    (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) X+
   X^(2*n)*fullH2FA (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a
    (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
    (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
    (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) X+
   X^(3*n)*fullH3FA (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a
    (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
    (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
    (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) X+
   X^(4*n)*(fullH4FA (n:ℤ[X]) (frame rest).mid.b (frame rest).mid.a
    (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
    (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
    (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) X+
    96*(1-X)^8*fourthCountCorrectionFA X (frame rest).mid.b (frame rest).mid.a) := by
   simpa only [←pow_mul, Nat.mul_comm n] using hh
 have ht := tail_coeff_four_blocksM06 _ _ _ _ _ _ R L n k hn hh' h4
   (fullH0_degreeM06 _ _ _ _ _ _) (fullH1_degreeM06 _ _ _ _ _ _)
   (fullH2_degreeM06 _ _ _ _ _ _) (fullH3_degreeM06 _ _ _ _ _ _) hld
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i (4*n+k) 4 hs] using ht
end
end MathGKM.Markov
