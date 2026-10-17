"""Machine-authored final local evidence assembly; no controller mutation."""
from finish_f8d0715b import R,O,sha,validate,finish
import json,hashlib
mods=[f'MarkovMiddleSecondC{c}MF8D' for c in range(9,16)]+[
 'MarkovMiddleRationalMF8D','MarkovMiddleTotalC5MF8D',
 'MarkovMiddleSecondExceptionsMF8D','MarkovMiddleSecondSourceMF8D',
 'MarkovMiddleSecondAllMF8D','MarkovMiddleFiveResidualMF8D']
if __name__=='__main__':
 v=validate(mods)
 records=[(p,json.loads(p.read_text())) for p in O.glob('build-*.json')]
 failed=[dict(receipt=str(p.relative_to(R)),modules=d['modules'],timeout=d.get('timeout',False),returncode=d.get('returncode'),seconds=d['seconds']) for p,d in records if d.get('returncode')!=0]
 (O/'failed-build-index.json').write_text(json.dumps(failed,indent=2))
 draftnames=['MarkovMiddleTotalC6MF8D','MarkovMiddleTotalC7MF8D',
  'MarkovMiddleTotalC8MF8D','MarkovMiddleTotalC9MF8D',
  'MarkovMiddleTotalSourceMF8D','MarkovMiddleRemainingMF8D']
 (O/'unaccepted-drafts.json').write_text(json.dumps(dict(sources={m:sha(R/'research'/f'{m}.lean') for m in draftnames},reason='Four candidate certificate modules have only timeout receipts; two dependent attachment drafts were not built. None is included in validation.json.'),indent=2))
 idx=json.loads((R/'.control/markov/inherited.json').read_text())
 bindings={k:sha(R/k)==v['sha256'] for k,v in idx.items()}
 contract=json.loads((R/'.control/markov/contract.json').read_text())
 ch=hashlib.sha256(json.dumps(contract,sort_keys=True,separators=(',',':')).encode()).hexdigest()
 assert ch=='6dda768a25577c126e6b98a9fb645837f77bdee3ea3a6e5ef5f2937438c2eefc'
 assert sha(R/'MathGKM/Markov.lean')=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
 assert all(bindings.values())
 (O/'final-bindings.json').write_text(json.dumps(dict(inherited=bindings,canonical_contract_sha256=ch,root_sha256=sha(R/'MathGKM/Markov.lean'),validation_sha256=sha(O/'validation.json'),completion=None),indent=2))
 finish()
 print(json.dumps(dict(modules=len(mods),closures=v['theorem_closures'],failed_builds=len(failed),completion=None)))
