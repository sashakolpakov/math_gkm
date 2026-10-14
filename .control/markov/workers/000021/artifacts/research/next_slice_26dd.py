"""Machine-authored exact truncated word experiment. No proof claims."""
import json,pathlib,time

R=6
def step(p,q,bit):
    h=[row[:] for row in p]
    for r in range(1,R+1):
      for k in range(1,r+1):h[r][k]+=q[r-1][k-1]
    if bit:
      pp=[row[:] for row in h]
      for r in range(1,R+1):
        for k in range(r):pp[r][k]+=p[r-1][k]
      return pp,h
    qq=[row[:] for row in h]
    for r in range(1,R+1):
      for k in range(r):qq[r][k]+=q[r-1][k]
    return h,qq

def terminal(p,q,r):return [p[r][k]+(q[r-1][k-1] if k else 0) for k in range(r+1)]

def main():
    start=time.monotonic(); first={};counts={};failcounts={};maxn=16
    z=[[0]*(r+1) for r in range(R+1)];z[0][0]=1
    def visit(w,p,q):
      n=len(w)
      for r in [4,5,6]:
        v=terminal(p,q,r);counts[r]=counts.get(r,0)+1
        fs=[k for k in range(r-1) if v[k]*v[k+2]>v[k+1]**2]
        if fs:
          failcounts[r]=failcounts.get(r,0)+1
          record=dict(core=w,n=n,r=r,coefficients=v,positions=fs)
          if r not in first or n<first[r]['n']:first[r]=record
      if n<maxn:
        for bit in [0,1]:visit(w+str(bit),*step(p,q,bit))
    visit('',z,z)
    out=dict(status='finite enlarged-word-family experiment; failures are not source refutations',
      max_core_length=maxn,counts=counts,failed_word_counts=failcounts,shortest_failures=first,
      seconds=time.monotonic()-start)
    pathlib.Path('evidence/markov-26dd33d6/next-slice.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out))
if __name__=='__main__':main()
