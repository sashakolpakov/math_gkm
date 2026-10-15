import MarkovSecondCoefficients07F1
import MarkovFirstCoefficients07F1
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option maxRecDepth 16384
def crossCoeff007F1 (n c r : ℤ) : ℤ :=
 thirdShapeBDEE n c r (n+0)
def crossCoeff107F1 (n c r : ℤ) : ℤ :=
 thirdShapeBDEE n c r (n+1)
def crossCoeff207F1 (n c r : ℤ) : ℤ :=
 thirdShapeBDEE n c r (n+2)+15*tailCoeff007F1 n c r
def crossCoeff307F1 (n c r : ℤ) : ℤ :=
 thirdShapeBDEE n c r (n+3)+90*tailCoeff007F1 n c r+15*tailCoeff107F1 n c r
def crossCoeff407F1 (n c r : ℤ) : ℤ :=
 thirdShapeBDEE n c r (n+4)+315*tailCoeff007F1 n c r+90*tailCoeff107F1 n c r+15*tailCoeff207F1 n c r
def crossCoeff507F1 (n c r : ℤ) : ℤ :=
 thirdShapeBDEE n c r (n+5)+840*tailCoeff007F1 n c r+315*tailCoeff107F1 n c r+90*tailCoeff207F1 n c r+15*tailCoeff307F1 n c r
theorem cross_coeff_007F1 (n c r : ℕ) (hn : 4 ≤ n) :
 crossCoeff007F1 n c r=15*(thirdRunPolyADB2 n c r).coeff (n+0) := by
 simpa [crossCoeff007F1] using third_run_interior_coeffFDDA n c r (n+0) (by omega) (by omega)
theorem cross_coeff_107F1 (n c r : ℕ) (hn : 4 ≤ n) :
 crossCoeff107F1 n c r=15*(thirdRunPolyADB2 n c r).coeff (n+1) := by
 simpa [crossCoeff107F1] using third_run_interior_coeffFDDA n c r (n+1) (by omega) (by omega)
theorem cross_coeff_207F1 (n c r : ℕ) (hn : 4 ≤ n) :
 crossCoeff207F1 n c r=15*(thirdRunPolyADB2 n c r).coeff (n+2) := by
 have he := extract_two_bands07F1 n c r (n+2) (by omega) (by omega)
 have hl := extract_lowFDDA (n:ℤ) c r (n+2) (by omega)
 have hk : n+2-(n+2)=0 := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff 0 (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))=
  1*tailCoeff007F1 n c r := by
  simp only [tailPoly07F1,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 unfold crossCoeff207F1
 push_cast at hl
 omega
theorem cross_coeff_307F1 (n c r : ℕ) (hn : 4 ≤ n) :
 crossCoeff307F1 n c r=15*(thirdRunPolyADB2 n c r).coeff (n+3) := by
 have he := extract_two_bands07F1 n c r (n+3) (by omega) (by omega)
 have hl := extract_lowFDDA (n:ℤ) c r (n+3) (by omega)
 have hk : n+3-(n+2)=1 := by omega
 rw [hk] at he
 have ht : PowerSeries.coeff 1 (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))=
  6*tailCoeff007F1 n c r+1*tailCoeff107F1 n c r := by
  simp only [tailPoly07F1,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
  norm_num [Nat.choose] <;> ring
 rw [ht] at he
 unfold crossCoeff307F1
 push_cast at hl
 omega
theorem cross_coeff_407F1 (n c r : ℕ) (hn : 4 ≤ n) :
 crossCoeff407F1 n c r=15*(thirdRunPolyADB2 n c r).coeff (n+4) := by
 have he : crossCoeff407F1 n c r=secondShape07F1 n c r (n+4) := by
  unfold crossCoeff407F1 secondShape07F1 thirdShapeBDEE tailCoeff007F1 tailCoeff107F1 tailCoeff207F1
  ring
 rw [he]
 exact second_run_coeff07F1 n c r (n+4) (by omega) (by omega)
theorem cross_coeff_507F1 (n c r : ℕ) (hn : 4 ≤ n) :
 crossCoeff507F1 n c r=15*(thirdRunPolyADB2 n c r).coeff (n+5) := by
 have he : crossCoeff507F1 n c r=secondShape07F1 n c r (n+5) := by
  unfold crossCoeff507F1 secondShape07F1 thirdShapeBDEE tailCoeff007F1 tailCoeff107F1 tailCoeff207F1 tailCoeff307F1
  ring
 rw [he]
 exact second_run_coeff07F1 n c r (n+5) (by omega) (by omega)
end
end MathGKM.Markov
