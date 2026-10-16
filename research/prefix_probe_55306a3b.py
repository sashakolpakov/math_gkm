"""Machine-authored exact mechanical-prefix experiment; never a proof."""
from pathlib import Path
from math import gcd
import json,time,hashlib
O=Path('evidence/markov-55306a3b')
def add(*ps):
 d={}
 for p in ps:
  for ij,v in p.items():d[ij]=d.get(ij,0)+v
 return {ij:v for ij,v in d.items() if v}
def sh(p,a=0,b=0,c=1):return {(i+a,j+b):c*v for (i,j),v in p.items()}
def step(f,g,bit):
 # Atomic A and then C on a B. x is coefficient variable, y is row.
 f,g=sh(add(f,sh(f,1),sh(g,1)),b=1),add(f,g)
 if bit:
  m=add(f,sh(f,1),sh(g,1))
  f,g=add(f,sh(m,b=1),sh(m,1,1)),m
 return f,g
def main():
 t=time.monotonic();seen=set();out={'status':'finite exact experiment only','bound':55,'prefixes':0,'triples':0,'mixed':0,'failures':{},'source_words':0}
 for b in range(2,56):
  for a in range(1,b):
   if gcd(a,b)>1:continue
   w=tuple((k+1)*a//b-k*a//b for k in range(b));f,g={(0,0):1},{}
   for l,bit in enumerate(w,1):
    f,g=step(f,g,bit)
    prefix=w[:l]
    if prefix in seen:continue
    seen.add(prefix);out['prefixes']+=1
    for j in range(l+sum(prefix)+1):
     for k in range(sum(prefix)+j+1):
      fs=[f.get((k+z,j),0) for z in range(3)];gs=[g.get((k+z,j),0) for z in range(3)]
      vals={'F':fs[1]**2-fs[0]*fs[2],'H':gs[1]**2-gs[0]*gs[2],
            'mixed':2*fs[1]*gs[1]-fs[0]*gs[2]-gs[0]*fs[2]}
      out['triples']+=2;out['mixed']+=1
      for name,gap in vals.items():
       if gap<0 and name not in out['failures']:
        out['failures'][name]={'source':[a,b],'prefix_length':l,'word':list(prefix),'row':j,'index':k,'F':fs,'H':gs,'gap':gap}
   out['source_words']+=1
  out['seconds']=time.monotonic()-t
  (O/'prefix-progress.json').write_text(json.dumps(out,indent=2)+'\n')
  if b%10==0:print(json.dumps(out),flush=True)
  if len(out['failures'])==3:break
 out['script_sha256']=hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
 (O/'prefix-experiments.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
