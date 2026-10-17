"""Machine-authored db238071. Kronecker packing experiment, NOT a Lean proof.
The coefficient bound and decoding/evaluation bridges are not formally proved.
"""
from pathlib import Path
import json,time,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-db238071'
def main():
 t=time.monotonic();data=json.loads((O/'sparse-original.json').read_text())
 fs=[dict((tuple(m),c) for m,c in p) for p in data['factors']]
 ps=[dict((tuple(m),c) for m,c in p) for p in data['products']]
 gap=dict((tuple(m),c) for m,c in data['gap'])
 degrees=[max(m[i] for p in ps for m in p) for i in range(4)]
 radices=[d+1 for d in degrees];weights=[1]
 for d in radices[:-1]:weights.append(weights[-1]*d)
 totals=[sum(f.values()) for f in fs]
 bounds=[]
 for gr in data['groups']:
  b=1
  for k in gr:b*=totals[k]
  bounds.append(b)
 bits=((max(bounds).bit_length()+7)//8)*8
 width=bits//8
 def pack(p):
  pos=lambda m:sum(a*b for a,b in zip(m,weights))
  raw=bytearray(width*(max(map(pos,p),default=0)+1))
  for m,c in p.items():
   assert 0<=c<1<<bits
   k=width*pos(m);raw[k:k+width]=c.to_bytes(width,'little')
  return int.from_bytes(raw,'little')
 fp=list(map(pack,fs));pp=list(map(pack,ps));checks=[]
 for gr,target in zip(data['groups'],pp):
  v=1
  for k in gr:v*=fp[k]
  checks.append(v==target)
 pg=pack(gap);aggregate=pp[0]+pp[1]-pp[2]-pp[3]
 out={'status':'exact finite representation experiment; no kernel proof or new mathematical result',
 'degrees':degrees,'radices':radices,'weights':weights,'coefficient_digit_bits':bits,
 'product_coefficient_upper_bounds':[str(x) for x in bounds],
 'product_checks':checks,'aggregate_check':aggregate==pg,'packed_bits':pg.bit_length(),
 'packed_sha256':hashlib.sha256(pg.to_bytes((pg.bit_length()+7)//8,'little')).hexdigest(),
 'formal_obligations':['bounded-digit packing injectivity','multivariate exponent/radix no-overflow','evaluation multiplicativity','coefficient bound from value at one','link to exact inherited factor expressions'],
 'seconds':time.monotonic()-t}
 (O/'packed-probe.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
