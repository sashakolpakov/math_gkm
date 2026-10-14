import MarkovSecondSourceBF
/-! Machine-authored bf38fa19. Scalar block recurrences and source index descent. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false

def runCOneBF : ℕ → ℤ[X]
 | 0 => X
 | n+1 => X*runCOneBF n+2*X*lowerH487 n+X-X^2+2*X^(n+2)
def runDTwoBF : ℕ → ℤ[X]
 | 0 => 0
 | n+1 => runDTwoBF n+(1+X)*(runCOneBF n+lowerH487 n-2*runSumA27 X n)

theorem lowerMatrix_scalar_jetsBF (n : ℕ) :
 (lowerMatrix487 n).c.coeff 1=runCOneBF n ∧
 (lowerMatrix487 n).d.coeff 2=runDTwoBF n := by
 induction n with
 | zero =>
   norm_num [runCOneBF,runDTwoBF,lowerMatrix487,lowerRun487,ambientWord5c,
     ambientT5c,mm16,U,V,Polynomial.coeff_one,Polynomial.coeff_X,
     Polynomial.coeff_C,Polynomial.coeff_add,Polynomial.coeff_C_mul]
 | succ n ih =>
   obtain ⟨ha,hb,hc,hd,hb1,ha1,hh⟩ := lowerMatrix_jets487 n
   rw [lowerMatrix_step487]
   simp only [mm16,ambientT5c,if_true,Polynomial.coeff_add,
     Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,U,V,
     Polynomial.coeff_X,Polynomial.coeff_C,Polynomial.coeff_one,
     Polynomial.coeff_mul_X,Polynomial.coeff_mul_C,Polynomial.coeff_C_mul,
     ha,hb,hc,hd,hb1,ha1,ih.1,ih.2]
   simp only [Polynomial.coeff_ofNat_zero,Polynomial.coeff_ofNat_succ,
     Polynomial.coeff_one,if_true,if_false,zero_ne_one,one_ne_zero,
     zero_mul,mul_zero,one_mul,mul_one,add_zero,zero_add]
   have hs := runSum_clear487 n
   constructor
   · rw [runCOneBF]
     have he : n+2=(n+1)+1 := by omega
     rw [he,pow_succ]
     linear_combination (2*X)*hh-(2*X)*hs
   · rw [runDTwoBF]
     linear_combination (1+X)*hh

theorem runK_scalarBF (n : ℕ) :
 runKBF (lowerMatrix487 n)=runDTwoBF n+runCOneBF n := by
 simp only [runKBF,(lowerMatrix_scalar_jetsBF n).1,(lowerMatrix_scalar_jetsBF n).2]

theorem source_run_indicesBF (n : ℕ) (rest : List Bool) :
 (frame (List.replicate n true++false::rest)).mid.a=
   (frame rest).mid.b*n+(frame rest).mid.a ∧
 (frame (List.replicate n true++false::rest)).mid.b=
   (frame rest).mid.b*(n+1)+(frame rest).mid.a := by
 obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n true++false::rest)
 rw [source_run_substitutionBF,(lower_counts487 n (sourceWord28 rest)).1] at ha
 rw [source_run_substitutionBF,(lower_counts487 n (sourceWord28 rest)).2] at hb
 obtain ⟨hca,hcb⟩ := source_word_counts28 rest
 rw [hca,hcb] at ha hb
 exact ⟨ha.symm,hb.symm⟩

theorem source_run_descentBF (n : ℕ) (rest : List Bool) :
 (frame rest).mid.b < (frame (List.replicate n true++false::rest)).mid.b := by
 have h := (source_run_indicesBF n rest).2
 obtain ⟨ha,hab,_⟩ := frame_reduced rest
 rw [h,Nat.mul_add,Nat.mul_one]
 omega

/-- Algebraic certificate for a proposed second-slice tail. The coefficient
identification and source statistic bounds are separate obligations. -/
theorem second_tail_boundBF (r c q : ℝ) (hr : 2≤r) (hc : 0≤c)
 (hcr : c≤2*r) (hq : 0≤q) (hqr : q≤r-1) :
 4*q*(16*r*(c+r)+4*c-24*r) ≤ (8*r^2)^2 := by
 have hr0 : 0≤r := by linarith
 have hu : 16*r*(c+r)+4*c-24*r ≤ 48*r^2-16*r := by
   have hh := mul_nonneg (show 0≤16*r+4 by linarith) (sub_nonneg.mpr hcr)
   nlinarith
 have hv : 0≤48*r^2-16*r := by
   have hh := mul_nonneg hr0 (show 0≤48*r-16 by linarith)
   nlinarith
 have h1 := mul_le_mul_of_nonneg_left hu (show 0≤4*q by positivity)
 have h2 := mul_le_mul_of_nonneg_right (show 4*q≤4*(r-1) by linarith) hv
 have cert : (8*r^2)^2-4*(r-1)*(48*r^2-16*r)=
   64*r*((r-2)^3+3*(r-2)^2+4*(r-2)+3) := by ring
 have ht : 0≤r-2 := by linarith
 have hp : 0≤64*r*((r-2)^3+3*(r-2)^2+4*(r-2)+3) := by positivity
 linarith

#print axioms lowerMatrix_scalar_jetsBF
#print axioms source_run_descentBF
#print axioms second_tail_boundBF
end
end MathGKM.Markov
