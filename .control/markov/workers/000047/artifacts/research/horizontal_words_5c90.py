"""Machine-authored exact finite experiments. No experiment is a proof."""
import sys,pathlib,json,itertools,time,math
from aggregate_a3c5 import poly,core
out=pathlib.Path('evidence/markov-5c90b506')
def check(w):
 p=poly(w);a=sum(w)+1;b=len(w)-sum(w)+1;N=b-1
 bad={};ct=0
 for (i,j),L in p.items():
  R=p.get((i+2,j),0)
  if not R:continue
  M=p.get((i+1,j),0);s=i+j-a
  raw=M*M-L*R
  amb=(s+1)*(N-s-1)*M*M-(s+2)*(N-s)*L*R
  ct+=1
  for name,g in [('raw',raw),('ambient',amb)]:
   if g<0:bad.setdefault(name,dict(word=w,a=a,b=b,i=i,j=j,s=s,coefficients=[L,M,R],gap=g))
 return ct,bad
def main():
 t=time.monotonic();fails={};ct=0;words=0;classes={}
 for n in range(1,22):
  nc=0
  # All words that begin/end A and have no adjacent C.
  def gen(n,w=()):
   if n==0:
    if not w[-1]:yield w
    return
   yield from gen(n-1,w+(False,))
   if w and not w[-1]:yield from gen(n-1,w+(True,))
  for w in gen(n):
   words+=1;nc+=1;k,bs=check(w);ct+=k
   for name,v in bs.items():fails.setdefault(name,v)
  classes[n]=nc
  rec=dict(status='finite exact experiment only; arbitrary words are not all source words',maximum_length=n,words=words,triples=ct,failures=fails,classes=classes,seconds=time.monotonic()-t)
  (out/'horizontal-words.json').write_text(json.dumps(rec,indent=2)+'\n')
  print(json.dumps(dict(n=n,words=words,triples=ct,failures=fails,seconds=rec['seconds'])),flush=True)
  if fails or rec['seconds']>90:break
if __name__=='__main__':main()
