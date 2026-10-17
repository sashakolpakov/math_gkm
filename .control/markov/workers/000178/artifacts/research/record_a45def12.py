"""Machine-authored capability/source records; no controller mutation."""
from pathlib import Path
import json,importlib,shutil,os,hashlib
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-a45def12'
caps={'temporary_location':'Developer denies .scratch; unique research/evidence paths used',
      'shell_heredoc':'Failed: cannot create temp file; Python -c used successfully',
      'broad_rg_discovery':'Denied directory traversal reported; no denied content obtained; subsequent paths explicit',
      'hosted_source_retrieval':'Publisher HTML and Karp author slides retrieved successfully',
      'executables':{x:shutil.which(x,path='/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin') for x in ['sage','gap','lean','lake']}}
for name in ['sympy','sage.all']:
    try:importlib.import_module(name);caps[name]='import succeeded'
    except Exception as e:caps[name]=type(e).__name__+': '+str(e)
(O/'capabilities.json').write_text(json.dumps(caps,indent=2)+'\n')
visit={'tool':'hosted web search/open/find; no shell networking',
       'published_source':'https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html',
       'sections_read':['(5)','(7)-(11)','Definitions 6.1-6.2','Conjecture 6.3'],
       'literature_queries':['rising factorial weighted sequence convolution ratio monotonicity Turan coefficients log concavity','Pólya frequency sequence binomial coefficients parameter Turan ratio coefficient monotonicity'],
       'related_primary_source':'https://math.nist.gov/~DLozier/SF21/SF21slides/Karp.pdf',
       'related_scope':'Author slides, Theorem 1 around page 29, discusses coefficient signs of rising-factorial Turan differences. No adjacent coefficient-ratio theorem was extracted or imported; no external mathematical axiom was added.',
       'completion':None}
(O/'source-visit.json').write_text(json.dumps(visit,indent=2)+'\n')
mods=[p.stem for p in (R/'research').glob('Markov*MA45.lean') if not p.stem.startswith('MarkovAudit')]
(O/'mathematical-modules.json').write_text(json.dumps(sorted(mods),indent=2)+'\n')
for p in ['pf_probe_a45def12.py','schur_probe_a45def12.py','schur_validate_a45def12.py','experiment_a45def12.py']:
    f=R/'research'/p
    (O/(p+'.sha256')).write_text(hashlib.sha256(f.read_bytes()).hexdigest()+'\n')
print(json.dumps(caps));print(json.dumps(mods))
