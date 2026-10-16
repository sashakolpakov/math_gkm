"""Machine-authored conditional transport, retaining the exact unproved premise."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
s=(R/'research/MarkovThirdAllLCM03.lean').read_text()
s=s.replace('import MarkovThirdAllSourceBoundsM03','import MarkovThirdAllBoundsDefM115')
s=s[:s.index('theorem vertical_third_largeM03')]
s=s.replace('vThird_seed_crossM03','vThird_seed_cross_of_boundsM03').replace('vertical_third_all_runM03','vertical_third_of_boundsM03')
prem='''(ha : 7 ≤ (frame rest).mid.b)
 (hb : vAllBoundsM115 (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ))'''
s=s.replace('(ha : 7 ≤ (frame rest).mid.b)',prem)
s=s.replace(' have hb := vAllboundsM03 b a (frame_reduced rest).1 ha (frame_reduced rest).2.1\n','')
s=s.replace('(vThird_seed_cross_of_boundsM03 n rest ha)', '(vThird_seed_cross_of_boundsM03 n rest ha hb)')
s+='end\nend MathGKM.Markov\n'
(R/'research/MarkovThirdBoundsTransportM03.lean').write_text(s)
print('Created exact conditional transport candidate.')
