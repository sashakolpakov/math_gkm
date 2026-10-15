"""Machine-authored 8ae35b59: source and root residual candidates, never root claims."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm');D=R/'research'
def save(m,s):
 p=D/(m+'.lean');assert not p.exists();p.write_text(s)
for name in ['LC','Source']:
 s=(D/f'MarkovMiddle{name}M5DC.lean').read_text().replace('M5DC','M8AE').replace('722898f8.','8ae35b59.')
 save(f'MarkovMiddle{name}M8AE',s)
save('MarkovFourthAllM8AE','''import MarkovMiddleSourceM8AE
import MarkovFourthCentralM253
/-! Machine-authored request 8ae35b59. Full fourth slice in the specified run range. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff
theorem run_fourth_allM8AE (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 apply (run_fourth_iff_centralM253 n rest hn hc).mpr
 intro i j _ _ _ hs hj hju
 exact source_fourth_middleM8AE n rest hc i j hj hju hs
end
end MathGKM.Markov
''')
s=(D/'MarkovResidualM253.lean').read_text()
s=s.replace('import MarkovOnsetAllM253','import MarkovFourthAllM8AE\nimport MarkovResidualM253')
s=s.replace('request 2532cf40','request 8ae35b59').replace('SolvedFourthRegionM253','SolvedFourthRegionM8AE').replace('InteriorCore63M253','InteriorCore63M8AE').replace('root_iff_coreM253','root_iff_coreM8AE')
s=s.replace('i+j+2=(frame path).mid.a+4 ∧\n  ((frame rest).mid.a=1 ∨ (2*n<j ∧ j≤2*n+5))','i+j+2=(frame path).mid.a+4')
s=s.replace('⟨n,rest,hpath,hn,hc,hdiag,hcase⟩','⟨n,rest,hpath,hn,hc,hdiag⟩')
start=s.index('     rcases hcase');finish=s.index('\n   · exact hd',start)
s=s[:start]+'     exact run_fourth_allM8AE n rest hn hc i j h0 h1 h2 hdiag'+s[finish:]
save('MarkovResidualM8AE',s)
print('Created scalar, source, full fourth-slice and exact residual candidates.')
