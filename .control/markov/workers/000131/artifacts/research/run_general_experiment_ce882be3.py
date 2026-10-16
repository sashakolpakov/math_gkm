"""Machine-authored reuse of exact general-statistic experiment with new receipts."""
from pathlib import Path
s=Path('research/experiment_strip_b9d0d341.py').read_text()
s=s.replace('markov-b9d0d341','markov-ce882be3').replace('generate(40)','generate(32)').replace('denominator_bound=40','denominator_bound=32').replace("'strip-experiments.json'","'general-strip-experiments.json'")
Path('research/experiment_general_ce882be3.py').write_text(s)
