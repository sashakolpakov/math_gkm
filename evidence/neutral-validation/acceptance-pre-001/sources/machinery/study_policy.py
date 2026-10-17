"""Explicit hypotheses and bounded episodes. Audit data has no input channel here."""
from .study_common import Invalid, digest, inside, sha
from . import study_program
from .study_bridge import OBLIGATIONS

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
            'use_links': [], 'pending_policy': None, 'observations': [],
            'program': study_program.REFERENCE, 'pending_program': None,
            'knowledge': {}, 'components': {}, 'remaining_obligations': {},
            'formal_obligations': OBLIGATIONS, 'episode_history': []}

def request(state, round_index, protocol, role='researcher'):
    # Explicit projection: never serialize the full controller state or audit tree.
    projected = {'role': role, 'round': round_index, 'policy': state['policy'],
        'mode': state['mode'], 'agenda': state['agenda'],
        'portfolio': list(state['portfolio'].values()), 'episode': state['episode'],
        'observations': state['observations'][-8:],
        'knowledge': state.get('knowledge', {}), 'components': state.get('components', {}),
        'remaining_obligations': state.get('remaining_obligations', {}),
        'formal_obligations': state.get('formal_obligations', OBLIGATIONS),
        'delayed_use_links': state['use_links'],
        'limits': {k: protocol[k] for k in ('rounds', 'episode_rounds', 'invention_rounds', 'call_seconds', 'knowledge_checks_per_round', 'validation_seconds')},
        'status': 'experimental; no certified continuation improvement'}
    projected['limits']['knowledge_counting'] = 'Aggregate entries across mathematical_claims, reductions, attachments, representations and fiber_gluings; repeated accepted identities count before skipping. Over-limit reports are rejected in full before checking.'
    projected['limits']['validation_scope'] = 'Per knowledge proposal validation timeout; separate exact-root completion timeout of validation_seconds. Episode reserves research, paired evaluation and reviewer/selector calls before execution.'
    return study_program.execute(state.get('program', study_program.REFERENCE), projected)

def record(state, report, workspace, round_index, protocol, *, prospective=None):
    if prospective is not None:
        validate_execution(prospective, report)
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
            if episode is not None:
                state.setdefault('episode_history', []).append(episode)
            horizon = min(protocol['episode_rounds'], protocol['rounds'] - round_index)
            episode = {'start': round_index, 'review_round': round_index + horizon - 1,
                'continuation_rounds': horizon, 'invention_used': 0,
                'hypothesis': trial['hypothesis'], 'status': 'usefulness_not_demonstrated'}
            state['episode'] = episode
        if trial.get('invention') and prospective is None:
            if episode['invention_used'] >= protocol['invention_rounds']:
                raise Invalid('bounded invention allowance exhausted')
            episode['invention_used'] += 1
        elif not trial.get('invention'):
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
        if state['mode'] != 'baseline':
            state['pending_policy'] = {'policy': proposal, 'hash': digest(proposal), 'proposed_round': round_index}
    executable = report.get('executable_proposal')
    if executable is not None:
        candidate = study_program.proposal(executable, round_index)
        if state['mode'] != 'baseline':
            state['pending_program'] = candidate
    state['agenda'] = report['agenda']
    state['observations'].append({'round': round_index, 'evidence': evidence,
                                  'summary': report.get('summary', ''), 'class': 'unverified_research_report'})


def commit(state, report, workspace, round_index, protocol):
    """Construct full commitment before action effects; no retrospective edits."""
    import copy
    staged = copy.deepcopy(state)
    record(staged, report, workspace, round_index, protocol)
    candidates = staged['portfolio'] if state['mode'] != 'baseline' else {h['id']: h for h in report.get('hypotheses', [])}
    if report.get('trial', {}).get('hypothesis') not in candidates:
        raise Invalid('prospective action must identify its explicit claim')
    selected = candidates[report['trial']['hypothesis']]
    if not selected.get('uncertainty') or len(selected.get('outcomes', [])) < 2:
        raise Invalid('prospective uncertainty and alternative outcome checks required')
    if not all(set(o) == {'check', 'changes_next_choice'} and all(isinstance(v, str) and v for v in o.values())
               for o in selected['outcomes']):
        raise Invalid('prospective outcome checks and decision consequences must be explicit')
    fixed = ('id', 'kind', 'claim', 'uncertainty', 'outcomes')
    commitment = {'schema': 'math-gkm.prospective.v3', 'round': round_index,
        'trial': copy.deepcopy(report['trial']),
        'selected': {k: copy.deepcopy(selected[k]) for k in fixed},
        'alternatives': [{k: copy.deepcopy(h[k]) for k in fixed}
                         for h in candidates.values() if h['id'] != selected['id']],
        'episode': copy.deepcopy(staged['episode']),
        'resource_reservation_seconds': protocol['call_seconds'],
        'continuation_envelope': {'rounds': max(1, (staged.get('episode') or {}).get('review_round', round_index)-round_index+1),
            'seconds_per_round': 2*protocol['call_seconds'] + protocol.get('knowledge_checks_per_round', 6)*protocol['validation_seconds'],
            'validation_limit_each_round': protocol.get('knowledge_checks_per_round', 6),
            'semantics': 'prepaid research and validation caps; operational protocol wall separately bounded and measured'},
        'state_binding': digest(state), 'program_hash': digest(staged['program'])}
    return staged, commitment


def validate_execution(commitment, report):
    if report.get('trial') != commitment['trial']:
        raise Invalid('executed trial differs from prospective commitment')
    hypotheses = {h['id']: h for h in report.get('hypotheses', [])}
    h = hypotheses.get(commitment['selected']['id'])
    if h is None or any(h.get(k) != v for k, v in commitment['selected'].items()):
        raise Invalid('claim, uncertainty or outcome consequences changed after commitment')
    for alternative in commitment['alternatives']:
        actual = hypotheses.get(alternative['id'])
        if actual is not None and any(actual.get(k) != v for k, v in alternative.items()):
            raise Invalid('committed alternative changed retrospectively')
    if report.get('prospective_binding') != digest(commitment):
        raise Invalid('execution does not bind the full prospective plan')


def finish_episode(state, round_index, review):
    episode = state.get('episode')
    if episode is not None:
        if round_index-1 < episode['review_round']:
            raise Invalid('premature episode review')
        episode['review'] = review
        episode['status'] = 'reviewed; delayed use remains observable'

COMMON = '''Read MISSION.md, docs/DESIGN.md and contract.json. The active versioned contract supplies the exact task and permitted assumptions. Follow its phase; do not start a different campaign. Historical campaigns are not rerun or inherited. Choose your own mathematical actions: literature, experiments using installed Python/Sage/GAP, representations, conjectures, proofs or refutations, typed attachments, strategy and executable request-program proposals. Missing tools are capability failures. A finite-budget failure is not unprovability. Do not use complexity, description length, compression or derived proxies in decisions. Never invoke another LLM, Codex, controllers or background processes. Do not access other workspaces, evaluation answers, audit records, Git, archives or credentials. No network shell, downloads, package updates, publication or messaging. Use .scratch for temporary files, pinned dependencies and /opt/homebrew/bin/python3. No sorry, admit, axioms or native_decide. Reports do not certify proofs. Checkpoint in research/ with unique names. Use existing artifacts; keep failed attempts. No supervisor supplies mathematical advice.'''

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
                 'Baseline keeps a single agenda and need not retain competing hypotheses; still explicitly commit its selected claim and outcome checks. '
                 'No execution or invented success. Proposed policy/program changes are experimental candidates.')
    elif req['role'] == 'researcher':
        extra = ('Execute the committed_trial in this request. Its hypotheses/outcomes were recorded by a separate proposer before this call. '
                 'Return the same trial identity and hypothesis claims, with actual evidence and updated status. A bounded invention round may precede a formal root reduction. '
                 'Echo prospective_binding exactly. Honor episode horizons; delayed usefulness is distinct from refutation. '
                 'Baseline keeps its incumbent single-agenda policy; changes are logged but not installed. '
                 'Policy/program changes are proposals for equal-budget trials. Submit mathematical_claims, attachments, representations or reductions using the typed schemas in the request.')
    else:
        extra = ('Independent reviewer: inspect actual supplied source snapshots, process receipts and checked outcomes. '
                 'Separate mathematical correctness, scope, transfer and costs. Praise or research self-reports are not evidence. '
                 'Cite artifact hashes in findings. Do not perform new research or invent retrospective holdout tasks.'
                 if req['role'] == 'reviewer' else
                 'Independent selector: consume actual checked comparison records and reviewer findings. Choose incumbent or candidate '
                 'only with cited records; unknown/failed validation cannot authorize a change. No universal score or theorem count. '
                 'A selected change is experimental, never a certified switch.')
    return COMMON + '\n' + extra + '''\nThe output envelope has request_id and payload_json (a JSON-encoded object).
Researcher payload: {agenda:[strings], summary:string, hypotheses:[{id,kind,claim,uncertainty,outcomes:[{check,changes_next_choice}],status,reason,evidence:[paths]}], evidence:[{path,sha256,kind}], trial:{hypothesis,invention}, prospective_binding:request.prospective_binding, use_links:[{artifact,consumer,claim}], policy_proposal:null or {search,memory,allocation,reassessment}, executable_proposal:null or {schema:"math-gkm.request-program.v1",code:[instructions]}, mathematical_claims:[], attachments:[], representations:[], reductions:[], completion:null or {kind,module,declaration,correspondence}}. Executable instructions: reverse_agenda, reverse_portfolio; rotate_agenda/keep_observations with integer n; if_open_obligations with then/else instruction lists. These cannot edit admission, contract, costs or authority.
Reviewer payload: {findings:[{path,sha256,finding}], correctness,scope,transfer,costs,recommendation}.
Selector payload: {choice:"incumbent" or "candidate",reason,evidence:[{path,sha256}]}.
REQUEST:\n''' + __import__('json').dumps(req, indent=2)
