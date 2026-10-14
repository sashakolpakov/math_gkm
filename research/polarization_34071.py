"""Machine-authored exact cut-site polarization probe. Finite evidence only."""
import itertools, math, json, pathlib, time
out=pathlib.Path('evidence/markov-34071a88')
def add(a,b):
 c=[0]*max(len(a),len(b))
 for i,v in enumerate(a):c[i]+=v
 for i,v in enumerate(b):c[i]+=v
 return c
def mul(a,b):
 c=[0]*(len(a)+len(b)-1)
 for i,x in enumerate(a):
  for j,y in enumerate(b):c[i+j]+=x*y
 return c
def cuts(w):
 n=len(w); d={}
 for mask in range(1<<n):
  p=[0,1];q=[1]
  for i,r in enumerate(w):
   if mask>>i&1:
    t=mul([1,1] if r else [1],add(p,q));p=[0]+t;q=t
   elif r:p=[0]+add(p,[2*c for c in q])
   else:p=[0]
  d[mask]=q
 return d
def coeff(d,m,j):return d[m][j] if j<len(d[m]) else 0
def main():
 start=time.monotonic();count=0;fails=[];sourcefails=[]
 for n in range(1,9):
  for v in itertools.product([0,1],repeat=n-1):
   w=v+(1,);d=cuts(w)
   for I in range(1<<n):
    rem=[i for i in range(n) if not I>>i&1];m=len(rem)
    for p,q in itertools.combinations(rem,2):
     for j in range(n+sum(w)+1):
      a,b,c,e=[coeff(d,k,j) for k in [I,I|1<<p,I|1<<q,I|1<<p|1<<q]]
      count+=1
      if e and m*a*e>2*(m-1)*b*c:
       f=dict(word=''.join('B' if r else 'A' for r in v),I=I,p=p,q=q,j=j,m=m,coefficients=[a,b,c,e],gap=2*(m-1)*b*c-m*a*e)
       fails.append(f)
       if v==v[::-1]:sourcefails.append(f)
       break
     if fails:break
    if fails:break
   if fails:break
  if fails:break
 rec=dict(status='finite exact test; no theorem',tests=count,failures=fails,palindrome_failures=sourcefails,seconds=time.monotonic()-start)
 (out/'polarization.json').write_text(json.dumps(rec,indent=2)+'\n');print(json.dumps(rec))
if __name__=='__main__':main()
