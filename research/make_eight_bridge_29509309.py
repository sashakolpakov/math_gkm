"""Machine-authored adapter generation. Every resulting theorem is rebuilt."""
from pathlib import Path
p=Path('research/MarkovFourVerticalM0D3.lean').read_text()
p=p.replace('import MarkovFourCertificateM0D3','\n'.join('import MarkovEight'+n+'M295' for n in ['Lower','Upper','CrossOne','CrossTwo']))
p=p.replace('0d346fa7','29509309').replace('fourth','eighth').replace('four','eight').replace('Four','Eight')
for name in ['lower_eight_lc','upper_eight_lc','cross_one_eight_lc','cross_two_eight_lc','vertical_regions_eight','source_two_vertical_eight','lower_gap_eight_nonneg','upper_gap_eight_nonneg','cross_one_gap_eight_nonneg','cross_two_gap_eight_nonneg']:
 p=p.replace(name+'M0D3',name+'M295')
p=p.replace(' 4',' 8').replace('M0D3 4','M0D3 8')
p=p.replace('n+4','n+EIGHT').replace('n+3','n+SEVEN').replace('n+2','n+SIX')
p=p.replace('n+EIGHT','n+8').replace('n+SEVEN','n+7').replace('n+SIX','n+6')
p=p.replace('N-2','N-6').replace('q-3','q-7').replace('q-4','q-8')
p=p.replace('lower_gap_eight_nonnegM295 (j:ℚ) (d:ℚ) (by positivity) (by positivity)','lower_gap_eight_nonnegM295 j d')
Path('research/MarkovEightVerticalM295.lean').write_text(p)
print(p)
