"""Machine-authored source/index separation for exact ordinary Lean certificates."""
from generate_all_lc_1152282d import charts,specs,which,ss,sp,R
from explore_allrun_refined_1152282d import numerator,value
from pathlib import Path
import json,sys
O=R/'evidence/markov-03d5764d'
mons=[(i,j) for i in range(4) for j in range(4-i)]
outmons=[(i,j) for i in range(7) for j in range(7-i)]
name=lambda h,ij:f'{h}{ij[0]}{ij[1]}'
def powstr(v,n):return '1' if n==0 else v if n==1 else f'{v}^{n}'
def mono(ij):return '*'.join(powstr(v,n) for v,n in zip(['x','y'],ij) if n) or '1'
def gap(ij):
 pairs=[(k,l) for k in mons for l in mons if tuple(a+b for a,b in zip(k,l))==ij]
 return '+'.join(name('b',k)+'*'+name('b',l) for k,l in pairs)+'-('+ '+'.join(name('a',k)+'*'+name('c',l) for k,l in pairs)+')'
header='namespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 15000000\nset_option maxRecDepth 32768\nset_option linter.unusedVariables false\nset_option linter.unusedSimpArgs false\n'
def generic():
 s='import MarkovThirdAllBoundsDefM115\n/-! Machine-authored 03d5764d. Elementary cubic coefficient certificate. -/\n'+header
 s+='def cubicM03 ('+' '.join(name('a',k) for k in mons)+' x y : ℤ) : ℤ :=\n '+'+'.join(name('a',k)+'*'+mono(k) for k in mons)+'\n'
 args=lambda h:' '.join(name(h,k) for k in mons)+' x y'
 s+='theorem cubic_lcM03 (x y : ℤ) ('+' '.join(name(h,k) for h in 'abc' for k in mons)+' : ℤ)\n (hx : 0 ≤ x) (hy : 0 ≤ y)\n'
 for k in outmons:s+=f' (h{k[0]}{k[1]} : 0 ≤ {gap(k)})\n'
 s+=f' : cubicM03 {args("a")} * cubicM03 {args("c")} ≤ (cubicM03 {args("b")})^2 := by\n apply sub_nonneg.mp\n'
 target='+'.join('('+gap(k)+')*'+mono(k) for k in outmons)
 s+=' have he : (cubicM03 '+args('b')+')^2-cubicM03 '+args('a')+'*cubicM03 '+args('c')+'=\n '+target+' := by simp only [cubicM03]; ring\n rw [he]\n positivity\nend\nend MathGKM.Markov\n'
 (R/'research/MarkovCubicCertificateM03.lean').write_text(s)
def coeff(p,ij):return sp.P({(0,0)+k[2:]:c for k,c in p.items() if k[:2]==ij})
def chamber(n,i):
 cname,ci,cj,vs=charts[n];case,qq,jj,_,_=specs[i]
 mod=f'MarkovThirdAll{cname}_{ci}_{cj}Part{i}M03'
 old=(R/f'research/{mod}.lean').read_text()
 hs=numerator(vs,qq);cs=[value(hs,qq,jj+h) for h in [-1,0,1]]
 assert all(sum(k[:2])<=3 for p in cs for k in p)
 cps=[[coeff(p,k) for k in mons] for p in cs]
 # All mathematical coefficients come from the inherited candidate, but each
 # identification with the already checked formula is proved below by ring.
 s=old[:old.index(' have he')] if ' have he' in old else old[:old.index(' constructor')]
 s=s.replace('import MarkovThirdAllBoundsDefM115','import MarkovCubicCertificateM03')
 calls=[]
 for h,p,ps in zip([-1,0,1],cs,cps):
  reg=which(jj+h,qq)
  jarg='('+ss(jj)+')'+(f'{h:+}' if h else '')
  args=' '.join('('+ss(z)+')' for z in vs+[qq])+' ('+jarg+')'
  cargs=' '.join('('+ss(z)+')' for z in ps)+' x y'
  lhs=f'v3{reg}M115 {args}' if reg!='zero' else '0'
  s+=f' have he{h+1} : {lhs}=cubicM03 {cargs} := by\n  simp only [cubicM03'+(f',v3{reg}M115' if reg!='zero' else '')+']\n  ring\n'
  calls.append(cargs)
 s+=' constructor\n · rw [he0,he2,he1]\n   apply cubic_lcM03 _ _ '+ ' '.join('('+ss(z)+')' for ps in cps for z in ps)+' hx hy\n'
 # b is the middle coefficient vector, matching the generic theorem.
 s+='   all_goals ring_nf <;> positivity\n'
 reg=which(jj,qq)
 s+=f' · simp only [v3{reg}M115]\n   ring_nf <;> positivity\n\nend\nend MathGKM.Markov\n'
 (R/f'research/{mod}.lean').write_text(s)
 return mod
if __name__=='__main__':
 generic()
 if len(sys.argv)>1:print(chamber(int(sys.argv[1]),int(sys.argv[2])))
