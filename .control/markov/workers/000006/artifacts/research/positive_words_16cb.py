"""Independent positive-matrix evaluation of the recorded word obstruction."""
import json,pathlib,sys
sys.path.insert(0,str(pathlib.Path('research').resolve()))
from residual_16cb import add,mul,one,x,y,check,child,initial
A=(one,one,x,add(x,y)); B=(add(one,y),one,x,x)
def mm(a,b):
 return tuple(add(mul(a[2*i],b[j]),mul(a[2*i+1],b[2+j])) for i in range(2) for j in range(2))
def prod(w):
 m=(one,{}, {},one)
 for c in w: m=mm(m,A if c=='A' else B)
 return m[1]
old=json.loads(pathlib.Path('evidence/markov-16cb07ce/quotient-words.json').read_text())
obs=[]
for word,fs in old['first_lc_failures']:
 p=prod(word)
 assert check(p)[:2]==fs
 obs.append(dict(word=word,failures=fs,terms=[[i,j,c] for (i,j),c in sorted(p.items())]))
stack=[('',initial,A,B)]; n=0; bound=40
while stack:
 path,f,lo,hi=stack.pop()
 if f[1][1]>bound: continue
 mid=mm(lo,hi)
 assert mid[1]==f[1][2]
 n+=1
 if f[1][1]+f[2][1]<=bound: stack.append((path+'R',child(f,True),mid,hi))
 if f[1][1]+f[0][1]<=bound: stack.append((path+'L',child(f,False),lo,mid))
out=dict(status='finite exact corroboration, not root proof',source_pairs_checked=n,
 denominator_bound=bound,positive_matrix_obstructions=obs)
pathlib.Path('evidence/markov-16cb07ce/positive-words.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(dict(source_pairs_checked=n,word_obstructions_checked=len(obs))))
