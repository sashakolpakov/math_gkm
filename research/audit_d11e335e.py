"""Machine-authored explicit theorem closure audit, with immutable receipts."""
from validate_d11e335e import *
mods=sys.argv[1:] or json.loads((O/'mathematical-modules.json').read_text())
decls={m:re.findall(r'^theorem\s+(\w+)',(R/'research'/f'{m}.lean').read_text(),re.M) for m in mods}
src='\n'.join('import '+m for m in mods)+'\n'
for ns in decls.values():
 for n in ns:src+='#print axioms MathGKM.Markov.'+n+'\n'
name='MarkovAudit'+str(time.time_ns())+'MD11'
(R/'research'/f'{name}.lean').write_text(src)
d=run([name],'build',120)
lines=d['stdout'];found={}
for ns in decls.values():
 for n in ns:
  match=re.search(r"'MathGKM\.Markov\."+n+r"' depends on axioms: \[([^\]]*)\]",lines)
  empty=re.search(r"'MathGKM\.Markov\."+n+r"' does not depend on any axioms",lines)
  assert match or empty,n
  ax=[] if empty else [x.strip() for x in match.group(1).split(',')]
  assert set(ax)<= {'propext','Classical.choice','Quot.sound'},(n,ax)
  found[n]=ax
assert d.get('returncode')==0,d
(O/f'axioms-{time.time_ns()}.json').write_text(json.dumps({'module':name,'sources':{m:sha(R/'research'/f'{m}.lean') for m in mods},'declarations':found},indent=2)+'\n')
print(json.dumps({'audit':name,'closures':len(found),'permitted':True}))
