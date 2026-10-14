"""Machine-authored receipt index, not an independent completion audit."""
import hashlib,json,pathlib,re,time
root=pathlib.Path('/Users/sasha/math_gkm'); out=root/'evidence/markov-02592c7b'
modules=['MarkovVerticalRamp025','MarkovVerticalPoly025','MarkovVerticalJet025',
         'MarkovVerticalSource025','MarkovVerticalBlocks025','MarkovVerticalRun025']
records=[(p,json.loads(p.read_text())) for p in sorted(out.glob('run-*.json'))]
validated=[]
for module in modules:
    source=root/'research'/f'{module}.lean'
    digest=hashlib.sha256(source.read_bytes()).hexdigest()
    successful=[(p,d) for p,d in records if d.get('returncode')==0
                and d['source']==str(source.relative_to(root)) and d['sha256']==digest]
    builds=[(p,d) for p,d in successful if pathlib.Path(d['command'][0]).name=='lean']
    replays=[(p,d) for p,d in successful if pathlib.Path(d['command'][0]).name=='leanchecker']
    assert builds and replays,module
    p,d=builds[-1]
    axioms=re.findall(r'depends on axioms: \[([^\]]*)\]',d['stdout'])
    assert axioms and all(set(x.strip() for x in line.split(','))<=
        {'propext','Classical.choice','Quot.sound'} for line in axioms),module
    assert not re.search(r'\b(sorry|admit|axiom|native_decide)\b',source.read_text()),module
    validated.append(dict(module=module,sha256=digest,build=str(p.relative_to(root)),
        replay=str(replays[-1][0].relative_to(root)),axiom_reports=axioms))
root_hash=hashlib.sha256((root/'MathGKM/Markov.lean').read_bytes()).hexdigest()
assert root_hash=='8b8408e5cae9822fe0969afd4a70b408d48e69f750dffb88c253dba8ef167dbe'
validation=dict(status='named-module compilation and kernel replay passed',modules=validated,
    root_sha256=root_hash,independent_completion_audit=False,
    limitation='Inherited compiled imports; not a full fresh source graph rebuild',
    rejected_attempts=[str(p.relative_to(root)) for p,d in records if d.get('returncode')!=0])
vp=out/f'validation-{time.time_ns()}.json'; vp.write_text(json.dumps(validation,indent=2)+'\n')
report=dict(request_id='02592c7b8f3c40b1a93a75e7a7278494',
    summary='Established checked first-vertical-row proof components and exact source block/jet bridges. Full published Conjecture 6.3 remains unresolved.',
    actions=[
      'Read required documents and audits; reconciled prior completed status in research/markov-02592c7b-checkpoint.md.',
      'Proved variable-length residual CrossLC, binomial smoothing and conditional raw vertical transfer: research/MarkovVerticalRamp025.lean and research/MarkovVerticalPoly025.lean.',
      'Proved exact source matrix-jet transport, adjacent-run block decomposition and explicit single-block jets: research/MarkovVerticalSource025.lean, research/MarkovVerticalBlocks025.lean and research/MarkovVerticalRun025.lean.',
      'Compiled and kernel-replayed six new modules; '+str(vp.relative_to(root))+'.',
      'Executed exact source-recurrence formula checks and documented the remaining assembly in research/markov-02592c7b-mathematics.md.'],
    observations=[
      'The candidate i=1 formula matched all 561 source fractions tested with a>=3 and b<=45; evidence/markov-02592c7b/vertical-formula.json. This is finite evidence only.',
      'The residual inequality is universal in its parameters, but the final source formula assembly and a=1,2 transfer remain open. No unconditional new vertical-row inequality is claimed.',
      'All successful printed axiom closures use only permitted axioms. Rejected attempts are preserved; validation uses inherited compiled imports.',
      'The pinned root is unchanged. Remaining correspondence obligations: research/markov-02592c7b-correspondence.md. Operational limitations: evidence/markov-02592c7b/operational-observations.json.'],
    agenda=[
      'Assemble the checked two-run jets and additive statistic into the first-vertical source formula, identifying block counts with a,b and q=floor(b/a).',
      'Discharge the explicit formula premise of vertical_one_of_formula025 and handle a=1,2 separately.',
      'Resolve every remaining universal direction and retain independent hash-bound source/English completion auditing.'],
    completion=None)
(out/'report.json').write_text(json.dumps(report,indent=2)+'\n')
p=root/'research/markov-02592c7b-checkpoint.md'
p.write_text(p.read_text()+'\nFinal checkpoint: six modules compiled and passed kernel replay. '+
    str(vp.relative_to(root))+'. '+str(len(validation['rejected_attempts']))+
    ' rejected attempts retained. Root unchanged; no completion or independent full-source audit claimed. '+
    'All foreground sessions completed. Full report: evidence/markov-02592c7b/report.json.\n')
print(json.dumps(dict(validation=str(vp.relative_to(root)),modules=len(validated),
    rejected=len(validation['rejected_attempts']),report='evidence/markov-02592c7b/report.json')))
