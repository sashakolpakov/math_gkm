"""Exact tests for factorial-weighted horizontal LC. Finite evidence only."""
import json,pathlib,random,time,math
from balanced_f80 import A,B,mm,I
out=pathlib.Path('evidence/markov-7252232b');out.mkdir(exist_ok=True)
def test(p):
 for (i,j),l in p.items():
  c=p.get((i+1,j),0);r=p.get((i+2,j),0)
  if c*c*(i+1)<l*r*(i+2):return dict(i=i,j=j,coeff=[l,c,r])
def main():
 start=time.monotonic();fail={};count=0;stack=[('A',A)]
 while stack:
  w,m=stack.pop()
  if w[-1]=='B':
   count+=1;f=test(m[1])
   if f and ('word' not in fail or len(w)<len(fail['word']['word'])):fail['word']=dict(word=w,**f)
  if len(w)<13:stack.extend([(w+'B',mm(m,B)),(w+'A',mm(m,A))])
 nsource=0
 for b in range(2,46):
  for a in range(1,b):
   if math.gcd(a,b)!=1:continue
   m=I;word=[]
   for k in range(1,b+1):
    r=(k*a)//b>((k-1)*a)//b;word.append('B' if r else 'A');m=mm(m,B if r else A)
   nsource+=1;f=test(m[1])
   if f and 'source' not in fail:fail['source']=dict(a=a,b=b,word=''.join(word),**f)
 result=dict(status='finite test only',word_count=count,source_count=nsource,failures=fail,seconds=time.monotonic()-start)
 (out/'factorial-probe.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result))
if __name__=='__main__':main()
