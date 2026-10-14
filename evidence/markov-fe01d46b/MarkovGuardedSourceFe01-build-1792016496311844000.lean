import MarkovGuardedPalindromeFe01
/-! Machine-authored fe01d46b. The actual 10/13 source differs from the
auxiliary reduced palindrome polynomial, not merely from its word. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def sourcePath1013Fe01 : List Bool := [true,true,true,false,false]

theorem actual_slice1013Fe01 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (central28 sourcePath1013Fe01++[true]) 1=
 12+29*y+28*y^2+16*y^3+4*y^4 := by
 simp [sourcePath1013Fe01,central28,subst28,cutCoeffA27,cutChargeA27,cutFactorA27]
 ring

theorem actual_source1013Fe01 :
 (frame sourcePath1013Fe01).mid.a=10 ∧ (frame sourcePath1013Fe01).mid.b=13 ∧
 coeff (frame sourcePath1013Fe01).mid.p 8 3=16 ∧
 (frame sourcePath1013Fe01).mid.p≠guardedBadPolyFe01 := by
 have ha : (frame sourcePath1013Fe01).mid.a=10 := by rfl
 have hb : (frame sourcePath1013Fe01).mid.b=13 := by rfl
 have hc : coeff (frame sourcePath1013Fe01).mid.p 8 3=16 := by
   rw [source_cut_coeffA27 sourcePath1013Fe01 8 3 1 (by rw [ha]),actual_slice1013Fe01]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,
     Polynomial.coeff_X_pow,Polynomial.coeff_X]
 refine ⟨ha,hb,hc,?_⟩
 intro he
 rw [he,guardedBad_coeffFe01.2.1] at hc
 norm_num at hc

theorem guardedBad_not_source_polyFe01 (path : List Bool)
 (ha : (frame path).mid.a=10) (hb : (frame path).mid.b=13) :
 (frame path).mid.p≠guardedBadPolyFe01 := by
 have he : (frame path).mid.p=(frame sourcePath1013Fe01).mid.p := by
   rw [source_word_exact3eda,source_word_exact3eda,source_word_mechanical3eda,
     source_word_mechanical3eda,ha,hb,actual_source1013Fe01.1,actual_source1013Fe01.2.1]
 rw [he]
 exact actual_source1013Fe01.2.2.2

#print axioms actual_source1013Fe01
#print axioms guardedBad_not_source_polyFe01
end
end MathGKM.Markov
