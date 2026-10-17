"""Machine-authored db238071. Generate separate certificate/evaluation layers."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-db238071'
groups=json.loads((R/'evidence/markov-c9f23b44/dense-generation.json').read_text())['groups']
head='/-! Machine-authored db238071. No numerical experiment is used as a proof. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxRecDepth 100000\nset_option maxHeartbeats 16000000\n'
end='end\nend MathGKM.Markov\n'
vs='(fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T)'
for a,k in enumerate([18,18,14,14]):
 s=f'import MarkovProduct{a}S21MDB2\nimport MarkovDenseTransportMDB2\n'+head
 s+='attribute [local irreducible] devalMC9F\n'
 for b in range(k+1,22):
  prev=f'dp{a}s{k}MC9F' if b==k+1 else f'prod{a}s{b-1}MDB2'
  fi=groups[a][b];name=f'prod{a}s{b}MDB2'
  s+=f'theorem prod{a}s{b}_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v {name} = devalMC9F 4 v {prev} * devalMC9F 4 v df{fi}MC9F :=\n dense_mul_transportMDB2 4 {prev} df{fi}MC9F {name} prod{a}s{b}_eqMDB2 v\n'
 s+=f'theorem product{a}_evalMDB2 (x g z T : ℚ) : devalMC9F 4 {vs} prod{a}s21MDB2 = '+ '*'.join(f'pf{i}MAD5 T x g z' for i in groups[a])+' := by\n'
 s+=' simp only ['+','.join([f'prod{a}s{b}_evalMDB2' for b in range(21,k,-1)]+[f'dp{a}s{b}MC9F_evalMC9F' for b in range(k,0,-1)]+[f'df{i}_evalMC9F' for i in range(38)])+']\n'
 (R/'research'/f'MarkovProductEval{a}MDB2.lean').write_text(s+end)
gap=(O/'proposed-gap.json').read_text()
s='import MarkovDenseDataMC9F\n'+head
s+='noncomputable def gapMDB2 : DenseMC9F 4 := dense_data% 4 '+json.dumps(gap)+'\n'
s+='theorem gap_positiveMDB2 : dpositiveMC9F 4 gapMDB2 = true := by decide +kernel\n'
(R/'research/MarkovGapDataMDB2.lean').write_text(s+end)
s='\n'.join(f'import MarkovProductEval{a}MDB2' for a in range(4))+'\nimport MarkovGapDataMDB2\n'+head
s+='theorem gap_identityMDB2 : daddMC9F 4 (daddMC9F 4 prod0s21MDB2 prod1s21MDB2) (dnegMC9F 4 (daddMC9F 4 prod2s21MDB2 prod3s21MDB2)) = gapMDB2 := dbeq_soundMC9F 4 _ _ (by decide +kernel)\n'
s+='attribute [local irreducible] devalMC9F\n'
s+=f'theorem gap_evalMDB2 (x g z T : ℚ) : devalMC9F 4 {vs} gapMDB2 = pairReducedMAD5 T x g z := by\n have h := dense_gap_transportMDB2 4 prod0s21MDB2 prod1s21MDB2 prod2s21MDB2 prod3s21MDB2 gapMDB2 gap_identityMDB2 {vs}\n simpa only [product0_evalMDB2,product1_evalMDB2,product2_evalMDB2,product3_evalMDB2,pairReducedMAD5] using h\n'
s+=f'theorem pair_reduced_nonnegMDB2 (T x g z : ℚ) (hT : 0 ≤ T) (hx : 0 ≤ x) (hg : 0 ≤ g) (hz : 0 ≤ z) : 0 ≤ pairReducedMAD5 T x g z := by\n rw [← gap_evalMDB2]\n apply deval_nonnegMC9F 4 {vs} _ gapMDB2 gap_positiveMDB2\n intro k\n rcases k with _|k\n · exact hx\n rcases k with _|k\n · exact hg\n rcases k with _|k <;> assumption\n'
s+='theorem reduced_pair_positiveMDB2 : ReducedPairPositiveMAD5 := by\n intro T x g z\n exact pair_reduced_nonnegMDB2 T x g z (by positivity) (by positivity) (by positivity) (by positivity)\n'
(R/'research/MarkovGapClosedMDB2.lean').write_text(s+end)
s=(R/'research/MarkovLowerClosedMC9F.lean').read_text().replace('MarkovDenseGapMC9F','MarkovGapClosedMDB2').replace('MC9F','MDB2').replace('c9f23b44','db238071')
(R/'research/MarkovLowerClosedMDB2.lean').write_text(s)
print('Generated four evaluation layers, gap data/certificate and source consequences; these are candidates until validated.')
