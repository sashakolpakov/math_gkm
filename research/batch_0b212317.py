"""Foreground bounded compilation batch. No model/controller calls."""
import concurrent.futures,subprocess,sys
def run(m):
 p=subprocess.run(['/opt/homebrew/bin/python3','research/validate_0b212317.py',m,'build','100'],text=True,capture_output=True)
 print(p.stdout,flush=True)
 return p.returncode
with concurrent.futures.ThreadPoolExecutor(max_workers=3) as ex:
 codes=list(ex.map(run,sys.argv[1:]))
sys.exit(int(any(codes)))
