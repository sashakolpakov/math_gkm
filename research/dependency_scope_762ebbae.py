"""Machine-authored manifest of reused source/object boundaries; does not claim rebuilding them."""
from validate_762ebbae import *
def main():
 roots=sys.argv[1:] or ['MarkovResidualLargeM762']
 paths=[Path(p) for p in env['LEAN_PATH'].split(':') if p]
 assert not any('.scratch' in str(p) or '/.git' in str(p) for p in paths)
 old=O/'source-dependency-scope.json'
 found=json.loads(old.read_text())['modules'] if old.exists() else {}
 if old.exists():roots=list(dict.fromkeys(json.loads(old.read_text())['roots']+roots))
 missing=[]
 def visit(m):
  if m in found and found[m]['object'] is not None:return
  src=R/(m.replace('.','/')+'.lean') if m.startswith('MathGKM.') else R/'research'/f'{m}.lean'
  if not src.is_file():return
  obj=next((p/(m.replace('.','/')+'.olean') for p in paths if (p/(m.replace('.','/')+'.olean')).is_file()),None)
  if obj is None:missing.append(m)
  found[m]=dict(source=str(src.relative_to(R)),source_sha256=sha(src),object=str(obj) if obj else None,object_sha256=sha(obj) if obj else None,new_object=bool(obj and obj.parent==O))
  for dep in re.findall(r'^import ([\w.]+)',src.read_text(),re.M):visit(dep)
 for m in roots:visit(m)
 out=dict(roots=roots,modules=found,missing_objects=missing,source_modules=len(found),reused_objects=sum(not z['new_object'] for z in found.values()),pins={p:sha(R/p) for p in ['lean-toolchain','lakefile.toml','lake-manifest.json']},scope='Hash-bound source/object inventory only; inherited objects are not freshly rebuilt or replayed by this inventory.')
 (O/'source-dependency-scope.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps({k:v for k,v in out.items() if k not in ['modules','pins']}))
if __name__=='__main__':main()
