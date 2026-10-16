"""Machine-authored high-cone algebra certificates, to be checked in Lean."""
from pathlib import Path
for cone in ['Half','High']:
 s='import MarkovStripGeneralGapMCE8\n/-! Machine-authored ce882be3. High-cone polynomial certificates. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 20000000\nset_option maxRecDepth 25000\n'
 for name,k,l in [('large','k','(l+5)'),('two','(k+3)','2'),('three','(k+2)','3'),('four','(k+1)','4')]:
  b=f'({k}+{l}+2)'
  if cone=='Half':a=f'(({b}+q)/2)';q='q';t=f'(({b}-q)/2)';u='0';var='q'
  else:a=f'((2*{b}+u)/3)';q=f'(({b}+2*u)/3)';t=f'(({b}-u)/3)';u='u';var='u'
  s+=f'\ntheorem strip{cone}_{name}MCE8 (k l {var} : ℝ) (hk : 0 ≤ k) (hl : 0 ≤ l) (hv : 0 ≤ {var}) :\n 0 ≤ stripGeneralGapMCE8 {a} {k} {l} {q} {t} {u} := by\n unfold stripGeneralGapMCE8 stripGeneralJMCE8 stripGeneralHMCE8 stripTMB9D stripJMB9D stripHMB9D\n ring_nf\n positivity\n'
 s+='end\nend MathGKM.Markov\n'
 Path(f'research/MarkovStrip{cone}GapMCE8.lean').write_text(s)
