"""Machine-authored edge of the reversed tail, exact positive certificates."""
from pathlib import Path
from uniform_shape_8bbb import Q,var,subst,horner
import json
R=Path('/Users/sasha/math_gkm');d=json.loads((R/'evidence/markov-53d5229e/tail-probe.json').read_text());p=Q({tuple(k):v for k,v in d['tails']['low']})
t,u,v,w=map(var,range(4));s='import MarkovTailLC53D\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 4000000\nset_option maxRecDepth 16384\n'
for name,cc,rr in [('Large',2*u+v+4,u+2),('One',v+4,1)]:
 gap=subst(p,[0,cc,rr,1])**2-subst(p,[0,cc,rr,0])*subst(p,[0,cc,rr,2]);assert all(x>=0 for x in gap.values())
 ce=horner(cc,['t','u','v','unused']);re=horner(rr if isinstance(rr,Q) else Q({(0,0,0,0):rr}),['t','u','v','unused']);expr=horner(gap,['t','u','v','unused'])
 s+=f'''theorem tail_edge_{name}53D (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 tailLow53D {ce} {re} 0*tailLow53D {ce} {re} 2 ≤ (tailLow53D {ce} {re} 1)^2 := by
 have he : (tailLow53D {ce} {re} 1)^2-tailLow53D {ce} {re} 0*tailLow53D {ce} {re} 2={expr} := by unfold tailLow53D; ring
 have hp : 0 ≤ {expr} := by positivity
 omega
'''
s+='''theorem tail_low_lc_extended53D (c r k : ℤ) (hc : 4 ≤ c) (hr : 1 ≤ r)
 (hch : 2*r ≤ c) (hk : 1 ≤ k) :
 tailLow53D c r (k-1)*tailLow53D c r (k+1) ≤ (tailLow53D c r k)^2 := by
 by_cases h : k=1
 · subst k
   by_cases h1 : r=1
   · subst r
     have hh := tail_edge_One53D 0 (c-4) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
   · have hh := tail_edge_Large53D (r-2) (c-2*r) (by omega) (by omega)
     convert hh using 1 <;> congr 2 <;> ring
 · exact tail_low_lc53D c r k hc hr hch (by omega)
end
end MathGKM.Markov
'''
(R/'research/MarkovTailEdge53D.lean').write_text(s)
# Separate extension preserves already accepted narrower source theorems.
s=(R/'research/MarkovTailLC53D.lean').read_text();s=s[s.index('theorem third_tail_low_lc53D'):s.index('theorem third_tail_high_lc53D')]
s=s.replace('third_tail_low_lc53D','third_tail_low_extended53D').replace('tail_low_lc53D','tail_low_lc_extended53D').replace('(hn : j ≤ 3*n)', '(hn : j ≤ 3*n+1)')
s+='''theorem third_tail_lc53D (n c r j : ℕ) (hc : 4 ≤ c) (hr : 1 ≤ r)
 (hrc : r+1 ≤ c) (hj : 2*n+5 ≤ j) (hn : j ≤ 3*n+1) :
 (thirdRunPolyADB2 n c r).coeff j*(thirdRunPolyADB2 n c r).coeff (j+2) ≤
 ((thirdRunPolyADB2 n c r).coeff (j+1))^2 := by
 by_cases h : 2*r ≤ c
 · exact third_tail_low_extended53D n c r j hc hr h hj hn
 · exact third_tail_high_lc53D n c r j hc hrc (by omega) hj hn
'''
(R/'research/MarkovTailExtended53D.lean').write_text('import MarkovTailEdge53D\nnamespace MathGKM.Markov\nnoncomputable section\n'+s+'end\nend MathGKM.Markov\n')
print('Generated final interior-tail edge certificates.')
