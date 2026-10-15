import MarkovWordRigidity28b1
import MarkovCutPartitionA27
/-! Machine-authored e45ef6ac. Even palindromicity and adjacent B-run lengths
do not suffice for vertical LC. Exact non-source witness, with source comparison. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 10000
def palindromeBadCoreE45 : List Bool :=
 [false,false,false,false,true,false,true,false,false,false,false]
def palindromeGoodPathE45 : List Bool := [false,false,false,true,true]
theorem badCore_palindromeE45 : List.Palindrome palindromeBadCoreE45 := by
 apply List.Palindrome.of_reverse_eq
 decide
theorem badCore_not_sourceE45 : ¬∃ path,central28 path=palindromeBadCoreE45 := by
 rintro ⟨path,h⟩
 have hw : sourceWord28 path=false::(palindromeBadCoreE45++[true]) := by
   rw [sourceWord_central28,h]
 obtain ⟨ha,hb⟩ := source_word_counts28 path
 have ha' : (frame path).mid.a=3 := by simpa [hw,palindromeBadCoreE45] using ha.symm
 have hb' : (frame path).mid.b=13 := by simpa [hw,palindromeBadCoreE45] using hb.symm
 have hf := source_prefix_floor28 path [false,false,false,false]
   [false,true,false,false,false,false] true (by simpa [palindromeBadCoreE45] using hw)
 norm_num [ha',hb'] at hf
theorem palindrome_source_wordE45 : central28 palindromeGoodPathE45++[true]=
 [false,false,false,true,false,false,false,true,false,false,false,true] := by decide

theorem bad_cut8_E45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (palindromeBadCoreE45++[true]) 8=495+4110*y+15134*y^2+32458*y^3+44744*y^4+41230*y^5+25550*y^6+10414*y^7+2633*y^8+364*y^9+20*y^10 := by
 simp only [palindromeBadCoreE45,List.cons_append,List.nil_append,cutCoeffA27,cutChargeA27,cutFactorA27,
   if_true,if_false,Bool.false_eq_true]
 ring

theorem bad_cut9_E45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (palindromeBadCoreE45++[true]) 9=220+2160*y+9568*y^2+25212*y^3+43848*y^4+52752*y^5+44688*y^6+26568*y^7+10812*y^8+2848*y^9+432*y^10+28*y^11 := by
 simp only [palindromeBadCoreE45,List.cons_append,List.nil_append,cutCoeffA27,cutChargeA27,cutFactorA27,
   if_true,if_false,Bool.false_eq_true]
 ring

theorem bad_cut10_E45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (palindromeBadCoreE45++[true]) 10=66+755*y+3950*y^2+12496*y^3+26620*y^4+40227*y^5+44220*y^6+35640*y^7+20922*y^8+8745*y^9+2486*y^10+440*y^11+40*y^12+1*y^13 := by
 simp only [palindromeBadCoreE45,List.cons_append,List.nil_append,cutCoeffA27,cutChargeA27,cutFactorA27,
   if_true,if_false,Bool.false_eq_true]
 ring

theorem good_cut8_E45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (central28 palindromeGoodPathE45++[true]) 8=495+4110*y+15134*y^2+32454*y^3+44716*y^4+41146*y^5+25410*y^6+10274*y^7+2549*y^8+336*y^9+16*y^10 := by
 rw [palindrome_source_wordE45]
 simp only [cutCoeffA27,cutChargeA27,cutFactorA27,
   if_true,if_false,Bool.false_eq_true]
 ring

theorem good_cut9_E45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (central28 palindromeGoodPathE45++[true]) 9=220+2160*y+9568*y^2+25212*y^3+43848*y^4+52752*y^5+44688*y^6+26568*y^7+10812*y^8+2848*y^9+432*y^10+28*y^11 := by
 rw [palindrome_source_wordE45]
 simp only [cutCoeffA27,cutChargeA27,cutFactorA27,
   if_true,if_false,Bool.false_eq_true]
 ring

theorem good_cut10_E45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (central28 palindromeGoodPathE45++[true]) 10=66+755*y+3950*y^2+12496*y^3+26620*y^4+40227*y^5+44220*y^6+35640*y^7+20922*y^8+8745*y^9+2486*y^10+440*y^11+40*y^12+1*y^13 := by
 rw [palindrome_source_wordE45]
 simp only [cutCoeffA27,cutChargeA27,cutFactorA27,
   if_true,if_false,Bool.false_eq_true]
 ring

theorem palindrome_bad_vertical_gapE45 :
 (cutCoeffA27 (X:ℤ[X]) X 1 (palindromeBadCoreE45++[true]) 9).coeff 11^2-
 (cutCoeffA27 (X:ℤ[X]) X 1 (palindromeBadCoreE45++[true]) 8).coeff 10*
 (cutCoeffA27 (X:ℤ[X]) X 1 (palindromeBadCoreE45++[true]) 10).coeff 12 = -16 := by
 rw [bad_cut8_E45,bad_cut9_E45,bad_cut10_E45]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_X,Polynomial.coeff_one]
theorem source313_rawE45 :
 let m := (frame palindromeGoodPathE45).mid
 m.a=3 ∧ m.b=13 ∧ Nat.Coprime m.a m.b ∧
 InPolygon m.a m.b 1 10 ∧ InPolygon m.a m.b 1 11 ∧ InPolygon m.a m.b 1 12 ∧
 coeff m.p 1 10=16 ∧ coeff m.p 1 11=28 ∧ coeff m.p 1 12=40 ∧
 coeff m.p 1 11^2-coeff m.p 1 10*coeff m.p 1 12=144 := by
 have ha : (frame palindromeGoodPathE45).mid.a=3 := by rfl
 have hb : (frame palindromeGoodPathE45).mid.b=13 := by rfl
 have c10 : coeff (frame palindromeGoodPathE45).mid.p 1 10=16 := by
   rw [source_cut_coeffA27 palindromeGoodPathE45 1 10 8 (by rw [ha]),good_cut8_E45]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_one]
 have c11 : coeff (frame palindromeGoodPathE45).mid.p 1 11=28 := by
   rw [source_cut_coeffA27 palindromeGoodPathE45 1 11 9 (by rw [ha]),good_cut9_E45]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_one]
 have c12 : coeff (frame palindromeGoodPathE45).mid.p 1 12=40 := by
   rw [source_cut_coeffA27 palindromeGoodPathE45 1 12 10 (by rw [ha]),good_cut10_E45]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_one]
 dsimp only
 norm_num [ha,hb,InPolygon,c10,c11,c12]
#print axioms badCore_not_sourceE45
#print axioms palindrome_bad_vertical_gapE45
#print axioms source313_rawE45
end
end MathGKM.Markov
