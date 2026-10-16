"""Machine-authored splitting of unproved certificates; no theorem assumed."""
from pathlib import Path
import re,json
R=Path('/Users/sasha/math_gkm'); O=R/'evidence/markov-03d5764d'
old=json.loads((R/'evidence/markov-1152282d/allrun-generated-modules.json').read_text())
rename=lambda s:re.sub(r'\bvAll(\w*)M115\b',r'vAll\1M03',s)
plan=[]; assemblies=[]
for mod in old:
 src=(R/f'research/{mod}.lean').read_text()
 head,*decls=src.split('\ntheorem ')
 head=head.replace('/-! Machine-authored 1152282d.', '/-! Machine-authored 03d5764d; split from pending 1152282d candidate.')
 head=head.replace('import MarkovThirdAllBoundsDefM115','import MarkovThirdAllBoundsDefM115')
 parts=[]
 for i,d in enumerate(decls[:-1]):
  new=mod.replace('M115',f'Part{i}M03')
  text=head+'\ntheorem '+rename(d)+'\nend\nend MathGKM.Markov\n'
  # Keep the already checked predicate, not a new unbound symbol.
  text=text.replace('vAllBoundsM03','vAllBoundsM115')
  (R/f'research/{new}.lean').write_text(text)
  parts.append(new);plan.append(new)
 new=mod.replace('M115','M03')
 s='\n'.join('import '+p for p in parts)+'\n'+head[head.index('namespace '):]+'\ntheorem '+rename(decls[-1])
 s=s.replace('vAllBoundsM03','vAllBoundsM115')
 (R/f'research/{new}.lean').write_text(s);assemblies.append(new)
for oldmod in ['MarkovThirdAllSourceBoundsM115','MarkovThirdAllLCM115','MarkovResidualM115']:
 src=(R/f'research/{oldmod}.lean').read_text()
 for m in old+['MarkovThirdAllSourceBoundsM115','MarkovThirdAllLCM115']:
  src=src.replace('import '+m,'import '+m.replace('M115','M03'))
 src=rename(src).replace('vAllBoundsM03','vAllBoundsM115')
 if oldmod!='MarkovThirdAllSourceBoundsM115':
  for n in ['vThird_seed_cross','vertical_third_all_run','vertical_third_large','InteriorCore63','root_iff_interior']:
   src=src.replace(n+'M115',n+'M03')
 new=oldmod.replace('M115','M03');(R/f'research/{new}.lean').write_text(src)
 assemblies.append(new)
(O/'build-plan.json').write_text(json.dumps(dict(parts=plan,assemblies=assemblies),indent=2)+'\n')
print('Created',len(plan),'independent chamber candidates and',len(assemblies),'assemblies; none yet accepted.')
