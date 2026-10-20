"""Independent pre-trial obligation selection. Never reads an arm or prior run.

Run explicitly after review, before study freeze. Builder tests use only fixture.
Curation cost is common study setup overhead, not free research for either arm.
"""
import argparse
import json
from pathlib import Path
import shutil
import subprocess
import time
from .study_common import ROOT, PYTHON, SEED, Invalid, write, read, clean_contract, copy_seed, canonical, authorize_live, sha, digest,validate_model,MODELS,REASONING_EFFORT
from .study import validate_suite

PROMPT = '''You are an independent pre-trial structural-obligation selector. No research trial has run and you have no trial artifacts or answers. Read contract.json and the exact clean target sources. Select a small fixed suite of structural obligations for testing future reusable mathematical interfaces, with exact hypotheses, source binding, scope and transport requirements. The supervisor supplies no mathematical strategy. Do not solve these obligations, supply answers, impose a proof recipe, or consult other workspaces. No nested models, package downloads, Git or old research. Read-only pinned dependencies are available. Your selection precedes both arms and must be retained even when unfavorable. A suite may be empty if no defensible independent obligations can be chosen; say so honestly.
Return envelope {request_id, payload_json}; payload_json encodes {suite: {schema:"math-gkm.suite.v2",selector:string,selection_basis:string,independent:true,tasks:[{id:string,statement:Lean proposition string,hypotheses:[explicit Lean binder strings],scope:string,source_sha256:exact root SHA256,kind:"holdout" or "regression",interface_type:Lean type string,transport_type:Lean proposition string,required_constants:[Lean names]}]}}. No answers. Required constants can constrain genuinely expected component interfaces, but impossible future names risk a useless benchmark; make that limitation explicit. Scope is reviewed judgment, not a proof that tasks characterize root difficulty. No model praise constitutes transfer evidence.'''

def validate_task_limits(value=None):
    """Optional size-only control; never chooses or drops mathematics."""
    if value is None:
        return None
    if (not isinstance(value, dict) or set(value) != {'holdout', 'regression'} or
        any(type(n) is not int or not 0 <= n <= 16 for n in value.values()) or
        sum(value.values()) < 1):
        raise Invalid('curator task limits require explicit bounded holdout/regression counts')
    return dict(value)


def task_limits_prompt(task_limits=None):
    value = validate_task_limits(task_limits)
    if value is None:
        return ''
    return ('\nSize constraint only: choose at most '+str(value['holdout'])+
        ' holdout obligations and at most '+str(value['regression'])+
        ' regression obligations. Select the mathematics independently; these '+
        'are upper bounds, not quotas. An empty suite remains permitted. '+
        'An overfull output is retained and rejected as a whole, never truncated.\n')


def check_task_limits(suite, task_limits=None):
    value = validate_task_limits(task_limits)
    if value is None:
        return
    counts = {kind: sum(t['kind'] == kind for t in suite['tasks']) for kind in value}
    if any(counts[kind] > limit for kind, limit in value.items()):
        raise Invalid('curator exceeded task-count bound; complete output retained, never truncated')


def curate(directory, transport, seconds, contract=None, *, model='gpt-6.1-sol', task_limits=None):
    validate_model(model)
    task_limits = validate_task_limits(task_limits)
    if not directory.resolve().is_relative_to(ROOT) or directory.exists() or not 1 <= seconds <= 1800:
        raise Invalid('fresh local curation directory and bounded seconds required')
    directory.mkdir(parents=True)
    contract = contract or clean_contract()
    if transport == 'live':
        authorize_live(contract)
    seed = directory/'seed'
    seed.mkdir()
    seed_files = [x for x in SEED if x != 'MathGKM/Markov.lean'] + [contract['root_file'],
        'MathGKM/ResearchSemantics.lean', 'MathGKM/ContinuationObligations.lean'] + contract.get('seed_sources', [])
    for name in seed_files:
        target = seed/name
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(ROOT/name, target)
    write(seed/'contract.json', contract)
    write(seed/'seed-files.json', seed_files)
    ws = directory/'workspace'
    copy_seed(seed, ws)
    job = directory/'job'
    write(job/'spec.json', {'request_id': 'independent-curation', 'workspace': str(ws),
        'role': 'curator', 'transport': transport, 'model': model, 'reasoning_effort':REASONING_EFFORT,'provider': 'codex-configured-provider',
        'usage_semantics': 'unverified_raw_only', 'readonly': True, 'seconds': seconds,
        'output_bytes': 2097152, 'stop': str(directory/'STOP.json')})
    write(job/'request.json', {'role': 'curator', 'request_id': 'independent-curation',
                               'task_limits': task_limits})
    (job/'prompt.txt').write_text(PROMPT+task_limits_prompt(task_limits)+'\nrequest_id=independent-curation\n')
    # The watchdog owns the heavy lease; this parent observer must not reserve
    # it again. Bound stdout, descendants and common curation job disk growth.
    from .process import run
    import os
    launch=run([PYTHON,'-m','machinery.study_worker',str(job)],cwd=ROOT,
        env={**os.environ,'TMPDIR':str(directory),'PATH':'/opt/homebrew/bin:/Users/sasha/.elan/bin:/usr/bin:/bin'},
        timeout=min(1800,seconds+5),output_bytes=1048576,scope=directory,tree_only=True,
        log_path=directory/'watchdog.log')
    write(directory/'watchdog-launch.json',launch)
    if launch['returncode'] or launch['termination']: raise Invalid('curation watchdog incomplete; raw receipt retained')
    result = read(job/'receipt.json')
    if result['outcome'] != 'completed':
        raise Invalid('curation failed within its budget; no suite frozen')
    suite = result['payload']['suite']
    validate_suite(suite, contract)
    check_task_limits(suite, task_limits)
    write(directory/'suite.json', suite)
    write(directory/'provenance.json', {'role': 'independent_pretrial_selector', 'receipt': str(job/'receipt.json'),
        'model':model,'reasoning_effort':REASONING_EFFORT,'transport':transport,
        'task_limits': task_limits,
        'receipt_sha256': sha(job/'receipt.json'), 'suite_sha256': digest(suite),
        'elapsed_seconds': result['elapsed_seconds'], 'usage_raw': result['usage_raw'],
        'accounting': 'common setup overhead, disclosed separately; each arm has the same later allowance',
        'independence_limit': 'process/input separation; no statistical independence guarantee about the common model'})
    return {'suite': str(directory/'suite.json'), 'provenance': str(directory/'provenance.json')}

if __name__ == '__main__':
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument('--out', type=Path, required=True)
    p.add_argument('--transport', choices=['fixture', 'live'], required=True)
    p.add_argument('--seconds', type=int, default=120)
    p.add_argument('--contract', type=Path)
    p.add_argument('--model',choices=MODELS,required=True)
    a = p.parse_args()
    print(canonical(curate(a.out.resolve(), a.transport, a.seconds, read(a.contract) if a.contract else None,model=a.model)))
