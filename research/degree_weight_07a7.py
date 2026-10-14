"""Machine-authored exact marked-source obstruction; auxiliary weights only."""
from pathlib import Path
from degree_transfer_07a7 import transfer
import json
w=(0,0,1,0,0,1);T=transfer(w);s=2;D=max(d for ss,d,j in T if ss==s)
p=[sum(c*100**(D-d) for (ss,d,k),c in T.items() if ss==s and k==j) for j in range(3)]
assert D==2 and p==[10311,325,14]
rec=dict(status='exact finite auxiliary marked-coefficient calculation, not root refutation and not Lean theorem',source=[2,7],path=[False,False,True],extended_word=w,cut_count=s,degree_marker='1/100',uniform_denominator=100**D,scaled_y_coefficients=p,gap=p[1]**2-p[0]*p[2],full_z_one=[15,28,14],full_gap=28**2-15*14,original_points=[[4,0],[3,1],[2,2]])
Path('evidence/markov-07a7e5b7/degree-weight.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
