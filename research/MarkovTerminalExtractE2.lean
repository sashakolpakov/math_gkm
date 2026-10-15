import MarkovFourthPolyE2
/-! Machine-authored e2cd486c. Retains the delayed fourth band. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384

theorem extract_four_bandsE2 (n c r j : ℕ) (hc : c ≠ 2) (hj : 3*n+4 ≤ j) :
 (thirdRunPolyADB2 n c r).coeff j=
 PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(2*n+3)) (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))+
 PowerSeries.coeff (j-(3*n+4)) (inverseSixFDDA*(thirdR53D n c r:PowerSeries ℤ)) := by
 have hh := congrArg (fun p : ℤ[X] => (p:PowerSeries ℤ)) (third_denominator53D n c r hc)
 simp only [Polynomial.coe_mul,Polynomial.coe_pow,Polynomial.coe_sub,
   Polynomial.coe_one,Polynomial.coe_X,Polynomial.coe_add] at hh
 have he := congrArg (fun p : PowerSeries ℤ => inverseSixFDDA*p) hh
 rw [←mul_assoc,inverseSix_mulFDDA,one_mul] at he
 have hc' := congrArg (PowerSeries.coeff j) he
 rw [Polynomial.coeff_coe] at hc'
 simp only [mul_add,map_add] at hc'
 have hshift (N : ℕ) (R : PowerSeries ℤ) (hN : N ≤ j) :
   PowerSeries.coeff j (inverseSixFDDA*(PowerSeries.X^N*R))=
   PowerSeries.coeff (j-N) (inverseSixFDDA*R) := by
  rw [show inverseSixFDDA*(PowerSeries.X^N*R)=PowerSeries.X^N*(inverseSixFDDA*R) by ring,
    PowerSeries.coeff_X_pow_mul',if_pos hN]
 rw [hshift _ _ (by omega),hshift _ _ (by omega),hshift _ _ hj] at hc'
 exact hc'

theorem tail_low_seriesE2 (n c r j : ℕ) (hch : 2*r ≤ c) (hj : 2*n+5 ≤ j) :
 tailLow53D c r (3*(n:ℤ)+3-j)=15*(
 PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(2*n+3)) (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))) := by
 have hs := second_series53D n c r j (by omega)
 have hu := extract_third_tail53D (n:ℤ) c r (2*r-c:ℕ) (j-(2*n+3)) (by omega)
 have hg := tail_low_falling53D (n:ℤ) c r j
 have hk : ((j-(2*n+3):ℕ):ℤ)=(j:ℤ)-2*n-3 := by omega
 have hq : ((2*r-c:ℕ):ℤ)=0 := by omega
 rw [hk,hq] at hu
 rw [hq]
 have heq : (j:ℤ)-2*n-3+5=(j:ℤ)-2*n+2 := by ring
 rw [heq] at hu
 omega

theorem tail_high_seriesE2 (n c r j : ℕ) (hch : c ≤ 2*r) (hj : 2*n+5 ≤ j) :
 tailHigh53D c r (3*(n:ℤ)+3-j)=15*(
 PowerSeries.coeff j (inverseSixFDDA*(lowNumeratorPolyFDDA n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(n+2)) (inverseSixFDDA*(tailPoly07F1 n c r:PowerSeries ℤ))+
 PowerSeries.coeff (j-(2*n+3)) (inverseSixFDDA*(thirdTailPoly53D n c r (2*r-c:ℕ):PowerSeries ℤ))) := by
 have hs := second_series53D n c r j (by omega)
 have hu := extract_third_tail53D (n:ℤ) c r (2*r-c:ℕ) (j-(2*n+3)) (by omega)
 have hg := tail_high_falling53D (n:ℤ) c r j
 have hk : ((j-(2*n+3):ℕ):ℤ)=(j:ℤ)-2*n-3 := by omega
 have hq : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-c := by omega
 rw [hk,hq] at hu
 rw [hq]
 have heq : (j:ℤ)-2*n-3+5=(j:ℤ)-2*n+2 := by ring
 rw [heq] at hu
 omega
end
end MathGKM.Markov
