"""Machine-authored separation of pure coefficient certificates from source expansion."""
from pathlib import Path
R=Path('/Users/sasha/math_gkm')
for z in range(6):
 p=R/f'research/MarkovFourthThree{z}K062.lean';s=p.read_text()
 cut=s.index(f'theorem fourth_three_moment_{z}K062')
 head=s[s.index('namespace MathGKM.Markov'):s.index('def fourthThreeMoment')]
 cert=s[:cut].replace('import MarkovFourthThreeLocalK062','import MarkovFourthTwoLocalK062')+'\nend\nend MathGKM.Markov\n'
 (R/f'research/MarkovFourthThreeCert{z}K062.lean').write_text(cert)
 p.write_text(f'import MarkovFourthThreeCert{z}K062\nimport MarkovFourthThreeLocalK062\n'+head+s[cut:])
print('Separated six pure polynomial certificates from six source expansions.')
