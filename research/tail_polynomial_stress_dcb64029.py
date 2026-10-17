"""Source retained for the exact inline stress action executed in this run.
It reproduces that action; the saved result is finite experimental evidence.
"""
from generate_tail_dcb64029 import *
def run():
 t=time.monotonic();out=[]
 for r in range(11,41):
  g=polynomials(r);bad=[(j,k,str(v)) for (j,k),v in g.items() if v<0]
  out.append(dict(r=r,terms=len(g),degree=max(j+k for j,k in g),negative_count=len(bad),negative_first=bad[:10]))
  print(json.dumps(out[-1]),flush=True)
 (O/'tail-polynomial-stress.json').write_text(json.dumps(dict(cases=out,seconds=time.monotonic()-t,status='finite symbolic experiment only'),indent=2))
if __name__=='__main__':run()
