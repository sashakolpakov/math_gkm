"""Explicit hypotheses and bounded episodes. Audit data has no input channel here."""
from .study_common import Invalid, digest, inside, sha
from . import study_program
from .study_bridge import OBLIGATIONS

BASELINE = {'search': 'single revisable agenda; choose and execute next useful action',
            'memory': 'latest eight observations and full own retained history',
            'allocation': 'one bounded research invocation per round',
            'reassessment': 'revise agenda from observed results; no forced portfolio'}

FINDING_REFERENCE_RULE = ('Expected an immutable HYPOTHESIS CONTENT REFERENCE in the exact staged portfolio, '
    'including retained historic versions and valid hypotheses staged from this report; '
    'not a source filename, hypothesis id or arbitrary hash. Use findings:[] when no hypothesis finding is reported.')

class FindingReferenceInvalid(Invalid):
    """Local schema failure; never carries submitted values or evaluator details."""
    def __init__(self, index):
        if type(index) is not int or not 0 <= index < 2**63:
            raise Invalid('invalid finding index')
        self.index = index
        super().__init__('finding references unknown immutable hypothesis')

def report_diagnostic(exc):
    """Allowlist one typed error; all unclassified failures keep generic feedback."""
    if type(exc) is FindingReferenceInvalid:
        return dict(code='finding_reference_not_staged', field=f'findings[{exc.index}].reference',
                    expected=FINDING_REFERENCE_RULE)
    return None
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
        'pending_discoveries': state.get('pending_discoveries', {}),
        'formal_obligations': state.get('formal_obligations', OBLIGATIONS),
        'delayed_use_links': state['use_links'],
        'proposition_dag': state.get('proposition_dag',{}), 'findings': state.get('findings',[]),
        'limits': {k: protocol[k] for k in ('rounds', 'episode_rounds', 'invention_rounds', 'call_seconds', 'knowledge_checks_per_round', 'validation_seconds')},
        'status': 'experimental; no certified continuation improvement'}
    projected['limits']['knowledge_counting'] = 'Aggregate entries across mathematical_claims, reductions, attachments, representations, fiber_gluings and compositions; repeated accepted identities count before skipping. Items within the cap are checked independently; later items are retained as not checked.'
    projected['limits']['validation_scope'] = 'Per knowledge proposal validation timeout; separate exact-root completion timeout of validation_seconds. Episode reserves research, paired evaluation and reviewer/selector calls before execution.'
    from .study_knowledge import SCHEMAS
    projected['checked_submission_schemas']=SCHEMAS
    projected['dag_submission_rules']='Use exact node ids/constants and original context modules. reductions target_id defaults to root; premises references existing nodes in order; residuals introduces fresh nodes after premises. Never rebind a known node. compositions requests a separately checked term through admitted edges, with every open leaf retained as an antecedent. Representation antecedents are nodes; connect them by a checked reduction. Graph status is planning information, never root completion or English/source approval.'
    return study_program.execute(state.get('program', study_program.REFERENCE), projected)

def record(state, report, workspace, round_index, protocol, *, prospective=None):
    if not isinstance(report,dict):
        raise Invalid('report must be an object')
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
    evidence_paths = {item['path'] for item in evidence}
    # Fixed predictions live under immutable identities; findings are separate.
    fixed=('id','kind','claim','uncertainty','outcomes')
    for h in report.get('hypotheses',[]):
        if not isinstance(h,dict) or any(k not in h for k in fixed):
            raise Invalid('hypothesis identity, claim and predictions required')
        if h['kind'] not in ('obstacle','capability','strategy') or not h['id'] or not h['claim']:
            raise Invalid('invalid hypothesis identity or kind')
        hypothesis_evidence = h.get('evidence', [])
        if not isinstance(hypothesis_evidence, list) or not all(
                isinstance(path, str) and path in evidence_paths for path in hypothesis_evidence):
            raise Invalid('hypothesis evidence not bound to actual artifacts')
        original=state['portfolio'].get(h['id'])
        core={k:h[k] for k in fixed}
        if original:
            if any(original[k]!=core[k] for k in fixed):
                raise Invalid('predictions immutable; create an explicit version descendant')
            if h.get('parent',original['parent'])!=original['parent'] or h.get('revision',original['revision'])!=original['revision']:
                raise Invalid('version ancestry immutable')
        else:
            parent=h.get('parent'); revision=h.get('revision',0)
            ancestors=[v for v in state['portfolio'].values() if v['reference']==parent]
            if (parent is None and revision!=0) or (parent is not None and (len(ancestors)!=1 or revision!=ancestors[0]['revision']+1)):
                raise Invalid('unknown parent or invalid hypothesis revision')
            version={**core,'parent':parent,'revision':revision}
            reference=digest(version)
            if h.get('reference',reference)!=reference: raise Invalid('hypothesis content hash mismatch')
            state['portfolio'][h['id']]={**version,'reference':reference}
        state.setdefault('findings',[]).append(dict(reference=state['portfolio'][h['id']]['reference'],round=round_index,
            status=h.get('status','open'),reason=h.get('reason',''),evidence=h.get('evidence',[])))
    trial=report.get('trial')
    consequential=report.get('work_kind','ordinary') in ('exploration','strategy')
    if consequential or trial:
        if not isinstance(trial,dict) or trial.get('hypothesis') not in state['portfolio']:
            raise Invalid('consequential experiment must select immutable hypothesis')
        selected=state['portfolio'][trial['hypothesis']]
        if not selected['uncertainty'] or len(selected['outcomes'])<2 or not all(
                isinstance(o,dict) and set(o)=={'check','changes_next_choice'} and all(isinstance(v,str) and v for v in o.values()) for o in selected['outcomes']):
            raise Invalid('consequential experiment needs discriminating outcomes and consequences')
        episode=state.get('episode')
        if episode is None or round_index>episode['review_round']:
            if episode: state.setdefault('episode_history',[]).append(episode)
            horizon=min(protocol['episode_rounds'],max(1,protocol['rounds']-round_index))
            episode=dict(start=round_index,review_round=round_index+horizon-1,continuation_rounds=horizon,
                         invention_used=0,hypothesis=selected['id'],status='usefulness_not_demonstrated')
            state['episode']=episode
        if trial.get('invention') and prospective is None:
            if episode['invention_used']>=protocol['invention_rounds']: raise Invalid('invention budget exhausted')
            episode['invention_used']+=1
        state['decisions'].append(dict(round=round_index,trial=trial,reference=selected['reference'],evidence=evidence))
    else:
        state['decisions'].append(dict(round=round_index,work_kind='ordinary',evidence=evidence))
    findings = report.get('findings', [])
    if not isinstance(findings, list):
        raise Invalid('findings must be a list')
    for index, finding in enumerate(findings):
        if not isinstance(finding, dict):
            raise Invalid('finding must be an object')
        if not isinstance(finding.get('reference'), str) or finding['reference'] not in {h['reference'] for h in state['portfolio'].values()}:
            raise FindingReferenceInvalid(index)
        state.setdefault('findings',[]).append({**finding,'round':round_index})
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
    trial=report.get('trial')
    candidates=staged['portfolio']
    selected=candidates[trial['hypothesis']] if trial else None
    fixed = ('id', 'kind', 'claim', 'uncertainty', 'outcomes')
    commitment = {'schema': 'math-gkm.prospective.v3', 'round': round_index,
        'trial': copy.deepcopy(trial), 'work_kind': report.get('work_kind','ordinary'),
        'selected_reference': selected['reference'] if selected else None,
        'selected': {k: copy.deepcopy(selected[k]) for k in fixed} if selected else None,
        'alternatives': [{k: copy.deepcopy(h[k]) for k in fixed}
                         for h in candidates.values() if selected and h['id'] != selected['id']],
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
    # A content-addressed reference replaces verbatim prediction prose.
    if commitment.get('selected_reference') and report.get('commitment_ref') != commitment['selected_reference']:
        hypotheses={h['id']:h for h in report.get('hypotheses',[])}
        actual=hypotheses.get(commitment['selected']['id'])
        if actual is None or any(actual.get(k)!=v for k,v in commitment['selected'].items()):
            raise Invalid('changed prediction or missing immutable commitment reference')
    if report.get('prospective_binding') != digest(commitment):
        raise Invalid('execution does not bind the full prospective plan')


def finish_episode(state, round_index, review):
    episode = state.get('episode')
    if episode is not None:
        # An executable strategy may request earlier reassessment; preserve the
        # original horizon and mark this as an interim review.
        if round_index-1 < episode['review_round']:
            episode.setdefault('interim_reviews',[]).append(dict(round=round_index,review=review))
            return
        episode['review'] = review
        episode['status'] = 'reviewed; delayed use remains observable'

COMMON = '''Read MISSION.md, docs/DESIGN.md and contract.json. The active versioned contract supplies the exact task and permitted assumptions. Follow its phase; do not start a different campaign. Historical campaigns are not rerun or inherited. Choose your own mathematical actions: literature, experiments using installed Python/Sage/GAP, representations, conjectures, proofs or refutations, typed attachments, strategy and executable request-program proposals. Missing tools are capability failures. A finite-budget failure is not unprovability. Do not use complexity, description length, compression or derived proxies in decisions. Use at most one Lean compiler at a time. Never invoke another LLM, Codex, controllers or background processes. Do not access other workspaces, evaluation answers, audit records, Git, archives or credentials. No network shell, downloads, package updates, publication or messaging. Use .scratch for temporary files, pinned dependencies and /opt/homebrew/bin/python3. No sorry, admit, axioms or native_decide. Reports do not certify proofs. Checkpoint in research/ with unique names. Use existing artifacts; keep failed attempts. No supervisor supplies mathematical advice.'''

def prompt(req):
    if req['role'] == 'proposer':
        extra = ('Plan the next bounded trial BEFORE execution. You have read-only access to own mathematical artifacts. '
                 'Ordinary proof exploitation is the default: trial:null and hypotheses:[] are valid. For consequential exploration/strategy experiments choose work_kind:exploration or strategy and precommit discriminating outcomes. '
                 'Return agenda, summary, hypotheses, evidence, trial, use_links, policy_proposal and completion (null). '
                 'Each hypothesis has id, kind (obstacle/capability/strategy), claim, uncertainty, outcomes '
                 '(list of {check, changes_next_choice}), status (open/supported_exploratorily/usefulness_not_demonstrated/refuted_by_evidence), '
                 'reason, evidence (artifact paths). trial has hypothesis and invention boolean. Evidence entries have path, sha256, '
                 'kind (experiment/source/representation/proof_candidate/capability_failure). '
                 'Commit alternative observable outcomes and what changes next; invention is bounded by the episode. '
                 'Hypothesis identities are immutable versions with parent reference, revision and content hash. Changed predictions require a new descendant. '
                 'No execution or invented success. Do not create research artifacts or endpoints while planning. '
                 'Describe intended future work and intended reuse in agenda, summary, hypothesis claims and outcome checks. '
                 'Future artifact paths may appear there as intentions, even when they do not exist yet. '
                 'Use use_links:[] when no existing reuse is being reported. '
                 'No prospective_binding is supplied to the proposer; the controller creates it after validating this plan. '
                 'Proposed policy/program changes are experimental candidates.')
    elif req['role'] == 'researcher':
        extra = ('Execute the committed_trial in this request. Its hypotheses/outcomes were recorded by a separate proposer before this call. '
                 'Return the same trial identity and commitment_ref from commitment.selected_reference, with findings separate from immutable predictions. Routine work needs no artificial hypotheses. '
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
    if req['role'] in ('proposer', 'researcher'):
        report_fields = '''agenda:[strings], summary:string, hypotheses:[{id,kind,claim,uncertainty,outcomes:[{check,changes_next_choice}],status,reason,evidence:[paths],parent?:null or hypothesis content reference,revision?:integer,reference?:exact version content hash}], evidence:[{path,sha256,kind}], trial:null or {hypothesis,invention}, work_kind:ordinary/exploration/strategy, findings:[{reference:immutable HYPOTHESIS CONTENT REFERENCE,observation,uncertainty}], commitment_ref:null or immutable hash, use_links:[{artifact,consumer,claim}], policy_proposal:null or {search,memory,allocation,reassessment}, executable_proposal:null or {schema:"math-gkm.request-program.v1",code:[instructions]}'''
        if req['role'] == 'proposer':
            schema = 'Proposer payload: {' + report_fields + ', completion:null}.'
        else:
            schema = 'Researcher payload: {' + report_fields + ', discovery_rechecks:[pending discovery bindings; charged within knowledge_checks_per_round], discovery_completion:null or pending completion binding, prospective_binding:request.prospective_binding, mathematical_claims:[], attachments:[], representations:[], reductions:[], fiber_gluings:[], completion:null or {kind,module,declaration,correspondence}}.'
        schema += '''
Hypothesis findings contract (both proposer and researcher): findings[i].reference must be an immutable HYPOTHESIS CONTENT REFERENCE in the exact staged portfolio, NOT a source filename, ordinary hypothesis id or arbitrary hash. Existing references are visible in request.portfolio; the researcher also receives commitment.selected_reference. Known retained historic/version references remain valid. Unknown references, including stale or changed references absent from that exact registry, are rejected. Valid new hypotheses are staged before explicit findings, so their exact deterministic content references are legal in the same report.
Version rules: id, kind, claim, uncertainty and outcomes form the immutable core. New root hypotheses default to parent:null and revision:0. A changed prediction needs a fresh id, parent equal to a known hypothesis content reference, and revision equal to that parent's revision plus one. Parents must already be in the portfolio or precede the child in hypotheses. The version hash is lowercase SHA256 of UTF-8 JSON for exactly {id,kind,claim,uncertainty,outcomes,parent,revision}, with keys sorted, separators comma/colon without spaces, and ensure_ascii=false. Array order is preserved. Optional reference on a new hypothesis must equal this hash; status, reason and evidence are not hashed. Existing ids must preserve core and ancestry; omit optional reference rather than trying to change identity. The controller computes references and records hypothesis status/reason/evidence automatically. It is valid to omit explicit findings in an initial plan (or use findings:[]) without computing any new hash yourself.
Use findings:[] whenever no hypothesis finding is reported, including ordinary source observations. Put source-file observations in summary plus evidence entries naming actual existing paths and their actual sha256. Ordinary work requires no artificial hypothesis or forced exploration. findings must be a list of objects with the hypothesis reference above; never translate a file path into a finding reference.
Pending discoveries are immutable RESEARCHER-origin branch candidates from either side, independent of policy selection. They are not main accepted mathematics. Inspect exact inbox source_paths and provenance. Request discovery_rechecks in dependency order for ordinary paid compile/replay/premise admission, or discovery_completion for the unchanged exact-root and independent audit gate. No automatic imports, hidden answers, usefulness certification or extra allowance. When budget is unavailable they remain pending.\nArtifact reporting contract (both proposer and researcher): use_links reports observed reuse, never intended future reuse. Each entry has exactly artifact, consumer and claim. Both artifact and consumer must name files that already exist in your workspace at report validation, using safe workspace-relative paths. Missing endpoints are rejected even in a prospective plan. Do not fabricate files to satisfy this requirement. Empty use_links is valid. File existence does not establish the claim: accepted links remain reported_use_pending_checked_interface until separately checked. Checked delayed_use_links in the request are controller-produced records, not the report entry schema; do not copy their status, receipt_hash or declaration identifiers into use_links.
Evidence likewise requires an existing file and its actual sha256; kind must be experiment/source/representation/proof_candidate/capability_failure. Hypothesis evidence references must be bound in evidence. Intentions belong in agenda/summary/hypothesis claims/outcome checks, not evidence or use_links. Reports cannot self-certify theorems.
Executable instructions: select_obligation {id}; reuse_library {ids}; allocate {exploration_percent}; budgets {tool_seconds,validation_seconds}; reassess {after_rounds}; reverse_agenda, reverse_portfolio; rotate_agenda/keep_observations with integer n; if_open_obligations with then/else instruction lists. These cannot edit admission, contract, costs or authority.'''
    elif req['role'] == 'reviewer':
        schema = 'Reviewer payload: {findings:[{path,sha256,finding}], correctness,scope,transfer,costs,recommendation}.'
    else:
        schema = 'Selector payload: {choice:"incumbent" or "candidate",reason,evidence:[{path,sha256}]}.'
    return (COMMON + '\n' + extra + '\nThe output envelope has request_id and payload_json (a JSON-encoded object).\n'
            + schema + '\nREQUEST:\n' + __import__('json').dumps(req, indent=2))
