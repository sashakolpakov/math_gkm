"""Machine-authored comparisons with inherited weighted-mask obstructions."""
from pathlib import Path
from run_formula_6d34 import layer
from degree_transfer_07a7 import transfer
import json
records=[]
for n,c,d,j in [(17,3,20,6),(21,3,24,7)]:
 p=layer(c,d-2*c);F=transfer((1,)*n)
 triple=[p[k] for k in [j-1,j,j+1]]
 assert triple==[F.get((c,d,k),0) for k in [j-1,j,j+1]]
 raw=[sum(v for (cc,dd,kk),v in F.items() if cc==c and kk==k) for k in [j-1,j,j+1]]
 records.append(dict(source=[n,n+1],cuts=c,degree=d,middle_y=j,complete_degree_layer_triple=triple,complete_degree_layer_gap=triple[1]**2-triple[0]*triple[2],complete_raw_slice_triple=raw,complete_raw_slice_gap=raw[1]**2-raw[0]*raw[2],universal_theorem='MathGKM.Markov.sourceRun_degreeInterval_integer_lc6d34; width=0'))
rec=dict(status='exact finite coefficient values; theorem separately validated',records=records)
Path('evidence/markov-6d34d54a/layer-witnesses.json').write_text(json.dumps(rec,indent=2)+'\n')
print(json.dumps(rec))
