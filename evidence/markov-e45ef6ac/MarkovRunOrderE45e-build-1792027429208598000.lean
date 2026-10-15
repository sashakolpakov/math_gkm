import MarkovCutPartitionA27
/-! Machine-authored e45ef6ac. Adjacent run lengths alone cannot replace the
source word in all three directions. The obstruction is explicitly NOT a source.
The actual source with the same coprime labels has a positive raw gap. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

def orderWordE45 : List Bool := [false,false,false,false,false,true,false,true]
def orderPathE45 : List Bool := [false,false,false,true]

theorem order_not_sourceE45 :
 ¬∃ path,central28 path++[true]=orderWordE45 := by
 rintro ⟨path,h⟩
 change central28 path++[true]=[false,false,false,false,false,true,false]++[true] at h
 have he := List.append_cancel_right h
 have hp := (central_palindrome28 path).reverse_eq
 rw [he] at hp
 simp at hp

theorem order_word_polysE45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 orderWordE45 4=70+250*y+337*y^2+210*y^3+59*y^4+6*y^5 ∧
 cutCoeffA27 y y 1 orderWordE45 5=56+275*y+548*y^2+562*y^3+308*y^4+83*y^5+8*y^6 ∧
 cutCoeffA27 y y 1 orderWordE45 6=28+180*y+492*y^2+740*y^3+660*y^4+348*y^5+100*y^6+12*y^7 := by
 simp only [orderWordE45,cutCoeffA27,cutChargeA27,cutFactorA27,
   if_true,if_false,Bool.false_eq_true]
 constructor
 · ring
 constructor <;> ring

theorem order_word_vertical_gapE45 :
 (cutCoeffA27 (X:ℤ[X]) X 1 orderWordE45 5).coeff 6^2-
 (cutCoeffA27 (X:ℤ[X]) X 1 orderWordE45 4).coeff 5*
 (cutCoeffA27 (X:ℤ[X]) X 1 orderWordE45 6).coeff 7 = -8 := by
 obtain ⟨h0,h1,h2⟩ := order_word_polysE45 (X:ℤ[X])
 rw [h0,h1,h2]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
   Polynomial.coeff_X,Polynomial.coeff_one]

theorem source29_wordE45 :
 central28 orderPathE45++[true]=[false,false,false,true,false,false,false,true] := by
 decide

theorem source29_polysE45 {R : Type*} [CommRing R] (y : R) :
 cutCoeffA27 y y 1 (central28 orderPathE45++[true]) 4=
   70+250*y+337*y^2+208*y^3+55*y^4+4*y^5 ∧
 cutCoeffA27 y y 1 (central28 orderPathE45++[true]) 5=
   56+275*y+548*y^2+562*y^3+308*y^4+83*y^5+8*y^6 ∧
 cutCoeffA27 y y 1 (central28 orderPathE45++[true]) 6=
   28+180*y+492*y^2+740*y^3+660*y^4+348*y^5+100*y^6+12*y^7 := by
 rw [source29_wordE45]
 simp only [cutCoeffA27,cutChargeA27,cutFactorA27,if_true,if_false,Bool.false_eq_true]
 constructor
 · ring
 constructor <;> ring

theorem source29_rawE45 :
 let m := (frame orderPathE45).mid
 m.a=2 ∧ m.b=9 ∧ Nat.Coprime m.a m.b ∧
 InPolygon m.a m.b 1 5 ∧ InPolygon m.a m.b 1 6 ∧ InPolygon m.a m.b 1 7 ∧
 coeff m.p 1 5=4 ∧ coeff m.p 1 6=8 ∧ coeff m.p 1 7=12 ∧
 coeff m.p 1 6^2-coeff m.p 1 5*coeff m.p 1 7=16 := by
 have ha : (frame orderPathE45).mid.a=2 := by rfl
 have hb : (frame orderPathE45).mid.b=9 := by rfl
 obtain ⟨h0,h1,h2⟩ := source29_polysE45 (X:ℤ[X])
 have c0 : coeff (frame orderPathE45).mid.p 1 5=4 := by
   rw [source_cut_coeffA27 orderPathE45 1 5 4 (by rw [ha]),h0]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_one]
 have c1 : coeff (frame orderPathE45).mid.p 1 6=8 := by
   rw [source_cut_coeffA27 orderPathE45 1 6 5 (by rw [ha]),h1]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_one]
 have c2 : coeff (frame orderPathE45).mid.p 1 7=12 := by
   rw [source_cut_coeffA27 orderPathE45 1 7 6 (by rw [ha]),h2]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_one]
 dsimp only
 norm_num [ha,hb,InPolygon,c0,c1,c2]

#print axioms order_not_sourceE45
#print axioms order_word_vertical_gapE45
#print axioms source29_rawE45
end
end MathGKM.Markov
