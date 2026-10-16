"""Machine-authored modular cubic certificates; exact identities remain Lean obligations."""
from factor_charts_03d5764d import *
import re
def separate(n,i):
 cname,ci,cj,vs=charts[n];case,qq,jj,_,_=specs[i]
 oldmod=f'MarkovThirdAll{cname}_{ci}_{cj}Part{i}M03'
 old=(R/f'research/{oldmod}.lean').read_text()
 tag=f'Sep{n}I{i}'
 mod=f'MarkovThird{tag}M03'
 hs=numerator(vs,qq);cs=[value(hs,qq,jj+h) for h in [-1,0,1]]
 cps=[[coeff(p,k) for k in mons] for p in cs]
 dn=lambda h,k:f's{tag}{name(h,k)}M03'
 dc=lambda h,k:f'({dn(h,k)} u v)'
 dargs=lambda h:' '.join(dc(h,k) for k in mons)
 ds=[dn(h,k) for h in 'abc' for k in mons]
 s='import MarkovCubicCertificateM03\n'+header
 for h,ps in zip('abc',cps):
  for k,p in zip(mons,ps):s+=f'def {dn(h,k)} (u v : ℤ) : ℤ := {ss(p)}\n'
 s+='end\nend MathGKM.Markov\n';(R/f'research/{mod}Defs.lean').write_text(s)
 plan=[mod+'Defs']
 for idx,h in enumerate([-1,0,1]):
  reg=which(jj+h,qq);jarg='('+ss(jj)+')'+(f'{h:+}' if h else '')
  args=' '.join('('+ss(z)+')' for z in vs+[qq])+' ('+jarg+')'
  lhs=f'v3{reg}M115 {args}' if reg!='zero' else '0'
  s=f'import {mod}Defs\n'+header
  s+=f'theorem s{tag}e{idx}M03 (x y u v : ℤ) : {lhs}=cubicM03 {dargs("abc"[idx])} x y := by\n'
  s+=' simp only [cubicM03'+(f',v3{reg}M115' if reg!='zero' else '')+','+','.join(dn('abc'[idx],k) for k in mons)+']\n ring\nend\nend MathGKM.Markov\n'
  nm=mod+f'E{idx}';(R/f'research/{nm}.lean').write_text(s);plan.append(nm)
 for batch in range(4):
  s=f'import {mod}Defs\n'+header
  for k in outmons[7*batch:7*(batch+1)]:
   expr=gap(k)
   for h in 'abc':
    for m in mons:expr=re.sub(r'\b'+name(h,m)+r'\b',dc(h,m),expr)
   s+=f'theorem s{tag}g{k[0]}{k[1]}M03 (u v : ℤ) (hu : 0 ≤ u) (hv : 0 ≤ v) : 0 ≤ {expr} := by\n'
   s+=' simp only ['+','.join(ds)+']\n ring_nf <;> positivity\n'
  s+='end\nend MathGKM.Markov\n';nm=mod+f'G{batch}';(R/f'research/{nm}.lean').write_text(s);plan.append(nm)
 s='\n'.join('import '+p for p in plan)+'\n'+old[old.index('namespace '):]
 s=s[:s.index(' have he')] if ' have he' in s else s[:s.index(' constructor')]
 theorem=re.search(r'theorem (\w+)',s).group(1)
 s=s.replace('theorem '+theorem,'theorem s'+tag+'FinalM03')
 s+=' constructor\n · rw ['+','.join(f's{tag}e{j}M03' for j in [0,2,1])+']\n'
 s+='   apply cubic_lcM03 _ _ '+ ' '.join(dargs(h) for h in 'abc')+' hx hy\n'
 for k in outmons:s+=f'   · exact s{tag}g{k[0]}{k[1]}M03 u v hu hv\n'
 s+=f' · rw [s{tag}e1M03]\n   simp only [cubicM03,'+','.join(dn('b',k) for k in mons)+']\n   positivity\nend\nend MathGKM.Markov\n'
 nm=mod+'Final';(R/f'research/{nm}.lean').write_text(s);plan.append(nm)
 (O/f'separate-{n}-{i}-plan.json').write_text(json.dumps(dict(modules=plan,old=oldmod,alias=theorem,target='s'+tag+'FinalM03'),indent=2)+'\n')
 print(' '.join(plan))
if __name__=='__main__':separate(int(sys.argv[1]),int(sys.argv[2]))
