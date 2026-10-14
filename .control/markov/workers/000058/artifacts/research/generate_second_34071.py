"""Machine-authored exact certificate generator; generated Lean checks all identities."""
from second_certificate_a27f import P,poly,vs,raw,rat_sub,rec
import pathlib,json
s,r,m,t=vs;N=s+r+2
def horner(p,names):
 if not p:return '0'
 if not names:return str(int(p.get((),0)))
 deg=max(k[0] for k in p);cs=[horner({k[1:]:v for k,v in p.items() if k[0]==z},names[1:]) for z in range(deg+1)];o=cs[-1]
 for c in reversed(cs[:-1]):o=f'({c}+{names[0]}*{o})'
 return o
base=raw.sub([s,r,m,0]);der=P({(e[0],e[1],e[2],0):c for e,c in raw.items() if e[3]==1})
src='''import MarkovSecondSource8934
/-! Machine-authored 34071a88. Source-shaped normalized second-row gap.
No universal Markov log-concavity theorem is asserted. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 30000
def secondNorm340 (k N m t : ℝ) : ℝ :=
 k*(4*t*(N-k)*(N-k-1)*(N-k-2)+(9*m^2+13*m+6)*(k-1)*(N-k)*(N-k-1)+
 (6*m^2+6*m*(N-1)+8*m+6*(N-1)+6)*(k-1)*(k-2)*(N-k)+
 (m+N+1)*(m+N)*(k-1)*(k-2)*(k-3))
def secondGap340 (k N m t : ℝ) : ℝ :=
 secondNorm340 (k+1) N m t^2-secondNorm340 k N m t*secondNorm340 (k+2) N m t
def secondMid340 (k N m : ℝ) : ℝ :=
 2*secondNorm340 (k+1) N m 0*secondNorm340 (k+1) N m (2*m)-
 secondNorm340 k N m 0*secondNorm340 (k+2) N m (2*m)-
 secondNorm340 k N m (2*m)*secondNorm340 (k+2) N m 0
'''
records={}
for tag,p,target in [('zero',base,'secondGap340 K NN m 0'),('middle',2*(base+m*der),'secondMid340 K NN m'),('upper',raw.sub([s,r,m,2*m]),'secondGap340 K NN m (2*m)')]:
 if tag!='zero':p=rat_sub(p,2,(N-1)*(m+1),m+2)
 for name,sub,K,NN in [('one',[1,r+1,m,t],'1','(y+4)'),('two',[2,r,m,t],'2','(y+4)'),('large',[s+3,r,m,t],'(x+3)','(x+y+5)')]:
  q=p.sub(sub);assert all(c>0 for c in q.values());assert all(e[3]==0 for e in q)
  if tag=='zero':terms={(e[0],e[1],e[2]):c for e,c in q.items()};names=['x','y','m'];args='x y m';call='x y m';scale='1';hyps='(hm : 0 ≤ m)'
  else:
   terms={(e[0],e[1],e[2],4-e[2]):c for e,c in q.items()};names=['x','y','u','v'];args='x y u v';call=f'x y (2*m-({NN}-1)) ({NN}-1-m)';scale=f'({NN}-1)^4';hyps=f'(hm : 0 ≤ m) (hlo : {NN}-1 ≤ 2*m) (hhi : m ≤ {NN}-1)'
  fn=f'secondCert_{tag}_{name}340';goal=target.replace('NN',NN).replace('K',K)
  src+=f'\ndef {fn} ({args} : ℝ) : ℝ := {horner(terms,names)}\n'
  src+=f'''theorem second_{tag}_{name}340 (x y m : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) {hyps} : 0 ≤ {goal} := by
 have hp : 0 ≤ {fn} {call} := by
'''
  if tag!='zero':src+=f'  have hu : 0 ≤ 2*m-({NN}-1) := by linarith\n  have hv : 0 ≤ {NN}-1-m := by linarith\n'
  src+=f'''  unfold {fn}
  positivity
 have he : {scale}*({goal}) = {fn} {call} := by
  simp only [secondGap340,secondMid340,secondNorm340,{fn}]
  ring
 rw [← he] at hp
'''
  if tag=='zero':src+=' simpa using hp\n'
  else:src+=f' have hpos : 0 < {NN}-1 := by linarith\n exact (mul_nonneg_iff_of_pos_left (pow_pos hpos 4)).mp hp\n'
  records[tag+'_'+name]=dict(terms=len(terms),all_nonnegative=True)
src+='''
#print axioms second_zero_large340
#print axioms second_middle_large340
#print axioms second_upper_large340
end
end MathGKM.Markov
'''
pathlib.Path('research/MarkovSecondCertificate340.lean').write_text(src)
pathlib.Path('evidence/markov-34071a88/second-certificates.json').write_text(json.dumps(records,indent=2)+'\n')
print(records)
