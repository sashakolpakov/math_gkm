import MarkovInteriorSourceFDDA
/-! Machine-authored 07f1d410. Exact low coefficients, not interpolation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
def firstCoeff007F1 (n c r : ℤ) : ℤ :=
 ((((((1*c)*c)*c)*n+(((3*c+(3*r+-6))*c)*c))*n+(((3*c+(6*r+-12))*c+((3*r+-12)*r+11))*c))*n+(((1*c+(3*r+-6))*c+((3*r+-12)*r+11))*c+(((1*r+-6)*r+11)*r+-6)))
def firstCoeff107F1 (n c r : ℤ) : ℤ :=
 ((((((9*c)*c)*c)*n+(((18*c+(27*r+-54))*c)*c))*n+(((9*c+(36*r+-51))*c+((27*r+-108)*r+87))*c))*n+(((9*r+3)*c+((18*r+-51)*r+-3))*c+(((9*r+-54)*r+87)*r+-18)))
def firstCoeff207F1 (n c r : ℤ) : ℤ :=
 ((((((39*c)*c)*c)*n+(((39*c+(117*r+-246))*c)*c))*n+(((-12*c+(78*r+3))*c+((117*r+-492)*r+393))*c))*n+(((-12*c+(-12*r+132))*c+((39*r+3)*r+-354))*c+(((39*r+-246)*r+393)*r+-18)))
def firstCoeff307F1 (n c r : ℤ) : ℤ :=
 ((((((111*c)*c)*c)*n+(((333*r+-774)*c)*c))*n+(((-108*c+684)*c+((333*r+-1548)*r+1365))*c))*n+(((-24*c+(-108*r+480))*c+(684*r+-2184))*c+(((111*r+-774)*r+1365)*r+-6)))
def firstCoeff407F1 (n c r : ℤ) : ℤ :=
 ((((((240*c)*c)*c)*n+(((-240*c+(720*r+-1920))*c)*c))*n+(((-252*c+(-480*r+3276))*c+((720*r+-3840)*r+3936))*c))*n+(((12*c+(-252*r+828))*c+((-240*r+3276)*r+-8760))*c+(((240*r+-1920)*r+3936)*r)))
def firstCoeff507F1 (n c r : ℤ) : ℤ :=
 ((((((432*c)*c)*c)*n+(((-864*c+(1296*r+-4032))*c)*c))*n+(((-252*c+(-1728*r+10140))*c+((1296*r+-8064)*r+9696))*c))*n+(((144*c+(-252*r+72))*c+((-864*r+10140)*r+-27576))*c+(((432*r+-4032)*r+9696)*r)))
theorem extract_monomial07F1 (a : ℤ) (l j : ℕ) :
 PowerSeries.coeff j (inverseSixFDDA*((C a*X^l:ℤ[X]):PowerSeries ℤ))=
 if l≤j then a*((j-l+5).choose 5 : ℤ) else 0 := by
 simp only [Polynomial.coe_mul,Polynomial.coe_C,Polynomial.coe_pow,Polynomial.coe_X]
 rw [show inverseSixFDDA*(PowerSeries.C a*PowerSeries.X^l)=
   PowerSeries.C a*(PowerSeries.X^l*inverseSixFDDA) by ring]
 rw [PowerSeries.coeff_C_mul,PowerSeries.coeff_X_pow_mul']
 split_ifs <;> simp [inverseSix_coeffFDDA]
theorem first_coeff_007F1 (n c r : ℕ) (hn : 0<n+2) :
 (thirdRunPolyADB2 n c r).coeff 0=firstCoeff007F1 n c r := by
 rw [extract_delayedFDDA _ _ _ (n+2) 0 (source_denominatorFDDA n c r) hn]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose]
 unfold firstCoeff007F1 lowNumerator0BDEE
 ring
theorem first_coeff_107F1 (n c r : ℕ) (hn : 1<n+2) :
 (thirdRunPolyADB2 n c r).coeff 1=firstCoeff107F1 n c r := by
 rw [extract_delayedFDDA _ _ _ (n+2) 1 (source_denominatorFDDA n c r) hn]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose]
 unfold firstCoeff107F1 lowNumerator0BDEE lowNumerator1BDEE
 ring
theorem first_coeff_207F1 (n c r : ℕ) (hn : 2<n+2) :
 (thirdRunPolyADB2 n c r).coeff 2=firstCoeff207F1 n c r := by
 rw [extract_delayedFDDA _ _ _ (n+2) 2 (source_denominatorFDDA n c r) hn]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose]
 unfold firstCoeff207F1 lowNumerator0BDEE lowNumerator1BDEE lowNumerator2BDEE
 ring
theorem first_coeff_307F1 (n c r : ℕ) (hn : 3<n+2) :
 (thirdRunPolyADB2 n c r).coeff 3=firstCoeff307F1 n c r := by
 rw [extract_delayedFDDA _ _ _ (n+2) 3 (source_denominatorFDDA n c r) hn]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose]
 unfold firstCoeff307F1 lowNumerator0BDEE lowNumerator1BDEE lowNumerator2BDEE lowNumerator3BDEE
 ring
theorem first_coeff_407F1 (n c r : ℕ) (hn : 4<n+2) :
 (thirdRunPolyADB2 n c r).coeff 4=firstCoeff407F1 n c r := by
 rw [extract_delayedFDDA _ _ _ (n+2) 4 (source_denominatorFDDA n c r) hn]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose]
 unfold firstCoeff407F1 lowNumerator0BDEE lowNumerator1BDEE lowNumerator2BDEE lowNumerator3BDEE lowNumerator4BDEE
 ring
theorem first_coeff_507F1 (n c r : ℕ) (hn : 5<n+2) :
 (thirdRunPolyADB2 n c r).coeff 5=firstCoeff507F1 n c r := by
 rw [extract_delayedFDDA _ _ _ (n+2) 5 (source_denominatorFDDA n c r) hn]
 simp only [lowNumeratorPolyFDDA,Polynomial.coe_add,mul_add,map_add,extract_monomial07F1]
 norm_num [Nat.choose]
 unfold firstCoeff507F1 lowNumerator0BDEE lowNumerator1BDEE lowNumerator2BDEE lowNumerator3BDEE lowNumerator4BDEE lowNumerator5BDEE
 ring
end
end MathGKM.Markov
