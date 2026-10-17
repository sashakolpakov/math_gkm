"""Explicit hypotheses and bounded episodes. Audit data has no input channel here."""
from .study_common import Invalid, digest, inside, sha

BASELINE = {'search': 'single revisable agenda; choose and execute next useful action',
            'memory': 'latest eight observations and full own retained history',
            'allocation': 'one bounded research invocation per round',
            'reassessment': 'revise agenda from observed results; no forced portfolio'}
EXPLORATION = {'search': 'retain competing obstacle, capability and strategy hypotheses',
               'memory': 'retain alternatives, evidence and reasons; consult own history',
               'allocation': 'consequential uncertainty trials and bounded invention episodes',
               'reassessment': 'review at committed episode horizon; permit delayed benefit'}

def validate_policy(policy):
    if set(policy) != set(BASELINE) or not all(isinstance(x, str) and 0 < len(x) <= 2000 for x in policy.values()):
        raise Invalid('policy changes may only change search/memory/allocation/reassessment guidance')

def initial(mode):
    return {'mode': mode, 'policy': BASELINE if mode == 'baseline' else EXPLORATION,
            'portfolio': {}, 'agenda': [], 'episode': None, 'decisions': [],
            'use_links': [], 'pending_policy': None, 'observations': []}

def request(state, round_index, protocol, role='researcher'):
    # Explicit projection: never serialize the full controller state or audit tree.
    return {'role': role, 'round': round_index, 'policy': state['policy'],
        'mode': state['mode'], 'agenda': state['agenda'],
        'portfolio': list(state['portfolio'].values()), 'episode': state['episode'],
        'observations': state['observations'][-8:],
        'limits': {k: protocol[k] for k in ('rounds', 'episode_rounds', 'invention_rounds', 'call_seconds')},
        'status': 'experimental; no certified continuation improvement'}

def record(state, report, workspace, round_index, protocol):
    if not isinstance(report.get('agenda'), list) or not all(isinstance(x, str) for x in report['agenda']):
        raise Invalid('agenda must be a list of strings')
    evidence = []
    for item in report.get('evidence', []):
        p = inside(workspace, item['path'])
        if not p.is_file() or sha(p) != item['sha256']:
            raise Invalid('evidence path/hash mismatch')
        if item['kind'] not in ('experiment', 'source', 'representation', 'proof_candidate', 'capability_failure'):
            raise Invalid('reports cannot self-certify a theorem')
        evidence.append(item)
    if state['mode'] != 'baseline':
        alternatives = report.get('hypotheses', [])
        if not state['portfolio'] and len(alternatives) < 2:
            raise Invalid('initial portfolio must retain competing hypotheses')
        for h in alternatives:
            if set(h) != {'id', 'kind', 'claim', 'uncertainty', 'outcomes', 'status', 'reason', 'evidence'}:
                raise Invalid('hypothesis fields invalid')
            if h['kind'] not in ('obstacle', 'capability', 'strategy') or h['status'] not in (
                    'open', 'supported_exploratorily', 'usefulness_not_demonstrated', 'refuted_by_evidence'):
                raise Invalid('invalid hypothesis category/status')
            if not h['claim'] or not h['reason']:
                raise Invalid('hypothesis needs claim and decision reason')
            if any(ref not in [e['path'] for e in evidence] for ref in h['evidence']):
                raise Invalid('hypothesis evidence not bound to actual artifacts')
            previous = state['portfolio'].get(h['id'])
            if previous and (previous['claim'], previous['kind']) != (h['claim'], h['kind']):
                raise Invalid('changed hypotheses require a new identity')
            state['portfolio'][h['id']] = h
        trial = report.get('trial')
        if not trial or trial.get('hypothesis') not in state['portfolio']:
            raise Invalid('trial must select a retained hypothesis')
        episode = state['episode']
        if episode is None or round_index > episode['review_round']:
            horizon = min(protocol['episode_rounds'], protocol['rounds'] - round_index)
            episode = {'start': round_index, 'review_round': round_index + horizon - 1,
                'continuation_rounds': horizon, 'invention_used': 0,
                'hypothesis': trial['hypothesis'], 'status': 'usefulness_not_demonstrated'}
            state['episode'] = episode
        if trial.get('invention'):
            if episode['invention_used'] >= protocol['invention_rounds']:
                raise Invalid('bounded invention allowance exhausted')
            episode['invention_used'] += 1
        else:
            h = state['portfolio'][trial['hypothesis']]
            if not h['uncertainty'] or len(h['outcomes']) < 2 or not all(
                    set(o) == {'check', 'changes_next_choice'} and all(o.values()) for o in h['outcomes']):
                raise Invalid('exploratory trial requires consequential, prospective checkable outcomes')
        state['decisions'].append({'round': round_index, 'trial': trial, 'evidence': evidence,
                                  'review_round': episode['review_round']})
    for link in report.get('use_links', []):
        if set(link) != {'artifact', 'consumer', 'claim'}:
            raise Invalid('invalid use link')
        for field in ('artifact', 'consumer'):
            if not inside(workspace, link[field]).is_file():
                raise Invalid('missing artifact-use endpoint')
        state['use_links'].append({**link, 'status': 'reported_use_pending_checked_interface'})
    proposal = report.get('policy_proposal')
    if proposal is not None:
        validate_policy(proposal)
        state['pending_policy'] = {'policy': proposal, 'hash': digest(proposal), 'proposed_round': round_index}
    state['agenda'] = report['agenda']
    state['observations'].append({'round': round_index, 'evidence': evidence,
                                  'summary': report.get('summary', ''), 'class': 'unverified_research_report'})

COMMON = '''Read MISSION.md, docs/DESIGN.md and contract.json. These supply principles and the exact target, not historical results. Construction and Agoh were historical; no proofs or agendas from them are supplied. Begin from the target definitions. This is a user-authorized experimental research study. Preserve the full published target, raw coefficients, zeros, endpoints, directions, allowed axioms and correspondence obligations. Choose your own mathematical actions: literature, experiments, representations, proof or refutation. A finite-budget failure is not unprovability. Do not use complexity, description length, compression or derived proxies in decisions. Never invoke another LLM, Codex, controllers or background processes. Do not access other workspaces, evaluation answers, audit records, Git, archives or credentials. No network shell, downloads, package updates, publication or messaging. Use .scratch for temporary files, pinned dependencies and /opt/homebrew/bin/python3. No sorry, admit, axioms or native_decide. Reports do not certify proofs. Checkpoint in research/ with unique names. Use existing artifacts; keep failed attempts. No supervisor supplies mathematical advice.'''

def prompt(req):
    if req['role'] == 'proposer':
        extra = ('Plan the next bounded trial BEFORE execution. You have read-only access to own mathematical artifacts. '
                 'Generate/retain competing explicit obstacle, capability and strategy hypotheses, not a prescribed math recipe. '
                 'Return agenda, summary, hypotheses, evidence, trial, use_links, policy_proposal and completion (null). '
                 'Each hypothesis has id, kind (obstacle/capability/strategy), claim, uncertainty, outcomes '
                 '(list of {check, changes_next_choice}), status (open/supported_exploratorily/usefulness_not_demonstrated/refuted_by_evidence), '
                 'reason, evidence (artifact paths). trial has hypothesis and invention boolean. Evidence entries have path, sha256, '
                 'kind (experiment/source/representation/proof_candidate/capability_failure). '
                 'Commit alternative observable outcomes and what changes next; invention is bounded by the episode. '
                 'Propose only guidance changes in search/memory/allocation/reassessment. No execution or invented success.')
    elif req['role'] == 'researcher':
        extra = ('Continue the single revisable agenda. Execute a bounded research action, record observations and revise agenda. '
                 'This reproduces the legacy single-worker agenda policy with empty initial history.' if req['mode'] == 'baseline' else
                 'Execute the committed_trial in this request. Its hypotheses/outcomes were recorded by a separate proposer before this call. '
                 'Return the same trial identity and hypothesis claims, with actual evidence and updated status. A bounded invention round may precede a formal root reduction. '
                 'Honor episode horizons; delayed usefulness is distinct from refutation. Policy changes are proposals for equal-budget trials.')
    else:
        extra = ('Independent reviewer: inspect actual supplied source snapshots, process receipts and checked outcomes. '
                 'Separate mathematical correctness, scope, transfer and costs. Praise or research self-reports are not evidence. '
                 'Cite artifact hashes in findings. Do not perform new research or invent retrospective holdout tasks.'
                 if req['role'] == 'reviewer' else
                 'Independent selector: consume actual checked comparison records and reviewer findings. Choose incumbent or candidate '
                 'only with cited records; unknown/failed validation cannot authorize a change. No universal score or theorem count. '
                 'A selected change is experimental, never a certified switch.')
    return COMMON + '\n' + extra + '''\nThe output envelope has request_id and payload_json (a JSON-encoded object).
Researcher payload: {agenda:[strings], summary:string, hypotheses:[{id,kind,claim,uncertainty,outcomes:[{check,changes_next_choice}],status,reason,evidence:[paths]}], evidence:[{path,sha256,kind}], trial:{hypothesis,invention}, use_links:[{artifact,consumer,claim}], policy_proposal:null or {search,memory,allocation,reassessment}, completion:null or {kind,module,declaration,correspondence}}. Baseline may return empty hypotheses and null trial.
Reviewer payload: {findings:[{path,sha256,finding}], correctness,scope,transfer,costs,recommendation}.
Selector payload: {choice:"incumbent" or "candidate",reason,evidence:[{path,sha256}]}.
REQUEST:\n''' + __import__('json').dumps(req, indent=2)
