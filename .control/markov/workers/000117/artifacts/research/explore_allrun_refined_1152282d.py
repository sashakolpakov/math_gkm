"""Machine-authored symbolic all-run gap exploration; not a proof artifact."""
from explore_1152282d import *
from fractions import Fraction
u,v=z.c,z.d
data=json.loads((R/'evidence/markov-ead8a96f/third-sparse-candidate.json').read_text())
def numerator(vs,qq):
 out={}
 for k,cs in data['table']:
  value=sum((Fraction(c)*qq**j for j,c in enumerate(cs)),sp.poly(0))
  for t,p in zip(vs,k[:5]):value=value*sp.poly(t)**p
  key=k[5],k[6];out[key]=out.get(key,sp.poly(0))+value
 return out
def fall(d):
 if all(c>=0 for c in (d+5).values()):
  p=sp.poly(1)
  for h in range(1,6):p=p*(d+h)
  return p
 if all(c>=0 for c in (-d-1).values()):return sp.poly(0)
 raise ValueError(('branch',d))
def value(hs,qq,jj):return sum((c*fall(jj-band*qq-off) for (band,off),c in hs.items()),sp.poly(0))
def main():
 start=time.monotonic();out=[]
 specs=[]
 for j in [1,2,3,4]:specs.append((f'first{j}',u+5,sp.poly(j)))
 specs.append(('low',u+v+5,u+5))
 for j in range(1,5):specs.append((f'cross1_{j}',u+5,u+5+j))
 specs.append(('mid1',u+v+4,2*u+v+9))
 for j in range(2,6):specs.append((f'cross2_{j}',u+5,2*(u+5)+j))
 specs.append(('mid2',u+v+5,3*u+2*v+16))
 for j in range(2,7):specs.append((f'tail{j}',u+5,3*(u+5)+j))
 for name,i,j,vs in charts:
  for tag,qq,jj in specs:
   hs=numerator(vs,qq)
   cs=[value(hs,qq,jj+h) for h in [-1,0,1]]
   gap=cs[1]**2-cs[0]*cs[2]
   neg=[(k,str(c)) for k,c in gap.items() if c<0]
   row=dict(source=[name,i,j],index=tag,terms=len(gap),negative_count=len(neg),negative_examples=neg[:3])
   out.append(row)
   (O/'all-run-refined-gaps.json').write_text(json.dumps(dict(status='Partial exact symbolic exploration, not Lean proof',seconds=time.monotonic()-start,charts=out),indent=2)+'\n')
   print(name,i,j,tag,len(gap),len(neg),flush=True)
 (O/'all-run-refined-gaps.json').write_text(json.dumps(dict(status='Completed exact symbolic exploration, not Lean proof',seconds=time.monotonic()-start,charts=out),indent=2)+'\n')
if __name__=='__main__':main()
