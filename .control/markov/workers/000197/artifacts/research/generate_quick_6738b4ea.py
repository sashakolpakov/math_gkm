"""Machine-authored certificate attempt avoiding rewrite's closing reduction."""
from pathlib import Path
for c in range(10,16):
 s=Path(f'research/MarkovTemplateC{c}M673.lean').read_text()
 s=s.replace('import MarkovTemplateIntegerM673','import MarkovTemplateFastM673')
 s=s.replace('templateData','templateQuickData').replace('template_data_','template_quick_data_').replace('template_certificate_','template_quick_certificate_').replace('template_strong_','template_quick_strong_')
 lines=s.splitlines()
 for i,line in enumerate(lines):
  if line.startswith('theorem template_quick_data_'):
   j=int(line.split('template_quick_data_')[1].split('M673')[0].split('_')[1])
   lines[i]=line.replace(':= by decide +kernel',f':=\n  (congrArg exprDenseM673 (top_int_fastM673 {c+2} {j})).trans (by decide +kernel)')
 Path(f'research/MarkovTemplateQuickC{c}M673.lean').write_text('\n'.join(lines)+'\n')
