"""Machine-authored exact inverse-six coefficient adapter."""
from generate_jets_1152282d import *
def main():
 s=(R/'research/MarkovVerticalInverseM758.lean').read_text().replace('import MarkovVerticalSparseM758','import MarkovThirdSparseM115').replace('7584c5d0','1152282d').replace('inverse-four','inverse-six').replace('M758','M115').replace('threeM115','fiveM115')
 s=s.replace('(j-k+3)*(j-k+2)*(j-k+1)','(j-k+5)*(j-k+4)*(j-k+3)*(j-k+2)*(j-k+1)').replace('k ≤ j+3','k ≤ j+5').replace('k=j+1 ∨ k=j+2 ∨ k=j+3','k=j+1 ∨ k=j+2 ∨ k=j+3 ∨ k=j+4 ∨ k=j+5').replace('rfl|rfl|rfl','rfl|rfl|rfl|rfl|rfl')
 s=s.replace('6*','120*').replace('(z+3).choose 3','(z+5).choose 5').replace('((z:ℤ)+3)*(z+2)*(z+1)','((z:ℤ)+5)*(z+4)*(z+3)*(z+2)*(z+1)').replace('(z+3) 3','(z+5) 5').replace('((3+(j-k)).choose 3','((5+(j-k)).choose 5').replace('3+(j-m)=j-m+3','5+(j-m)=j-m+5')
 (R/'research/MarkovThirdInverseM115.lean').write_text(s)
 table=json.loads((R/'evidence/markov-ead8a96f/third-sparse-candidate.json').read_text())['table']
 blocks={}
 for k,cs in table:
  p=sp.P({tuple(k[:5]+[j]):Fraction(v) for j,v in enumerate(cs) if Fraction(v)})
  blocks[k[5],k[6]]=blocks.get((k[5],k[6]),sp.poly(0))+p
 keys=sorted(blocks)
 names=['a','b','c','d','e','q']
 nm=lambda i,k:f'vJ{i}c{k}M115'
 defs=','.join(nm(i,k) for i,k in keys)
 s='import MarkovThirdInverseM115\n/-! Machine-authored 1152282d. Literal integer quintic sequence, zero extended. -/\nnamespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 15000000\nset_option maxRecDepth 32768\nset_option linter.unusedVariables false\nset_option linter.unusedSimpArgs false\n'
 for (i,k),p in sorted(blocks.items()):s+=f'\ndef {nm(i,k)} (a b c d e q : ℤ) : ℤ :=\n {lean(p,names)}\n'
 s+='\ndef vEM115 (a b c d e q j : ℤ) : ℤ :=\n '+'+\n '.join(f'{nm(i,k)} a b c d e q*vFallM115 (j-{i}*q) {k}' for i,k in keys)+'\n'
 s+='''
theorem vThird_coeff_scaledM115 (n : ℕ) (rest : List Bool) (j : ℕ) :
 120*(vThirdSeedMEA (X:ℤ[X]) n rest).coeff j=
 vEM115 (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) (n+1) j := by
 let a := (frame rest).mid.b
 let b := (frame rest).mid.a
 let c := 2*b-a
 let d := min (a-b) (3*b-a)
 let e := 3*b-2*a
 have hs := vThirdSeed_four_blocksM115 n rest
 change (1-X)^6*vThirdSeedMEA (X:ℤ[X]) n rest=vThirdNumeratorM115 n a b c d e at hs
 have he : vThirdNumeratorM115 n a b c d e=
 '''+'+\n '.join(f'C ({nm(i,k)} a b c d e (n+1))*X^({i}*(n+1)+{k})' for i,k in keys)+f''' := by
   simp only [vThirdNumeratorM115,vJ0M115,vJ1M115,vJ2M115,vJ3M115,{defs},
     map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_neg,map_one,map_zero,
     Nat.cast_add,Nat.cast_one,Nat.cast_ofNat,Int.cast_natCast,pow_add,pow_mul]
   ring
 rw [he] at hs
 have hc := coeff_of_one_sub_mul_rangeBC _ _ 5 j hs
 change (vThirdSeedMEA (X:ℤ[X]) n rest).coeff j=vInvM115 _ j at hc
 rw [hc]
 simp only [vInv_addM115,mul_add,vInv_monomialM115]
 have hshift (j q k : ℤ) : vFallM115 j (q+k)=vFallM115 (j-q) k := by
   unfold vFallM115
   split_ifs <;> first | omega | ring
 simp only [vEM115,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   zero_mul,zero_add,one_mul,hshift]
 rfl
end
end MathGKM.Markov
'''
 (R/'research/MarkovThirdValuesM115.lean').write_text(s)
 (O/'third-block-coefficients.json').write_text(json.dumps([[list(k),[[list(e),str(v)] for e,v in p.items()]] for k,p in sorted(blocks.items())])+'\n')
 print('Generated inverse-six and coefficient sequence',len(keys))
if __name__=='__main__':main()
