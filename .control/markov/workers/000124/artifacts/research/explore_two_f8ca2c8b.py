"""Machine-authored exact two-letter correction experiment; not a proof."""
from pathlib import Path
import json
from small_blocks_ae257c53 import blocks,divplus,lean
from explore_1152282d import sp,x,y,z
q=x;T=y;X=z.x
def correction():
 return (1-X)**4*(T*X**2*((1+X)**2*(q-(q+1)*X+T*X)+(1+X)**2*(q+1-(q+2)*X+T*X**2)-(1-X)**2*(X+1))-X**2*(2-T*X-T*X**2)**2-X**3*(2-T-T*X)**2)
def corrected(a,r):
 assert (a,r)==(2,1)
 bs=blocks(2,1)
 for k,c in (6*correction()).items():
  assert k[2:5]==(0,0,0)
  band=k[1];key=k[0],k[5]
  bs[band][key]=bs[band].get(key,0)+c
 return [{k:v for k,v in d.items() if v} for d in bs]
if __name__=='__main__':
 bs=corrected(2,1)
 for _ in range(5):bs=[divplus(d) for d in bs]
 print([lean(d) for d in bs])
 Path('evidence/markov-f8ca2c8b/two-candidate.json').write_text(json.dumps(dict(status='Symbolic candidate only; not proof',blocks=[[[i,j,str(c)] for (i,j),c in d.items()] for d in bs]),indent=2)+'\n')
