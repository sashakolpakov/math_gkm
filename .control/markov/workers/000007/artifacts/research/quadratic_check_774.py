"""Machine-authored exact corroboration; no universal conclusion from this scan."""
import itertools,json,pathlib,sys
sys.path.insert(0,str(pathlib.Path('research').resolve()))
from word_invariants_774 import product
from residual_16cb import initial,child
count=0; failures=[]
for b in range(2,11):
 for core in itertools.product('AB',repeat=b-2):
  word='A'+''.join(core)+'B'; a=word.count('B'); p=product(word)[1]; count+=1
  expected=[(a-1)*(a-2)//2,a*b-4*a+2,(b-1)*(b-2)//2]
  actual=[p.get((i,2-i),0) for i in range(3)]
  if actual!=expected:failures.append(dict(word=word,actual=actual,expected=expected))
stack=[('',initial,'A','B')]; witness=None
while stack:
 path,f,lo,hi=stack.pop(); a,b,p=f[1]
 if b>11:continue
 if (a,b)==(3,11):witness=dict(path=path,word=lo+hi,coefficients=[p.get((1,j),0) for j in (2,3,4)])
 stack.append((path+'R',child(f,True),lo+hi,hi))
 stack.append((path+'L',child(f,False),lo,lo+hi))
out=dict(status='finite exact corroboration, not proof',words=count,failures=failures,
 source_3_11=witness,non_source_word='AABAAAAABAB',non_source_coefficients=[20,12,8])
pathlib.Path('evidence/markov-774eaadc/quadratic-check.json').write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps(out))
