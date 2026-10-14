"""Exact finite investigation of aggregate horizontal fibers; not a proof."""
import math,json,time,pathlib
def c(n,k): return math.comb(n,k) if 0<=k<=n else 0
def h(n,j,s,q):
 return c(n-q,s)*c(s+q-1,q)*c(2*s,j-q) if s>0 else int(q==j==0)
def main():
 start=time.monotonic(); fail={}; examples={};count=0
 for n in range(3,36):
  for j in range(2*n+1):
   for s in range(1,n):
    for k in range(2*(n-s)+1):
     terms=[]
     for q in range(k//2+1):
      r=k-q
      v=2*h(n,j,s,q)*h(n,j,s,r)-h(n,j,s-1,q)*h(n,j,s+1,r)-h(n,j,s+1,q)*h(n,j,s-1,r)
      if q==r:v//=2
      terms.append(v)
     if not any(terms):continue
     count+=1
     if min(terms)<0 and 'negative_term' not in examples:examples['negative_term']=dict(n=n,j=j,s=s,k=k,terms=terms)
     if sum(terms)<0 and 'sum' not in fail:fail['sum']=dict(n=n,j=j,s=s,k=k,terms=terms)
     # Are centered partial sums nonnegative? This supports a telescoping pairing.
     acc=0
     for t in reversed(range(len(terms))):
      acc+=terms[t]
      if acc<0 and 'center_partial' not in fail:fail['center_partial']=dict(n=n,j=j,s=s,k=k,terms=terms,t=t)
     signs=[v>0 for v in terms if v]
     if any(signs[t] and not signs[t+1] for t in range(len(signs)-1)) and 'single_sign_change' not in fail:
      fail['single_sign_change']=dict(n=n,j=j,s=s,k=k,terms=terms)
  out=dict(status='finite exact experiment',n_max=n,checks=count,failures=fail,examples=examples,seconds=time.monotonic()-start)
  pathlib.Path('evidence/markov-65c4dfb8/pair-probe.json').write_text(json.dumps(out,indent=2)+'\n')
  if time.monotonic()-start>45:break
 print(json.dumps(out))
if __name__=='__main__':main()
