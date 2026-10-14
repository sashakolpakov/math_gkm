import MarkovCutMasksFe01
/-! Machine-authored fe01d46b. A reduced, polygon-guarded palindrome
obstruction to an enlarged family. It is proved not to be a source word. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

def guardedBadWordFe01 : List Bool :=
 [true,false,true,true,true,true,true,true,true,false,true]
def guardedBadPolyFe01 : BiPoly :=
 (rawWord80 (false::(guardedBadWordFe01++[true]))).b

theorem raw_word_cut_coeffFe01 (w : List Bool) (i j s : ℕ)
 (hs : i+j=w.count true+1+s) :
 coeff (rawWord80 (false::(w++[true]))).b i j=
 (cutCoeffA27 (X:ℤ[X]) X 1 (w++[true]) s).coeff j := by
 rw [←horizontalShear_coeff5c,raw_word_ambient5c,hs]
 have he : coeff (U^(w.count true+1)*ambientScalar5c U V w)
     (w.count true+1+s) j=coeff (ambientScalar5c U V w) s j := by
   simp [coeff,U,Polynomial.coeff_X_pow_mul',Nat.add_sub_cancel_left]
 rw [he,ambient_cut_coeffA27]

theorem guardedBad_sliceFe01 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (guardedBadWordFe01++[true]) 1=
 12+29*y+28*y^2+20*y^3+16*y^4+12*y^5+8*y^6+4*y^7 := by
 simp only [guardedBadWordFe01,List.cons_append,List.nil_append,
   cutCoeffA27,cutChargeA27,cutFactorA27,Bool.false_eq_true,if_false,if_true]
 ring

theorem guardedBad_coeffFe01 :
 coeff guardedBadPolyFe01 9 2=28 ∧ coeff guardedBadPolyFe01 8 3=20 ∧
 coeff guardedBadPolyFe01 7 4=16 := by
 have h (i j : ℕ) (hs : i+j=11) :
     coeff guardedBadPolyFe01 i j=
       (12+29*(X:ℤ[X])+28*X^2+20*X^3+16*X^4+12*X^5+8*X^6+4*X^7).coeff j := by
   rw [guardedBadPolyFe01,raw_word_cut_coeffFe01 guardedBadWordFe01 i j 1
     (by simpa [guardedBadWordFe01] using hs),guardedBad_sliceFe01]
 rw [h 9 2 (by decide),h 8 3 (by decide),h 7 4 (by decide)]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
   Polynomial.coeff_X_pow,Polynomial.coeff_X]

theorem guarded_palindrome_failureFe01 :
 List.Palindrome guardedBadWordFe01 ∧ Nat.Coprime 10 13 ∧
 InPolygon 10 13 9 2 ∧ InPolygon 10 13 8 3 ∧ InPolygon 10 13 7 4 ∧
 coeff guardedBadPolyFe01 8 3^2<
   coeff guardedBadPolyFe01 9 2*coeff guardedBadPolyFe01 7 4 := by
 obtain ⟨h1,h2,h3⟩ := guardedBad_coeffFe01
 rw [h1,h2,h3]
 norm_num [InPolygon]
 decide

theorem guardedBad_not_sourceFe01 (path : List Bool) :
 central28 path≠guardedBadWordFe01 := by
 intro hw
 obtain ⟨ha,hb⟩ := source_word_counts28 path
 rw [sourceWord_central28,hw] at ha hb
 norm_num [guardedBadWordFe01] at ha hb
 have he := source_word_mechanical3eda path
 rw [sourceWord_central28,hw,←ha,←hb] at he
 have hn : false::(guardedBadWordFe01++[true])≠mechanicalWord3eda 10 13 := by decide
 exact hn he

#print axioms raw_word_cut_coeffFe01
#print axioms guarded_palindrome_failureFe01
#print axioms guardedBad_not_sourceFe01
end
end MathGKM.Markov
