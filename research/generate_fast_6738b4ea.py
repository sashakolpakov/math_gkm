"""Machine-authored fast representation certificates; ordinary kernel checks."""
from pathlib import Path
for c in range(5,16):
 s=Path(f'research/MarkovTemplateC{c}M673.lean').read_text()
 s=s.replace('import MarkovTemplateIntegerM673','import MarkovTemplateFastM673')
 s=s.replace('templateData','templateFastData').replace('template_data_','template_fast_data_').replace('template_certificate_','template_fast_certificate_').replace('template_strong_','template_fast_strong_')
 lines=s.splitlines()
 for i,line in enumerate(lines):
  if line.startswith('theorem template_fast_data_'):
   lines[i]=line.replace(':= by decide +kernel',':= by\n  rw [top_int_fastM673]\n  decide +kernel')
 Path(f'research/MarkovTemplateFastC{c}M673.lean').write_text('\n'.join(lines)+'\n')
p=Path('research/MarkovMiddleClosedM673.lean');s=p.read_text()
for c in range(5,16):s=s.replace(f'import MarkovTemplateC{c}M673',f'import MarkovTemplateFastC{c}M673').replace(f'template_strong_{c}M673',f'template_fast_strong_{c}M673')
p.write_text(s)
