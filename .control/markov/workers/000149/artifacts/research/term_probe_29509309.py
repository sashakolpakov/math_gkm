"""Machine-authored exploration; finite tests of candidate summand bounds."""
from newton_probe_0d346fa7 import C
from pathlib import Path
import json
def term(i,j,d,h):
 return C(2*d,h)*C(2*i-2-h,i)*(C(j+i+1,2*i-1-h)+C(j+i,2*i-1-h))
out={}
for shift in range(5):
 fail=[];n=0
 for i in range(2,18):
  for j in range(18):
   for d in range(8):
    for h in range(i-1):
     for k in range(i-1):
      a=term(i,j,d+2,h)*term(i,j+2,d,k)
      b=term(i,j+1,d+1,min(h+shift,k))*term(i,j+1,d+1,max(h+shift,k)-shift)
      n+=1
      if a>b:
       fail.append(dict(i=i,j=j,d=d,h=h,k=k,left=a,right=b));break
     if fail:break
    if fail:break
   if fail:break
  if fail:break
 out[str(shift)]={'checked':n,'failure':fail}
Path('evidence/markov-29509309/term-probe.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out,indent=2))
