"""Machine-authored e45ef6ac; generates exact symbolic identities, not proofs by evaluation."""
from pathlib import Path
from run_order_e45e import transfer
bad=(0,0,0,0,1,0,1,0,0,0,0,1)
good=(0,0,0,1,0,0,0,1,0,0,0,1)
def poly(F,s):
 terms=[]
 for j in range(max(j for ss,j in F if ss==s)+1):
  c=F.get((s,j),0)
  if c:terms.append(str(c) if j==0 else f'{c}*y' if j==1 else f'{c}*y^{j}')
 return '+'.join(terms)
text='''import MarkovWordRigidity28b1
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
'''
for tag,w,expr in [('bad',bad,'palindromeBadCoreE45++[true]'),('good',good,'central28 palindromeGoodPathE45++[true]')]:
 F=transfer(w,len(w))
 for s in (8,9,10):
  text+=f'\ntheorem {tag}_cut{s}_E45 {{R : Type*}} [CommRing R] (y : R) :\n cutCoeffA27 y y 1 ({expr}) {s}={poly(F,s)} := by\n'
  if tag=='good':text+=' rw [palindrome_source_wordE45]\n'
  text+=' simp only ['+('palindromeBadCoreE45,List.cons_append,List.nil_append,' if tag=='bad' else '')+'cutCoeffA27,cutChargeA27,cutFactorA27,\n   if_true,if_false,Bool.false_eq_true]\n ring\n'
text+='''
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
'''
for s,j,c in [(8,10,16),(9,11,28),(10,12,40)]:
 text+=f''' have c{j} : coeff (frame palindromeGoodPathE45).mid.p 1 {j}={c} := by
   rw [source_cut_coeffA27 palindromeGoodPathE45 1 {j} {s} (by rw [ha]),good_cut{s}_E45]
   norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow,
     Polynomial.coeff_X,Polynomial.coeff_one]
'''
text+=''' dsimp only
 norm_num [ha,hb,InPolygon,c10,c11,c12]
#print axioms badCore_not_sourceE45
#print axioms palindrome_bad_vertical_gapE45
#print axioms source313_rawE45
end
end MathGKM.Markov
'''
Path('research/MarkovPalindromeOrderE45e.lean').write_text(text)
print('Wrote symbolic Lean identities for independent elaboration and replay.')
