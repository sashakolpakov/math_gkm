"""Machine-authored 6604cff8. Preserve drafts; build coefficientwise replacement."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm'); D=R/'research'
pending=json.loads((R/'evidence/markov-062809ba/pending-modules.json').read_text())['pending']
pending.remove('MarkovFourthGauge3K062')
mapping={m:m.replace('K062','N6604') for m in pending}
for m in pending:
 for n in re.findall(r'^(?:theorem|def)\s+(\w+)',(D/f'{m}.lean').read_text(),re.M):
  mapping[n]=n.replace('K062','N6604')
for m in pending:
 s=(D/f'{m}.lean').read_text()
 for a,b in sorted(mapping.items(),key=lambda p:-len(p[0])):
  s=re.sub(r'\b'+a+r'\b',b,s)
 s=s.replace('Machine-authored 062809ba','Machine-authored 6604cff8, derived from preserved 062809ba draft')
 if m=='MarkovFourthThreeLocalK062':
  s=s.replace('import MarkovFourthGauge3K062','import MarkovGaugeCoeff6604')
  pat=r'(theorem jet3_\d\d_([abcd])\dN6604\s*:[\s\S]*? := by)\n[\s\S]*?(?=theorem |def threeLocal)'
  def repair(z):
   c=z.group(2)
   return z.group(1)+f'\n unfold runBooleanGaugeADB2\n rw [gauge_coeff_{c}6604]\n norm_num [lower3K062,lower4K062,U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow,runSumA27,Finset.sum_range_succ] <;> ring\n'
  s,n=re.subn(pat,repair,s)
  assert n==44,n
 (D/f'{mapping[m]}.lean').write_text(s)
(R/'evidence/markov-6604cff8/draft-derivation.json').write_text(json.dumps(mapping,indent=2)+'\n')
print('Generated',len(pending),'new modules')
