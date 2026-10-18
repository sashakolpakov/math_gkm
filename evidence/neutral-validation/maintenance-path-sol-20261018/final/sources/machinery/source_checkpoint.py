"""STATIC only: parse sources, inventory symbols/imports, hash files. No imports
of machinery, test execution, compilation, role invocation or study activation."""
import ast
import hashlib
import json
from pathlib import Path
from datetime import datetime, timezone

root = Path.cwd()
out = root/'evidence/revision-static'
before = json.loads((out/'before.json').read_text())
paths = [p for folder in ('machinery','tests','MathGKM','docs','contracts','studies')
         for p in (root/folder).glob('*') if p.is_file() and p.suffix in ('.py','.lean','.md','.json')]
paths += [root/n for n in ('MISSION.md','lean-toolchain','lakefile.toml','lake-manifest.json')]
sources, errors = {}, []
for p in sorted(paths):
    name = str(p.relative_to(root))
    raw = p.read_bytes()
    info = {'sha256': hashlib.sha256(raw).hexdigest(), 'bytes': len(raw)}
    if p.suffix == '.py':
        try:
            tree = ast.parse(raw, filename=name)
            info['definitions'] = [{'name': n.name, 'line': n.lineno} for n in ast.walk(tree)
                                   if isinstance(n, (ast.FunctionDef, ast.ClassDef, ast.AsyncFunctionDef))]
            info['imports'] = [ast.unparse(n) for n in ast.walk(tree) if isinstance(n, (ast.Import,ast.ImportFrom))]
        except SyntaxError as exc:
            errors.append({'path': name, 'error': str(exc)})
    elif p.suffix == '.json':
        try:
            json.loads(raw)
        except ValueError as exc:
            errors.append({'path': name, 'error': str(exc)})
    info['change'] = 'unchanged' if before.get(name) == info['sha256'] else 'modified' if name in before else 'new'
    sources[name] = info
protected = ['MISSION.md','docs/DESIGN.md','MathGKM/Markov.lean','MathGKM/Protocol.lean',
             'contracts/markov-goal.json','contracts/markov-clean-v2.json','lean-toolchain','lakefile.toml','lake-manifest.json']
protected_records = {p: {'before':before[p], 'after':sources[p]['sha256'],
                          'unchanged':before[p] == sources[p]['sha256']} for p in protected}
record = {'schema':'math-gkm.static-source-audit.v1','generated_utc':datetime.now(timezone.utc).isoformat(),
          'validation':'NOT YET RUN on these bytes','method':'AST parsing and JSON parsing only; no code imports or execution',
          'errors':errors,'protected':protected_records,'sources':sources}
(out/'source-inventory.json').write_text(json.dumps(record,indent=2)+'\n')
(out/'checkpoint.json').write_text(json.dumps({
    'phase':'construction', 'status':'final source checkpoint; validation NOT YET RUN',
    'provenance':'independent Codex/gpt-6-astra builder; identity supplied by invocation',
    'started_utc':'2026-10-17T21:41:38Z', 'deadline_utc':'2026-10-17T22:11:38Z',
    'finished_static_utc':datetime.now(timezone.utc).isoformat(),
    'next':'independent supervisor source audit, then separately authorized validation',
    'markov':'stopped; explicit user OK after harness report still required'},indent=2)+'\n')
required = {name: info['sha256'] for name, info in sources.items()}
for p in sorted(out.glob('*.json')):
    if p.name != 'SOURCE_MANIFEST.json':
        required[str(p.relative_to(root))] = hashlib.sha256(p.read_bytes()).hexdigest()
for name in ('.bootstrap/supervisor-review/requirements.md', '.bootstrap/supervisor-review/feedback.md',
             '.bootstrap/base-permissions.json'):
    required[name] = hashlib.sha256((root/name).read_bytes()).hexdigest()
manifest = {'schema':'math-gkm.final-source-required-files.v1', 'phase':'construction',
    'validation':'NOT YET RUN', 'files_sha256':required,
    'protected_inputs':protected_records, 'static_parse_findings':errors,
    'requirement_mapping':'docs/REQUIREMENT_MAP.md',
    'report':'docs/HARNESS_CHECKPOINT.md', 'dispositions':'evidence/revision-static/dispositions.json',
    'designed_validation':'evidence/revision-static/test-plan.json',
    'self_hash':'stored separately in SOURCE_MANIFEST.sha256; manifest excludes itself and companion',
    'archive_requirement':'retain listed sources, tests, docs, pins and evidence; supplied .bootstrap files remain supervisor-owned inputs'}
manifest_path = out/'SOURCE_MANIFEST.json'
manifest_path.write_text(json.dumps(manifest,indent=2)+'\n')
manifest_hash = hashlib.sha256(manifest_path.read_bytes()).hexdigest()
(out/'SOURCE_MANIFEST.sha256').write_text(manifest_hash+'  SOURCE_MANIFEST.json\n')
print(json.dumps({'source_files':len(sources),'syntax_findings':errors,
                  'protected_unchanged':all(v['unchanged'] for v in protected_records.values()),
                  'validation':'NOT YET RUN'}))
print('SOURCE_MANIFEST_SHA256='+manifest_hash)
