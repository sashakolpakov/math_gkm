"""Machine-authored bounded source-bound replay of value bases and upper extreme certificates."""
import subprocess,sys
from validate_2532cf40 import env,R
mods=['MarkovOnsetScalarM253','MarkovResidualOneM253']
for p in ['Low','High','Top']:
 mods+=[f'MarkovOnset{p}DefsM253']+[f'MarkovOnset{p}Value{k}M253' for k in range(1,8)]
 if p!='Top':mods+=[f'MarkovOnset{p}SplitDefsM253']
mods += [f'MarkovOnsetTopGap{k}M253' for k in range(1,6)]
sys.exit(subprocess.run(['/opt/homebrew/bin/python3',str(R/'research/replay_2532cf40.py'),*mods],cwd=R,env=env).returncode)
