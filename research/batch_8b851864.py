"""Foreground joined independent compiler jobs, no detached process."""
from concurrent.futures import ThreadPoolExecutor
import sys,json,os
from validate_8b851864 import run,O
mods=sys.argv[3:]
if mods[0].isdigit():mods=json.loads((O/'pipeline.json').read_text())[int(mods[0])]
if mods[0]=='small':mods=json.loads((O/'small-onset-modules.json').read_text())[1:]
if mods[0].startswith('six') and mods[0][3:].isdigit():mods=json.loads((O/'six-tail-pipeline.json').read_text())[int(mods[0][3:])]
if mods[0].startswith('four') and mods[0][4:].isdigit():mods=json.loads((O/'four-five-pipeline.json').read_text())[int(mods[0][4:])]
with ThreadPoolExecutor(max_workers=int(os.environ.get('MARKOV_BUILD_WORKERS','3'))) as pool:
 results=list(pool.map(lambda m:run(m,sys.argv[1],float(sys.argv[2])),mods))
sys.exit(0 if all(r.get('returncode')==0 for r in results) else 1)
