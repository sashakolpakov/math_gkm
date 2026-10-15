"""Machine-authored assembly of independently checked normalization components."""
from generate_jets_bc8d3b6f import *
def main():
 imports=['MarkovFirstNormBC','MarkovSecondNormBC','MarkovMomentScaleBC','MarkovBinomialExtractBC']
 imports += ['MarkovThirdNorm'+''.join(map(str,b))+'BC' for b in product(range(2),repeat=3)]
 imports += ['MarkovFourthNorm'+''.join(map(str,b))+'BC' for b in product(range(2),repeat=4)]
 text=header.replace('import MarkovFourthClosedN6604','\n'.join('import '+m for m in imports))
 for kind,ln,power,orig in [('Third',3,6,'closedLocalBDEE'),('Four',4,8,'closedLocalFourN6604')]:
  args='p q r' if ln==3 else 'p q r s'
  text+=f'\ndef local{kind}NumBC {{A : Type*}} [CommRing A] (N Z x : A) ({args} : Bool) : A :=\n match '+','.join(args.split())+' with\n'
  for bits in product(range(2),repeat=ln):
   key=''.join(map(str,bits));bs=','.join('true' if b else 'false' for b in bits)
   text+=f' | {bs} => local{kind}Num{key}BC N Z x\n'
  text+=f'''theorem local{kind}_normalizeBC (n : ℕ) ({args} : Bool) :
 (1-runXBDEE)^{power}*{orig} n {args}=
 local{kind}NumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE {args} := by
 {'; '.join('cases '+a for a in args.split())}
'''.replace('; ', ' <;> ')
  # Cases are discharged in lexicographic false/true order.
  for bits in product(range(2),repeat=ln):
   key=''.join(map(str,bits));text+=f' · exact local{kind}_normalize_{key}BC n\n'
  defs=','.join(f'local{kind}Num'+''.join(map(str,b))+'BC' for b in product(range(2),repeat=ln))
  text+=f'''theorem local{kind}Num_mapBC {{A B : Type*}} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) ({args} : Bool) :
 g (local{kind}NumBC N Z x {args})=
 local{kind}NumBC (g N) (g Z) (g x) {args} := by
 {' <;> '.join('cases '+a for a in args.split())} <;>
 simp only [local{kind}NumBC,{defs},map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]
'''
 text+='''
def fourthNumeratorBC {A : Type*} [CommRing A] (N Z x : A) (c r : ℕ) : A :=
 let F := firstNumBC N Z c r (2*r-c:ℕ) x
 let S := secondNumBC N Z c r (2*r-c:ℕ) x
 let T := boolMomentADB2 (localThirdNumBC N Z x) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 fourMomentBE (localFourNumBC N Z x) c r+6*(1+x)^4*(1-x)^8+
 4*F*T-8*F*(1+x)^3*(1-x)^6+3*S^2-2*F^4

theorem fourth_normalizeBC (n c r : ℕ) (hc : 5≤c) :
 (1-runXBDEE)^8*closedFourthN6604 n c r=
 fourthNumeratorBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE c r := by
 have hm4 := fourMoment_scaleBC (closedLocalFourN6604 n) ((1-runXBDEE)^8) c r
 have he4 : (fun a b d e => (1-runXBDEE)^8*closedLocalFourN6604 n a b d e)=
     localFourNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
   funext a b d e; exact localFour_normalizeBC n a b d e
 rw [he4] at hm4
 have hm3 := boolMoment_scaleBC (closedLocalBDEE n) ((1-runXBDEE)^6)
   (c:RunFieldBDEE) r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)
 have he3 : (fun a b d => (1-runXBDEE)^6*closedLocalBDEE n a b d)=
     localThirdNumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
   funext a b d; exact localThird_normalizeBC n a b d
 rw [he3] at hm3
 have hf := first_normalizeBC n c r hc
 have hs := second_normalizeBC n c r hc
 unfold closedFourthN6604 correctedClosedThirdBDEE closedThirdBDEE
 rw [if_neg (by omega : ¬c=2),if_neg (by omega : ¬c=3)]
 dsimp only
 calc
  _ = (1-runXBDEE)^8*fourMomentBE (closedLocalFourN6604 n) c r+
    6*(1+runXBDEE)^4*(1-runXBDEE)^8+
    4*((1-runXBDEE)^2*closedFirstBDEE n c r)*
      ((1-runXBDEE)^6*boolMomentADB2 (closedLocalBDEE n) c r (2*r-c:ℕ)
        (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ))-
    8*((1-runXBDEE)^2*closedFirstBDEE n c r)*(1+runXBDEE)^3*(1-runXBDEE)^6+
    3*((1-runXBDEE)^4*closedSecondBDEE n c r)^2-
    2*((1-runXBDEE)^2*closedFirstBDEE n c r)^4 := by ring
  _ = _ := by rw [hm4,hm3,hf,hs]; rfl

theorem fourthNumerator_mapBC {A B : Type*} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (c r : ℕ) :
 g (fourthNumeratorBC N Z x c r)=fourthNumeratorBC (g N) (g Z) (g x) c r := by
 have h4 : (fun a b d e => g (localFourNumBC N Z x a b d e))=
     localFourNumBC (g N) (g Z) (g x) := by
   funext a b d e; exact localFourNum_mapBC g N Z x a b d e
 unfold fourthNumeratorBC
 simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,
   fourMoment_mapBC,h4,boolMomentADB2,boolJetADB2,firstNumBC,secondNumBC]
 simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,map_neg,map_natCast,
   localThirdNum_mapBC]

theorem source_fourth_clearedBC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a := by
 apply run_embed_injectiveBDEE
 simp only [map_mul,map_pow,map_sub,map_one,fourthNumerator_mapBC,map_natCast]
 rw [source_fourth_closedN6604 n rest hc]
 exact fourth_normalizeBC n (frame rest).mid.b (frame rest).mid.a hc

theorem source_fourth_binomialBC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a).coeff k *
   ((7+(j-k)).choose 7 : ℤ) := by
 have h := coeff_of_one_sub_mul_rangeBC
   (24*cutCoeffA27 (X:ℤ[X]) X 1
     (central28 (List.replicate n true++false::rest)++[true]) 4)
   (fourthNumeratorBC (n:ℤ[X]) (X^n) X (frame rest).mid.b (frame rest).mid.a)
   7 j (source_fourth_clearedBC n rest hc)
 simpa only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] using h

end
end MathGKM.Markov
'''
 (R/'research/MarkovFourthBinomialBC.lean').write_text(text)
if __name__=='__main__':main()
