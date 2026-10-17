"""Machine-authored diagnostic of a proposed low-degree convolution formula."""
from convolution_probe_09fffb56 import C,conv,O
import json,time
def run():
 start=time.monotonic();out=dict(status='finite exact formula checks; universal Lean identity unproved',interior_coefficients=0,boundary_coefficients=0,failures=[])
 for j in range(1,101):
  for s in list(range(16))+[30,100]:
   a,b,c=[[(1 if i==j else 4*(j-i))*C(s+t+i+3,i) for i in range(j+1)] for t in range(3)]
   ac=conv(a,c);bb=conv(b,b)
   for n in range(j):
    Q=2*s+n+9
    acp=16*(j*(j-n)*C(Q,n)+(s+4)*(s+6)*C(Q,n-2))
    bbp=16*(j*(j-n)*C(Q,n)+(s+5)**2*C(Q,n-2))
    out['interior_coefficients']+=2
    if (acp,bbp)!=(ac[n],bb[n]):out['failures'].append([j,s,n])
   acp=16*(s+4)*(s+6)*C(2*s+j+9,j-2)+4*j*(C(s+j+3,j)+C(s+j+5,j))
   bbp=16*(s+5)**2*C(2*s+j+9,j-2)+8*j*C(s+j+4,j)
   out['boundary_coefficients']+=2
   if (acp,bbp)!=(ac[j],bb[j]):out['failures'].append(['boundary',j,s])
 out['seconds']=time.monotonic()-start
 (O/'q-low-formula.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':run()
