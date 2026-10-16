"""Machine-authored finite tests of a different lower-region kernel."""
from pathlib import Path
import json,time
from sparse_probe_96ada19b import fr,sop
O=Path('/Users/sasha/math_gkm/evidence/markov-e9cdd527')
def lower(n,I,J):
 a={}
 f=lambda i,j:fr(n+2,i,j)-2*fr(n+1,i,j)+fr(n,i,j)
 for i in range(I+1):
  for j in range(J+1):
   z=sop(lambda c,d:sop(f,c,d),i,j)
   g=lambda c,d:a.get((c,d),0)
   a[i,j]=z-2*g(i-1,j)+2*g(i,j-1)-g(i-2,j)-2*g(i-1,j-1)-g(i,j-2)
 return a
def main():
 t=time.monotonic();B=24;I=24
 arr={n:lower(n,I,B+2) for n in range(1,I+2*B+5)}
 out={'status':'finite exact experiment only; wedge domain is essential','definition':'K_i(j,k)=lower(i+j+k-2,i,j)','bounds':{'j_k':B,'i':I},'counts':[0,0,0],'failure_counts':[0,0,0],'failures':[[],[],[]],'negative':[]}
 for i in range(3,I+1):
  def h(j,k):return arr[i+j+k-2][i,j]
  for j in range(B+1):
   for k in range(B+1):
    a,b,c=h(j,k),h(j+1,k),h(j+2,k);e,f,g=h(j,k+1),h(j,k+2),h(j+1,k+1)
    if i+k>=2*j+3 and a<0:out['negative'].append([i,j,k,a])
    conditions=[i+k>=2*j+7,i+k>=2*j+3,i+k>=2*j+5]
    for l,z in enumerate([b*b-a*c,e*e-a*f,a*g-b*e]):
     if conditions[l]:
      out['counts'][l]+=1
      if z<0:
       out['failure_counts'][l]+=1
       if len(out['failures'][l])<8:out['failures'][l].append({'i':i,'j':j,'k':k,'gap':z,'a_b_c_e_f_g':[a,b,c,e,f,g]})
 out['seconds']=time.monotonic()-t
 (O/'alternate-shape-experiments.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out))
if __name__=='__main__':main()
