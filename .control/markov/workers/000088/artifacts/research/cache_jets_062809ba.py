"""Machine-authored exact coefficient caching for the run-three local moment."""
from pathlib import Path
from itertools import product
from experiment_be5676f9 import gauge
R=Path('/Users/sasha/math_gkm');p=R/'research/MarkovFourthThreeLocalK062.lean'
s=p.read_text();jets='';names=[]
for b,c in product(range(2),repeat=2):
 m=gauge(3,b,c)
 for e,k in [('a',1),('a',2),('b',2),('b',3),('c',1),('c',2),('c',3),('d',1),('d',2),('d',3),('d',4)]:
  f=m['abcd'.index(e)];f={z:v for (i,j,z),v in f.items() if i==k}
  pol=' + '.join(str(int(v))+('*X'+('^'+str(z) if z>1 else '') if z else '') for z,v in sorted(f.items())) or '0'
  name=f'jet3_{b}{c}_{e}{k}K062';names.append(name)
  jets+=f'''theorem {name} :
 (runBooleanGaugeADB2 3 {'true' if b else 'false'} {'true' if c else 'false'}).{e}.coeff {k}=({pol}) := by
 rw [gauge3_{b}{c}K062]
 simp only [U,Polynomial.coeff_add,Polynomial.coeff_C,Polynomial.coeff_mul_C,Polynomial.coeff_X_pow]
 norm_num <;> ring
'''
s=s.replace('def threeLocalFourK062',jets+'def threeLocalFourK062',1)
a=s.index('theorem runLocalFour_threeK062')
s=s[:a]+'''theorem runLocalFour_threeK062 (p q r s : Bool) :
 runLocalFourBE 3 p q r s=threeLocalFourK062 p q r s := by
 cases p <;> cases q <;> cases r <;> cases s <;>
   simp only [runLocalFourBE,localFour01F,threeLocalFourK062,
'''+','.join(names)+'''] <;> ring
end
end MathGKM.Markov
'''
p.write_text(s)
print('Cached 44 exact gauge coefficients before the 16 local-moment cases.')
