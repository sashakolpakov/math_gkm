"""Bounded operations-only continuation of exploration's own universal-root research.

This module adds no mathematics and never uses baseline knowledge. One explicitly
authorized maintenance branches repair role TMPDIR permission and expand only the
trusted dependency-edge capacity, preserving every historical implementation identity. An independently reviewed, single-consumption supervisor waits for
the official resumed parent, then funds at most eight fresh finite epochs.
"""
import argparse
import base64
import copy
import contextlib
import fcntl
import hashlib
import importlib
import json
import os
import re
from pathlib import Path
import signal
import subprocess
import sys
import time

ROOT=Path(__file__).resolve().parents[3]
OPS=Path(__file__).resolve().parent
RESUME=OPS.parent/'resume-general-0002'
ORIGINAL_RESUME=OPS.parent/'resume-general'
FINALIZATION=OPS.parent/'failed-round-finalization'
INITIAL_PARENT=ROOT/'.scratch/concept-driver-20261020-study-0001'
FROZEN_PAIR=INITIAL_PARENT
MODEL_SECONDS=1800
VALIDATION_SECONDS=900
ARM_ALLOWANCE_SECONDS=180000
# Protocol versions are selected by the new finite epoch's starting round.
# Historical parents keep their original allowances and accounting.
VALIDATION30_START_ROUND=60
VALIDATION30_SECONDS=1800
VALIDATION30_ARM_ALLOWANCE_SECONDS=216000
ADDITIONAL_ROUNDS=4
MAX_EPOCHS=8
OPERATOR_SECONDS=120*3600
CLEANUP_SECONDS=1900
SETUP_SECONDS=1800
LOG_LIMIT=8*1024**2
MIGRATION_CAP=8*1024**3
PYTHON='/opt/homebrew/bin/python3'
EXPECTED_IMPL='66e3aa3f8dddeaafde8456e46b3636fb23f3737128ce53020e847319db3368ff'
NEW_IMPL='7772dfefd0e76d355edbdcd1a1414a4fcaccb7ec1aa0d298de99b8d7e1f84aa3'
OLD_WORKER='569f2531e6bf310a7260ea4c6b7574171fd72ea783bfec895c0ba7dfac99a80d'
NEW_WORKER='d605eb833614df50c3782862430dbeb8a550b3b8c248adde19fa211254e1cf76'
SOURCE_ARCHIVE=ROOT/'evidence/concept-driver-source-20261020/source'
MAINTENANCE_PARENT=ROOT/'.scratch/concept-driver-20261020-follow-000004'
MAINTENANCE_DESTINATION=ROOT/'.scratch/concept-driver-20261020-follow-000005'
CAPACITY_PARENT=ROOT/'.scratch/concept-driver-20261020-follow-000005'
CAPACITY_DESTINATION=ROOT/'.scratch/concept-driver-20261020-follow-000006'
CAPACITY_IMPL='bac1b8f622077e362fc2d078e87bab3bad4114882700d722b09498f3481878fa'
CAPACITY_CHANGES={'machinery/inspection_stream.py': ('cb0ff86634236920531ea15f5151ad94ad0782a908ead12ce88f83ee647c4ab3',
                                    '217715dbf3d302fc7097bca8442afd8323af643c406eb67f6bd3947e52b2ffd7',
                                    ((b'def program(module, declarations, required, catalog_modules, nonce):\n',
                                      b'def program(module, declarations, required, catalog_modules, nonce):\n   '
                                      b' from .proof_audit import EDGE_LIMIT\n'),
                                     (b'          if edges >= 200000 then fail "dependency_edge_limit"\n',
                                      b'          if edges >= {EDGE_LIMIT} then fail "dependency_edge_limit"\n'))),
 'machinery/proof_audit.py': ('1c836ec67bdd37ce05dc80d35a34d5d9cf4b526c552afc2f5e83d653323753ba',
                              '5a9f763b5058ec5b01e38d0a7892d072fada04039ba03c23b6cc4fb44e81cc18',
                              ((b'DECL_LIMIT = WORK_LIMIT = 200000\n',
                                b'DECL_LIMIT = WORK_LIMIT = 200000\nEDGE_LIMIT = 2000000\n'),
                               (b'            for n in (nodes,edges,duplicates): _nat(n,WORK_LIMIT)\n',
                                b'            _nat(nodes,WORK_LIMIT)\n            for n in (edges,duplicates): '
                                b'_nat(n,EDGE_LIMIT)\n'))),
 'machinery/own_feedback.py': ('1d5bda9d3ce3f4957b13e7f5efcf554ef3ae059d802500465042f50ff30a8d69',
                               'fa9c5d77b1a6d6093fac3f85f27467ea3fdd57f464a0cc60f1feb2baa8f4772a',
                               ((b'    from .proof_audit import InspectionFailure\n',
                                 b'    from .proof_audit import InspectionFailure, EDGE_LIMIT\n'),
                                (b"    if category=='dependency_edge_limit': measured['limit_edges']=200000\n",
                                 b"    if category=='dependency_edge_limit': measured['limit_edges']=EDGE_LIMIT"
                                 b'\n')))}
REQUEST_CONTEXT_STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000006'
REQUEST_CONTEXT_IMPL='590648a8eb6c9ee626c63077cbdbd7963aa53d946ceac9cfe3f73e4591b63b7d'
REQUEST_CONTEXT_FILES={'machinery/study.py': ('037caafc4def94e50b2749999e313ed3c45152551aa794ffa19de2b751181064', '21d229d19485d78152792f349f13a343ca7b3a6b11b12933ed59054b8c9b18ed'), 'machinery/study_context.py': (None, '3ceac2970a7c85e3bc8db8eec5613cb9e31f44e0a3d6093d993f6e2c51990d94'), 'machinery/study_policy.py': ('902eebdcbfc10de78ae6fc5d2df92e0e6b5f1e330975491149559655d578b38a', '35c832306d3b445304745a254c3973ea0b07dce663e76e3613731b13a3b56432'), 'machinery/study_worker.py': ('d605eb833614df50c3782862430dbeb8a550b3b8c248adde19fa211254e1cf76', '8535b04376c51634bcbafd449c7946346877f545423a68dee1a3095cc828bdbd')}

CATALOGUE_PARENT=ROOT/'.scratch/concept-driver-20261020-follow-000007'
CATALOGUE_DESTINATION=ROOT/'.scratch/concept-driver-20261020-follow-000008'
CATALOGUE_IMPL='ffd4aee9df33c2b3503a3ec1833e95ad5da29949394a2558c23ec01f6efffbdf'
RETENTION_IMPL='3cfd280fbeea15b0a2ca0a434a7333304d282ee97ed5a66d840ad2c340f76478'
RETENTION_COMMON_OLD='3e1e72987c79ea289babe1b2156e3fbbfb57797af808d7fa40cbd7299c5e5ec6'
RETENTION_COMMON_NEW='e0b98db7f1160c6bd4098136e978579ad0dfac13db51537479133b566ebd6ef4'
RETENTION_PRIOR_INTENT_SHA='cff59d105a7b93d0ac898abce204356c12547a5f1a1ff456946153bf8418cac2'
RETENTION_PRIOR_DEADLINE=1792796767.036315
RETENTION_STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000008'

PROMPT_VIEW_IMPL='d7c3f043e81417605553e9e034415bff90fa2736f9e91d6ce41538a715891957'
RETENTION12_IMPL='362ddc45720556257067ceac52159534bfe5da11864b0becdf77dbe68e0d2d6d'
RETENTION54_IMPL='67aedf1e4c4bd8bf26b318b92540209f35d268e4145434e19ea171a58a92edc5'
RETENTION54_COMMON='6b9131edaa288ad6dbe3759c807d9ec23eb16e02add8d629ba602c65ac151cf1'
RETENTION54_STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000012'
RETENTION54_PACKET=OPS/'retention54-maintenance-20261022'
RETENTION12_PARENT=ROOT/'.scratch/concept-driver-20261020-follow-000011'
RETENTION12_DESTINATION=ROOT/'.scratch/concept-driver-20261020-follow-000012'
RETENTION12_PACKET=OPS/'retention12-maintenance-20261022'
RETENTION12_PARENT_STATE='f24608379e848aa491af0630682faa09e0032e8cb6d0ccdee954fd78f59c50fa'
RETENTION12_CHANGES={
    'machinery/resources.py':('aa0344a85fd1eb7bc9fa6e0fb59ef7343b63c88e504158a7dfff6e18f9a4a8bd','341584d8a7d6d29c5f597253f08416f0b7f1d7828962d65f532da71c5f2c238f'),
    'machinery/study_common.py':('e0b98db7f1160c6bd4098136e978579ad0dfac13db51537479133b566ebd6ef4','1112761aa57a317a0bb8573fe16cd79ad29ad58760b802774bfc16cb5b4a42ec'),
    'machinery/study_worker.py':('8535b04376c51634bcbafd449c7946346877f545423a68dee1a3095cc828bdbd','07d7aae3f771bc3ecf670739a5c389e23cb93e902bbfb55475b08e381cee1c78')}
PROMPT_VIEW_CONTEXT='ede4c5cd86812072ce6236456b9b9985147485ae2d82353ee45665a1032b9a9f'
PROMPT_VIEW_STUDY=ROOT/'.scratch/concept-driver-20261020-follow-000011'
PROMPT_VIEW_PACKET=OPS/'prompt-view-round48-20261022'
PROMPT_VIEW_RECORD=PROMPT_VIEW_PACKET/'REVISION.json'
PROMPT_VIEW_WITNESS_SHA='51ee2d7f83b509b0c42b127288331785488976549be7188a5a61efb2ce5cd528'
PROMPT_VIEW_ARCHIVE_SHA='d5b8ccbf191a44c6aab8e22ba87618d68249bc202c253b6be49070bd5703ab0e'
PROMPT_VIEW_ANCHOR=ROOT/'.scratch/concept-driver-20261020-follow-000010/arms/exploration/snapshots/round-0047/manifest.json'
PROMPT_VIEW_ANCHOR_SHA='db4d66334679b7b1f6d86582d85840769963078a3c0d71ce0f2eb75a65772efd'
PROMPT_VIEW_ANCHOR_CREATED=1792660751.636141

CATALOGUE_CHANGES={'machinery/study.py': ('21d229d19485d78152792f349f13a343ca7b3a6b11b12933ed59054b8c9b18ed',
                        'b57d3e25c0e23684e41f20099e263d6571f5ad575c42c9a42da9c1404a65101b',
                        ((b'    clean_contract, copy_seed, implementation, dependency_identity, authorize_li'
                          b've,\n    validate_model, REASONING_EFFORT)\nfrom . import study_policy as poli'
                          b"cy\n\nDEFAULT = {'schema': 'math-gkm.study.v2', 'transport': 'fixture',\n    'm"
                          b"odel': 'gpt-6.1-sol', 'provider': 'codex-configured-provider',\n",
                          b'    clean_contract, copy_seed, implementation, dependency_identity, authorize_li'
                          b've,\n    validate_model, REASONING_EFFORT)\nfrom . import study_policy as poli'
                          b"cy\nfrom .study_transfer import paired_evaluation_seconds\n\nDEFAULT = {'schema"
                          b"': 'math-gkm.study.v2', 'transport': 'fixture',\n    'model': 'gpt-6.1-sol', 'pro"
                          b"vider': 'codex-configured-provider',\n"),
                         (b"    return {k: v for k, v in result.items() if k not in ('sides', 'outcomes'"
                          b")}\n\ndef episode_envelope(p, count, tasks):\n    evaluation = 2*p['adaptation_"
                          b"seconds'] + 2*(tasks+1)*p['validation_seconds'] if tasks else 0\n    return {'res"
                          b"earch': (count*((2+p['proposal_repairs'])*p['call_seconds'] + (p['knowledge_chec"
                          b"ks_per_round']+1)*p['validation_seconds']), (2+p['proposal_repairs'])*count, (1+"
                          b"p['proposal_repairs'])*count),\n            'evaluation': (evaluation, 2 if tasks"
                          b" else 0, 0),\n            'review': (2*p['call_seconds'], 2, 2)}\n",
                          b"    return {k: v for k, v in result.items() if k not in ('sides', 'outcomes'"
                          b')}\n\ndef episode_envelope(p, count, tasks):\n    evaluation = paired_evaluatio'
                          b"n_seconds(p, tasks) if tasks else 0\n    return {'research': (count*((2+p['propos"
                          b"al_repairs'])*p['call_seconds'] + (p['knowledge_checks_per_round']+1)*p['validat"
                          b"ion_seconds']), (2+p['proposal_repairs'])*count, (1+p['proposal_repairs'])*count"
                          b"),\n            'evaluation': (evaluation, 2 if tasks else 0, 0),\n           "
                          b" 'review': (2*p['call_seconds'], 2, 2)}\n"),
                         (b"        side_budget = self.p['policy_trial_rounds'] * ((2+self.p['proposal_repai"
                          b"rs'])*self.p['call_seconds'] +\n            self.p['knowledge_checks_per_round']*"
                          b"self.p['validation_seconds'])\n        tasks = len(read(self.study/'evaluation/su"
                          b"ite.json')['tasks'])\n        downstream = 2*self.p['adaptation_seconds'] + 2*(ta"
                          b"sks+1)*self.p['validation_seconds'] + 2*self.p['call_seconds']\n        budget = "
                          b"2*side_budget + downstream\n        trial_commitment = destination/'trial-commitm"
                          b"ent.json'\n        if not trial_commitment.exists():\n",
                          b"        side_budget = self.p['policy_trial_rounds'] * ((2+self.p['proposal_repai"
                          b"rs'])*self.p['call_seconds'] +\n            self.p['knowledge_checks_per_round']*"
                          b"self.p['validation_seconds'])\n        tasks = len(read(self.study/'evaluation/su"
                          b"ite.json')['tasks'])\n        downstream = paired_evaluation_seconds(self.p, task"
                          b"s) + 2*self.p['call_seconds']\n        budget = 2*side_budget + downstream\n  "
                          b"      trial_commitment = destination/'trial-commitment.json'\n        if not tria"
                          b'l_commitment.exists():\n'))),
 'machinery/study_research_feedback.py': ('26c10beb1c8254db24f34101bad9a92d550c5292497fe5e55eccfa3298e8a46a',
 'f48f2c378fc49284a8e809bc719f210cafcf3c2069c169df1d7687d1824d5743',
 ((b"        'no_independent_holdout; transfer_not_demonstrated': 'no_independent_holdout',\n    }\n    if "
   b"status != 'valid_finite_budget_comparison':\n        return {**unavailable, 'reason': reasons.get(sta"
   b"tus, 'invalid_or_unknown_comparison')}\n    count_fields = ('task_gains', 'transfer', 'regressions')\n"
   b'    if any(not isinstance(result.get(k), list) for k in count_fields):\n        return {**unavailable'
   b", 'reason': 'incomplete_comparison'}\n",
   b"        'no_independent_holdout; transfer_not_demonstrated': 'no_independent_holdout',\n    }\n    if "
   b"status != 'valid_finite_budget_comparison':\n        reason = reasons.get(status, 'invalid_or_unknown"
   b"_comparison')\n        if status == 'invalid_frozen_context' and result.get('own_context_status') == "
   b"'timeout':\n            reason = 'frozen_context_timeout'\n        return {**unavailable, 'reason': re"
   b"ason}\n    count_fields = ('task_gains', 'transfer', 'regressions')\n    if any(not isinstance(result."
   b"get(k), list) for k in count_fields):\n        return {**unavailable, 'reason': 'incomplete_compariso"
   b"n'}\n"),
  (b"    binding = result.get('binding')\n    budgets = {}\n    if isinstance(binding, dict):\n        for f"
   b"ield in ('adaptation_seconds_each', 'validation_seconds_each_task'):\n            value = _number(bin"
   b'ding.get(field))\n            if value is not None:\n                budgets[field] = value\n',
   b"    binding = result.get('binding')\n    budgets = {}\n    if isinstance(binding, dict):\n        for f"
   b"ield in ('adaptation_seconds_each', 'validation_seconds_each_task', 'catalog_seconds_each'):\n       "
   b'     value = _number(binding.get(field))\n            if value is not None:\n                budgets[f'
   b'ield] = value\n'),
  (b"            reasons = {'missing_comparison', 'invalid_policy_comparison', 'invalid_frozen_context',\n"
   b"                       'invalid_or_capability_regression', 'no_independent_holdout',\n               "
   b"        'invalid_or_unknown_comparison', 'incomplete_comparison',\n                       'incomplete"
   b"_or_unretained_comparison'}\n            if (set(value) != base or value['reason'] not in reasons or "
   b"value['eligible'] or\n                    any(value[k] is not None for k in ('gains', 'checked_compon"
   b"ent_transfer', 'regressions'))):\n                raise Invalid('inconclusive comparison cannot repor"
   b"t gains or private details')\n",
   b"            reasons = {'missing_comparison', 'invalid_policy_comparison', 'invalid_frozen_context',\n"
   b"                       'invalid_or_capability_regression', 'no_independent_holdout',\n               "
   b"        'invalid_or_unknown_comparison', 'incomplete_comparison',\n                       'incomplete"
   b"_or_unretained_comparison', 'frozen_context_timeout'}\n            if (set(value) != base or value['r"
   b"eason'] not in reasons or value['eligible'] or\n                    any(value[k] is not None for k in"
   b" ('gains', 'checked_component_transfer', 'regressions'))):\n                raise Invalid('inconclusi"
   b"ve comparison cannot report gains or private details')\n"),
  (b"                        for k in ('gains', 'checked_component_transfer', 'regressions')) or\n        "
   b"            not isinstance(value['budget_caps_seconds'], dict) or\n                    not set(value["
   b"'budget_caps_seconds']) <=\n                        {'adaptation_seconds_each', 'validation_seconds_e"
   b"ach_task'} or\n                    any(_number(v) is None for v in value['budget_caps_seconds'].value"
   b"s()) or\n                    value['cost_interpretation'] != 'Caps are not elapsed costs; development"
   b" costs are separate.' or\n                    value['causal_interpretation'] != 'Checked dependency u"
   b"se does not establish indispensability.'):\n",
   b"                        for k in ('gains', 'checked_component_transfer', 'regressions')) or\n        "
   b"            not isinstance(value['budget_caps_seconds'], dict) or\n                    not set(value["
   b"'budget_caps_seconds']) <=\n                        {'adaptation_seconds_each', 'validation_seconds_e"
   b"ach_task', 'catalog_seconds_each'} or\n                    any(_number(v) is None for v in value['bud"
   b"get_caps_seconds'].values()) or\n                    value['cost_interpretation'] != 'Caps are not el"
   b"apsed costs; development costs are separate.' or\n                    value['causal_interpretation'] "
   b"!= 'Checked dependency use does not establish indispensability.'):\n"),
  (b"import copy\nimport math\nimport re\n\nfrom .study_common import Invalid, digest\n\nSCHEMA = 'math-gkm"
   b".research-feedback.v1'\nOWN_REVIEW_SCOPE = 'own_sources_only'\nHISTORY_LIMIT = 8\nCONSUMPTION_LIMIT = 3"
   b"2\nFINDINGS_LIMIT = 16\nTEXT_LIMIT = 2400\n_SHA = re.compile(r'[0-9a-f]{64}\\Z')\n\nINTERPRETATION = ("
   b"\n    'Source diagnosis is a fallible interpretation of own artifacts, not mathematical '\n",
   b"import copy\nimport math\nimport re\n\nfrom .study_common import Invalid, digest\n\nSCHEMA = 'math-gkm"
   b".research-feedback.v1'\nOWN_REVIEW_SCOPE = 'own_sources_only'\n# Fixed operational labels only; legacy"
   b" packets may omit this optional field.\nREVIEWER_OUTCOME_STATUSES = {\n    'completed': {'artifact_bou"
   b"nd_source_assessment', 'unavailable_invalid_artifact_references'},\n    'output_budget_exceeded': {'u"
   b"navailable_incomplete_review'},\n    'unavailable_other': {'unavailable_incomplete_review', 'unavaila"
   b"ble_private_or_legacy_scope'},\n}\nHISTORY_LIMIT = 8\nCONSUMPTION_LIMIT = 32\nFINDINGS_LIMIT = 16\nTE"
   b"XT_LIMIT = 2400\n_SHA = re.compile(r'[0-9a-f]{64}\\Z')\n\nINTERPRETATION = (\n    'Source diagnosis i"
   b"s a fallible interpretation of own artifacts, not mathematical '\n"),
  (b"    trusted_scope = reviewer_scope == OWN_REVIEW_SCOPE\n    completed = receipt.get('outcome') == 'co"
   b"mpleted'\n    valid = (trusted_scope and completed and artifact_refs_valid is True and\n             i"
   b"sinstance(payload, dict))\n    status = ('artifact_bound_source_assessment' if valid else\n           "
   b"   'unavailable_private_or_legacy_scope' if not trusted_scope else\n              'unavailable_incomp"
   b"lete_review' if not completed else\n              'unavailable_invalid_artifact_references')\n    diag"
   b"nosis = {'status': status, 'authority': 'interpretation_only',\n                 'findings': [], 'tru"
   b"ncated': False}\n    if valid:\n        for name in ('correctness', 'scope', 'transfer', 'costs', 'rec"
   b"ommendation'):\n            text = _text(payload.get(name))\n            if text is not None:\n        "
   b"        diagnosis[name] = text\n        findings = payload.get('findings', [])\n        if not isinsta"
   b'nce(findings, list):\n            findings = []\n',
   b"    trusted_scope = reviewer_scope == OWN_REVIEW_SCOPE\n    completed = receipt.get('outcome') == 'co"
   b"mpleted'\n    valid = (trusted_scope and completed and artifact_refs_valid is True and\n             i"
   b"sinstance(payload, dict))\n    status = ('artifact_bound_source_assessment' if valid else\n           "
   b"   'unavailable_private_or_legacy_scope' if not trusted_scope else\n              'unavailable_incomp"
   b"lete_review' if not completed else\n              'unavailable_invalid_artifact_references')\n    # Ne"
   b'ver forward arbitrary exception text, payload claims or private-review outcomes.\n    own_outcome = r'
   b"eceipt.get('outcome')\n    reviewer_outcome = (own_outcome if trusted_scope and\n        own_outcome i"
   b"n ('completed', 'output_budget_exceeded') else 'unavailable_other')\n    diagnosis = {'status': statu"
   b"s, 'authority': 'interpretation_only',\n                 'findings': [], 'truncated': False, 'reviewe"
   b"r_outcome': reviewer_outcome}\n    if valid:\n        for name in ('correctness', 'scope', 'transfer',"
   b" 'costs', 'recommendation'):\n            text = _text(payload.get(name))\n            if text is not "
   b"None:\n                diagnosis[name] = text\n        findings = payload.get('findings', [])\n        "
   b'if not isinstance(findings, list):\n            findings = []\n'),
  (b"            development['interpretation'] != 'Sum of own-main proposer/researcher elapsed seconds over t"
   b"he compared interval; excludes overlapping controller wall.'):\n        raise Invalid('invalid measur"
   b"ed development costs')\n    context = _comparison_context(packet['comparison_context'])\n    if contex"
   b"t is not None and context['end_round'] > packet['round']:\n        raise Invalid('comparison context "
   b"extends beyond reviewed research')\n    diagnosis = packet['source_review']\n    base = {'status', 'au"
   b"thority', 'findings', 'truncated'}\n    prose = {'correctness', 'scope', 'transfer', 'costs', 'recomm"
   b"endation'}\n    statuses = {'artifact_bound_source_assessment', 'unavailable_private_or_legacy_scope'"
   b",\n                'unavailable_incomplete_review', 'unavailable_invalid_artifact_references'}\n    if"
   b' (not isinstance(diagnosis, dict) or not base <= set(diagnosis) or\n            not set(diagnosis) <='
   b" base | prose or diagnosis.get('status') not in statuses or\n            diagnosis.get('authority') !"
   b"= 'interpretation_only' or\n            type(diagnosis.get('truncated')) is not bool or\n            n"
   b"ot isinstance(diagnosis.get('findings'), list) or\n            len(diagnosis['findings']) > FINDINGS_"
   b'LIMIT or\n            any(not isinstance(diagnosis[k], str) or len(diagnosis[k]) > TEXT_LIMIT + 10\n  '
   b"              for k in prose & set(diagnosis))):\n        raise Invalid('invalid source feedback diag"
   b"nosis')\n    if diagnosis['status'] != 'artifact_bound_source_assessment' and (\n            diagnosis"
   b"['findings'] or set(diagnosis) != base):\n        raise Invalid('unavailable source review cannot car"
   b"ry diagnosis')\n    for finding in diagnosis['findings']:\n        if (not isinstance(finding, dict) o"
   b"r set(finding) != {'path', 'sha256', 'finding'} or\n                not isinstance(finding['path'], s"
   b"tr) or len(finding['path']) > 512 or\n                finding['path'].startswith('/') or\n            "
   b"    any(p in ('', '.', '..') for p in finding['path'].split('/')) or\n                not isinstance("
   b"finding['sha256'], str) or not _SHA.fullmatch(finding['sha256']) or\n                not isinstance(f"
   b"inding['finding'], str) or len(finding['finding']) > TEXT_LIMIT + 10):\n",
   b"            development['interpretation'] != 'Sum of own-main proposer/researcher elapsed seconds over t"
   b"he compared interval; excludes overlapping controller wall.'):\n        raise Invalid('invalid measur"
   b"ed development costs')\n    context = _comparison_context(packet['comparison_context'])\n    if contex"
   b"t is not None and context['end_round'] > packet['round']:\n        raise Invalid('comparison context "
   b"extends beyond reviewed research')\n    diagnosis = packet['source_review']\n    base = {'status', 'au"
   b"thority', 'findings', 'truncated'}\n    prose = {'correctness', 'scope', 'transfer', 'costs', 'recomm"
   b"endation'}\n    diagnostics = {'reviewer_outcome'}\n    statuses = {'artifact_bound_source_assessment'"
   b", 'unavailable_private_or_legacy_scope',\n                'unavailable_incomplete_review', 'unavailab"
   b"le_invalid_artifact_references'}\n    if (not isinstance(diagnosis, dict) or not base <= set(diagnosi"
   b"s) or\n            not set(diagnosis) <= base | prose | diagnostics or diagnosis.get('status') not in"
   b" statuses or\n            diagnosis.get('authority') != 'interpretation_only' or\n            type(dia"
   b"gnosis.get('truncated')) is not bool or\n            not isinstance(diagnosis.get('findings'), list) "
   b"or\n            len(diagnosis['findings']) > FINDINGS_LIMIT or\n            any(not isinstance(diagnos"
   b'is[k], str) or len(diagnosis[k]) > TEXT_LIMIT + 10\n                for k in prose & set(diagnosis)))'
   b":\n        raise Invalid('invalid source feedback diagnosis')\n    if 'reviewer_outcome' in diagnosis:"
   b"\n        outcome = diagnosis['reviewer_outcome']\n        if (not isinstance(outcome, str) or outcome"
   b" not in REVIEWER_OUTCOME_STATUSES or\n                diagnosis['status'] not in REVIEWER_OUTCOME_STA"
   b"TUSES[outcome]):\n            raise Invalid('invalid source review operational outcome')\n    if diagn"
   b"osis['status'] != 'artifact_bound_source_assessment' and (\n            diagnosis['findings'] or set("
   b"diagnosis) - diagnostics != base):\n        raise Invalid('unavailable source review cannot carry dia"
   b"gnosis')\n    for finding in diagnosis['findings']:\n        if (not isinstance(finding, dict) or set("
   b"finding) != {'path', 'sha256', 'finding'} or\n                not isinstance(finding['path'], str) or"
   b" len(finding['path']) > 512 or\n                finding['path'].startswith('/') or\n                an"
   b"y(p in ('', '.', '..') for p in finding['path'].split('/')) or\n                not isinstance(findin"
   b"g['sha256'], str) or not _SHA.fullmatch(finding['sha256']) or\n                not isinstance(finding"
   b"['finding'], str) or len(finding['finding']) > TEXT_LIMIT + 10):\n"))),
 'machinery/study_transfer.py': ('ddda414dbeb8528b55cb036b1489a4e790964ace28d8dd1c296c7890d624c6fc',
                                 '237540e2861559cbd2f25df1f875efae144628b4984c32c2da3c380014a5c06b',
                                 ((b'from .completion import NAME, ALLOWED, without_comments\nfrom . impor'
                                   b't proof_audit\nfrom .adapter_protocol import intake, AdapterProtocolE'
                                   b"rror\n\ndef dependency_paths(workspace):\n    return [CORE] + [p/'.lake"
                                   b"/build/lib/lean' for p in sorted((workspace/'.lake/packages').iterdir())"
                                   b']\n',
                                   b'from .completion import NAME, ALLOWED, without_comments\nfrom . impor'
                                   b't proof_audit\nfrom .adapter_protocol import intake, AdapterProtocolE'
                                   b'rror\n\ndef catalogue_seconds(protocol):\n    """Derived frozen-own-con'
                                   b'text allowance; ordinary proof caps are unchanged."""\n    seconds = '
                                   b"protocol['validation_seconds']\n    if type(seconds) is not int or no"
                                   b"t 1 <= seconds <= 1800:\n        raise Invalid('invalid catalogue val"
                                   b"idation basis')\n    return min(1800, 2*seconds)\n\n\ndef paired_evaluat"
                                   b'ion_seconds(protocol, tasks):\n    """Symmetric reserved ceiling; eac'
                                   b'h task retains the ordinary proof cap.\n\n    The zero-task formula re'
                                   b'mains useful for conservative trial reservations;\n    callers with a'
                                   b'n empty suite still skip evaluation work as before.\n    """\n    if t'
                                   b"ype(tasks) is not int or tasks < 0:\n        raise Invalid('invalid p"
                                   b"aired evaluation task count')\n    return (2*protocol['adaptation_sec"
                                   b"onds'] +\n            2*tasks*protocol['validation_seconds'] + 2*cata"
                                   b'logue_seconds(protocol))\n\n\ndef dependency_paths(workspace):\n    retu'
                                   b"rn [CORE] + [p/'.lake/build/lib/lean' for p in sorted((workspace/'.lake/"
                                   b"packages').iterdir())]\n"),
                                  (b"        'original_validation_seconds': result.get('elapsed_seconds')"
                                   b",\n        'validator_directory': str(origin),\n        'scope': 'exac"
                                   b"t frozen declaration catalog; full reservation remains charged'}\n   "
                                   b' return out\n\n\n',
                                   b"        'original_validation_seconds': result.get('elapsed_seconds')"
                                   b",\n        'validator_directory': str(origin),\n        'scope': 'exac"
                                   b"t frozen declaration catalog; full reservation remains charged'}\n   "
                                   b' # This function is called only for the frozen OWN catalogue. It project'
                                   b's a\n    # controller diagnostic token; never task text, compiler out'
                                   b"put, or reports.\n    diagnostic = result.get('controller_diagnostic'"
                                   b")\n    if (result.get('checked') is False and isinstance(diagnostic, "
                                   b"dict) and\n            diagnostic.get('schema') == 'math-gkm.own-chec"
                                   b"k-feedback.v1' and\n            diagnostic.get('category') == 'timeou"
                                   b"t' and\n            diagnostic.get('mathematical_conclusion') == 'non"
                                   b"e'):\n        out['frozen_context_failure_category'] = 'timeout'\n    "
                                   b'return out\n\n\n'),
                                  (b'    actual = verify_snapshot(source)\n    if actual != manifest:\n    '
                                   b"    raise Invalid('frozen catalog snapshot manifest changed')\n    ar"
                                   b"m.reserve('catalog-'+key, arm.p['validation_seconds'])\n    marker = "
                                   b"directory.parent/(directory.name+'.reserved.json')\n    cached_attemp"
                                   b"t = directory/'CACHE_REUSE.json'\n    existing = (directory/'result.j"
                                   b"son').exists() or cached_attempt.exists()\n",
                                   b'    actual = verify_snapshot(source)\n    if actual != manifest:\n    '
                                   b"    raise Invalid('frozen catalog snapshot manifest changed')\n    ar"
                                   b"m.reserve('catalog-'+key, catalogue_seconds(arm.p))\n    marker = dir"
                                   b"ectory.parent/(directory.name+'.reserved.json')\n    cached_attempt ="
                                   b" directory/'CACHE_REUSE.json'\n    existing = (directory/'result.json"
                                   b"').exists() or cached_attempt.exists()\n"),
                                  (b"        return {'checked': False, 'status': 'interrupted_catalog_not_rep"
                                   b"layed',\n                'elapsed_seconds': time.monotonic()-started}"
                                   b"\n    if not existing:\n        write(marker, {'snapshot': manifest['b"
                                   b"inding'], 'seconds': arm.p['validation_seconds']})\n    ws = director"
                                   b"y.parent/(directory.name+'-workspace')\n    if not ws.exists():\n     "
                                   b"   copy_seed(arm.study/'seed', ws)\n",
                                   b"        return {'checked': False, 'status': 'interrupted_catalog_not_rep"
                                   b"layed',\n                'elapsed_seconds': time.monotonic()-started}"
                                   b"\n    if not existing:\n        write(marker, {'snapshot': manifest['b"
                                   b"inding'], 'seconds': catalogue_seconds(arm.p)})\n    ws = directory.p"
                                   b"arent/(directory.name+'-workspace')\n    if not ws.exists():\n        "
                                   b"copy_seed(arm.study/'seed', ws)\n"),
                                  (b'    except (Invalid, OSError, KeyError, TypeError, ValueError):\n    '
                                   b"    return {'checked': False, 'status': 'invalid_finished_catalog_cache;"
                                   b" inconclusive',\n                'elapsed_seconds': time.monotonic()-"
                                   b'started}\n    result = check_task(ws, task, solution, directory, arm.'
                                   b"p['validation_seconds'],\n        live=arm.p['transport'] == 'live', "
                                   b"stop=arm.stopped, frozen_files=manifest['files'])\n    if result.get("
                                   b"'checked'):\n        try:\n",
                                   b'    except (Invalid, OSError, KeyError, TypeError, ValueError):\n    '
                                   b"    return {'checked': False, 'status': 'invalid_finished_catalog_cache;"
                                   b" inconclusive',\n                'elapsed_seconds': time.monotonic()-"
                                   b'started}\n    result = check_task(ws, task, solution, directory, cata'
                                   b"logue_seconds(arm.p),\n        live=arm.p['transport'] == 'live', sto"
                                   b"p=arm.stopped, frozen_files=manifest['files'])\n    if result.get('ch"
                                   b"ecked'):\n        try:\n"),
                                  (b"    suite = read(arm.study/'evaluation/suite.json')\n    result = arm"
                                   b".root/'evaluations'/key/'result.json'\n    if suite['tasks'] and not "
                                   b"result.exists():\n        cap = 2*arm.p['adaptation_seconds'] + 2*(le"
                                   b"n(suite['tasks'])+1)*arm.p['validation_seconds']\n        arm.fund('p"
                                   b"aired-evaluation-'+key, cap)\n        with arm.budget('paired-evaluat"
                                   b"ion-'+key):\n            return _evaluate_pair(arm, before, after, ke"
                                   b'y, policy_comparison=policy_comparison)\n',
                                   b"    suite = read(arm.study/'evaluation/suite.json')\n    result = arm"
                                   b".root/'evaluations'/key/'result.json'\n    if suite['tasks'] and not "
                                   b'result.exists():\n        cap = paired_evaluation_seconds(arm.p, len('
                                   b"suite['tasks']))\n        arm.fund('paired-evaluation-'+key, cap)\n   "
                                   b"     with arm.budget('paired-evaluation-'+key):\n            return _"
                                   b'evaluate_pair(arm, before, after, key, policy_comparison=policy_comparis'
                                   b'on)\n'),
                                  (b"               'inspection_schema': proof_audit.SCHEMA,\n            "
                                   b"   'policy_comparison': policy_comparison,\n               'adaptatio"
                                   b"n_seconds_each': arm.p['adaptation_seconds'],\n               'valida"
                                   b"tion_seconds_each_task': arm.p['validation_seconds']}\n    if (direct"
                                   b"ory/'result.json').exists():\n        previous = read(directory/'resu"
                                   b"lt.json',max_bytes=64*1024**2)\n        if previous['binding'] != bin"
                                   b'ding:\n',
                                   b"               'inspection_schema': proof_audit.SCHEMA,\n            "
                                   b"   'policy_comparison': policy_comparison,\n               'adaptatio"
                                   b"n_seconds_each': arm.p['adaptation_seconds'],\n               'valida"
                                   b"tion_seconds_each_task': arm.p['validation_seconds'],\n              "
                                   b" 'catalog_seconds_each': catalogue_seconds(arm.p)}\n    if (directory"
                                   b"/'result.json').exists():\n        previous = read(directory/'result."
                                   b"json',max_bytes=64*1024**2)\n        if previous['binding'] != bindin"
                                   b'g:\n'),
                                  (b"        write(directory/'result.json', result)\n        return result"
                                   b'\n    # Reserve symmetric entire comparison before any adaptation cal'
                                   b"l.\n    reserve = 2*arm.p['adaptation_seconds'] + 2*(len(suite['tasks"
                                   b"'])+1)*arm.p['validation_seconds']\n    if not (directory/'commitment"
                                   b".json').exists():\n        if reserve > arm.available() or arm.availa"
                                   b"ble_calls() < 2:\n            raise Invalid('insufficient equal adapt"
                                   b"ation/validation reservation for pair')\n",
                                   b"        write(directory/'result.json', result)\n        return result"
                                   b'\n    # Reserve symmetric entire comparison before any adaptation cal'
                                   b"l.\n    reserve = paired_evaluation_seconds(arm.p, len(suite['tasks']"
                                   b"))\n    if not (directory/'commitment.json').exists():\n        if res"
                                   b'erve > arm.available() or arm.available_calls() < 2:\n            rai'
                                   b"se Invalid('insufficient equal adaptation/validation reservation for pai"
                                   b"r')\n"),
                                  (b"        if not checked['checked']:\n            result = {'binding': "
                                   b"binding, 'eligible': False, 'status': 'invalid_frozen_context',\n    "
                                   b"                  'catalog_failure': checked, 'transfer': [], 'regressio"
                                   b"ns': [],\n                      'measured_costs': _measured_costs({},"
                                   b" context_checks)}\n            write(directory/'result.json', result)"
                                   b'\n            return result\n',
                                   b"        if not checked['checked']:\n            result = {'binding': "
                                   b"binding, 'eligible': False, 'status': 'invalid_frozen_context',\n    "
                                   b"                  'catalog_failure': checked, 'transfer': [], 'regressio"
                                   b"ns': [],\n                      'own_context_status': ('timeout' if c"
                                   b"hecked.get('frozen_context_failure_category') == 'timeout' else 'inconcl"
                                   b"usive'),\n                      'measured_costs': _measured_costs({},"
                                   b" context_checks)}\n            write(directory/'result.json', result)"
                                   b'\n            return result\n')))}

EXPECTED_CONTRACT='564b2659c941bcf76484bcf20de5dfc4808c9379306f773d1642748e2a02c91d'
EXPECTED_SUITE='88e05a48bac42ae11db2a12c2c748b03eac9904e8782fd5b5e52ebf8f3c641d1'
GOAL='Continue autonomous research toward the unchanged exact universal root, not a partial log-concavity family.'
COPY_GUARD=None
INTERRUPTED=None
API=None
REVIEW_PATH=None
DEADLINE=None

def sha(path):
    h=hashlib.sha256()
    with Path(path).open('rb') as stream:
        for block in iter(lambda:stream.read(1024**2),b''): h.update(block)
    return h.hexdigest()


def canonical(value):
    return json.dumps(value,sort_keys=True,separators=(',',':'),ensure_ascii=False)


def digest(value):
    return hashlib.sha256(canonical(value).encode()).hexdigest()


def read(path):
    path=Path(path)
    if path.stat().st_size>64*1024**2: raise RuntimeError('oversize operational input')
    return json.loads(path.read_text())


def write(path,value):
    path=Path(path);path.parent.mkdir(parents=True,exist_ok=True)
    temp=path.with_name(path.name+'.next')
    with temp.open('w') as out:
        out.write(canonical(value)+'\n');out.flush();os.fsync(out.fileno())
    os.replace(temp,path)
    fd=os.open(path.parent,os.O_RDONLY)
    try: os.fsync(fd)
    finally: os.close(fd)


def api():
    global API, PT_FRESH_API
    if API is None:
        declared=read(ROOT/'.bootstrap/study-authorization.json').get('implementation_sha256')
        descendant=pt_is_new(declared)
        if descendant:
            config=cs19_guard().config() if cs19_selected(declared) else (ca19_guard().config() if ca19_selected(declared) else pt_config())
            if any(n=='machinery' or n.startswith('machinery.') for n in sys.modules):
                raise RuntimeError('new source family requires a fresh interpreter; no hot reload')
            for name,expected in config['implementation'].items():
                pt_require(sha(ROOT/name)==expected,'reviewed physical sources differ before fresh import')
        PT_FRESH_API=descendant
        sys.path.insert(0,str(ROOT))
        from machinery import study,study_common,study_observer,study_knowledge,validation_receipts,resources,study_discoveries
        API=dict(study=study,common=study_common,observer=study_observer,
                 knowledge=study_knowledge,receipts=validation_receipts,resources=resources,discoveries=study_discoveries)
        if PT_FRESH_API:
            from machinery import study_deployment
            API['deployment']=study_deployment
            if cs19_selected(declared):cs19_guard().coherent_api(API)
            elif ca19_selected(declared):ca19_guard().coherent_api(API)
            else:pt_coherent(API)
    return API


def safe_relative(name):
    p=Path(name)
    if p.is_absolute() or not p.parts or '..' in p.parts:
        raise RuntimeError('unsafe inherited relative path')
    return p


class CopyGuard:
    """Bounded supervisor copy, no child and no compiled artifacts."""
    def __init__(self,planned_bytes,resources):
        if planned_bytes>MIGRATION_CAP: raise RuntimeError('cumulative migration retention cap')
        self.planned=planned_bytes;self.copied=0;self.next_check=0;self.resources=resources
        self.check(0)
    def check(self,added):
        controls()
        self.copied+=added
        if self.copied>MIGRATION_CAP: raise RuntimeError('cumulative migration byte cap')
        if self.copied>=self.next_check:
            self.resources.headroom(self.resources.limits())
            import shutil
            if shutil.disk_usage(ROOT).free < self.resources.limits()['admit_free']+max(0,self.planned-self.copied):
                raise RuntimeError('migration reserved disk headroom')
            self.next_check=self.copied+8*1024**2


def tree_files(directory):
    directory=Path(directory);result=[]
    for folder,dirs,files in os.walk(directory,followlinks=False):
        for name in dirs:
            if (Path(folder)/name).is_symlink(): raise RuntimeError('migration directory alias')
        for name in files:
            p=Path(folder)/name
            if p.is_symlink(): raise RuntimeError('migration file alias')
            result.append(p)
            if len(result)>20000: raise RuntimeError('migration inventory file cap')
    return result


def planned_copy_bytes(old_arm,old):
    common=api()['common'];workspace=old_arm/'workspace'
    total=sum((workspace/n).stat().st_size for n in common.inventory(workspace))
    total+=sum(p.stat().st_size for p in tree_files(workspace/'history'))
    # Retain one exact historical snapshot view; round names remain usable by reviews.
    for snapshot in (old_arm/'snapshots').iterdir():
        if snapshot.is_dir() and not snapshot.name.endswith('.staging'):
            manifest=common.verify_snapshot(snapshot)
            total+=sum((snapshot/'source'/n).stat().st_size for n in manifest['files'])+(snapshot/'manifest.json').stat().st_size
    for group in ('knowledge','components'):
        for record in old['research'][group].values():
            base=Path(record['validation_bundle']['directory']);finished=read(base/'FINISHED.json')
            total+=(base/'FINISHED.json').stat().st_size+sum((base/safe_relative(n)).stat().st_size for n in finished['files'])
    for entry in old['research'].get('pending_discoveries',{}).values():
        job=old_arm/'jobs'/entry['core']['origin']['job_key']
        total+=sum((job/n).stat().st_size for n in ('spec.json','receipt.json'))
        total+=sum((workspace/n).stat().st_size for n in entry['source_paths'].values())
        total+=(workspace/entry['manifest']).stat().st_size
        if entry['core']['kind']!='completion':
            base=Path(entry['core']['record']['validation_bundle']['directory']);finished=read(base/'FINISHED.json')
            total+=(base/'FINISHED.json').stat().st_size+sum((base/safe_relative(n)).stat().st_size for n in finished['files'])
    # Extra allowance covers successor initial snapshot and seed placeholders.
    total+=sum((workspace/n).stat().st_size for n in common.inventory(workspace))+(old_arm/'state.json').stat().st_size+16*1024**2
    if total>MIGRATION_CAP: raise RuntimeError('cumulative migration retention cap')
    return total


def copy_snapshots(old_arm,arm):
    """Preserve every frozen view once, without duplicating round archives."""
    common=api()['common'];inherited={}
    for source in sorted((old_arm/'snapshots').iterdir()):
        if source.is_dir() and not source.name.endswith('.staging'):
            manifest=common.verify_snapshot(source)
            container=arm/'snapshots' if source.name.startswith('round-') else arm/'inherited/snapshots'
            destination=container/source.name
            for name,expected in manifest['files'].items():
                copy_file(source/'source'/safe_relative(name),destination/'source'/safe_relative(name),expected)
            copy_file(source/'manifest.json',destination/'manifest.json')
            common.verify_snapshot(destination);inherited[source.name]=manifest['binding']
    return inherited


def copy_file(source,destination,expected=None,replace=False):
    source,destination=Path(source),Path(destination)
    if source.is_symlink() or not source.is_file(): raise RuntimeError('nonregular inherited source')
    actual=sha(source)
    if expected is not None and actual!=expected: raise RuntimeError('inherited source changed')
    if destination.exists() or destination.is_symlink():
        if destination.is_symlink(): raise RuntimeError('destination alias forbidden')
        if sha(destination)==actual: return
        if not replace: raise RuntimeError('inherited destination collision')
    destination.parent.mkdir(parents=True,exist_ok=True)
    temp=destination.with_name(destination.name+'.copying')
    with source.open('rb') as inp,temp.open('xb') as out:
        for block in iter(lambda:inp.read(1024**2),b''):
            if COPY_GUARD: COPY_GUARD.check(len(block))
            out.write(block)
        out.flush();os.fsync(out.fileno())
    if sha(temp)!=actual: raise RuntimeError('inherited copy mismatch')
    os.replace(temp,destination)


def copy_closed_bundle(source,destination,record,reuse):
    source,destination=Path(source),Path(destination)
    marker=source/'FINISHED.json'
    if sha(marker)!=record['validation_bundle']['finished_sha256']:
        raise RuntimeError('validator marker changed')
    # Verifier checks the actual original before any copy; no compiler is run.
    result=reuse(source,record['task'],record['solution'],record['task'].get('required_constants',[]))
    if digest(result)!=record['receipt_hash']: raise RuntimeError('validator result changed')
    finished=read(marker)
    if len(finished['files'])>10000: raise RuntimeError('validator file bound')
    total=0
    for name,expected in finished['files'].items():
        relative=safe_relative(name)
        if 'build' in relative.parts: raise RuntimeError('unexpected bound build artifact')
        total+=(source/relative).stat().st_size
        if total>256*1024**2: raise RuntimeError('validator size bound')
        copy_file(source/relative,destination/relative,expected)
    copy_file(marker,destination/'FINISHED.json',record['validation_bundle']['finished_sha256'])
    migrated=copy.deepcopy(record)
    migrated['validation_bundle']['directory']=str(destination.resolve())
    fresh=reuse(destination,record['task'],record['solution'],record['task'].get('required_constants',[]))
    if digest(fresh)!=record['receipt_hash']: raise RuntimeError('relocated validator result changed')
    return migrated


def copy_history(source,destination):
    """Only closed main-source history, not role/evaluator trees or caches."""
    source,destination=Path(source),Path(destination)
    total=count=0
    for directory,dirs,files in os.walk(source,followlinks=False):
        for name in dirs:
            if (Path(directory)/name).is_symlink(): raise RuntimeError('history alias forbidden')
        for name in files:
            path=Path(directory)/name
            if path.is_symlink(): raise RuntimeError('history alias forbidden')
            relative=path.relative_to(source)
            context=relative.parts[0]=='context'
            if context:
                if (len(relative.parts)!=2 or not re.fullmatch(r'[0-9a-f]{64}\.json',relative.name) or
                    path.stat().st_size>8*1024**2 or sha(path)!=relative.stem or
                    read(path).get('role') not in ('proposer','researcher')):
                    raise RuntimeError('invalid own context history')
            if relative.parts[0] not in ('objects','manifests','own-checks','context') and not (
                    len(relative.parts)==1 and relative.name.startswith('round-') and relative.suffix=='.json'):
                raise RuntimeError('unknown history provenance; preserve parent and stop')
            size=path.stat().st_size;total+=size;count+=1
            if size>32*1024**2 or total>MIGRATION_CAP or count>10000:
                raise RuntimeError('inherited history bound')
            copy_file(path,destination/relative)
            if context:(destination/relative).chmod(0o444)



def copy_pending(a,old_arm,old_ws,arm,workspace,research,key):
    """Preserve quarantine without admitting or changing its immutable identity."""
    from types import SimpleNamespace
    entry=research['pending_discoveries'][key]
    origin=entry['core']['origin'];job_key=origin['job_key']
    if len(Path(job_key).parts)!=1 or safe_relative(job_key)!=Path(job_key):
        raise RuntimeError('unsafe pending origin job key')
    oldjob=old_arm/'jobs'/job_key;newjob=arm/'jobs'/job_key
    spec=a['common'].read(oldjob/'spec.json');receipt=a['common'].read(oldjob/'receipt.json')
    if spec.get('role')!='researcher' or receipt.get('role')!='researcher' or receipt.get('outcome')!='completed':
        raise RuntimeError('nonresearch or unfinished pending origin')
    a['discoveries'].verify(SimpleNamespace(root=old_arm,mode='exploration'),research,old_ws,key)
    for name in ('spec.json','receipt.json'):copy_file(oldjob/name,newjob/name)
    for name,relative in entry['source_paths'].items():
        copy_file(old_ws/relative,workspace/relative,entry['core']['source_files'][name])
    copy_file(old_ws/entry['manifest'],workspace/entry['manifest'])
    dependency=None
    if entry['core']['kind']!='completion':
        record=entry['core']['record'];source=Path(record['validation_bundle']['directory'])
        destination=arm/'inherited/pending-validators'/key
        copy_closed_bundle(source,destination,record,a['receipts'].reuse)
        # core is immutable and names its exact retained origin. Original parent
        # bundles MUST remain present until paid main rechecking removes the need.
        dependency=dict(binding=key,origin_bundle=str(source),preserved_clone=str(destination),
            finished_sha256=record['validation_bundle']['finished_sha256'])
    return dict(path=str(newjob),key=job_key,receipt_hash=digest(receipt),
                inherited_elapsed_seconds=receipt.get('elapsed_seconds',0)),dependency


def dedupe_inherited_jobs(jobs):
    result={}
    for job in jobs:
        path=job['path']
        if path in result and result[path]!=job:
            raise RuntimeError('conflicting inherited origin receipt metadata')
        result[path]=job
    return list(result.values())


def mark_inherited_consumed(state,jobs):
    jobs=dedupe_inherited_jobs(jobs)
    state['receipts']=[j['path'] for j in jobs]
    state['receipt_hashes']={j['path']:j['receipt_hash'] for j in jobs}
    state['counted_jobs']=[j['key'] for j in jobs]
    return state

def epoch_state(fresh,parent,research,new_seal_hash):
    """Preserve the exact stopped mathematical phase; reset only epoch accounting."""
    if parent['active'] is not None or parent.get('active_intent') is not None or parent['resolution']:
        raise RuntimeError('cannot migrate active or resolved parent')
    if parent['phase'] not in ('research','review'):
        raise RuntimeError('unknown parent mathematical phase')
    result=copy.deepcopy(fresh)
    result.update(research=research,round=parent['round'],phase=parent['phase'],
        reviewed_rounds=list(parent['reviewed_rounds']),seal_hash=new_seal_hash,
        status='ready; own-history universal-root continuation; new finite allowance')
    return result


def lock_available(path):
    path=Path(path)
    if not path.is_file(): return False
    with path.open('r') as stream:
        try: fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError: return False
        fcntl.flock(stream,fcntl.LOCK_UN)
    return True


def pid_exists(pid):
    if not pid: return False
    try: os.kill(int(pid),0)
    except ProcessLookupError: return False
    return True


def prospective_evaluation_seconds(protocol,tasks=2):
    """Prospective arithmetic also works before the new core is installed.

    Keep equal to study_transfer.paired_evaluation_seconds; do not import a new
    callable during old-implementation verification or reinterpret old pools.
    """
    return (2*protocol['adaptation_seconds'] + 2*tasks*protocol['validation_seconds'] +
            2*min(1800,2*protocol['validation_seconds']))


def protected_horizon(protocol,start_round,start_phase):
    """Prepay the resumed review and next four rounds, without spending trial money."""
    p=protocol;horizon=ADDITIONAL_ROUNDS;episode=p['episode_rounds']
    if start_phase not in ('research','review') or start_round%episode or horizon%episode:
        raise RuntimeError('continuation horizon must start at a complete episode boundary')
    evaluation=prospective_evaluation_seconds(p)
    review=2*p['call_seconds'];pools={}
    if start_phase=='review':
        pools['paired-evaluation-episode-'+str(start_round)]=(evaluation,2,0)
        pools['review-'+str(start_round)]=(review,2,2)
    for first in range(start_round,start_round+horizon,episode):
        end=first+episode
        research=episode*((2+p['proposal_repairs'])*p['call_seconds']+(p['knowledge_checks_per_round']+1)*p['validation_seconds'])
        pools['episode-research-'+str(first)]=(research,(2+p['proposal_repairs'])*episode,(1+p['proposal_repairs'])*episode)
        pools['paired-evaluation-episode-'+str(end)]=(evaluation,2,0)
        pools['review-'+str(end)]=(review,2,2)
    # Existing request programs may ask for earlier reassessment. Reserving
    # these optional slots does not force an extra review or change its agenda.
    for end in range(start_round+1,start_round+horizon+1):
        pools.setdefault('paired-evaluation-episode-'+str(end),(evaluation,2,0))
        pools.setdefault('review-'+str(end),(review,2,2))
    pools['paired-evaluation-final-'+str(start_round+horizon)]=(evaluation,2,0)
    return pools


def capacity_plan(protocol,start_round,start_phase):
    p=protocol;pools=protected_horizon(p,start_round,start_phase)
    main_seconds=sum(v[0] for v in pools.values());main_calls=sum(v[1] for v in pools.values());main_meta=sum(v[2] for v in pools.values())
    side=p['policy_trial_rounds']*((2+p['proposal_repairs'])*p['call_seconds']+p['knowledge_checks_per_round']*p['validation_seconds'])
    downstream=prospective_evaluation_seconds(p)+2*p['call_seconds']
    trial_seconds=2*side+downstream
    trial_calls=2*(2+p['proposal_repairs'])*p['policy_trial_rounds']+4
    trial_meta=2*(1+p['proposal_repairs'])*p['policy_trial_rounds']+2
    required_seconds=main_seconds+p['policy_trials']*trial_seconds
    required_calls=main_calls+p['policy_trials']*trial_calls
    required_meta=main_meta+p['policy_trials']*trial_meta
    if required_seconds>p['arm_seconds'] or required_calls>p['max_calls'] or required_meta>p['meta_calls']:
        raise RuntimeError('new allowance cannot fund protected horizon and optional policy trials')
    normal={k:v for k,v in pools.items() if not ((k.startswith('paired-evaluation-episode-') or k.startswith('review-')) and int(k.rsplit('-',1)[1])%p['episode_rounds'])}
    return dict(normal_main_seconds=sum(v[0] for v in normal.values()),normal_main_calls=sum(v[1] for v in normal.values()),normal_main_meta_calls=sum(v[2] for v in normal.values()),
        optional_early_review_slots='Reserved only; unchanged request programs decide whether used.',protected_pools=pools,protected_seconds=main_seconds,protected_calls=main_calls,protected_meta_calls=main_meta,
        optional_trial_seconds_each=trial_seconds,required_seconds=required_seconds,required_calls=required_calls,
        required_meta_calls=required_meta,accounting='Reserved ceilings, not measured elapsed time; conservative trial downstream includes shared review.')



def preserve_initial_state(common,state_path,destination):
    """Immutable operator checkpoint; no live intent or conversational payload."""
    state=common.load_state(state_path)
    if state['active'] is not None or state.get('active_intent') is not None:
        raise RuntimeError('initial state archive cannot contain active invocation intent')
    expected=sha(state_path)
    copy_file(state_path,destination,expected)
    Path(destination).chmod(0o444)
    return dict(path=str(destination),sha256=expected)


def migrate(parent,number,*,destination=None,caller_binding=None,ongoing=False):
    global COPY_GUARD
    a=api();common=a['common'];parent=Path(parent)
    if ongoing:
        if destination is None or not isinstance(caller_binding,dict):
            raise RuntimeError('ongoing migration requires explicit destination and caller binding')
        if (caller_binding.get('follow_sha256')!=sha(OPS/'follow.py') or
            caller_binding.get('checkpoint_sha256')!=sha(OPS/'FOLLOW.json')):
            raise RuntimeError('ongoing caller source/checkpoint binding changed')
    elif destination is not None or caller_binding is not None:
        raise RuntimeError('explicit migration context requires ongoing authorization')
    old,p,contract,suite,curation=inspect_plan(parent,number,include_private_evaluator_inputs=True,ongoing=ongoing)
    parent_protocol=common.read(parent/'protocol.json')
    ready,reason=parent_ready(parent,first=(parent==INITIAL_PARENT))
    if not ready: raise RuntimeError(reason)
    new=ongoing_destination(destination,number) if ongoing else successor_path(number)
    if new.exists(): raise RuntimeError('successor already exists; no overwrite or uncertain replay')
    old_arm=parent/'arms/exploration';old_ws=old_arm/'workspace'
    planned=planned_copy_bytes(old_arm,old)
    COPY_GUARD=CopyGuard(planned,a['resources'])
    with parent_ownership(parent):
        parent_verification=verify_parent_source(a,parent,new,ongoing=ongoing)
        parent_seal=common.read(parent/'seal.json')
        if parent!=INITIAL_PARENT and sha(parent/'CONTINUATION_PROVENANCE.json')!=parent_seal.get('continuation_provenance_sha256'):
            raise RuntimeError('parent continuation provenance changed')
        common.verify_snapshot(old_arm/'snapshots'/f'round-{old["round"]-1:04d}')
        verified_parent={'official_verify_completed':True,
            'implementation_sha256':parent_verification['implementation_sha256'],
            'old_verification_sha256':parent_verification.get('old_verification_sha256'),
            'parent_state_sha256':sha(old_arm/'state.json'),
            'parent_seal_sha256':sha(parent/'seal.json'),
            'parent_protocol_sha256':sha(parent/'protocol.json')}
        transition=apply_source_maintenance(parent,new,parent_seal,verified_parent=verified_parent) if ongoing else None
        # freeze performs real neutral deployment checks only after launch review;
        # ordinary official research still starts later, in one separate child.
        controls()
        a['study'].freeze(new,p,suite,contract,curation)
        if common.read(new/'seal.json')['seed'] != common.read(INITIAL_PARENT/'seal.json')['seed']:
            raise RuntimeError('successor seed differs from exact original clean seed')
        arm=new/'arms/exploration';workspace=arm/'workspace'
        files=common.inventory(old_ws)
        for name,expected in files.items():
            copy_file(old_ws/name,workspace/name,expected,replace=True)
        copy_history(old_ws/'history',workspace/'history')
        research=copy.deepcopy(old['research'])
        remaps=[]
        for group in ('knowledge','components'):
            for key,record in old['research'][group].items():
                source=Path(record['validation_bundle']['directory'])
                if not source.resolve().is_relative_to(old_arm.resolve()):
                    raise RuntimeError('accepted validator not from own parent arm')
                destination=arm/'inherited/validators'/key
                migrated=copy_closed_bundle(source,destination,record,a['receipts'].reuse)
                a['knowledge'].verify_record(migrated,workspace)
                research[group][key]=migrated
                remaps.append(dict(id=key,source=str(source),destination=str(destination),
                    finished_sha256=record['validation_bundle']['finished_sha256']))
        inherited_jobs=[];pending_dependencies=[]
        from types import SimpleNamespace
        for key,entry in old['research'].get('pending_discoveries',{}).items():
            copied,dependency=copy_pending(a,old_arm,old_ws,arm,workspace,old['research'],key)
            inherited_jobs.append(copied)
            if dependency: pending_dependencies.append(dependency)
        inherited_jobs=dedupe_inherited_jobs(inherited_jobs)
        # Keep all original bindings and global round labels, with one copy per view.
        inherited_snapshots=copy_snapshots(old_arm,arm)
        provenance=dict(schema='math-gkm.own-continuation-provenance.v1',parent_study=str(parent),
            parent_state_sha256=sha(old_arm/'state.json'),parent_seal_sha256=sha(parent/'seal.json'),
            parent_round=old['round'],parent_phase=old['phase'],additional_rounds=ADDITIONAL_ROUNDS,
            parent_verification_implementation_sha256=digest(parent_seal['implementation']),
            source_transition=transition,successor_implementation_sha256=digest(common.implementation()),
            protocol_changes={k:dict(before=parent_protocol[k],after=p[k]) for k in p if parent_protocol[k]!=p[k]},
            new_capacity_plan=capacity_plan(p,old['round'],old['phase']),
            initial_resume_launch_sha256=sha(RESUME/'LAUNCH_CONSUMED.json'),
            review_resume='Preserve pending review and mathematics; run new isolated roles with new allowance; no prior partial evaluation outputs copied.',
            parent_research_sha256=digest(old['research']),parent_workspace_inventory=files,
            preserved_mathematical_state='identical except explicit validator directory relocation',
            old_accounting={k:v for k,v in old.items() if k!='research'},
            validator_remaps=remaps,inherited_snapshots=inherited_snapshots,
            snapshot_retention='one exact copy per historical snapshot; round views at snapshots/, other views at inherited/snapshots/',
            inherited_origin_jobs=inherited_jobs,pending_original_dependencies=pending_dependencies,
            inherited_receipt_paths=[j['path'] for j in inherited_jobs],
            inherited_worker_elapsed=sum(j['inherited_elapsed_seconds'] for j in inherited_jobs),
            observer_elapsed_scope='raw receipt sum includes inherited origin jobs; use deltas/new job IDs for new elapsed',
            original_paired_comparison='retained immutable at original path; this successor is not a fresh comparison',
            reused_evaluation_panel_sha256=EXPECTED_SUITE,
            evaluation_scope='same original frozen panel, reused; no new independent performance claim',
            excluded='old role trees, adapter jobs, evaluation outputs, active jobs, caches and compiled build files',
            user_goal=GOAL,goal_channel='operator-only; no proof ideas or additional proposer instructions',
            created=time.time())
        write(new/'CONTINUATION_PROVENANCE.json',provenance)
        seal=common.read(new/'seal.json')
        seal['continuation_provenance_sha256']=sha(new/'CONTINUATION_PROVENANCE.json')
        seal['baseline_adjustments']=['noncomparative own-history continuation; baseline placeholder is dormant',
            'exploration resumes only its own mathematical state and sources',
            'fresh finite accounting allowance; previous costs retained in continuation provenance',
            'same frozen evaluator panel reused, no new independent performance claim']
        plan=common.read(new/'audit/plan.json')
        plan['checkpoints']=['initial']+[f'round-{r:04d}' for r in range(old['round'],p['rounds'])]+['terminal']
        plan['initial_scope']='resumed own source and admitted knowledge; not a pristine comparison seed'
        plan['continuation_provenance_sha256']=seal['continuation_provenance_sha256']
        common.write(new/'audit/plan.json',plan)
        seal['observer_plan']=plan;seal['audit_plan_sha256']=sha(new/'audit/plan.json')
        common.write(new/'seal.json',seal)
        seal_hash=common.digest(seal)
        for mode in ('baseline','exploration'):
            path=new/'arms'/mode/'state.json';fresh=common.load_state(path)
            state=epoch_state(fresh,old,research,seal_hash) if mode=='exploration' else {**fresh,'seal_hash':seal_hash}
            if mode=='exploration':
                mark_inherited_consumed(state,inherited_jobs)
            common.save_state(path,state)
        # Protect the complete requested horizon before any optional strategy trial.
        a['study'].Arm(new,'exploration',-1).fund_many(protected_horizon(p,old['round'],old['phase']))
        for key in research.get('pending_discoveries',{}):
            a['discoveries'].verify(SimpleNamespace(root=arm,mode='exploration'),research,workspace,key)
        # Replace only newly created seed checkpoint artifacts, recording the prior
        # placeholders. No previously published/research checkpoint is overwritten.
        placeholders={}
        initial=arm/'snapshots/initial'
        placeholders['seed_snapshot_binding']=common.verify_snapshot(initial)['binding']
        import shutil
        placeholder=arm/'inherited/freeze-placeholders/initial'
        placeholder_manifest=common.verify_snapshot(initial)
        for name,expected in placeholder_manifest['files'].items():
            copy_file(initial/'source'/name,placeholder/'source'/name,expected)
        copy_file(initial/'manifest.json',placeholder/'manifest.json')
        shutil.rmtree(initial)
        for path in (arm/'observer-outbox/initial.json',new/'audit/inputs/exploration/initial.json'):
            if path.exists():
                placeholders[str(path.relative_to(new))]=sha(path)
                copy_file(path,new/'freeze-placeholder-records'/path.relative_to(new))
                path.unlink()
        state=common.load_state(arm/'state.json')
        common.snapshot(workspace,initial,research['policy'],a['study'].Arm(new,'exploration',-1).admitted(research))
        a['observer'].checkpoint(new,'exploration','initial',state,initial)
        write(new/'CONTINUATION_PLACEHOLDERS.json',placeholders)
        a['study'].verify(new)
        if common.inventory(old_ws)!=files or sha(old_arm/'state.json')!=provenance['parent_state_sha256']:
            raise RuntimeError('parent changed during migration')
        initial_state=preserve_initial_state(common,arm/'state.json',new/'MIGRATION_INITIAL_STATE.json')
        write(new/'MIGRATION_FINISHED.json',dict(initial_state_path=initial_state['path'],initial_state_sha256=initial_state['sha256'],
            provenance_sha256=sha(new/'CONTINUATION_PROVENANCE.json'),
            seal_sha256=sha(new/'seal.json'),state_sha256=sha(arm/'state.json'),finished=time.time(),
            source_sha256=sha(__file__),
            **({'ongoing_caller':copy.deepcopy(caller_binding)} if ongoing else {'review_sha256':sha(REVIEW_PATH)})))
        COPY_GUARD=None
        return new

def ongoing_destination(destination,number):
    import re
    path=Path(destination)
    if type(number) is not int or number<1 or not re.fullmatch(r'concept-driver-20261020-follow-[0-9]{6,}',path.name):
        raise RuntimeError('explicit fresh ongoing destination required')
    if path.name!=f'concept-driver-20261020-follow-{number:06d}' or path.is_symlink() or path.parent.resolve()!=(ROOT/'.scratch').resolve():
        raise RuntimeError('ongoing destination must be the exact fresh scratch successor')
    return path.resolve()


def successor_path(number):
    if type(number) is not int or not 1<=number<=MAX_EPOCHS:
        raise RuntimeError('finite successor count exceeded')
    return ROOT/'.scratch'/f'concept-driver-20261020-general-{number:04d}'


def registry(**updates):
    path=OPS/'STATUS.json';value=read(path) if path.exists() else {}
    value.update(schema='math-gkm.general-continuation-status.v1',updated=time.time(),
        goal=GOAL,comparison='incomplete original comparison; own-history noncomparative continuation',**updates)
    write(path,value);return value


def event(kind,**fields):
    path=OPS/'events.jsonl'
    if path.exists() and path.stat().st_size>1024**2:
        os.replace(path,path.with_suffix('.previous.jsonl'))
    with path.open('a') as out:
        out.write(canonical(dict(event=kind,time=time.time(),**fields))+'\n');out.flush();os.fsync(out.fileno())


def controls():
    if DEADLINE is not None and time.monotonic()>=DEADLINE-CLEANUP_SECONDS:
        raise RuntimeError('global wall ceiling reached; reserve cleanup and preserve goal open')
    if INTERRUPTED: raise RuntimeError(INTERRUPTED)
    if (OPS/'STOP.json').exists(): raise RuntimeError('operator stop requested')
    if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():
        raise RuntimeError('unresolved resource cleanup hold; independent reconciliation required')


@contextlib.contextmanager
def parent_ownership(parent):
    with (Path(parent)/'controller.lock').open('rb') as lease:
        fcntl.flock(lease,fcntl.LOCK_EX|fcntl.LOCK_NB)
        yield


def checked_implementation(common):
    original=read(INITIAL_PARENT/'seal.json')['implementation']
    if digest(original)!=EXPECTED_IMPL:raise RuntimeError('original implementation archive binding changed')
    for name,expected in original.items():
        source=SOURCE_ARCHIVE/safe_relative(name)
        if source.is_symlink() or not source.resolve().is_relative_to(SOURCE_ARCHIVE.resolve()) or sha(source)!=expected:
            raise RuntimeError('pinned old implementation source archive changed')
    new=dict(original);new['machinery/study_worker.py']=NEW_WORKER
    if original.get('machinery/study_worker.py')!=OLD_WORKER or digest(new)!=NEW_IMPL:
        raise RuntimeError('exact reviewed one-file implementation delta changed')
    allowed=[original,new]
    if CAPACITY_CHANGES:
        capacity=dict(new)
        for name,(old_hash,new_hash,hunks) in CAPACITY_CHANGES.items():
            if new.get(name)!=old_hash:raise RuntimeError('capacity old implementation binding changed')
            capacity[name]=new_hash
        if digest(capacity)!=CAPACITY_IMPL:raise RuntimeError('exact reviewed capacity implementation delta changed')
        allowed.append(capacity)
        if REQUEST_CONTEXT_FILES:
            revised=dict(capacity)
            for name,(before,after) in REQUEST_CONTEXT_FILES.items():
                if revised.get(name)!=before:raise RuntimeError('request context old source binding changed')
                revised[name]=after
            if digest(revised)!=REQUEST_CONTEXT_IMPL:raise RuntimeError('reviewed request context source map changed')
            allowed.append(revised)
    if CATALOGUE_CHANGES:
        predecessor=next((m for m in allowed if digest(m)==REQUEST_CONTEXT_IMPL),None)
        if predecessor is not None:
            catalogue=dict(predecessor)
            for name,(before,after,hunks) in CATALOGUE_CHANGES.items():
                if catalogue.get(name)!=before:raise RuntimeError('catalogue old source map changed')
                catalogue[name]=after
            if digest(catalogue)!=CATALOGUE_IMPL:raise RuntimeError('reviewed catalogue source map changed')
            allowed.append(catalogue)
    predecessor=next((m for m in allowed if digest(m)==CATALOGUE_IMPL),None)
    if predecessor is not None and predecessor.get('machinery/study_common.py')==RETENTION_COMMON_OLD:
        revised={**predecessor,'machinery/study_common.py':RETENTION_COMMON_NEW}
        if digest(revised)!=RETENTION_IMPL:raise RuntimeError('reviewed retention source map changed')
        allowed.append(revised)
    predecessor=next((m for m in allowed if digest(m)==RETENTION_IMPL),None)
    if predecessor is not None:
        revised={**predecessor,'machinery/study_context.py':PROMPT_VIEW_CONTEXT}
        if digest(revised)!=PROMPT_VIEW_IMPL:raise RuntimeError('reviewed prompt-view source map changed')
        allowed.append(revised)
    predecessor=next((m for m in allowed if digest(m)==PROMPT_VIEW_IMPL),None)
    if predecessor is not None:
        revised=dict(predecessor)
        for name,(before,after) in RETENTION12_CHANGES.items():
            if revised.get(name)!=before:raise RuntimeError('retention12 old source map changed')
            revised[name]=after
        if digest(revised)!=RETENTION12_IMPL:raise RuntimeError('retention12 reviewed source map changed')
        allowed.append(revised)
    predecessor=next((m for m in allowed if digest(m)==RETENTION12_IMPL),None)
    if predecessor is not None:
        if predecessor.get('machinery/study_common.py')!='1112761aa57a317a0bb8573fe16cd79ad29ad58760b802774bfc16cb5b4a42ec':
            raise RuntimeError('retention54 exact predecessor changed')
        revised={**predecessor,'machinery/study_common.py':RETENTION54_COMMON}
        if digest(revised)!=RETENTION54_IMPL:raise RuntimeError('retention54 exact source map changed')
        allowed.append(revised)
    actual=common.implementation()
    if actual not in allowed:
        predecessor=next((m for m in allowed if digest(m)==PT_OLD_CORE),None)
        if predecessor is not None:
            if cs19_selected(digest(actual)):
                guard=cs19_guard()
                base=pt_map(predecessor,guard.historical17_config())
                allowed.append(guard.tip_map(guard.historical19_map(base),guard.config()))
            elif ca19_selected(digest(actual)):
                guard=ca19_guard()
                base=pt_map(predecessor,guard.historical17_config())
                allowed.append(guard.tip_map(base,guard.config()))
            else:allowed.append(pt_map(predecessor,pt_config()))
    if actual not in allowed:raise RuntimeError('implementation has an unreviewed source delta')
    return digest(actual)


def atomic_protected(path,data,mode):
    path=Path(path)
    allowed=(ROOT/'machinery/study_worker.py',ROOT/'.bootstrap/study-authorization.json',
        *(ROOT/name for name in CAPACITY_CHANGES),
        *(ROOT/name for name in CATALOGUE_CHANGES),
        ROOT/'machinery/study_common.py',RETENTION_STUDY/'seal.json',
        RETENTION_STUDY/'arms/baseline/state.json',RETENTION_STUDY/'arms/exploration/state.json',
        OPS/'RETENTION_CAPACITY_REVISION.json',PROMPT_VIEW_RECORD,PROMPT_VIEW_STUDY/'seal.json',
        PROMPT_VIEW_STUDY/'arms/baseline/state.json',PROMPT_VIEW_STUDY/'arms/exploration/state.json',
        REQUEST_CONTEXT_STUDY/'seal.json',REQUEST_CONTEXT_STUDY/'arms/baseline/state.json',
        REQUEST_CONTEXT_STUDY/'arms/exploration/state.json',OPS/'REQUEST_CONTEXT_REVISION.json',
        RETENTION54_STUDY/'seal.json',RETENTION54_STUDY/'arms/baseline/state.json',
        RETENTION54_STUDY/'arms/exploration/state.json',RETENTION54_PACKET/'after/seal.json',
        RETENTION54_PACKET/'after/arms-baseline-state.json',RETENTION54_PACKET/'after/arms-exploration-state.json',
        RETENTION54_PACKET/'REVISION.json',RETENTION54_PACKET/'activation-authority.before.json')
    if (path not in allowed or path.is_symlink() or path.parent.is_symlink() or
        path.parent.resolve()!=ROOT.resolve()/path.relative_to(ROOT).parent):
        raise RuntimeError('maintenance target escaped workspace')
    temporary=path.with_name(path.name+'.maintenance.next')
    with temporary.open('xb') as output:
        output.write(data);output.flush();os.fsync(output.fileno())
    temporary.chmod(mode);os.replace(temporary,path)
    descriptor=os.open(path.parent,os.O_RDONLY)
    try:os.fsync(descriptor)
    finally:os.close(descriptor)


def reload_capacity_modules():
    """Reload shared module objects, before freeze uses the changed inspector."""
    importlib.invalidate_caches()
    names=('machinery.proof_audit','machinery.inspection_stream','machinery.own_feedback')
    for name in names:
        module=importlib.import_module(name)
        if Path(module.__file__).resolve()!=ROOT/(name.replace('.', '/')+'.py'):
            raise RuntimeError('capacity module import escaped pinned source')
        importlib.reload(module)
    proof=importlib.import_module('machinery.proof_audit')
    if proof.EDGE_LIMIT!=2000000 or proof.WORK_LIMIT!=200000:
        raise RuntimeError('loaded capacity bounds differ from reviewed source')
    return list(names)


def apply_source_maintenance(parent,destination,parent_seal,*,verified_parent=None):
    """Genuine old verification has just run; never verify that old study as new."""
    a=api();common=a['common'];actual=checked_implementation(common)
    record=authorize_ongoing();checkpoint=read(OPS/'FOLLOW.json')
    if cs19_selected(actual):
        pt_require(digest(parent_seal['implementation'])==actual,'capacity source family requires its actual new-source parent seal')
        cs19_guard().applied_lineage()
        return None
    if ca19_selected(actual):
        pt_require(digest(parent_seal['implementation'])==actual,'new19 source family requires its actual new-source parent seal')
        ca19_guard().applied_lineage()
        return None
    if pt_is_new(actual):
        pt_require(digest(parent_seal['implementation'])==actual,'new source family requires actual new-source parent seal')
        pt_lineage();pt_guard().applied(pt_operator())
        return None
    if actual==RETENTION54_IMPL:
        retention54_api().applied()
        if digest(parent_seal['implementation'])!=RETENTION54_IMPL:
            raise RuntimeError('retention54 historical parent cannot be relabeled')
        return None
    if actual==RETENTION12_IMPL:
        retention12_fresh_source()
        if Path(parent)==RETENTION12_PARENT:
            witness=retention12_witness()
            if (Path(destination)!=RETENTION12_DESTINATION or digest(parent_seal['implementation'])!=PROMPT_VIEW_IMPL or
                not verified_parent or verified_parent.get('implementation_sha256')!=PROMPT_VIEW_IMPL or
                verified_parent.get('old_verification_sha256')!=sha(RETENTION12_PACKET/'OLD_VERIFICATION.json')):
                raise RuntimeError('exact verified retention12 old-parent handoff required')
            return dict(schema='math-gkm.retention12-source-transition.v1',status='verified_before_successor_freeze',
                old_implementation_sha256=PROMPT_VIEW_IMPL,implementation_sha256=RETENTION12_IMPL,
                old_verification_sha256=sha(RETENTION12_PACKET/'OLD_VERIFICATION.json'),
                parent_state_sha256=witness['parent_hashes']['arms/exploration/state.json'],
                parent_unchanged=True,scope='successor only; original parent proofs, charges, seal and both states unchanged')
        if digest(parent_seal['implementation'])!=RETENTION12_IMPL:raise RuntimeError('unreviewed historical parent source')
        return None
    if actual==PROMPT_VIEW_IMPL:
        prompt_view_applied()
        if digest(parent_seal['implementation'])!=PROMPT_VIEW_IMPL:raise RuntimeError('historical parent cannot be relabeled')
        return None
    if actual==RETENTION_IMPL:
        completed=checkpoint.get('retention_capacity_revision',{})
        if digest(parent_seal['implementation'])!=RETENTION_IMPL or completed.get('status')!='applied':
            raise RuntimeError('retention source revision incomplete or historical parent is not current')
        return None
    if (actual==CATALOGUE_IMPL or (actual==REQUEST_CONTEXT_IMPL and
            'catalogue_capacity_maintenance' in record)):
        return apply_catalogue_source_maintenance(parent,destination,parent_seal,record,checkpoint,
            verified_parent=verified_parent)
    capacity=(actual==NEW_IMPL and bool(CAPACITY_CHANGES) and 'inspection_capacity_maintenance' in record)
    if capacity and (not isinstance(record['inspection_capacity_maintenance'],dict) or
        record['inspection_capacity_maintenance'].get('status')=='applied'):
        raise RuntimeError('capacity maintenance grant is malformed or already applied; reconcile explicitly')
    if actual in (NEW_IMPL,CAPACITY_IMPL,REQUEST_CONTEXT_IMPL) and not capacity:
        if digest(parent_seal['implementation'])!=actual:
            raise RuntimeError('historical old parent cannot be reverified as the new implementation')
        field=('request_context_revision' if actual==REQUEST_CONTEXT_IMPL else
            'inspection_capacity_transition' if actual==CAPACITY_IMPL else 'source_transition')
        completed=checkpoint.get(field,{})
        if completed.get('status')!='applied':raise RuntimeError('source transition is incomplete; no replay')
        return None
    old_id,new_id=(NEW_IMPL,CAPACITY_IMPL) if capacity else (EXPECTED_IMPL,NEW_IMPL)
    parent_expected,destination_expected=(CAPACITY_PARENT,CAPACITY_DESTINATION) if capacity else (MAINTENANCE_PARENT,MAINTENANCE_DESTINATION)
    key,field=('inspection_capacity_maintenance','inspection_capacity_transition') if capacity else ('source_maintenance','source_transition')
    spec=record.get(key)
    expected={'parent_study':str(parent_expected),'destination':str(destination_expected),
        'old_implementation_sha256':old_id,'new_implementation_sha256':new_id}
    if capacity:
        prior=checkpoint.get('source_transition',{})
        if prior.get('status')!='applied' or prior.get('actual_implementation_sha256')!=NEW_IMPL:
            raise RuntimeError('prior worker source transition missing or incomplete')
        expected['source_files']={name:{'before':row[0],'after':row[1]} for name,row in CAPACITY_CHANGES.items()}
    else:
        expected.update(old_worker_sha256=OLD_WORKER,new_worker_sha256=NEW_WORKER,source_archive=str(SOURCE_ARCHIVE.resolve()))
    if (not isinstance(spec,dict) or spec.get('authorized') is not True or not spec.get('reviewer') or
        any(spec.get(k)!=v for k,v in expected.items()) or Path(parent)!=parent_expected or Path(destination)!=destination_expected):
        raise RuntimeError('exact one-time source maintenance authority required')
    state_path=Path(parent)/'arms/exploration/state.json'
    if (sha(state_path)!=spec.get('parent_state_sha256') or sha(Path(parent)/'seal.json')!=spec.get('parent_seal_sha256') or
        digest(parent_seal['implementation'])!=old_id or record.get('implementation_sha256')!=old_id):
        raise RuntimeError('authorized historical parent checkpoint changed')
    state=common.load_state(state_path)
    if (state.get('active') is not None or state.get('active_intent') is not None or
        state['status']!='finite_budget_finished; root_open' or
        (capacity and (state.get('resolution') is not None or state['round']!=28 or read(Path(parent)/'protocol.json')['rounds']!=28 or
            (Path(parent)/'STOP.json').exists()))):
        raise RuntimeError('maintenance parent is not quiescent')
    for name in ('FOLLOW.lock','operator.lock'):
        if not (OPS/name).is_file() or lock_available(OPS/name):
            raise RuntimeError('maintenance requires both owned supervisor singleton locks')
    identity=a['resources'].current_process(os.getpid())
    if checkpoint.get('operator_pid')!=os.getpid() or not identity or checkpoint.get('operator_birth')!=identity['identity']:
        raise RuntimeError('maintenance supervisor native ownership binding changed')
    if checkpoint.get(field) or checkpoint.get('phase')!='migration_intent' or checkpoint.get('parent_study')!=str(parent) or checkpoint.get('destination')!=str(destination):
        raise RuntimeError('maintenance intent is uncertain or already consumed; no replay')
    if Path(destination).exists() or Path(destination).is_symlink():raise RuntimeError('maintenance successor already exists')
    replacements={};authority=ROOT/'.bootstrap/study-authorization.json'
    if capacity:
        for name,(old_hash,new_hash,hunks) in CAPACITY_CHANGES.items():
            target=ROOT/name;revised=target.read_bytes()
            if sha(target)!=old_hash:raise RuntimeError('exact capacity maintenance source changed')
            for before,after in hunks:
                if revised.count(before)!=1:raise RuntimeError('exact capacity maintenance hunk changed')
                revised=revised.replace(before,after)
            if hashlib.sha256(revised).hexdigest()!=new_hash:raise RuntimeError('reviewed capacity replacement bytes differ')
            replacements[target]=revised
    else:
        worker=ROOT/'machinery/study_worker.py';original=worker.read_bytes();needle=b"    fs = profile['filesystem']\n"
        if sha(worker)!=OLD_WORKER or original.count(needle)!=1:raise RuntimeError('exact worker maintenance hunk changed')
        revised=original.replace(needle,needle+b"    fs[':tmpdir'] = 'write'  # TMPDIR is this role's workspace/.scratch.\n")
        if hashlib.sha256(revised).hexdigest()!=NEW_WORKER:raise RuntimeError('reviewed replacement worker bytes differ')
        replacements[worker]=revised
    intent={'status':'intent',**expected,'parent_state_sha256':sha(state_path),'parent_seal_sha256':sha(Path(parent)/'seal.json'),
        'historical_verification':'official study.verify completed against the actual old implementation before this intent',
        'authorized_reviewer':spec['reviewer'],'created':time.time()}
    with (ROOT/'.scratch/resources/heavy.lock').open('rb') as heavy:
        fcntl.flock(heavy,fcntl.LOCK_EX|fcntl.LOCK_NB);controls()
        a['resources'].headroom(a['resources'].limits())
        if checked_implementation(common)!=old_id or sha(state_path)!=intent['parent_state_sha256'] or read(authority)!=record:
            raise RuntimeError('quiescent maintenance bindings changed')
        checkpoint[field]=intent;write(OPS/'FOLLOW.json',checkpoint)
        for target,revised in replacements.items():atomic_protected(target,revised,target.stat().st_mode & 0o777)
        if checked_implementation(common)!=new_id:raise RuntimeError('actual source transition differs from reviewed map')
        loaded=reload_capacity_modules() if capacity else None
        updated=copy.deepcopy(record);updated['implementation_sha256']=new_id
        updated[key]={**spec,'status':'applied'}
        atomic_protected(authority,(canonical(updated)+'\n').encode(),0o444)
        common.authorize_live(read(Path(parent)/'seed/contract.json'))
        completed={**intent,'status':'applied','intent_sha256':digest(intent),
            'authorization_sha256':sha(authority),'actual_implementation_sha256':checked_implementation(common),'finished':time.time()}
        if capacity:completed['reloaded_modules']=loaded
        checkpoint[field]=completed;write(OPS/'FOLLOW.json',checkpoint)
    return completed


def reload_catalogue_modules():
    """Keep common/Invalid stable; refresh the consumer after its calculator."""
    importlib.invalidate_caches()
    common=importlib.import_module('machinery.study_common');invalid=common.Invalid
    names=('machinery.study_research_feedback','machinery.study_transfer','machinery.study')
    loaded={}
    for name in names:
        module=importlib.import_module(name)
        if Path(module.__file__).resolve()!=ROOT/(name.replace('.', '/')+'.py'):
            raise RuntimeError('catalogue module import escaped pinned source')
        loaded[name]=importlib.reload(module)
    transfer=loaded['machinery.study_transfer'];study=loaded['machinery.study']
    if (importlib.import_module('machinery.study_common') is not common or common.Invalid is not invalid or
            loaded['machinery.study_research_feedback'].Invalid is not invalid or
            transfer.Invalid is not invalid or study.Invalid is not invalid or
            study.paired_evaluation_seconds is not transfer.paired_evaluation_seconds or
            transfer.catalogue_seconds({'validation_seconds':900})!=1800):
        raise RuntimeError('loaded catalogue calculator or common identity changed')
    return list(names)


def apply_catalogue_source_maintenance(parent,destination,parent_seal,record,checkpoint,*,verified_parent):
    """One clean-boundary operator source revision; no historical replay/rebind."""
    a=api();common=a['common'];actual=checked_implementation(common)
    field='catalogue_capacity_transition';key='catalogue_capacity_maintenance'
    if actual==CATALOGUE_IMPL:
        completed=checkpoint.get(field,{})
        if (digest(parent_seal['implementation'])!=actual or completed.get('status')!='applied' or
                completed.get('actual_implementation_sha256')!=actual):
            raise RuntimeError('catalogue transition incomplete or historical old parent; no replay')
        return None
    spec=record.get(key);parent=Path(parent);destination=Path(destination)
    after=dict(parent_seal['implementation'])
    for name,(before,new,hunks) in CATALOGUE_CHANGES.items():
        if after.get(name)!=before:raise RuntimeError('catalogue exact old source map changed')
        after[name]=new
    expected={'parent_study':str(CATALOGUE_PARENT),'destination':str(CATALOGUE_DESTINATION),
        'old_implementation_sha256':REQUEST_CONTEXT_IMPL,'new_implementation_sha256':CATALOGUE_IMPL,
        'old_implementation':parent_seal['implementation'],'new_implementation':after,
        'source_files':{name:{'before':row[0],'after':row[1]} for name,row in CATALOGUE_CHANGES.items()}}
    if (not isinstance(spec,dict) or spec.get('authorized') is not True or not spec.get('reviewer') or
            spec.get('status')=='applied' or any(spec.get(k)!=v for k,v in expected.items()) or
            parent!=CATALOGUE_PARENT or destination!=CATALOGUE_DESTINATION or
            actual!=REQUEST_CONTEXT_IMPL or digest(after)!=CATALOGUE_IMPL):
        raise RuntimeError('exact one-time catalogue maintenance authority required')
    prior=checkpoint.get('request_context_revision',{})
    if prior.get('status')!='applied' or prior.get('actual_implementation_sha256')!=REQUEST_CONTEXT_IMPL:
        raise RuntimeError('prior request context source revision missing or incomplete')
    state_path=parent/'arms/exploration/state.json'
    bindings={'parent_state_sha256':sha(state_path),'parent_seal_sha256':sha(parent/'seal.json'),
        'parent_protocol_sha256':sha(parent/'protocol.json')}
    witness={'official_verify_completed':True,'implementation_sha256':REQUEST_CONTEXT_IMPL,**bindings}
    if (verified_parent!=witness or any(spec.get(k)!=v for k,v in bindings.items()) or
            digest(parent_seal['implementation'])!=REQUEST_CONTEXT_IMPL or
            record.get('implementation_sha256')!=REQUEST_CONTEXT_IMPL):
        raise RuntimeError('genuine old verification or catalogue parent checkpoint changed')
    state=common.load_state(state_path)
    if (state.get('active') is not None or state.get('active_intent') is not None or
            state.get('resolution') is not None or state.get('status')!='finite_budget_finished; root_open' or
            state.get('round')!=36 or read(parent/'protocol.json')['rounds']!=36 or
            (parent/'STOP.json').exists()):
        raise RuntimeError('catalogue parent is not quiescent at its normal boundary')
    for name in ('FOLLOW.lock','operator.lock'):
        if not (OPS/name).is_file() or lock_available(OPS/name):
            raise RuntimeError('catalogue maintenance requires owned supervisor singleton locks')
    if lock_available(parent/'controller.lock'):
        raise RuntimeError('catalogue maintenance requires owned parent controller lock')
    identity=a['resources'].current_process(os.getpid())
    if checkpoint.get('operator_pid')!=os.getpid() or not identity or checkpoint.get('operator_birth')!=identity['identity']:
        raise RuntimeError('catalogue supervisor native ownership binding changed')
    if (checkpoint.get(field) or checkpoint.get('phase')!='migration_intent' or
            checkpoint.get('parent_study')!=str(parent) or checkpoint.get('destination')!=str(destination)):
        raise RuntimeError('catalogue intent is uncertain or consumed; no replay')
    if destination.exists() or destination.is_symlink():raise RuntimeError('catalogue successor already exists')
    replacements={}
    for name,(before,new,hunks) in CATALOGUE_CHANGES.items():
        target=ROOT/name;data=target.read_bytes()
        if sha(target)!=before:raise RuntimeError('catalogue source changed before intent')
        for old,revised in hunks:
            if data.count(old)!=1:raise RuntimeError('catalogue pinned source hunk changed')
            data=data.replace(old,revised)
        if hashlib.sha256(data).hexdigest()!=new:raise RuntimeError('catalogue reviewed replacement bytes differ')
        replacements[target]=data
    authority=ROOT/'.bootstrap/study-authorization.json'
    intent={'status':'intent',**expected,**bindings,'authorized_reviewer':spec['reviewer'],
        'historical_verification':'official study.verify completed under the unchanged predecessor before this intent',
        'created':time.time()}
    with (ROOT/'.scratch/resources/heavy.lock').open('rb') as heavy:
        fcntl.flock(heavy,fcntl.LOCK_EX|fcntl.LOCK_NB);controls();a['resources'].headroom(a['resources'].limits())
        if (checked_implementation(common)!=REQUEST_CONTEXT_IMPL or read(authority)!=record or
                any(sha(parent/name)!=bindings[key] for key,name in
                    [('parent_state_sha256','arms/exploration/state.json'),('parent_seal_sha256','seal.json'),('parent_protocol_sha256','protocol.json')])):
            raise RuntimeError('quiescent catalogue maintenance bindings changed')
        checkpoint[field]=intent;write(OPS/'FOLLOW.json',checkpoint)
        for target,data in replacements.items():
            controls();atomic_protected(target,data,target.stat().st_mode & 0o777)
        if checked_implementation(common)!=CATALOGUE_IMPL:raise RuntimeError('actual catalogue source transition differs')
        loaded=reload_catalogue_modules();controls()
        updated=copy.deepcopy(record);updated['implementation_sha256']=CATALOGUE_IMPL
        updated[key]={**spec,'status':'applied'}
        atomic_protected(authority,(canonical(updated)+'\n').encode(),0o444)
        common.authorize_live(read(parent/'seed/contract.json'))
        completed={**intent,'status':'applied','intent_sha256':digest(intent),'authorization_sha256':sha(authority),
            'actual_implementation_sha256':checked_implementation(common),'reloaded_modules':loaded,'finished':time.time()}
        checkpoint[field]=completed;write(OPS/'FOLLOW.json',checkpoint)
    return completed


def request_context_api():
    from machinery import study_context,study_deployment
    return {'projection':study_context.recovery_projection,'verify_deployment':study_deployment.reuse_deployment}


@contextlib.contextmanager
def request_context_locks():
    # No child launch. A failed/partial transaction remains explicit and is never replayed.
    with contextlib.ExitStack() as stack:
        for path in (OPS/'FOLLOW.lock',OPS/'operator.lock',REQUEST_CONTEXT_STUDY/'controller.lock',ROOT/'.scratch/resources/heavy.lock'):
            stream=stack.enter_context(path.open('rb'));fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        controls();yield


def revision_bytes(value):
    return (canonical(value)+'\n').encode()


def rebind_request_context(deployment):
    """Explicit source-version revision at closed round30; preserves every cost/path."""
    with request_context_locks():
        a=api();common=a['common'];context=request_context_api();study=REQUEST_CONTEXT_STUDY
        authorization=authorize_ongoing();spec=authorization.get('request_context_maintenance',{})
        if (spec.get('authorized') is not True or not spec.get('reviewer') or
            spec.get('study')!=str(study) or spec.get('old_implementation_sha256')!=CAPACITY_IMPL or
            spec.get('implementation_sha256')!=REQUEST_CONTEXT_IMPL or checked_implementation(common)!=REQUEST_CONTEXT_IMPL):
            raise RuntimeError('exact reviewed request context revision authority required')
        record_path=OPS/'REQUEST_CONTEXT_REVISION.json';checkpoint=read(OPS/'FOLLOW.json')
        if record_path.exists() or checkpoint.get('request_context_revision'):
            raise RuntimeError('request context revision already started; explicit finish only, never replay')
        original_authority=Path(spec['old_authorization_path']).read_bytes()
        if (hashlib.sha256(original_authority).hexdigest()!=spec['old_authorization_sha256'] or
            json.loads(original_authority).get('implementation_sha256')!=CAPACITY_IMPL):
            raise RuntimeError('original pre-maintenance authorization archive changed')
        witness=read(Path(spec['old_verification_path']));supplement=read(Path(spec['baseline_observation_path']))
        if (sha(spec['old_verification_path'])!=spec['old_verification_sha256'] or
            sha(spec['baseline_observation_path'])!=spec['baseline_observation_sha256'] or
            witness.get('schema')!='math-gkm.request-context-reconciliation-start.v1' or
            witness.get('genuine_old_study_verify_passed') is not True or witness.get('verified_old_implementation')!=CAPACITY_IMPL or
            witness.get('study')!=str(study) or supplement.get('baseline_seal_binding_matches') is not True):
            raise RuntimeError('genuine old verification and supplemental baseline witness required')
        paths={'seal.json':study/'seal.json',**{f'arms/{mode}/state.json':study/'arms'/mode/'state.json' for mode in ('baseline','exploration')}}
        old={name:path.read_bytes() for name,path in paths.items()};seal=json.loads(old['seal.json'])
        states={mode:common.load_state(paths[f'arms/{mode}/state.json']) for mode in ('baseline','exploration')}
        old_hashes={name:hashlib.sha256(raw).hexdigest() for name,raw in old.items()}
        if (old_hashes['seal.json']!=witness['old_seal_sha256'] or digest(seal['implementation'])!=CAPACITY_IMPL or
            old_hashes['arms/exploration/state.json']!=witness['old_state_sha256'] or
            old_hashes['arms/baseline/state.json']!=supplement['baseline_state_sha256'] or
            supplement.get('old_seal_sha256')!=old_hashes['seal.json'] or
            supplement.get('old_verification_witness_sha256')!=spec['old_verification_sha256'] or
            sha(study/'protocol.json')!=witness['old_protocol_sha256']):
            raise RuntimeError('old stopped source/version bindings changed')
        if any(v.get('seal_hash')!=digest(seal) for v in states.values()):raise RuntimeError('old arm seal bindings changed')
        common.authorize_live(read(study/'seed/contract.json'))
        state=states['exploration'];job=study/'arms/exploration/jobs/plan-0030';receipt=read(job/'receipt.json')
        if (state.get('round')!=30 or state.get('phase')!='research' or state.get('active') is not None or
            state.get('active_intent') is not None or state.get('resolution') is not None or
            any(s.get('active') is not None or s.get('active_intent') is not None for s in states.values()) or
            str(job) not in state['receipts'] or state['receipt_hashes'].get(str(job))!=digest(receipt) or
            state['reservations'].get('call-plan-0030')!=read(job/'spec.json')['seconds'] or
            'plan-0030' not in state['counted_jobs'] or receipt.get('returncode')!=1 or receipt.get('payload') is not None or
            receipt.get('before')!=receipt.get('after') or not receipt.get('outcome','').startswith('invalid_report:') or
            (job/'final.json').exists() or (job.parent/'plan-0030-repair-1').exists() or
            any(str(p) not in state['receipts'] for p in job.parent.iterdir() if p.is_dir())):
            raise RuntimeError('only exact closed consumed input rejection may be rebound')
        stderr=(job/'stderr.log').read_text();match=re.search(r'data: (\{.*\})\s*$',stderr)
        diagnostic=json.loads(match[1]) if match else {}
        events=[json.loads(line) for line in (job/'events.jsonl').read_text().splitlines() if line]
        prompt_chars=len((job/'prompt.txt').read_text())
        if ((study/'STOP.json').exists() or diagnostic.get('input_error_code')!='input_too_large' or
            diagnostic.get('max_chars')!=1048576 or diagnostic.get('actual_chars')!=prompt_chars or prompt_chars<=1048576 or
            not events or any(v.get('type')!='thread.started' for v in events)):
            raise RuntimeError('no exact provider rejection before model start')
        if spec.get('native_cleanup_verified') is not True:raise RuntimeError('independent native cleanup witness required')
        for pid,birth in spec.get('native_owners',{}).items():
            info=a['resources'].process_status(int(pid))
            if info and info['identity']==birth:raise RuntimeError('historical native owner remains')
        for pid in receipt.get('resources',{}).get('owned_identities',{}):
            if a['resources'].process_status(int(pid)):raise RuntimeError('failed proposer identity still present')
        a['resources'].headroom(a['resources'].limits());context['verify_deployment'](deployment)
        if not deployment.get('ready'):raise RuntimeError('fresh new implementation deployment not ready')
        origin={name:sha(study/name) for name in ('CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json')}
        core={'schema':'math-gkm.request-context-revision.v1','study':str(study),'old_implementation_sha256':CAPACITY_IMPL,
            'implementation_sha256':REQUEST_CONTEXT_IMPL,'old_files':old_hashes,'old_verification_sha256':spec['old_verification_sha256'],
            'original_authorization_sha256':spec['old_authorization_sha256'],
            'baseline_observation_sha256':spec['baseline_observation_sha256'],'baseline_hash_observed_after_genuine_verify':True,
            'protocol_sha256':sha(study/'protocol.json'),'unchanged_origins':origin,'deployment':deployment,
            'old_deployment':seal.get('deployment_preflight'),
            'recovery_projection_sha256':digest(context['projection'](state)),'created':time.time()}
        binding=digest(core);new_seal={**seal,'implementation':common.implementation(),'deployment_preflight':deployment,
            'frozen_at':time.time(),'source_revision':{'record':str(record_path),'binding':binding,'old_seal_sha256':old_hashes['seal.json']}}
        revised={'seal.json':revision_bytes(new_seal)}
        for mode in ('baseline','exploration'):
            updated={**states[mode],'seal_hash':digest(new_seal)}
            revised[f'arms/{mode}/state.json']=revision_bytes({'state':updated,'sha256':digest(updated)})
        files={name:{'old_sha256':old_hashes[name],'old_bytes_base64':base64.b64encode(old[name]).decode(),
            'new_sha256':hashlib.sha256(revised[name]).hexdigest(),'new_bytes_base64':base64.b64encode(revised[name]).decode()} for name in paths}
        record={'schema':'math-gkm.closed-proposer-recovery.v1','study':str(study),'arm':'exploration',
            'failed_request_id':'plan-0030','next_request_id':'plan-0030-repair-1','request_binding':digest(read(job/'request.json')),
            'receipt_binding':digest(receipt),'receipt_file_sha256':sha(job/'receipt.json'),'spec_sha256':sha(job/'spec.json'),
            'events_sha256':sha(job/'events.jsonl'),'stderr_sha256':sha(job/'stderr.log'),'old_implementation_sha256':CAPACITY_IMPL,
            'implementation_sha256':REQUEST_CONTEXT_IMPL,'old_seal_sha256':old_hashes['seal.json'],
            'stopped_state_sha256':old_hashes['arms/exploration/state.json'],'recovery_projection_sha256':core['recovery_projection_sha256'],
            'no_model_started':True,'native_cleanup_verified':True,'classification':'closed_input_too_large_no_model',
            'revision_binding':binding,'revision_core':core,'archived_files':files,
            'archived_original_authorization':base64.b64encode(original_authority).decode(),
            'archived_witnesses':{key:base64.b64encode(Path(spec[key]).read_bytes()).decode()
                for key in ('old_verification_path','baseline_observation_path')},
            'archived_origins':{name:base64.b64encode((study/name).read_bytes()).decode() for name in origin},
            'archived_old_deployment_receipt':base64.b64encode(Path(seal['deployment_preflight']['receipt']).read_bytes()).decode()}
        # Archive first, then persist the complete three-file intent before changing any seal/state.
        atomic_protected(record_path,revision_bytes(record),0o444)
        after={**authorization,'operational_recovery':{'path':str(record_path),'sha256':sha(record_path)}}
        checkpoint['request_context_revision']={'status':'install_intent','record':str(record_path),'record_sha256':sha(record_path),
            'authorization_before_sha256':sha(ROOT/'.bootstrap/study-authorization.json'),
            'authorization_after_sha256':hashlib.sha256(revision_bytes(after)).hexdigest(),'actual_implementation_sha256':REQUEST_CONTEXT_IMPL}
        write(OPS/'FOLLOW.json',checkpoint)
        return _finish_request_context_rebind()


def finish_request_context_rebind():
    """Explicit completion of known three-file writes; no deployment, model or job replay."""
    with request_context_locks():return _finish_request_context_rebind()


def _finish_request_context_rebind():
    a=api();common=a['common'];context=request_context_api();study=REQUEST_CONTEXT_STUDY
    checkpoint=read(OPS/'FOLLOW.json');intent=checkpoint.get('request_context_revision',{});path=OPS/'REQUEST_CONTEXT_REVISION.json'
    if intent.get('status')!='install_intent' or intent.get('record')!=str(path) or sha(path)!=intent.get('record_sha256'):
        raise RuntimeError('no exact incomplete request context revision; never replay')
    record=read(path);core=record['revision_core'];authorization=authorize_ongoing()
    if (checked_implementation(common)!=REQUEST_CONTEXT_IMPL or record['implementation_sha256']!=REQUEST_CONTEXT_IMPL or
        record['revision_binding']!=digest(core) or record['study']!=str(study)):
        raise RuntimeError('request context revision source or archive binding changed')
    raw_authority=base64.b64decode(record['archived_original_authorization'],validate=True)
    if (hashlib.sha256(raw_authority).hexdigest()!=core['original_authorization_sha256'] or
        json.loads(raw_authority).get('implementation_sha256')!=CAPACITY_IMPL):
        raise RuntimeError('permanent original authorization archive changed')
    for name,key in [('old_verification_path','old_verification_sha256'),('baseline_observation_path','baseline_observation_sha256')]:
        raw=base64.b64decode(record['archived_witnesses'][name],validate=True)
        if hashlib.sha256(raw).hexdigest()!=core[key]:raise RuntimeError('permanent old verification archive changed')
    for name,raw in record['archived_origins'].items():
        if name not in core['unchanged_origins'] or hashlib.sha256(base64.b64decode(raw,validate=True)).hexdigest()!=core['unchanged_origins'][name]:
            raise RuntimeError('permanent old origin archive changed')
    if hashlib.sha256(base64.b64decode(record['archived_old_deployment_receipt'],validate=True)).hexdigest()!=core['old_deployment']['receipt_sha256']:
        raise RuntimeError('permanent old deployment archive changed')
    current_authority=sha(ROOT/'.bootstrap/study-authorization.json')
    if current_authority not in (intent['authorization_before_sha256'],intent['authorization_after_sha256']):
        raise RuntimeError('request context revision authority changed')
    expected={'seal.json','arms/baseline/state.json','arms/exploration/state.json'}
    if set(record['archived_files'])!=expected:raise RuntimeError('unexpected revision install target')
    decoded={}
    for name,entry in record['archived_files'].items():
        before=base64.b64decode(entry['old_bytes_base64'],validate=True);after=base64.b64decode(entry['new_bytes_base64'],validate=True)
        if hashlib.sha256(before).hexdigest()!=entry['old_sha256'] or hashlib.sha256(after).hexdigest()!=entry['new_sha256']:
            raise RuntimeError('revision byte archive changed')
        target=study/name
        if sha(target) not in (entry['old_sha256'],entry['new_sha256']):raise RuntimeError('uncertain seal/state bytes; no automatic repair')
        decoded[name]=(before,after)
    seal=json.loads(decoded['seal.json'][1])
    if digest(seal['implementation'])!=REQUEST_CONTEXT_IMPL:raise RuntimeError('revision seal source changed')
    if sha(study/'protocol.json')!=core['protocol_sha256'] or any(sha(study/name)!=value for name,value in core['unchanged_origins'].items()):
        raise RuntimeError('historical protocol or origin provenance changed')
    if seal.get('source_revision')!={'record':str(path),'binding':record['revision_binding'],'old_seal_sha256':record['old_seal_sha256']}:
        raise RuntimeError('revision seal does not bind archive')
    for mode in ('baseline','exploration'):
        old_envelope,new_envelope=(json.loads(v) for v in decoded[f'arms/{mode}/state.json'])
        before,after=old_envelope['state'],new_envelope['state']
        if old_envelope['sha256']!=digest(before) or new_envelope['sha256']!=digest(after):raise RuntimeError('revision state envelope changed')
        if {k:v for k,v in before.items() if k!='seal_hash'}!={k:v for k,v in after.items() if k!='seal_hash'} or after['seal_hash']!=digest(seal):
            raise RuntimeError('revision changed mathematical state or accounting')
    for name,(_,raw) in decoded.items():
        if sha(study/name)!=record['archived_files'][name]['new_sha256']:atomic_protected(study/name,raw,(study/name).stat().st_mode & 0o777)
    context['verify_deployment'](core['deployment']);a['study'].verify(study)
    updated={**authorization,'operational_recovery':{'path':str(path),'sha256':sha(path)}}
    if hashlib.sha256(revision_bytes(updated)).hexdigest()!=intent['authorization_after_sha256']:
        raise RuntimeError('revision authorization replacement differs')
    atomic_protected(ROOT/'.bootstrap/study-authorization.json',revision_bytes(updated),0o444)
    checkpoint['request_context_revision']={**intent,'status':'applied','actual_implementation_sha256':REQUEST_CONTEXT_IMPL,
        'new_seal_sha256':sha(study/'seal.json'),'finished':time.time()}
    write(OPS/'FOLLOW.json',checkpoint)
    return checkpoint['request_context_revision']


def immutable_bindings(*,ongoing=False):
    a=api();common=a['common']
    actual_implementation=checked_implementation(common)
    if cs19_selected(actual_implementation):
        cs19_guard().applied_lineage()
    elif ca19_selected(actual_implementation):
        ca19_guard().applied_lineage()
    elif pt_is_new(actual_implementation):
        pt_lineage();pt_guard().applied(pt_operator())
    if actual_implementation==RETENTION54_IMPL:retention54_api().applied()
    lineage_implementation=RETENTION12_IMPL if actual_implementation==RETENTION54_IMPL or pt_is_new(actual_implementation) else actual_implementation
    if not ongoing and actual_implementation!=EXPECTED_IMPL:
        raise RuntimeError('bounded legacy operator cannot use a changed implementation')
    seal=read(INITIAL_PARENT/'seal.json');p=read(INITIAL_PARENT/'protocol.json')
    contract=read(INITIAL_PARENT/'seed/contract.json')
    if digest(seal['implementation'])!=EXPECTED_IMPL or digest(p)!=seal['protocol']:
        raise RuntimeError('original seal/protocol mismatch')
    if digest(contract)!=EXPECTED_CONTRACT or seal['suite']!=EXPECTED_SUITE:
        raise RuntimeError('original exact contract or panel changed')
    if sha(ROOT/contract['root_file'])!=contract['root_sha256']:
        raise RuntimeError('original exact root source changed')
    if common.dependency_identity()!=seal['dependencies']:
        raise RuntimeError('original dependency identity changed')
    for name,expected in seal['seed'].items():
        if sha(INITIAL_PARENT/'seed'/safe_relative(name))!=expected:
            raise RuntimeError('original clean seed changed')
    common.authorize_live(contract)
    if lineage_implementation in (NEW_IMPL,CAPACITY_IMPL,REQUEST_CONTEXT_IMPL,CATALOGUE_IMPL,RETENTION_IMPL,PROMPT_VIEW_IMPL,RETENTION12_IMPL):
        checkpoint=read(OPS/'FOLLOW.json');applied=checkpoint.get('source_transition',{})
        if applied.get('status')!='applied' or applied.get('actual_implementation_sha256')!=NEW_IMPL:
            raise RuntimeError('reviewed source transition has not completed')
        if lineage_implementation in (CAPACITY_IMPL,REQUEST_CONTEXT_IMPL,CATALOGUE_IMPL,RETENTION_IMPL,PROMPT_VIEW_IMPL,RETENTION12_IMPL):
            applied=checkpoint.get('inspection_capacity_transition',{})
            if applied.get('status')!='applied' or applied.get('actual_implementation_sha256')!=CAPACITY_IMPL:
                raise RuntimeError('reviewed capacity source transition has not completed')
        if lineage_implementation in (REQUEST_CONTEXT_IMPL,CATALOGUE_IMPL,RETENTION_IMPL,PROMPT_VIEW_IMPL,RETENTION12_IMPL):
            applied=checkpoint.get('request_context_revision',{})
            if applied.get('status')!='applied' or applied.get('actual_implementation_sha256')!=REQUEST_CONTEXT_IMPL:
                raise RuntimeError('reviewed request context revision has not completed')
        if lineage_implementation in (CATALOGUE_IMPL,RETENTION_IMPL,PROMPT_VIEW_IMPL,RETENTION12_IMPL):
            applied=checkpoint.get('catalogue_capacity_transition',{})
            if applied.get('status')!='applied' or applied.get('actual_implementation_sha256')!=CATALOGUE_IMPL:
                raise RuntimeError('reviewed catalogue source transition has not completed')
    if lineage_implementation in (RETENTION_IMPL,PROMPT_VIEW_IMPL,RETENTION12_IMPL):
        completed=read(OPS/'FOLLOW.json').get('retention_capacity_revision',{})
        path=OPS/'RETENTION_CAPACITY_REVISION.json'
        if (completed.get('status')!='applied' or completed.get('record_sha256')!=sha(path) or
            read(ROOT/'.bootstrap/study-authorization.json').get('retention_capacity_revision')!={'path':str(path),'sha256':sha(path)}):
            raise RuntimeError('reviewed retention source revision missing')
    if lineage_implementation in (PROMPT_VIEW_IMPL,RETENTION12_IMPL):prompt_view_applied()
    if lineage_implementation==RETENTION12_IMPL:
        if cs19_selected(actual_implementation):cs19_guard().retention12_history()
        elif ca19_selected(actual_implementation):ca19_guard().retention12_history()
        elif pt_is_new(actual_implementation):pt_retention12_witness()
        else:retention12_witness()
    authorization=read(ROOT/'.bootstrap/study-authorization.json')
    if ongoing:
        authorize_ongoing(authorization)
    else:
        scope=str(authorization.get('authorized_continuation',''))
        if 'successor' not in scope.lower() or '8' not in scope:
            raise RuntimeError('explicit current sustained-successor authorization required')
    finalization=read(FINALIZATION/'FINISHED.json')
    if finalization.get('round')!=2 or finalization.get('phase')!='review' or finalization.get('role_calls')!=0 or finalization.get('proof_checks')!=0:
        raise RuntimeError('reviewed exact failed-tail finalization missing')
    consumed=read(RESUME/'LAUNCH_CONSUMED.json')
    launch=read(RESUME/'LAUNCH.json')
    if (consumed.get('plan_sha256')!=sha(RESUME/'PLAN.json') or
        consumed.get('review_sha256')!=sha(RESUME/'REVIEW.json') or
        launch.get('plan_sha256')!=consumed['plan_sha256'] or
        launch.get('review_sha256')!=consumed['review_sha256'] or
        launch.get('finalization_sha256')!=sha(FINALIZATION/'FINISHED.json')):
        raise RuntimeError('initial official resume launch binding changed')
    tests=read(OPS/'TEST_RESULT.json') if (OPS/'TEST_RESULT.json').exists() else None
    return dict(implementation_sha256=actual_implementation,original_implementation_sha256=EXPECTED_IMPL,original_study=str(INITIAL_PARENT),
        original_seal_sha256=sha(INITIAL_PARENT/'seal.json'),original_protocol_sha256=sha(INITIAL_PARENT/'protocol.json'),
        original_contract_sha256=digest(contract),original_suite_sha256=EXPECTED_SUITE,suite_tasks=2,
        original_seed=seal['seed'],dependencies_sha256=digest(seal['dependencies']),
        authorization_sha256=sha(ROOT/'.bootstrap/study-authorization.json'),
        initial_resume_launch_sha256=sha(RESUME/'LAUNCH.json'),
        initial_resume_consumption_sha256=sha(RESUME/'LAUNCH_CONSUMED.json'),
        initial_resume_plan_sha256=sha(RESUME/'PLAN.json'),
        original_failed_resume_launch_sha256=sha(ORIGINAL_RESUME/'LAUNCH_CONSUMED.json'),
        failed_tail_finalization_sha256=sha(FINALIZATION/'FINISHED.json'),
        initial_resume_review_sha256=consumed['review_sha256'],
        source_sha256=sha(__file__),tests_source_sha256=sha(OPS/'test_continue_machine.py'))


def authorize_ongoing(record=None):
    record=record or read(ROOT/'.bootstrap/study-authorization.json')
    expected={'ongoing_follow_sha256':sha(OPS/'follow.py'),
        'ongoing_migration_sha256':sha(__file__),
        'ongoing_tests_sha256':sha(OPS/'test_continue_machine.py')}
    if (record.get('ongoing_goal_authorized') is not True or
        not isinstance(record.get('ongoing_source_reviewer'),str) or not record['ongoing_source_reviewer'].strip() or
        any(record.get(k)!=v for k,v in expected.items())):
        raise RuntimeError('exact independently audited ongoing-goal authority required')
    return record


def planned_protocol(parent_round,phase='research'):
    p=copy.deepcopy(read(INITIAL_PARENT/'protocol.json'))
    future_validation=parent_round>=VALIDATION30_START_ROUND
    p.update(rounds=parent_round+ADDITIONAL_ROUNDS,call_seconds=MODEL_SECONDS,adaptation_seconds=MODEL_SECONDS,
        validation_seconds=VALIDATION30_SECONDS if future_validation else VALIDATION_SECONDS,
        arm_seconds=VALIDATION30_ARM_ALLOWANCE_SECONDS if future_validation else ARM_ALLOWANCE_SECONDS,
        max_calls=64,meta_calls=32)
    p['concept_driver']=dict(p.get('concept_driver') or {},min_horizon_rounds=2,max_horizon_rounds=4)
    if p['model']!='gpt-6.1-sol' or p['transport']!='live' or not (p.get('concept_driver') or {}).get('enabled'):
        raise RuntimeError('unchanged independent concept researcher configuration required')
    a=api();a['study'].validate_protocol(p);a['study'].validate_commitment(p,2)
    capacity_plan(p,parent_round,phase)
    return p


def epoch_wall_reservation(protocol):
    # Wall containment includes each role's protocol-check ceiling, setup, and
    # controller cleanup in addition to the arm allowance. Not expected elapsed.
    return protocol['arm_seconds']+(4*protocol['max_calls']+2)*30+SETUP_SECONDS+CLEANUP_SECONDS


def admit_epoch(deadline,protocol,now=None):
    now=time.monotonic() if now is None else now
    required=epoch_wall_reservation(protocol)
    if deadline-now<required:
        raise RuntimeError('global wall ceiling cannot reserve a complete finite epoch and cleanup')
    return required


def plan_value():
    binding=immutable_bindings()
    p=planned_protocol(read(INITIAL_PARENT/'protocol.json')['rounds'])
    value=dict(schema='math-gkm.general-continuation-plan.v1',bindings=binding,
        initial_parent_may_be_running=True,mutable_parent_gate='after official controller and resume operator close normally',
        max_epochs=MAX_EPOCHS,operator_seconds=OPERATOR_SECONDS,cleanup_seconds=CLEANUP_SECONDS,
        rounds_per_epoch=ADDITIONAL_ROUNDS,arm_seconds=ARM_ALLOWANCE_SECONDS,max_calls=64,meta_calls=32,
        model='gpt-6.1-sol',reasoning_effort='high',call_seconds=MODEL_SECONDS,validation_seconds=VALIDATION_SECONDS,
        capacity=capacity_plan(p,read(INITIAL_PARENT/'protocol.json')['rounds'],'research'),
        concept_horizon={'min_rounds':2,'max_rounds':4,'selection':'own proposer chooses within finite epoch'},
        epoch_wall_reservation=epoch_wall_reservation(p),migration_cap_bytes=MIGRATION_CAP,
        completion='only finished exact universal-root receipt and independent source/English correspondence audit',
        exhausted='goal remains open; no partial milestone is completion',automatic_retry=False,
        mathematics='no changes or extra strategy guidance; preserve own research state including concepts and feedback',
        comparison='original paired comparison remains incomplete; all successors noncomparative',
        hosted_calls_by_plan=0,proof_checks_by_plan=0)

    # Persist and compare the same JSON-native representation; runtime budget
    # pools may retain tuple values without making an unchanged plan differ.
    return json.loads(canonical(value))


def prepare_plan():
    if (OPS/'LAUNCH_CONSUMED.json').exists() or any(successor_path(i).exists() for i in range(1,MAX_EPOCHS+1)):
        raise RuntimeError('continuation already consumed or successor exists; never overwrite')
    value=plan_value();write(OPS/'PLAN.json',value)
    return dict(status='prepared_not_launched',plan_sha256=sha(OPS/'PLAN.json'))


def reviewed(path):
    plan=read(OPS/'PLAN.json')
    if plan!=plan_value(): raise RuntimeError('reviewed immutable plan/source/authority changed')
    result=read(OPS/'TEST_RESULT.json');review=read(path)
    expected=dict(plan_sha256=sha(OPS/'PLAN.json'),source_sha256=sha(__file__),
        tests_source_sha256=sha(OPS/'test_continue_machine.py'),test_result_sha256=sha(OPS/'TEST_RESULT.json'),
        implementation_sha256=EXPECTED_IMPL)
    if result.get('passed') is not True or any(result.get(k)!=expected[k] for k in ('source_sha256','tests_source_sha256','implementation_sha256')):
        raise RuntimeError('exact passing pure operational tests required')
    if review.get('accepted') is not True or not review.get('reviewer') or any(review.get(k)!=v for k,v in expected.items()):
        raise RuntimeError('exact independent operational review required')
    return plan


def initial_operator_closed():
    if not lock_available(RESUME/'operator.lock'):return False,'initial official resume operator still owns lock'
    status=read(RESUME/'STATUS.json')
    if status.get('operator_pid') or status.get('controller_pid') or status.get('research_launched'):
        return False,'initial official resume operator has not closed'
    if status.get('controller_returncode')!=0 or not status.get('status','').startswith('closed'):
        raise RuntimeError('initial official resume failed or uncertain; no successor replay')
    return True,None


def parent_ready(parent,first=False):
    parent=Path(parent)
    if not lock_available(parent/'controller.lock'):return False,'parent controller/watchdog lock held or missing'
    if first:
        ready,reason=initial_operator_closed()
        if not ready:return ready,reason
    state=api()['common'].load_state(parent/'arms/exploration/state.json')
    if state.get('active') is not None or state.get('active_intent') is not None:
        return False,'parent active or uncertain invocation must be reconciled'
    if state.get('resolution'):return False,'root resolution requires exact finished evidence check'
    if state.get('status')!='finite_budget_finished; root_open':
        raise RuntimeError('parent did not close normally at finite budget; no automatic retry')
    if state['round']!=read(parent/'protocol.json')['rounds']:
        raise RuntimeError('normal parent round limit mismatch')
    if (parent/'STOP.json').exists():raise RuntimeError('parent was explicitly stopped; no successor')
    return True,None


def inspect_plan(parent,number,*,include_private_evaluator_inputs=False,ongoing=False):
    a=api();parent=Path(parent);immutable_bindings(ongoing=ongoing)
    state=a['common'].load_state(parent/'arms/exploration/state.json')
    p=planned_protocol(state['round'],state['phase'])
    expected_parent=read(INITIAL_PARENT/'protocol.json') if parent==INITIAL_PARENT else planned_protocol(state['round']-ADDITIONAL_ROUNDS,state['phase'])
    if {k:v for k,v in read(parent/'protocol.json').items() if k!='rounds'} != {k:v for k,v in expected_parent.items() if k!='rounds'}:
        raise RuntimeError('own continuation protocol differs beyond reviewed finite horizon settings')
    contract=read(parent/'seed/contract.json')
    if digest(contract)!=EXPECTED_CONTRACT:raise RuntimeError('parent exact contract changed')
    suite=curation=None
    if include_private_evaluator_inputs:
        # Private evaluation input for official freeze only, never a role prompt,
        # public plan, status, history, or source copy. No outputs are migrated.
        suite=a['common'].read(FROZEN_PAIR/'evaluation/suite.json')
        if digest(suite)!=EXPECTED_SUITE or len(suite['tasks'])!=2:raise RuntimeError('frozen evaluation input changed')
        curation=read(FROZEN_PAIR/'seal.json')['curation']
    return state,p,contract,suite,curation


def verified_resolution(study):
    a=api();common=a['common'];study=Path(study)
    state=common.load_state(study/'arms/exploration/state.json')
    result=state.get('resolution')
    if result is None:return False
    relative=safe_relative(state.get('resolution_receipt',''))
    path=study/relative
    if not path.resolve().is_relative_to((study/'arms/exploration/completion').resolve()):
        raise RuntimeError('root resolution is not own exact completion receipt')
    if read(path)!=result or result.get('resolved') is not True or result.get('lean_exact_root_checked') is not True:
        raise RuntimeError('exact checked root resolution evidence missing')
    contract=read(study/'seed/contract.json')
    if digest(contract)!=EXPECTED_CONTRACT or result.get('binding',{}).get('contract_hash')!=EXPECTED_CONTRACT:
        raise RuntimeError('resolution is not unchanged universal contract')
    claim=result['binding']['claim'];audit=result.get('audit')
    reused=a['receipts'].reuse(path.parent,{'contract':contract,'claim':claim,'audit':audit},claim,())
    if reused!=result or not isinstance(audit,dict) or audit.get('accepted') is not True or not audit.get('reviewer'):
        raise RuntimeError('exact finished root and correspondence receipt changed')
    if audit.get('bundle_hash')!=result.get('bundle_hash') or any(not audit.get('checks',{}).get(k) for k in contract['correspondence_obligations']):
        raise RuntimeError('independent English/source correspondence obligation missing')
    from machinery import completion
    previous=completion.ROOT
    try:
        completion.ROOT=study/'arms/exploration/workspace'
        if completion.prepare(contract,claim)['bundle_hash']!=result['bundle_hash']:
            raise RuntimeError('resolved source bundle changed')
    finally:completion.ROOT=previous
    return True


def start_keep_awake():
    if not Path('/usr/bin/caffeinate').is_file():return None
    return subprocess.Popen(['/usr/bin/caffeinate','-dimsu','-w',str(os.getpid())],cwd=ROOT,
        stdin=subprocess.DEVNULL,stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL,start_new_session=True)


def close_keep_awake(child):
    if child is None:return
    if child.poll() is None:child.terminate()
    try:child.wait(timeout=5)
    except subprocess.TimeoutExpired:child.kill();child.wait(timeout=5)


def own_birth(child,expected=None):
    if child.poll() is not None:return None
    info=api()['resources'].current_process(child.pid)
    if info is None:
        if child.poll() is not None:return None
        raise RuntimeError('owned controller birth unavailable')
    birth=info['identity']
    if expected is not None and birth!=expected:raise RuntimeError('owned controller birth changed')
    return birth


def stop_child(child,study,deadline,birth):
    write(study/'STOP.json',dict(source='general continuation operator',requested=time.time()))
    end=min(deadline,time.monotonic()+CLEANUP_SECONDS)
    while child.poll() is None and time.monotonic()<end-30:
        own_birth(child,birth);time.sleep(1)
    if child.poll() is None:own_birth(child,birth);child.terminate()
    while child.poll() is None and time.monotonic()<end:
        own_birth(child,birth);time.sleep(1)
    return child.poll() is not None


def request_stop():
    marker=dict(requested=time.time(),source='general continuation operator')
    write(OPS/'STOP.json',marker)
    status=read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else {}
    current=status.get('current_study')
    # Do not stop another operator's parent while merely waiting.
    if status.get('research_launched') and current:write(Path(current)/'STOP.json',marker)
    return dict(status='stop_requested',automatic_retry=False)


def run_operator(review_path):
    global REVIEW_PATH,DEADLINE
    controls();reviewed(review_path);REVIEW_PATH=Path(review_path).resolve()
    a=api();a['resources'].headroom(a['resources'].limits())
    with (OPS/'operator.lock').open('a') as lockfile:
        fcntl.flock(lockfile,fcntl.LOCK_EX|fcntl.LOCK_NB)
        controls()
        if (OPS/'LAUNCH_CONSUMED.json').exists():raise RuntimeError('single operator launch already consumed; reconcile explicitly, never replay')
        write(OPS/'LAUNCH_CONSUMED.json',dict(plan_sha256=sha(OPS/'PLAN.json'),review_sha256=sha(review_path),
            source_sha256=sha(__file__),time=time.time(),automatic_retry=False))
        started=time.monotonic();deadline=started+OPERATOR_SECONDS;DEADLINE=deadline;parent=INITIAL_PARENT
        awake=child=None;birth=None;current=None;completed=[]
        try:
            awake=start_keep_awake()
            registry(status='waiting_for_official_parent',operator_pid=os.getpid(),current_study=str(parent),
                controller_pid=None,research_launched=False,goal_open=True,completed_epochs=[],
                caffeinate_pid=awake.pid if awake else None,deadline_wall=time.time()+OPERATOR_SECONDS,
                maximum_epochs=MAX_EPOCHS,initial_resume_operator=str(RESUME))
            while True:
                controls()
                if time.monotonic()>=deadline-CLEANUP_SECONDS:
                    registry(status='global_wall_exhausted; goal_open',goal_open=True);return
                if lock_available(parent/'controller.lock') and verified_resolution(parent):
                    if parent==INITIAL_PARENT and not initial_operator_closed()[0]:time.sleep(2);continue
                    registry(status='exact_universal_root_verified',goal_open=False,goal_achieved=True,
                        resolution_study=str(parent),resolution_state_sha256=sha(parent/'arms/exploration/state.json'));return
                ready,reason=parent_ready(parent,first=(parent==INITIAL_PARENT))
                if ready:break
                registry(status='waiting_for_official_parent',wait_reason=reason);time.sleep(2)
            for number in range(1,MAX_EPOCHS+1):
                controls();reviewed(review_path)
                old=read(parent/'protocol.json');p=planned_protocol(old['rounds'])
                try:reservation=admit_epoch(deadline,p)
                except RuntimeError:
                    registry(status='insufficient_global_wall_for_next_epoch; goal_open',goal_open=True,
                        completed_epochs=completed);return
                a['resources'].headroom(a['resources'].limits())
                registry(status='migration_in_progress',current_parent=str(parent),next_epoch=number,
                    epoch_wall_reservation=reservation,research_launched=False)
                epoch_started=time.monotonic()
                current=migrate(parent,number)
                controls();reviewed(review_path)
                argv=[PYTHON,'-m','machinery.study','run','--study',str(current),'--arm','exploration']
                logfile=OPS/f'epoch-{number:04d}.log'
                epoch_deadline=min(deadline,epoch_started+reservation)
                with logfile.open('xb') as out:
                    controls()
                    write(OPS/f'epoch-{number:04d}-launch-intent.json',dict(argv=argv,study=str(current),
                        migration_sha256=sha(current/'MIGRATION_FINISHED.json'),time=time.time(),automatic_retry=False))
                    child=subprocess.Popen(argv,cwd=ROOT,stdin=subprocess.DEVNULL,stdout=out,stderr=out,
                        start_new_session=True,env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'})
                    birth=own_birth(child)
                    write(OPS/f'epoch-{number:04d}-launch.json',dict(controller_pid=child.pid,controller_birth=birth,
                        argv=argv,study=str(current),time=time.time()))
                    registry(status='research_running',current_study=str(current),controller_pid=child.pid,
                        controller_birth=birth,research_launched=True,epoch=number)
                    while child.poll() is None:
                        controls();own_birth(child,birth)
                        if time.monotonic()>=epoch_deadline-CLEANUP_SECONDS:raise RuntimeError('finite epoch controller wall containment reached')
                        if logfile.stat().st_size>LOG_LIMIT:raise RuntimeError('bounded controller log exceeded')
                        time.sleep(2)
                if child.returncode!=0:raise RuntimeError('official controller failed; preserve receipts, no automatic retry')
                if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():raise RuntimeError('cleanup hold after controller closure')
                if verified_resolution(current):
                    registry(status='exact_universal_root_verified',goal_open=False,goal_achieved=True,
                        resolution_study=str(current),resolution_state_sha256=sha(current/'arms/exploration/state.json'));return
                ready,reason=parent_ready(current)
                if not ready:raise RuntimeError(reason)
                final=a['common'].load_state(current/'arms/exploration/state.json')
                completed.append(dict(epoch=number,study=str(current),round=final['round'],
                    state_sha256=sha(current/'arms/exploration/state.json'),finished=time.time()))
                registry(status='epoch_finished; universal_goal_open',current_study=str(current),
                    controller_pid=None,controller_birth=None,research_launched=False,completed_epochs=completed,goal_open=True)
                child=None;birth=None;parent=current
            registry(status='maximum_epochs_finished; universal_goal_open',goal_open=True)
        except BaseException as exc:
            cleaned=True
            if child is not None and child.poll() is None:
                try:cleaned=stop_child(child,current,deadline,birth)
                except BaseException:cleaned=False
            registry(status='needs_reconciliation',reason=type(exc).__name__+': '+str(exc),
                controller_pid=child.pid if child is not None and not cleaned else None,
                research_launched=not cleaned,goal_open=True,automatic_retry=False)
            raise
        finally:
            close_keep_awake(awake)
            registry(operator_pid=None,caffeinate_pid=None,
                controller_pid=child.pid if child is not None and child.poll() is None else None,
                research_launched=bool(child is not None and child.poll() is None))


# Exact same-directory storage-version transition; historical round30 recovery is unchanged.
def retention_fresh_source(a):
    common=a['common']
    if (common.Invalid is not a['study'].Invalid or getattr(common,'RETAINED_SOURCE_HISTORY_CAP',None)!=2*1024**3 or
        'RETAINED_SOURCE_HISTORY_CAP' not in common.retention_room.__code__.co_names or
        Path(common.__file__).resolve()!=ROOT/'machinery/study_common.py' or sha(common.__file__)!=RETENTION_COMMON_NEW):
        raise RuntimeError('fresh new-source interpreter required; never reload common into old consumers')


def retention_reentry():
    """Read-only reconstruction of the two closed requests and admitted journal chain."""
    from machinery import study_policy
    from machinery.study_knowledge import SCHEMAS
    from machinery.study_research_feedback import record_feedback_consumption
    common=api()['common'];arm=RETENTION_STUDY/'arms/exploration';p=read(RETENTION_STUDY/'protocol.json')
    start=read(arm/'rounds/0039/start.json');plan=read(arm/'jobs/plan-0039/validated-plan.json')
    proposal=study_policy.request(start['research'],39,p)
    proposal.update(role='proposer',model=p['model'],reasoning_effort=common.REASONING_EFFORT,request_id='plan-0039')
    staged=plan['research'];commitment=plan['commitment'];main=study_policy.request(staged,39,p)
    main.update(committed_trial=commitment['trial'],prospective_binding=digest(commitment),commitment=commitment,
        checked_submission_schemas=SCHEMAS,model=p['model'],reasoning_effort=common.REASONING_EFFORT,request_id='round-0039')
    if proposal!=read(arm/'jobs/plan-0039/request.json') or main!=read(arm/'jobs/round-0039/request.json'):
        raise RuntimeError('closed logical request differs; no replay or rewriting')
    if plan['receipt_hash']!=digest(read(arm/'jobs/plan-0039/receipt.json')):raise RuntimeError('validated plan receipt changed')
    updated=copy.deepcopy(staged)
    record_feedback_consumption(updated,'round-0039',39,'researcher',[x['reference'] for x in main['research_feedback']['history']])
    updated['execution_budget']=main.get('execution_budget',{});chain=[]
    for path in sorted((arm/'rounds/0039/checks/math').glob('*/ADMITTED.json')):
        journal=common.load_state(path)
        if journal['before_hash']!=digest(updated):raise RuntimeError('admitted recovery chain differs; no new validation')
        updated=journal['after'];chain.append({'path':str(path),'sha256':sha(path),'before':journal['before_hash'],
            'after':digest(updated),'knowledge_count':len(updated['knowledge'])})
    if [x['knowledge_count'] for x in chain]!=[42,43,44]:raise RuntimeError('exact41-to44 admitted chain required')
    return {'plan_request':digest(proposal),'main_request':digest(main),'journals':chain}


def retention_state_material(seal,states,deployment,record_path,core):
    """Pure three-file revision; the complete arm projections remain unchanged."""
    old=digest(seal)
    if set(states)!={'baseline','exploration'} or any(s.get('seal_hash')!=old for s in states.values()):
        raise RuntimeError('both original arm seal bindings required')
    current=states['exploration']
    if ((current.get('round'),current.get('phase'),current.get('status'),len(current['research']['knowledge']))!=
        (39,'research','bounded_or_blocked',44) or current.get('reason')!='aggregate retained source/history bound; preserve evidence and stop' or
        (current.get('calls'),current.get('meta_calls'),current.get('seconds'),current.get('failures'))!=(10,6,104400,0) or
        any(s.get('active') is not None or s.get('active_intent') is not None or s.get('resolution') is not None for s in states.values())):
        raise RuntimeError('exact closed39 state and original accounting required')
    revised={**seal,'implementation':core['implementation'],'deployment_preflight':deployment,
        'source_revision':{'record':str(record_path),'binding':digest(core),'old_seal_sha256':core['old_hashes']['seal.json']}}
    files={'seal.json':revision_bytes(revised)}
    for mode,before in states.items():
        after={**before,'seal_hash':digest(revised)}
        files[f'arms/{mode}/state.json']=revision_bytes({'state':after,'sha256':digest(after)})
    return files


@contextlib.contextmanager
def retention_locks():
    with contextlib.ExitStack() as stack:
        for path in (OPS/'FOLLOW.lock',OPS/'operator.lock',RETENTION_STUDY/'controller.lock',
                     ROOT/'.scratch/resources/heavy.lock',OPS/'boundary_hold.lock'):
            stream=stack.enter_context(path.open('rb'));fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        controls()
        if (RETENTION_STUDY/'STOP.json').exists():raise RuntimeError('study STOP remains authoritative')
        yield


def retention_closed(state,spec):
    """No payloads: authenticate counted receipts and native ownership metadata."""
    resources=api()['resources'];arm=RETENTION_STUDY/'arms/exploration';pairs=set();watchdogs=set()
    if ((state.get('round'),state.get('phase'),state.get('status'),len(state['research']['knowledge']))!=(39,'research','bounded_or_blocked',44) or
        (state.get('calls'),state.get('meta_calls'),state.get('seconds'),state.get('failures'))!=(10,6,104400,0) or
        state.get('active') is not None or state.get('active_intent') is not None or state.get('resolution') is not None):
        raise RuntimeError('exact closed current39 context required')
    if state.get('protocol_state',{}).get('pending') or state.get('protocol_state',{}).get('inflight'):
        raise RuntimeError('unfinished invocation protocol; no replay')
    if len(state['counted_jobs'])!=10 or len(set(state['counted_jobs']))!=10 or set(state['receipts'])!={str(arm/'jobs'/k) for k in state['counted_jobs']}:
        raise RuntimeError('complete exact10 invocation ledger required')
    if {p.name for p in (arm/'jobs').iterdir() if p.is_dir()}!=set(state['counted_jobs']):raise RuntimeError('unaccounted job directory')
    for key in state['counted_jobs']:
        job=arm/'jobs'/key;receipt=read(job/'receipt.json');process=read(job/'process.json');worker=read(job/'watchdog.json')
        if (receipt.get('finished') is None or receipt.get('request_id')!=key or state['receipts'].count(str(job))!=1 or
            state['receipt_hashes'].get(str(job))!=digest(receipt) or state['reservations'].get('call-'+key)!=1800 or read(job/'spec.json')['seconds']!=1800):
            raise RuntimeError('closed call identity or full original charge changed')
        pairs.update((int(pid),birth) for pid,birth in receipt.get('resources',{}).get('owned_identities',{}).items())
        watchdogs.update((process['pid'],process['watchdog_pid'],worker['pid']))
    owners=spec.get('native_owners')
    if not isinstance(owners,list) or not owners:raise RuntimeError('independent native ownership witness required')
    pairs.update((row['pid'],row['birth']) for row in owners)
    for pid,birth in pairs:
        now=resources.process_status(pid)
        if now and now['identity']==birth:raise RuntimeError('same-birth historical owner remains')
    for pid in watchdogs:
        if resources.process_status(pid):raise RuntimeError('worker/watchdog identity unresolved')
    sample=subprocess.run(['/bin/ps','-axo','pid=,ppid=,pgid='],cwd=ROOT,capture_output=True,text=True,timeout=2,check=True)
    observed={}
    for line in sample.stdout.splitlines():
        fields=line.split()
        if len(fields)!=3 or not all(x.isdigit() for x in fields):raise RuntimeError('incomplete native group observer')
        pid,ppid,group=map(int,fields)
        if pid in observed:raise RuntimeError('duplicate native observer row')
        observed[pid]=(ppid,group)
    if os.getpid() not in observed or any(group in ({pid for pid,birth in pairs}|watchdogs) for ppid,group in observed.values()):
        raise RuntimeError('native group closure not established')
    return {'native_pairs':len(pairs),'closed_calls':10}


def rebind_retention_capacity(deployment):
    """Fresh new-source interpreter only; no role, proof, receipt or budget replay."""
    with retention_locks():
        a=api();retention_fresh_source(a);common=a['common'];authorization=authorize_ongoing();spec=authorization.get('retention_capacity_maintenance',{})
        reviewers=spec.get('independent_reviewers',[])
        if (spec.get('authorized') is not True or len(set(reviewers))<2 or spec.get('study')!=str(RETENTION_STUDY) or
            spec.get('old_implementation_sha256')!=CATALOGUE_IMPL or spec.get('implementation_sha256')!=RETENTION_IMPL or
            checked_implementation(common)!=RETENTION_IMPL or common.Invalid is not a['study'].Invalid):
            raise RuntimeError('exact reviewed fresh-interpreter retention revision authority required')
        path=OPS/'RETENTION_CAPACITY_REVISION.json';checkpoint=read(OPS/'FOLLOW.json')
        if path.exists() or checkpoint.get('retention_capacity_revision'):raise RuntimeError('revision already consumed; explicit finish only')
        witness=read(spec['old_verification_path']);old_authority=Path(spec['original_authorization_path']).read_bytes();old_common=Path(spec['old_common_path']).read_bytes();old_helper=Path(spec['old_helper_path']).read_bytes()
        if (sha(spec['old_verification_path'])!=spec['old_verification_sha256'] or
            witness.get('schema')!='math-gkm.genuine-old-retention-verification.v1' or
            witness.get('genuine_old_study_verify_passed') is not True or witness.get('study')!=str(RETENTION_STUDY) or
            witness.get('implementation_sha256')!=CATALOGUE_IMPL or
            hashlib.sha256(old_authority).hexdigest()!=spec['original_authorization_sha256'] or
            json.loads(old_authority).get('implementation_sha256')!=CATALOGUE_IMPL or hashlib.sha256(old_common).hexdigest()!=RETENTION_COMMON_OLD or
            hashlib.sha256(old_helper).hexdigest()!=json.loads(old_authority).get('ongoing_migration_sha256')):
            raise RuntimeError('genuine old verification/source/authority archive required')
        paths={'seal.json':RETENTION_STUDY/'seal.json',**{f'arms/{m}/state.json':RETENTION_STUDY/'arms'/m/'state.json' for m in ('baseline','exploration')}}
        before={name:p.read_bytes() for name,p in paths.items()};old_hashes={n:hashlib.sha256(raw).hexdigest() for n,raw in before.items()}
        if old_hashes!=witness.get('old_hashes') or sha(RETENTION_STUDY/'protocol.json')!=witness.get('protocol_sha256'):
            raise RuntimeError('verified old three-file context changed')
        old_seal=json.loads(before['seal.json']);states={m:common.load_state(paths[f'arms/{m}/state.json']) for m in ('baseline','exploration')}
        if digest(old_seal['implementation'])!=CATALOGUE_IMPL:raise RuntimeError('old seal source version differs')
        prior_path=OPS/'recover-retention-round38-20261021/RESUME_INTENT.json';prior_raw=prior_path.read_bytes()
        if (hashlib.sha256(prior_raw).hexdigest()!=RETENTION_PRIOR_INTENT_SHA or
            json.loads(prior_raw)['witness']['absolute_deadline']!=RETENTION_PRIOR_DEADLINE):
            raise RuntimeError('original consumed same-epoch deadline witness changed')
        closure=retention_closed(states['exploration'],spec);reentry=retention_reentry()
        if reentry!=spec.get('reentry_binding'):raise RuntimeError('reviewed cached39 reentry differs')
        from machinery.study_deployment import reuse_deployment
        reuse_deployment(deployment)
        if deployment.get('ready') is not True:raise RuntimeError('fresh new implementation deployment required')
        controls()
        if (RETENTION_STUDY/'STOP.json').exists():raise RuntimeError('study STOP arrived during deployment verification')
        origins={n:(RETENTION_STUDY/n).read_bytes() for n in ('CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json')}
        core={'schema':'math-gkm.retention-capacity-revision.v1','study':str(RETENTION_STUDY),'implementation':common.implementation(),
            'old_implementation_sha256':CATALOGUE_IMPL,'implementation_sha256':RETENTION_IMPL,'old_hashes':old_hashes,
            'protocol_sha256':sha(RETENTION_STUDY/'protocol.json'),'old_verification_sha256':spec['old_verification_sha256'],
            'original_authorization_sha256':spec['original_authorization_sha256'],'old_deployment':old_seal['deployment_preflight'],
            'old_helper_sha256':hashlib.sha256(old_helper).hexdigest(),'new_helper_sha256':sha(__file__),
            'accepted_registry_binding':digest(states['exploration']['research']['knowledge']),
            'activation_authorization_sha256':sha(ROOT/'.bootstrap/study-authorization.json'),
            'prior_resume_intent_path':str(prior_path),'prior_resume_intent_sha256':RETENTION_PRIOR_INTENT_SHA,
            'prior_resume_deadline_wall':RETENTION_PRIOR_DEADLINE,
            'deployment':deployment,'origins':{n:hashlib.sha256(raw).hexdigest() for n,raw in origins.items()},'reentry':reentry,'closure':closure,'created':time.time()}
        revised=retention_state_material(old_seal,states,deployment,path,core)
        record={'core':core,'binding':digest(core),'files':{n:{'old':base64.b64encode(before[n]).decode(),'new':base64.b64encode(revised[n]).decode(),
            'old_sha256':old_hashes[n],'new_sha256':hashlib.sha256(revised[n]).hexdigest()} for n in paths},
            'archived_old_verification':base64.b64encode(Path(spec['old_verification_path']).read_bytes()).decode(),
            'archived_prior_resume_intent':base64.b64encode(prior_raw).decode(),
            'archived_activation_authorization':base64.b64encode((ROOT/'.bootstrap/study-authorization.json').read_bytes()).decode(),
            'archived_original_authorization':base64.b64encode(old_authority).decode(),'archived_old_common':base64.b64encode(old_common).decode(),
            'archived_old_helper':base64.b64encode(old_helper).decode(),'archived_new_helper':base64.b64encode(Path(__file__).read_bytes()).decode(),
            'archived_new_common':base64.b64encode((ROOT/'machinery/study_common.py').read_bytes()).decode(),
            'archived_origins':{n:base64.b64encode(raw).decode() for n,raw in origins.items()},
            'archived_old_deployment_receipt':base64.b64encode(Path(old_seal['deployment_preflight']['receipt']).read_bytes()).decode()}
        atomic_protected(path,revision_bytes(record),0o444)
        after={**authorization,'retention_capacity_revision':{'path':str(path),'sha256':sha(path)}}
        checkpoint['retention_capacity_revision']={'status':'install_intent','record_sha256':sha(path),
            'authorization_before_sha256':sha(ROOT/'.bootstrap/study-authorization.json'),
            'authorization_after_sha256':hashlib.sha256(revision_bytes(after)).hexdigest()}
        write(OPS/'FOLLOW.json',checkpoint)
        return _finish_retention_capacity_rebind()


def finish_retention_capacity_rebind():
    """Only known old/new writes may finish; never starts another transaction."""
    with retention_locks():return _finish_retention_capacity_rebind()


def _finish_retention_capacity_rebind():
    a=api();retention_fresh_source(a);common=a['common'];path=OPS/'RETENTION_CAPACITY_REVISION.json';checkpoint=read(OPS/'FOLLOW.json');intent=checkpoint.get('retention_capacity_revision',{})
    if intent.get('status')!='install_intent' or intent.get('record_sha256')!=sha(path):raise RuntimeError('no exact incomplete retention revision')
    record=read(path);core=record['core'];authorization=authorize_ongoing()
    if (checked_implementation(common)!=RETENTION_IMPL or record['binding']!=digest(core) or core['study']!=str(RETENTION_STUDY) or
        core['implementation_sha256']!=RETENTION_IMPL or digest(core['implementation'])!=RETENTION_IMPL or sha(__file__)!=core['new_helper_sha256']):raise RuntimeError('retention revision source changed')
    if (core.get('prior_resume_intent_path')!=str(OPS/'recover-retention-round38-20261021/RESUME_INTENT.json') or
        core.get('prior_resume_intent_sha256')!=RETENTION_PRIOR_INTENT_SHA or core.get('prior_resume_deadline_wall')!=RETENTION_PRIOR_DEADLINE):
        raise RuntimeError('original same-epoch deadline binding changed')
    expected={'seal.json','arms/baseline/state.json','arms/exploration/state.json'}
    if set(record['files'])!=expected:raise RuntimeError('revision target escape')
    for field,expected_sha in [('archived_old_verification',core['old_verification_sha256']),('archived_original_authorization',core['original_authorization_sha256']),('archived_prior_resume_intent',core['prior_resume_intent_sha256']),
        ('archived_activation_authorization',core['activation_authorization_sha256']),
        ('archived_old_common',RETENTION_COMMON_OLD),('archived_new_common',RETENTION_COMMON_NEW),
        ('archived_old_helper',core['old_helper_sha256']),('archived_new_helper',core['new_helper_sha256'])]:
        if hashlib.sha256(base64.b64decode(record[field],validate=True)).hexdigest()!=expected_sha:raise RuntimeError('permanent original archive changed')
    if set(record['archived_origins'])!={'CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json'}:raise RuntimeError('historical origin archive scope changed')
    for name,raw in record['archived_origins'].items():
        if hashlib.sha256(base64.b64decode(raw,validate=True)).hexdigest()!=core['origins'].get(name) or sha(RETENTION_STUDY/name)!=core['origins'].get(name):raise RuntimeError('historical origin changed')
    if (sha(RETENTION_STUDY/'protocol.json')!=core['protocol_sha256'] or
        hashlib.sha256(base64.b64decode(record['archived_old_deployment_receipt'],validate=True)).hexdigest()!=core['old_deployment']['receipt_sha256']):raise RuntimeError('historical deployment/protocol changed')
    decoded={}
    for name,row in record['files'].items():
        old,new=(base64.b64decode(row[k],validate=True) for k in ('old','new'))
        if row['old_sha256']!=core['old_hashes'][name] or hashlib.sha256(old).hexdigest()!=row['old_sha256'] or hashlib.sha256(new).hexdigest()!=row['new_sha256'] or sha(RETENTION_STUDY/name) not in (row['old_sha256'],row['new_sha256']):raise RuntimeError('uncertain three-file mixture; explicit reconciliation required')
        decoded[name]=(old,new)
    seal=json.loads(decoded['seal.json'][1]);old_seal=json.loads(decoded['seal.json'][0])
    if (digest(seal['implementation'])!=RETENTION_IMPL or digest(old_seal['implementation'])!=CATALOGUE_IMPL or
        seal.get('source_revision')!={'record':str(path),'binding':record['binding'],'old_seal_sha256':core['old_hashes']['seal.json']}):raise RuntimeError('seal revision binding differs')
    for mode in ('baseline','exploration'):
        old,new=(json.loads(raw) for raw in decoded[f'arms/{mode}/state.json']);before,after=old['state'],new['state']
        if (old['sha256']!=digest(before) or new['sha256']!=digest(after) or before.get('seal_hash')!=digest(old_seal) or
            after.get('seal_hash')!=digest(seal) or {k:v for k,v in before.items() if k!='seal_hash'}!={k:v for k,v in after.items() if k!='seal_hash'}):raise RuntimeError('revision changes mathematical/accounting state')
    after={**authorization,'retention_capacity_revision':{'path':str(path),'sha256':sha(path)}}
    if sha(ROOT/'.bootstrap/study-authorization.json') not in (intent['authorization_before_sha256'],intent['authorization_after_sha256']) or hashlib.sha256(revision_bytes(after)).hexdigest()!=intent['authorization_after_sha256']:raise RuntimeError('authority changed during revision')
    from machinery.study_deployment import reuse_deployment
    reuse_deployment(core['deployment']);controls()
    if (RETENTION_STUDY/'STOP.json').exists():raise RuntimeError('study STOP arrived before revision install')
    for name,(_,raw) in decoded.items():
        if sha(RETENTION_STUDY/name)!=record['files'][name]['new_sha256']:atomic_protected(RETENTION_STUDY/name,raw,(RETENTION_STUDY/name).stat().st_mode & 0o777)
    a['study'].verify(RETENTION_STUDY)
    atomic_protected(ROOT/'.bootstrap/study-authorization.json',revision_bytes(after),0o444)
    checkpoint['retention_capacity_revision']={**intent,'status':'applied','record_sha256':sha(path),'implementation_sha256':RETENTION_IMPL,
        'seal_sha256':sha(RETENTION_STUDY/'seal.json'),'finished':time.time()};write(OPS/'FOLLOW.json',checkpoint)
    return checkpoint['retention_capacity_revision']


def resume_retention_current():
    """One paid current-epoch continuation, then a clean waiting8/next9 checkpoint."""
    import math
    import importlib.util
    module_spec=importlib.util.spec_from_file_location('retention_follow',OPS/'follow.py')
    follow=importlib.util.module_from_spec(module_spec);module_spec.loader.exec_module(follow)
    awake=None
    with (OPS/'FOLLOW.lock').open('rb') as singleton,(OPS/'operator.lock').open('rb') as shared:
        fcntl.flock(singleton,fcntl.LOCK_EX|fcntl.LOCK_NB);fcntl.flock(shared,fcntl.LOCK_EX|fcntl.LOCK_NB)
        retention_fresh_source(api());record=authorize_ongoing();grant=record.get('retention_current_resume',{});checkpoint=read(OPS/'FOLLOW.json')
        revision=checkpoint.get('retention_capacity_revision',{});path=OPS/'RETENTION_CAPACITY_REVISION.json'
        if (grant.get('authorized') is not True or len(set(grant.get('independent_reviewers',[])))<2 or grant.get('study')!=str(RETENTION_STUDY) or
            revision.get('status')!='applied' or revision.get('record_sha256')!=sha(path) or revision.get('resume_intent') or
            grant.get('revision_sha256')!=sha(path) or checkpoint.get('current_study')!=str(RETENTION_STUDY) or
            checkpoint.get('phase')!='needs_reconciliation' or checkpoint.get('next_sequence')!=8):
            raise RuntimeError('exact reviewed one-use current8 continuation required')
        for name,key in [('seal.json','seal_sha256'),('protocol.json','protocol_sha256'),('arms/exploration/state.json','state_sha256')]:
            if sha(RETENTION_STUDY/name)!=grant.get(key):raise RuntimeError('current resume bytes changed')
        with contextlib.ExitStack() as leases:
            for item in (RETENTION_STUDY/'controller.lock',ROOT/'.scratch/resources/heavy.lock',OPS/'boundary_hold.lock'):
                stream=leases.enter_context(item.open('rb'));fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
            controls()
            if (RETENTION_STUDY/'STOP.json').exists():raise RuntimeError('study STOP remains authoritative')
            state=api()['common'].load_state(RETENTION_STUDY/'arms/exploration/state.json')
            retention_closed(state,record['retention_capacity_maintenance']);retention_reentry()
            immutable_bindings(ongoing=True);api()['study'].verify(RETENTION_STUDY)
            protocol=read(RETENTION_STUDY/'protocol.json');start,end=grant.get('authorized_at'),grant.get('deadline_wall')
            prior=read(path)['core']
            if prior.get('prior_resume_intent_sha256')!=RETENTION_PRIOR_INTENT_SHA or prior.get('prior_resume_deadline_wall')!=RETENTION_PRIOR_DEADLINE:
                raise RuntimeError('original owned deadline not retained')
            ceiling=min(1792614557.400268+epoch_wall_reservation(protocol),prior['prior_resume_deadline_wall'])
            if (any(type(v) not in (int,float) or not math.isfinite(v) for v in (start,end)) or start>time.time() or
                end>min(ceiling,start+follow.remaining_wall(protocol,state)) or end-time.time()<=CLEANUP_SECONDS+30):
                raise RuntimeError('original finite epoch remainder exhausted or extended')
            # Recheck after potentially lengthy verification and before durable consumption.
            controls()
            if (RETENTION_STUDY/'STOP.json').exists():raise RuntimeError('study STOP arrived before launch')
            revision={**revision,'resume_intent':{'created':time.time(),'grant_binding':digest(grant),'same_epoch':True,'deadline_wall':end}}
            checkpoint['retention_capacity_revision']=revision;write(OPS/'FOLLOW.json',checkpoint)
        deadline=time.monotonic()+end-time.time();global DEADLINE;DEADLINE=deadline
        previous_handlers={sig:signal.getsignal(sig) for sig in (signal.SIGTERM,signal.SIGINT)}
        for sig in previous_handlers:signal.signal(sig,lambda *_:setattr(follow,'STOPPED',True))
        try:
            follow.controls();awake=start_keep_awake();birth=own_birth(awake) if awake else None
            follow.checkpoint(operator_pid=os.getpid(),operator_birth=api()['resources'].current_process(os.getpid())['identity'],
                caffeinate_pid=awake.pid if awake else None,caffeinate_birth=birth)
            follow.controls()
            if (RETENTION_STUDY/'STOP.json').exists():raise RuntimeError('study STOP arrived during keeper setup')
            follow.ops.DEADLINE=deadline;follow.execute(RETENTION_STUDY,deadline)
            if follow.wait_closed(RETENTION_STUDY):
                follow.checkpoint(phase='waiting',current_study=str(RETENTION_STUDY),next_sequence=9)
        except BaseException as exc:
            follow.checkpoint(phase='needs_reconciliation',reason=type(exc).__name__+': '+str(exc),goal_achieved=False)
            raise
        finally:
            close_keep_awake(awake);DEADLINE=None;follow.ops.DEADLINE=None
            follow.checkpoint(operator_pid=None,operator_birth=None,caffeinate_pid=None,caffeinate_birth=None)
            for sig,handler in previous_handlers.items():signal.signal(sig,handler)



# Exact successful-plan48 prompt-view revision. No exceptional call recovery or new budget.
def prompt_view_fresh_source():
    import types
    import inspect
    context=importlib.import_module('machinery.study_context')
    path=ROOT/'machinery/study_context.py'
    if (Path(context.__file__).resolve()!=path or sha(path)!=PROMPT_VIEW_CONTEXT or
        checked_implementation(api()['common'])!=PROMPT_VIEW_IMPL):
        raise RuntimeError('exact fresh prompt-view source required')
    compiled=compile(path.read_bytes(),str(path),'exec')
    expected={c.co_name:c for c in compiled.co_consts if isinstance(c,types.CodeType) and c.co_flags & inspect.CO_NEWLOCALS}
    if (not issubclass(context.PromptContextLimit,api()['common'].Invalid) or context.PROMPT_CHAR_LIMIT!=900000 or
        context.CONTEXT_BYTE_LIMIT!=8*1024**2 or any(not isinstance(getattr(context,n,None),types.FunctionType) or
        getattr(context,n).__code__!=code for n,code in expected.items())):
        raise RuntimeError('stale loaded prompt-view code; fresh interpreter required')


def prompt_view_archive():
    witness_path=PROMPT_VIEW_PACKET/'OLD_VERIFICATION.json';archive_path=PROMPT_VIEW_PACKET/'OLD_ARCHIVE.json'
    if sha(witness_path)!=PROMPT_VIEW_WITNESS_SHA or sha(archive_path)!=PROMPT_VIEW_ARCHIVE_SHA:
        raise RuntimeError('genuine old verification archive changed')
    witness=read(witness_path);archive=read(archive_path)
    if (witness.get('genuine_old_study_verify_passed') is not True or witness.get('study')!=str(PROMPT_VIEW_STUDY) or
        witness.get('implementation_sha256')!=RETENTION_IMPL or witness.get('old_archive_sha256')!=PROMPT_VIEW_ARCHIVE_SHA):
        raise RuntimeError('genuine old prompt-view verification required')
    expected={'seal.json','baseline.state.json','exploration.state.json','protocol.json','original_authorization.json',
        'original_FOLLOW.json','old_study_context.py','old_continue_machine.py','old_follow.py','old_ops_tests.py',
        'old_deployment_receipt.json','CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json'}
    if set(archive['files'])!=expected:raise RuntimeError('old archive scope changed')
    for name,row in archive['files'].items():
        path=PROMPT_VIEW_PACKET/'before'/name
        if row['archive_path']!=str(path) or path.is_symlink() or sha(path)!=row['sha256']:
            raise RuntimeError('permanent original archive changed')
    if archive['unchanged_closed_job_bindings']!=witness['closed_job_bindings']:raise RuntimeError('closed-job archive differs')
    return witness,archive


def prompt_view_projection(state):
    return {k:v for k,v in state.items() if k!='seal_hash'}


def prompt_view_closed(state):
    """Only finalized receipt/accounting and native metadata; opaque request/plan hashes."""
    witness,archive=prompt_view_archive();common=api()['common'];arm=PROMPT_VIEW_STUDY/'arms/exploration'
    original=common.load_state(PROMPT_VIEW_PACKET/'before/exploration.state.json')
    if prompt_view_projection(state)!=prompt_view_projection(original):raise RuntimeError('stopped state/accounting changed')
    if ((state.get('round'),state.get('phase'),state.get('status'),len(state['research']['knowledge']),state.get('calls'),
        state.get('meta_calls'),state.get('seconds'),state.get('failures'))!=(48,'research','bounded_or_blocked',64,1,1,104400,0) or
        state.get('reason')!='complete prompt exceeds transport character bound' or any(state.get(k) is not None for k in ('active','active_intent','resolution')) or
        state.get('protocol_state',{}).get('pending') or state.get('protocol_state',{}).get('inflight')):
        raise RuntimeError('exact closed successful-plan48 boundary required')
    job=arm/'jobs/plan-0048'
    if (state['counted_jobs']!=['plan-0048'] or state['receipts']!=[str(job)] or
        {p.name for p in (arm/'jobs').iterdir() if p.is_dir()}!={'plan-0048'} or (arm/'jobs/round-0048').exists() or
        state['reservations'].get('call-plan-0048')!=1800 or 'call-round-0048' in state['reservations']):
        raise RuntimeError('plan must be counted once and researcher must not have started')
    for row in witness['closed_job_bindings'].values():
        if sha(row['path'])!=row['sha256']:raise RuntimeError('accepted plan/request/receipt bytes changed')
    receipt=read(job/'receipt.json')
    if (receipt.get('finished') is None or receipt.get('returncode')!=0 or receipt.get('outcome')!='completed' or
        state['receipt_hashes'].get(str(job))!=digest(receipt)):
        raise RuntimeError('successful finalized plan receipt binding changed')
    pairs={(row['pid'],row['birth']) for row in witness['native_owners']}
    resources=api()['resources']
    for pid,birth in pairs:
        info=resources.process_status(pid)
        if info and info['identity']==birth:raise RuntimeError('historical same-birth owner remains')
    sample=subprocess.run(['/bin/ps','-axo','pid=,pgid='],cwd=ROOT,capture_output=True,text=True,timeout=2,check=True)
    observed={}
    for line in sample.stdout.splitlines():
        fields=line.split()
        if len(fields)!=2 or not all(v.isdigit() for v in fields):raise RuntimeError('incomplete native group observer')
        pid,group=map(int,fields)
        if pid in observed:raise RuntimeError('duplicate native observer row')
        observed[pid]=group
    if os.getpid() not in observed or any(g in {pid for pid,birth in pairs} for g in observed.values()):
        raise RuntimeError('owned native group closure not established')
    return {'closed_calls':1,'native_pairs':len(pairs),'accepted_registry_binding':digest(state['research']['knowledge'])}


@contextlib.contextmanager
def prompt_view_locks(*,follower_owns_outer=False):
    names=[PROMPT_VIEW_STUDY/'controller.lock',ROOT/'.scratch/resources/heavy.lock',OPS/'boundary_hold.lock']
    if not follower_owns_outer:names=[OPS/'FOLLOW.lock',OPS/'operator.lock',*names]
    with contextlib.ExitStack() as stack:
        for path in names:
            stream=stack.enter_context(path.open('rb'));fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        controls()
        if (PROMPT_VIEW_STUDY/'STOP.json').exists():raise RuntimeError('study STOP remains authoritative')
        yield


def prompt_view_state_material(seal,states,deployment,core):
    if set(states)!={'baseline','exploration'} or any(s.get('seal_hash')!=digest(seal) for s in states.values()):
        raise RuntimeError('both original seal bindings required')
    revised={**seal,'implementation':core['implementation'],'deployment_preflight':deployment,
        'source_revision':{'record':str(PROMPT_VIEW_RECORD),'binding':digest(core),'old_seal_sha256':core['old_hashes']['seal.json']}}
    files={'seal.json':revision_bytes(revised)}
    for mode,state in states.items():
        after={**state,'seal_hash':digest(revised)}
        files[f'arms/{mode}/state.json']=revision_bytes({'state':after,'sha256':digest(after)})
    return files


def prompt_view_applied():
    checkpoint=read(OPS/'FOLLOW.json');entry=checkpoint.get('prompt_view_revision',{})
    if (entry.get('status')!='applied' or entry.get('record_sha256')!=sha(PROMPT_VIEW_RECORD) or
        read(ROOT/'.bootstrap/study-authorization.json').get('prompt_view_revision')!={'path':str(PROMPT_VIEW_RECORD),'sha256':sha(PROMPT_VIEW_RECORD)}):
        raise RuntimeError('reviewed prompt-view revision not applied')
    record=read(PROMPT_VIEW_RECORD);core=record['core']
    if (record['binding']!=digest(core) or core['study']!=str(PROMPT_VIEW_STUDY) or
        core['implementation_sha256']!=PROMPT_VIEW_IMPL or digest(core['implementation'])!=PROMPT_VIEW_IMPL):
        raise RuntimeError('prompt-view immutable revision differs')
    prompt_view_archive()
    return record


def rebind_prompt_view(deployment):
    """One exact three-file source revision after genuine old verification and fresh readiness."""
    with prompt_view_locks():
        prompt_view_fresh_source();authorization=authorize_ongoing();spec=authorization.get('prompt_view_maintenance',{})
        if (spec.get('authorized') is not True or len(set(spec.get('independent_reviewers',[])))<2 or
            spec.get('study')!=str(PROMPT_VIEW_STUDY) or spec.get('old_implementation_sha256')!=RETENTION_IMPL or
            spec.get('implementation_sha256')!=PROMPT_VIEW_IMPL or authorization.get('implementation_sha256')!=PROMPT_VIEW_IMPL):raise RuntimeError('exact twice-reviewed prompt-view authority required')
        checkpoint=read(OPS/'FOLLOW.json')
        if PROMPT_VIEW_RECORD.exists() or checkpoint.get('prompt_view_revision'):raise RuntimeError('revision consumed; explicit finish only')
        if (checkpoint.get('phase')!='needs_reconciliation' or checkpoint.get('current_study')!=str(PROMPT_VIEW_STUDY) or
            checkpoint.get('next_sequence')!=11 or any(checkpoint.get(k) is not None for k in ('operator_pid','controller_pid','caffeinate_pid'))):
            raise RuntimeError('exact stopped follower checkpoint required')
        witness,archive=prompt_view_archive();paths={'seal.json':PROMPT_VIEW_STUDY/'seal.json',
            **{f'arms/{m}/state.json':PROMPT_VIEW_STUDY/'arms'/m/'state.json' for m in ('baseline','exploration')}}
        before={n:p.read_bytes() for n,p in paths.items()}
        if {n:hashlib.sha256(raw).hexdigest() for n,raw in before.items()}!=witness['old_hashes']:
            raise RuntimeError('genuinely verified old pair changed')
        if sha(PROMPT_VIEW_STUDY/'protocol.json')!=witness['protocol_sha256']:raise RuntimeError('original protocol changed')
        old_seal=json.loads(before['seal.json']);states={m:api()['common'].load_state(paths[f'arms/{m}/state.json']) for m in ('baseline','exploration')}
        closure=prompt_view_closed(states['exploration'])
        if digest(old_seal['implementation'])!=RETENTION_IMPL:raise RuntimeError('old seal identity changed')
        if sha(PROMPT_VIEW_ANCHOR)!=PROMPT_VIEW_ANCHOR_SHA or read(PROMPT_VIEW_ANCHOR)['created']!=PROMPT_VIEW_ANCHOR_CREATED:
            raise RuntimeError('conservative pre-migration deadline witness changed')
        from machinery.study_deployment import reuse_deployment
        reuse_deployment(deployment)
        if deployment.get('ready') is not True:raise RuntimeError('fresh current-source readiness required')
        controls()
        if (PROMPT_VIEW_STUDY/'STOP.json').exists():raise RuntimeError('study STOP arrived during readiness verification')
        core={'schema':'math-gkm.prompt48-source-revision.v1','study':str(PROMPT_VIEW_STUDY),'implementation':api()['common'].implementation(),
            'implementation_sha256':PROMPT_VIEW_IMPL,'old_implementation_sha256':RETENTION_IMPL,'old_hashes':witness['old_hashes'],
            'protocol_sha256':witness['protocol_sha256'],'old_verification_sha256':PROMPT_VIEW_WITNESS_SHA,'old_archive_sha256':PROMPT_VIEW_ARCHIVE_SHA,
            'new_helper_sha256':sha(__file__),'new_follow_sha256':sha(OPS/'follow.py'),'activation_authorization_sha256':sha(ROOT/'.bootstrap/study-authorization.json'),
            'accepted_registry_binding':closure['accepted_registry_binding'],'deployment':deployment,'closure':closure,
            'deadline_anchor_sha256':PROMPT_VIEW_ANCHOR_SHA,'deadline_anchor_created':PROMPT_VIEW_ANCHOR_CREATED,
            'deadline_anchor_description':'parent10 round47 snapshot predates successor11 migration; conservative earlier ceiling, not exact original start',
            'created':time.time()}
        revised=prompt_view_state_material(old_seal,states,deployment,core)
        record={'core':core,'binding':digest(core),'files':{n:{'old':base64.b64encode(before[n]).decode(),'new':base64.b64encode(revised[n]).decode(),
            'old_sha256':hashlib.sha256(before[n]).hexdigest(),'new_sha256':hashlib.sha256(revised[n]).hexdigest()} for n in paths},
            'archived_activation_authorization':base64.b64encode((ROOT/'.bootstrap/study-authorization.json').read_bytes()).decode(),
            'archived_deadline_anchor':base64.b64encode(PROMPT_VIEW_ANCHOR.read_bytes()).decode()}
        atomic_protected(PROMPT_VIEW_RECORD,revision_bytes(record),0o444)
        after={**authorization,'prompt_view_revision':{'path':str(PROMPT_VIEW_RECORD),'sha256':sha(PROMPT_VIEW_RECORD)}}
        checkpoint['prompt_view_revision']={'status':'install_intent','record_sha256':sha(PROMPT_VIEW_RECORD),
            'authorization_before_sha256':sha(ROOT/'.bootstrap/study-authorization.json'),
            'authorization_after_sha256':hashlib.sha256(revision_bytes(after)).hexdigest()}
        write(OPS/'FOLLOW.json',checkpoint)
        return _finish_prompt_view_rebind()


def finish_prompt_view_rebind():
    with prompt_view_locks():return _finish_prompt_view_rebind()


def _finish_prompt_view_rebind():
    prompt_view_fresh_source();witness,archive=prompt_view_archive();checkpoint=read(OPS/'FOLLOW.json')
    intent=checkpoint.get('prompt_view_revision',{});record=read(PROMPT_VIEW_RECORD);core=record['core'];authorization=authorize_ongoing()
    if (intent.get('status')!='install_intent' or intent.get('record_sha256')!=sha(PROMPT_VIEW_RECORD) or
        record['binding']!=digest(core) or core['study']!=str(PROMPT_VIEW_STUDY) or core['implementation_sha256']!=PROMPT_VIEW_IMPL or
        digest(core['implementation'])!=PROMPT_VIEW_IMPL or core['old_hashes']!=witness['old_hashes'] or
        sha(__file__)!=core['new_helper_sha256'] or sha(OPS/'follow.py')!=core['new_follow_sha256']):
        raise RuntimeError('exact known prompt-view revision intent required')
    expected={'seal.json','arms/baseline/state.json','arms/exploration/state.json'}
    if set(record['files'])!=expected:raise RuntimeError('revision target escape')
    if (hashlib.sha256(base64.b64decode(record['archived_activation_authorization'],validate=True)).hexdigest()!=core['activation_authorization_sha256'] or
        hashlib.sha256(base64.b64decode(record['archived_deadline_anchor'],validate=True)).hexdigest()!=PROMPT_VIEW_ANCHOR_SHA):
        raise RuntimeError('permanent activation/deadline archive changed')
    decoded={}
    for name,row in record['files'].items():
        old,new=(base64.b64decode(row[k],validate=True) for k in ('old','new'))
        if (hashlib.sha256(old).hexdigest()!=witness['old_hashes'][name] or row['old_sha256']!=witness['old_hashes'][name] or
            hashlib.sha256(new).hexdigest()!=row['new_sha256'] or sha(PROMPT_VIEW_STUDY/name) not in (row['old_sha256'],row['new_sha256'])):
            raise RuntimeError('unknown partial revision bytes; reconciliation required')
        decoded[name]=(old,new)
    old_seal=json.loads(decoded['seal.json'][0]);states={m:json.loads(decoded[f'arms/{m}/state.json'][0])['state'] for m in ('baseline','exploration')}
    required=prompt_view_state_material(old_seal,states,core['deployment'],core)
    if any(raw!=required[n] for n,(old,raw) in decoded.items()):raise RuntimeError('revision modifies more than source/seal bindings')
    for name in ('protocol.json','CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json'):
        if sha(PROMPT_VIEW_STUDY/name)!=archive['files'][name]['sha256']:raise RuntimeError('historical protocol/origin changed')
    after={**authorization,'prompt_view_revision':{'path':str(PROMPT_VIEW_RECORD),'sha256':sha(PROMPT_VIEW_RECORD)}}
    if (sha(ROOT/'.bootstrap/study-authorization.json') not in (intent['authorization_before_sha256'],intent['authorization_after_sha256']) or
        hashlib.sha256(revision_bytes(after)).hexdigest()!=intent['authorization_after_sha256']):raise RuntimeError('unknown activation authority mixture')
    from machinery.study_deployment import reuse_deployment
    prompt_view_closed(api()['common'].load_state(PROMPT_VIEW_STUDY/'arms/exploration/state.json'))
    reuse_deployment(core['deployment']);controls()
    if (PROMPT_VIEW_STUDY/'STOP.json').exists():raise RuntimeError('study STOP arrived before revision writes')
    for name,(old,new) in decoded.items():
        if sha(PROMPT_VIEW_STUDY/name)!=record['files'][name]['new_sha256']:
            atomic_protected(PROMPT_VIEW_STUDY/name,new,(PROMPT_VIEW_STUDY/name).stat().st_mode & 0o777)
    api()['study'].verify(PROMPT_VIEW_STUDY)
    atomic_protected(ROOT/'.bootstrap/study-authorization.json',revision_bytes(after),0o444)
    checkpoint['prompt_view_revision']={**intent,'status':'applied','implementation_sha256':PROMPT_VIEW_IMPL,
        'seal_sha256':sha(PROMPT_VIEW_STUDY/'seal.json'),'finished':time.time()}
    write(OPS/'FOLLOW.json',checkpoint);return checkpoint['prompt_view_revision']


def prompt_view_resume_deadline(study,checkpoint,remaining_wall):
    """Called only while the existing follower holds its singleton/operator leases."""
    import math
    if Path(study)!=PROMPT_VIEW_STUDY:raise RuntimeError('wrong prompt-view resume study')
    with prompt_view_locks(follower_owns_outer=True):
        if checkpoint!=read(OPS/'FOLLOW.json'):raise RuntimeError('resume checkpoint changed or already consumed')
        prompt_view_fresh_source();record=prompt_view_applied();authorization=authorize_ongoing();grant=authorization.get('ongoing_current_resume',{})
        if (grant!=checkpoint.get('current_resume') or grant.get('authorized') is not True or len(set(grant.get('independent_reviewers',[])))<2 or
            grant.get('study')!=str(study) or grant.get('current_sequence')!=11 or grant.get('next_sequence')!=12 or
            checkpoint.get('phase')!='ready_to_resume_current' or checkpoint.get('current_study')!=str(study) or checkpoint.get('next_sequence')!=11 or
            grant.get('revision_sha256')!=sha(PROMPT_VIEW_RECORD) or checkpoint.get('prompt_view_resume_intent')):
            raise RuntimeError('exact one-use current11 resume authority required')
        for name,key in [('seal.json','seal_sha256'),('protocol.json','protocol_sha256'),('arms/exploration/state.json','state_sha256')]:
            if sha(study/name)!=grant.get(key):raise RuntimeError('resume input bytes changed')
        state=api()['common'].load_state(study/'arms/exploration/state.json');prompt_view_closed(state)
        immutable_bindings(ongoing=True);api()['study'].verify(study)
        p=read(study/'protocol.json');start,end=grant.get('authorized_at'),grant.get('deadline_wall')
        ceiling=PROMPT_VIEW_ANCHOR_CREATED+epoch_wall_reservation(p)
        if (any(type(v) not in (int,float) or not math.isfinite(v) for v in (start,end)) or start>time.time() or
            end>min(ceiling,start+remaining_wall(p,state)) or end-time.time()<=CLEANUP_SECONDS+30):
            raise RuntimeError('remaining wall exhausted or conservative original ceiling extended')
        controls()
        if (study/'STOP.json').exists():raise RuntimeError('study STOP arrived before resume intent')
        checkpoint={**checkpoint,'prompt_view_resume_intent':{'created':time.time(),'grant_binding':digest(grant),
            'revision_sha256':sha(PROMPT_VIEW_RECORD),'deadline_wall':end,'same_epoch':True}}
        write(OPS/'FOLLOW.json',checkpoint)
        return time.monotonic()+end-time.time()


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('command',choices=('plan','status','run','stop'))
    parser.add_argument('--review',type=Path)
    args=parser.parse_args()
    if args.command=='plan':value=prepare_plan()
    elif args.command=='status':value=read(OPS/'STATUS.json') if (OPS/'STATUS.json').exists() else dict(status='not_launched')
    elif args.command=='stop':value=request_stop()
    else:
        if args.review is None:parser.error('run requires exact independent --review')
        def interrupted(number,frame):
            global INTERRUPTED
            INTERRUPTED='operator signal '+str(number)
        for number in (signal.SIGTERM,signal.SIGINT):signal.signal(number,interrupted)
        run_operator(args.review);value=read(OPS/'STATUS.json')
    print(canonical(value))



def retention12_fresh_source():
    """New coherent interpreter, never a partial reload of resource classes."""
    a=api();common=a['common'];resources=a['resources']
    worker=importlib.import_module('machinery.study_worker')
    for module,name in ((common,'study_common'),(resources,'resources'),(worker,'study_worker')):
        if Path(module.__file__).resolve()!=ROOT/'machinery'/(name+'.py'):
            raise RuntimeError('retention12 source import escaped installed path')
    if (digest(common.implementation())!=RETENTION12_IMPL or resources.RETENTION_SCAN_ENTRY_LIMIT!=250000 or
        resources.DISK_SCAN_ENTRY_LIMIT!=100000 or common.RETAINED_SOURCE_HISTORY_CAP!=2*1024**3 or
        MIGRATION_CAP!=2*1024**3 or common.Invalid is not a['study'].Invalid or
        worker.Guard is not resources.Guard or worker.ResourceFailure is not resources.ResourceFailure or
        worker.disk_scope_roots is not resources.disk_scope_roots or
        common.retention_room.__globals__ is not common.__dict__ or
        resources.Guard._disk_bytes.__globals__ is not resources.__dict__):
        raise RuntimeError('retention12 fresh coherent resource modules required')
    return a


def retention12_witness():
    """Exact old-source verification, with parent bytes never relabeled or edited."""
    spec=authorize_ongoing().get('retention12_maintenance',{})
    path=RETENTION12_PACKET/'OLD_VERIFICATION.json'
    if (spec.get('authorized') is not True or len(set(spec.get('independent_reviewers',[])))<2 or
        spec.get('parent')!=str(RETENTION12_PARENT) or spec.get('destination')!=str(RETENTION12_DESTINATION) or
        spec.get('old_implementation_sha256')!=PROMPT_VIEW_IMPL or spec.get('implementation_sha256')!=RETENTION12_IMPL or
        spec.get('old_verification_sha256')!=sha(path) or path.is_symlink()):
        raise RuntimeError('exact reviewed retention12 witness authority required')
    witness=read(path)
    if (witness.get('schema')!='math-gkm.retention12-old-parent-verification.v1' or
        witness.get('genuine_old_study_verify_passed') is not True or witness.get('study')!=str(RETENTION12_PARENT) or
        witness.get('old_implementation_sha256')!=PROMPT_VIEW_IMPL or digest(witness.get('implementation'))!=PROMPT_VIEW_IMPL or
        witness.get('parent_round')!=52 or witness.get('accepted_count')!=71 or
        witness.get('parent_status')!='finite_budget_finished; root_open'):
        raise RuntimeError('genuine exact old-D7 parent52 verification required')
    expected={'seal.json','arms/baseline/state.json','arms/exploration/state.json','protocol.json',
        'CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json',
        'seed/seed-files.json','seed/contract.json'}
    hashes=witness.get('parent_hashes',{})
    if set(hashes)!=expected or hashes['arms/exploration/state.json']!=RETENTION12_PARENT_STATE:
        raise RuntimeError('retention12 immutable parent scope differs')
    for name,expected_hash in hashes.items():
        source=RETENTION12_PARENT/safe_relative(name)
        if source.is_symlink() or sha(source)!=expected_hash:raise RuntimeError('verified retention12 parent bytes changed')
    for name,row in witness.get('archive_files',{}).items():
        relative=safe_relative(name);archived=RETENTION12_PACKET/relative
        if len(relative.parts)!=1 or archived.is_symlink() or archived.stat().st_size!=row['bytes'] or sha(archived)!=row['sha256']:
            raise RuntimeError('retention12 permanent original archive differs')
        source=Path(row['source'])
        changed={ROOT/name for name in RETENTION12_CHANGES}|{Path(__file__),OPS/'FOLLOW.json'}
        if source not in changed and (source.is_symlink() or sha(source)!=row['sha256']):
            raise RuntimeError('retention12 unchanged original metadata differs')
    if not witness.get('archive_files'):raise RuntimeError('retention12 permanent originals required')
    metadata=witness.get('operational_metadata_files')
    if (not isinstance(metadata,dict) or not 1<=len(metadata)<=10000 or
        digest(metadata)!=witness.get('native_closure',{}).get('metadata_files_binding')):
        raise RuntimeError('retention12 bounded closed-effect metadata binding required')
    for name,expected_hash in metadata.items():
        source=Path(name)
        if (not source.is_absolute() or not source.is_relative_to(ROOT/'.scratch') or
            source.name not in ('receipt.json','spec.json','process.json','watchdog.json','worker.json','result.json','FINISHED.json') or
            source.is_symlink() or not source.is_file() or source.resolve()!=source or sha(source)!=expected_hash):
            raise RuntimeError('retention12 closed receipt or validator metadata changed')
    state=api()['common'].load_state(RETENTION12_PARENT/'arms/exploration/state.json')
    if (state.get('round')!=52 or state.get('status')!='finite_budget_finished; root_open' or
        len(state['research']['knowledge'])!=71 or any(state.get(k) is not None for k in ('active','active_intent','resolution')) or
        digest(state['research']['knowledge'])!=witness.get('accepted_registry_binding')):
        raise RuntimeError('retention12 finalized accepted/accounting boundary changed')
    if ((RETENTION12_PARENT/'STOP.json').exists() or (OPS/'STOP.json').exists() or
        (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists()):raise RuntimeError('retention12 STOP or cleanup hold')
    return witness


def retention12_observer_fixture():
    """Separate source-bound zero-hosted scope evidence, never proof evidence."""
    pointer=authorize_ongoing().get('retention12_maintenance',{}).get('observer_fixture',{})
    path=RETENTION12_PACKET/'OBSERVER_FIXTURE.json'
    if (path.is_symlink() or not path.is_file() or path.resolve()!=path or
        pointer!={'path':str(path),'sha256':sha(path)}):
        raise RuntimeError('retention12 exact independent observer fixture required')
    fixture=read(path)
    if (fixture.get('schema')!='math-gkm.retention12-observer-fixture.v1' or fixture.get('passed') is not True or
        fixture.get('implementation_sha256')!=RETENTION12_IMPL or type(fixture.get('hosted_calls')) is not int or fixture['hosted_calls']!=0 or
        any(fixture.get(key) is not True for key in ('workspace_and_job_observed','readonly_workspace_growth_observed',
            'sibling_arm_tool_write_denied','supported_config_preflight_checked'))):
        raise RuntimeError('retention12 new-source neutral observer coverage required')
    artifacts=fixture.get('artifacts',{})
    if set(artifacts)!={'source','result'}:raise RuntimeError('retention12 measured observer fixture artifacts required')
    for row in artifacts.values():
        artifact=Path(row['path'])
        if (not artifact.is_relative_to(RETENTION12_PACKET) or artifact.is_symlink() or not artifact.is_file() or
            artifact.resolve()!=artifact or sha(artifact)!=row['sha256']):
            raise RuntimeError('retention12 observer fixture source/result changed')
    for key in ('observed_workspace_growth_bytes','observed_job_growth_bytes','readonly_workspace_growth_bytes'):
        if type(fixture.get(key)) is not int or fixture[key]<=0:
            raise RuntimeError('retention12 measured observer growth evidence required')
    if fixture.get('config_rejection_before_popen') is not True:
        raise RuntimeError('retention12 prelaunch configuration negative evidence required')
    return pointer['sha256']


def retention12_ps_snapshot():
    """Complete bounded native table, with separate empty stderr and UTC dates."""
    import calendar
    import selectors
    argv=['/bin/ps','-axo','pid=,ppid=,pgid=,lstart=']
    child=None;output=bytearray();error=bytearray();started=time.monotonic()
    try:
        child=subprocess.Popen(argv,cwd=ROOT,env={**os.environ,'LC_ALL':'C','TZ':'UTC'},
            stdin=subprocess.DEVNULL,stdout=subprocess.PIPE,stderr=subprocess.PIPE)
        with selectors.DefaultSelector() as selector:
            for stream,target in ((child.stdout,output),(child.stderr,error)):
                os.set_blocking(stream.fileno(),False);selector.register(stream,selectors.EVENT_READ,target)
            while selector.get_map():
                if time.monotonic()-started>=2:raise RuntimeError('retention12 native table timeout')
                for key,mask in selector.select(.02):
                    block=os.read(key.fd,8192)
                    if not block:selector.unregister(key.fileobj);continue
                    if len(output)+len(error)+len(block)>1024**2:raise RuntimeError('retention12 native table output bound')
                    key.data.extend(block)
        child.wait(timeout=max(.01,2-(time.monotonic()-started)))
        if child.returncode!=0 or error:raise RuntimeError('retention12 native table failed')
        rows={}
        for line in output.decode('ascii').splitlines():
            fields=line.split()
            if len(fields)!=8 or not all(v.isdigit() for v in fields[:3]):raise RuntimeError('retention12 malformed native table')
            pid,ppid,group=map(int,fields[:3]);date=' '.join(fields[3:])
            parsed=time.strptime(date,'%a %b %d %H:%M:%S %Y');second=calendar.timegm(parsed)
            actual=time.gmtime(second)
            if actual[:6]!=parsed[:6] or actual.tm_wday!=parsed.tm_wday or pid in rows:
                raise RuntimeError('retention12 invalid native date or duplicate row')
            rows[pid]={'ppid':ppid,'pgid':group,'lstart':date,'ps_start_second':second}
        own=api()['resources'].process_status(os.getpid())
        if (own is None or rows.get(os.getpid(),{}).get('ppid')!=own['ppid'] or
            rows[os.getpid()]['pgid']!=own['pgid'] or rows.get(child.pid,{}).get('ppid')!=os.getpid()):
            raise RuntimeError('retention12 incomplete native table')
        return rows
    finally:
        if child is not None:
            if child.poll() is None:child.kill()
            child.wait(timeout=2)
            child.stdout.close();child.stderr.close()


def retention12_native_closed(witness):
    """Original identities/groups absent; positively recycled numbers are retained."""
    closure=witness.get('native_closure',{});resources=api()['resources']
    if (closure.get('registry_complete') is not True or closure.get('all_owned_identities_absent') is not True or
        closure.get('all_owned_groups_absent') is not True or not closure.get('pairs')):
        raise RuntimeError('retention12 complete birth-bound native closure witness required')
    expected={}
    for pid,birth in closure['pairs']:
        if type(pid) is not int or pid<=0 or not isinstance(birth,str) or not re.fullmatch(r'[0-9]+:[0-9]+',birth):
            raise RuntimeError('retention12 malformed expected native identity')
        expected.setdefault(pid,set()).add(birth)
    birthless=set(closure.get('birthless_pids',[]));observed={};fallback=set()
    def native(pid):
        try:return resources.process_status(pid)
        except PermissionError as exc:
            import errno
            if (exc.errno!=errno.EPERM or not resources.darwin_profile() or pid!=21410 or
                expected.get(pid)!={'1792539004:9534'}):raise RuntimeError('retention12 native identity unavailable') from None
            fallback.add(pid);return 'ps_second_only'
    for pid in sorted(set(expected)|birthless):
        info=native(pid)
        if pid in birthless and info is not None:raise RuntimeError('retention12 birthless PID still present')
        if info=='ps_second_only':observed[pid]=info;continue
        if info is not None:
            if (not isinstance(info,dict) or not re.fullmatch(r'[0-9]+:[0-9]+',str(info.get('identity',''))) or
                info['identity'] in expected.get(pid,set())):
                raise RuntimeError('retention12 original live or zombie identity remains')
        observed[pid]=info
    first=retention12_ps_snapshot();recycled={};groups=set(closure.get('groups',[]))
    for pid,info in observed.items():
        if info=='ps_second_only':
            row=first.get(pid)
            if (row is None or row['ppid']!=1 or row['pgid']!=pid or
                row['ps_start_second'] in {int(b.split(':')[0]) for b in expected[pid]}):
                raise RuntimeError('retention12 denied native identity has no different-second evidence')
            recycled[pid]={'ps_start_second':row['ps_start_second'],'native_usec_identity':None}
        elif info is not None:
            row=first.get(pid)
            if (row is None or row['ppid']!=info.get('ppid') or row['pgid']!=info.get('pgid') or
                row['ps_start_second']!=int(info['identity'].split(':')[0])):
                raise RuntimeError('retention12 native/table identity disagreement')
            recycled[pid]={'identity':info['identity']}
    second=retention12_ps_snapshot()
    collisions={group for group in groups if any(row['pgid']==group for row in first.values()) or
        any(row['pgid']==group for row in second.values())}
    for group in collisions:
        if group not in recycled or first.get(group,{}).get('pgid')!=group:
            raise RuntimeError('retention12 old group has no positively recycled current leader')
        info=observed[group]
        if isinstance(info,dict) and info.get('pgid')!=group:raise RuntimeError('retention12 native/table group disagreement')
    if birthless.intersection(first) or birthless.intersection(second):
        raise RuntimeError('retention12 birthless PID observed in complete table')
    for pid in fallback:
        if first.get(pid)!=second.get(pid) or native(pid)!='ps_second_only':
            raise RuntimeError('retention12 denied native detail changed')
    for group in collisions:
        if first.get(group)!=second.get(group) or second.get(group,{}).get('pgid')!=group:
            raise RuntimeError('retention12 recycled group leader changed')
        if group not in fallback and native(group)!=observed[group]:raise RuntimeError('retention12 recycled leader changed')
    # A new matching expected birth is never ignored, including zombies. No
    # signal is sent to any recorded or recycled PID by this observer.
    for pid,births in expected.items():
        if pid in fallback:continue
        info=native(pid)
        if info is not None and (not isinstance(info,dict) or
            not re.fullmatch(r'[0-9]+:[0-9]+',str(info.get('identity',''))) or info['identity'] in births):
            raise RuntimeError('retention12 original identity remains or observer changed')
    return {'all_owned_identities_absent':True,'all_owned_groups_absent':True,
        'recycled_pids':recycled,'recycled_groups':sorted(collisions),'expected_pairs':closure['pairs']}


def verify_parent_source(a,parent,destination,*,ongoing):
    actual=digest(a['common'].implementation())
    if actual==RETENTION12_IMPL and Path(parent)==RETENTION12_PARENT:
        if not ongoing or Path(destination)!=RETENTION12_DESTINATION or RETENTION12_DESTINATION.exists():
            raise RuntimeError('retention12 witness applies only to exact absent successor12')
        retention12_fresh_source();witness=retention12_witness();retention12_observer_fixture();retention12_native_closed(witness);controls()
        return dict(implementation_sha256=PROMPT_VIEW_IMPL,old_verification_sha256=sha(RETENTION12_PACKET/'OLD_VERIFICATION.json'))
    a['study'].verify(parent)
    return dict(implementation_sha256=actual)


def reconcile_retention12():
    """Explicit once-only waiting reconciliation; never resumes or replays parent11."""
    names=[OPS/'FOLLOW.lock',OPS/'operator.lock',RETENTION12_PARENT/'controller.lock',
        ROOT/'.scratch/resources/heavy.lock',OPS/'boundary_hold.lock']
    with contextlib.ExitStack() as stack:
        for path in names:
            stream=stack.enter_context(path.open('rb'));fcntl.flock(stream,fcntl.LOCK_EX|fcntl.LOCK_NB)
        controls();retention12_fresh_source();witness=retention12_witness();fixture_sha=retention12_observer_fixture();retention12_native_closed(witness)
        path=OPS/'FOLLOW.json';checkpoint=read(path);record=RETENTION12_PACKET/'RECONCILIATION.json'
        if (record.exists() or sha(path)!=witness['old_follow_sha256'] or RETENTION12_DESTINATION.exists() or
            checkpoint.get('phase')!='needs_reconciliation' or checkpoint.get('current_study')!=str(RETENTION12_PARENT) or
            checkpoint.get('next_sequence')!=12 or checkpoint.get('reason')!='RuntimeError: cumulative migration retention cap' or
            any(checkpoint.get(k) is not None for k in ('operator_pid','controller_pid','caffeinate_pid'))):
            raise RuntimeError('exact closed retention12 failure checkpoint required; no retry')
        entry=dict(schema='math-gkm.retention12-reconciliation.v1',old_follow_sha256=sha(path),
            old_verification_sha256=sha(RETENTION12_PACKET/'OLD_VERIFICATION.json'),source_sha256=sha(__file__),
            implementation_sha256=RETENTION12_IMPL,parent_unchanged=True,created=time.time())
        entry['observer_fixture_sha256']=fixture_sha
        # Write once before changing the follower checkpoint. Any interruption
        # after intent requires an explicit independent finish review, not retry.
        with record.open('x') as out:
            out.write(canonical(entry)+'\n');out.flush();os.fsync(out.fileno())
        record.chmod(0o444)
        directory=os.open(record.parent,os.O_RDONLY)
        try:os.fsync(directory)
        finally:os.close(directory)
        controls()
        if (RETENTION12_PARENT/'STOP.json').exists():raise RuntimeError('retention12 study STOP arrived')
        checkpoint.update(phase='waiting',helper_sha256=sha(__file__),retention12_reconciliation=entry)
        write(path,checkpoint)
        return entry



def retention54_api():
    path=OPS/'retention54-maintenance-20261022/retention54_maintenance.py'
    spec=authorize_ongoing().get('retention54_maintenance',{})
    if (spec.get('authorized') is not True or spec.get('module_path')!=str(path) or
        path.is_symlink() or sha(path)!=spec.get('module_sha256')):
        raise RuntimeError('exact protected retention54 maintenance module required')
    module_spec=importlib.util.spec_from_file_location('retention54_maintenance',path)
    module=importlib.util.module_from_spec(module_spec);module_spec.loader.exec_module(module)
    return module


# Inactive same17 source-only administrative lineage; no CLI or installer.
PT_OLD_CORE='67aedf1e4c4bd8bf26b318b92540209f35d268e4145434e19ea171a58a92edc5'
PT_PACKET=OPS/'prompt-transport-maintenance-20261023/lineage-finalization'
PT_GUARD_SHA='e631063d2c8540213bb565169b413119fc8d21a36634f7e861d0724bd94cddbf'
PT_FOLLOW_BEFORE='7ebed6da485a15c6669cbe6ad4ab8bc3291571434ba0d5db5c66dee690d661df'
PT_FOLLOW_AFTER='4af3c266369958b14ecdf3a68b22f554608b43eb60145ea6068e449c116cc25c'
PT_RET54='c837dc01e3c1e0495bf6fd4346154d406af59d81b6de1c1c8f39e4b107096dee'
PT_REV54='d111136872a812d1da128f35b721f5ca0c56e0e50cc9afac65d0ae9341f7320e'
PT_AUTH54='2556541ea2f645859680536e02cceb2ff86a4234c6fa902d1ec7888fbcb38cc5'
PT_HELPER54='633f0bc9c150dc39aad0b2f1dc67d714b22d054533ea5228828d2aad805970bd'
PT_FRESH_API=False
PT_BEFORE={
 'machinery/study_context.py':'ede4c5cd86812072ce6236456b9b9985147485ae2d82353ee45665a1032b9a9f',
 'machinery/study_policy.py':'35c832306d3b445304745a254c3973ea0b07dce663e76e3613731b13a3b56432',
 'machinery/study_research_feedback.py':'f48f2c378fc49284a8e809bc719f210cafcf3c2069c169df1d7687d1824d5743'}
PT_FIXED_AFTER={
 'machinery/study_policy.py':'d7e7a7e6577547e3420cea6390787cd73cdf9687ef9c1b536ba75c64f8401855',
 'machinery/study_research_feedback.py':'47b723b63caa3d390a6561ebaa51791810f09431a003718ddc34be6211acf094'}
PT_OLD_CORES=('66e3aa3f8dddeaafde8456e46b3636fb23f3737128ce53020e847319db3368ff', '7772dfefd0e76d355edbdcd1a1414a4fcaccb7ec1aa0d298de99b8d7e1f84aa3', 'bac1b8f622077e362fc2d078e87bab3bad4114882700d722b09498f3481878fa', '590648a8eb6c9ee626c63077cbdbd7963aa53d946ceac9cfe3f73e4591b63b7d', 'ffd4aee9df33c2b3503a3ec1833e95ad5da29949394a2558c23ec01f6efffbdf', '3cfd280fbeea15b0a2ca0a434a7333304d282ee97ed5a66d840ad2c340f76478', 'd7c3f043e81417605553e9e034415bff90fa2736f9e91d6ce41538a715891957', '362ddc45720556257067ceac52159534bfe5da11864b0becdf77dbe68e0d2d6d', '67aedf1e4c4bd8bf26b318b92540209f35d268e4145434e19ea171a58a92edc5')


def pt_require(ok,message):
    if not ok:raise RuntimeError(message)


def pt_map(historical,config):
    pt_require(isinstance(historical,dict) and len(historical)==76 and digest(historical)==PT_OLD_CORE,'literal historical full76 core67 required')
    pt_require(config.get('old_core')==PT_OLD_CORE and config.get('old_implementation')==historical
        and isinstance(config.get('changes'),dict) and set(config['changes'])==set(PT_BEFORE),
        'exact three reviewed core paths required')
    result=dict(historical)
    for name,before in PT_BEFORE.items():
        pair=config['changes'][name]
        pt_require(isinstance(pair,(list,tuple)) and len(pair)==2 and pair[0]==before==result.get(name)
            and isinstance(pair[1],str) and bool(re.fullmatch('[0-9a-f]{64}',pair[1])) and pair[1]!=before,
            'reviewed actual source hash pair required')
        if name in PT_FIXED_AFTER:pt_require(pair[1]==PT_FIXED_AFTER[name],'reviewed policy/feedback target differs')
        result[name]=pair[1]
    pt_require(config.get('implementation')==result and config.get('new_core')==digest(result),
        'reviewed full76/source target data differs')
    return result


def pt_declared_source_reference(source,old_hash,current_hash,config):
    pt_map(config['old_implementation'],config)
    pairs={str(ROOT/name):tuple(pair) for name,pair in config['changes'].items()}
    pairs[str(OPS/'follow.py')]=(PT_FOLLOW_BEFORE,PT_FOLLOW_AFTER)
    pt_require(str(source) in pairs and (old_hash,current_hash)==pairs[str(source)],
        'archived original and exact declared current source differ')


def pt_is_new(implementation):
    return implementation not in PT_OLD_CORES


def pt_config():
    authority=authorize_ongoing();grant=authority.get('prompt_transport_maintenance',{})
    pt_require(grant.get('schema')=='math-gkm.prompt-transport-maintenance.v1'
        and grant.get('authorized')is True and len(set(grant.get('independent_reviewers',[])))>=2
        and grant.get('module_path')==str(PT_PACKET/'revision_guard.py')
        and grant.get('module_sha256')==PT_GUARD_SHA,'separately reviewed exact source configuration required')
    path=Path(grant.get('config_path',''))
    pt_require(path.is_absolute() and path.is_relative_to(PT_PACKET) and path.resolve()==path
        and not path.is_symlink() and path.is_file() and sha(path)==grant.get('config_sha256'),
        'protected immutable source configuration unavailable')
    config=read(path)
    pt_require(config.get('schema')=='math-gkm.prompt-transport-maintenance-config.v1'
        and config.get('study')==str(ROOT/'.scratch/concept-driver-20261020-follow-000017')
        and config.get('helper_sha256')==sha(__file__) and config.get('follow_sha256')==PT_FOLLOW_AFTER
        and sha(OPS/'follow.py')==PT_FOLLOW_AFTER and config.get('module_sha256')==PT_GUARD_SHA
        and authority.get('implementation_sha256')==config.get('new_core'), 'actual reviewed current source identities differ')
    pt_map(config['old_implementation'],config)
    return config


def pt_coherent(a):
    common,resources=a['common'],a['resources']
    config=pt_config()
    from machinery import study_worker as worker,study_research_feedback as feedback,study_context as context
    pt_require(PT_FRESH_API and common.Invalid is a['study'].Invalid is feedback.Invalid is context.Invalid is a['deployment'].Invalid
        and issubclass(context.PromptContextLimit,common.Invalid)
        and worker.Guard is resources.Guard and worker.ResourceFailure is resources.ResourceFailure
        and worker.disk_scope_roots is resources.disk_scope_roots
        and common.retention_room.__globals__ is common.__dict__
        and resources.Guard._disk_bytes.__globals__ is resources.__dict__
        and common.RETAINED_SOURCE_HISTORY_CAP==MIGRATION_CAP==8*1024**3
        and resources.DISK_SCAN_ENTRY_LIMIT==100000 and resources.RETENTION_SCAN_ENTRY_LIMIT==250000
        and context.PROMPT_CHAR_LIMIT==900000 and context.CONTEXT_BYTE_LIMIT==8*1024**2
        and callable(getattr(feedback,'_section_text',None))
        and callable(getattr(context,'prepare_prompt',None)), 'fresh coherent prompt/resource API required')
    pt_require(sha(OPS/'follow.py')==PT_FOLLOW_AFTER,'reviewed current follower hook changed')
    for name,after in config['implementation'].items():pt_require(sha(ROOT/name)==after,'reviewed physical source file changed')
    for module,name in ((common,'study_common'),(resources,'resources'),(worker,'study_worker'),
                       (feedback,'study_research_feedback'),(context,'study_context'),(a['deployment'],'study_deployment')):
        pt_require(Path(module.__file__).resolve()==ROOT/'machinery'/(name+'.py'),'fresh API module origin differs')


def pt_historical(record,archive,current,config):
    core=record['core'];grant=archive.get('retention54_maintenance',{})
    pt_require(record['binding']==digest(core) and core['study']==str(RETENTION54_STUDY)
        and core['implementation_sha256']==PT_OLD_CORE and core['old_implementation_sha256']==RETENTION12_IMPL
        and pt_map(core['implementation'],config)==current and core['activation_authority_sha256']==PT_AUTH54
        and archive.get('implementation_sha256')==PT_OLD_CORE and grant.get('authorized')is True
        and len(set(grant.get('independent_reviewers',[])))>=2 and grant.get('study')==str(RETENTION54_STUDY)
        and grant.get('old_implementation_sha256')==RETENTION12_IMPL and grant.get('implementation_sha256')==PT_OLD_CORE
        and grant.get('module_path')==str(RETENTION54_PACKET/'retention54_maintenance.py')
        and grant.get('module_sha256')==PT_RET54 and grant.get('helper_sha256')==PT_HELPER54
        and grant.get('old_verification_sha256')==core['old_verification_sha256']
        and grant.get('closure_sha256')==core['closed_effects_sha256'],'literal retention54 historical identities required')


def pt_preserved_ret54_grant(authority,original,config):
    pt_require(config.get('old_helper_sha256')=='22fbafaabd60adcd8942020072601a366768db2608b88ddb83a812825ae55cb1'
        and config.get('old_follow_sha256')==PT_FOLLOW_BEFORE
        and original.get('implementation_sha256')==PT_OLD_CORE
        and original.get('ongoing_migration_sha256')==config['old_helper_sha256']
        and original.get('ongoing_follow_sha256')==PT_FOLLOW_BEFORE
        and type(original.get('retention54_maintenance')) is dict
        and canonical(authority.get('retention54_maintenance'))==canonical(original['retention54_maintenance']),
        'original pre-prompt historical grant cannot be retargeted')


def pt_lineage():
    a=api();pt_coherent(a)
    config=pt_config()
    revision=RETENTION54_PACKET/'REVISION.json';archive=RETENTION54_PACKET/'activation-authority.before.json'
    pt_require(sha(revision)==PT_REV54 and sha(archive)==PT_AUTH54,'historical retention54 archive changed')
    record,old_authority=read(revision),read(archive)
    pt_historical(record,old_authority,a['common'].implementation(),config)
    authority=authorize_ongoing()
    original_path=PT_PACKET.parent/'before/.bootstrap/study-authorization.json'
    original_pin=config.get('before_files',{}).get(str(ROOT/'.bootstrap/study-authorization.json'))
    pt_require(type(original_pin) is str and re.fullmatch('[0-9a-f]{64}',original_pin) is not None
        and original_path.is_file() and not original_path.is_symlink() and original_path.resolve()==original_path
        and sha(original_path)==original_pin,'authenticated original pre-prompt authority required')
    pt_preserved_ret54_grant(authority,read(original_path),config)
    path=RETENTION54_PACKET/'retention54_maintenance.py'
    pt_require(sha(path)==PT_RET54,'historical retention54 module changed')
    from types import SimpleNamespace,ModuleType
    module=ModuleType('prompt_transport_historical_ret54');module.__file__=str(path)
    exec(compile(path.read_bytes(),str(path),'exec'),module.__dict__)
    module._witness(SimpleNamespace(sha=sha,read=read,safe_relative=safe_relative))
    entry=read(OPS/'FOLLOW.json').get('retention54_revision',{})
    pt_require(entry.get('status')=='applied' and entry.get('record_sha256')==PT_REV54
        and authority.get('retention54_revision')=={'path':str(revision),'sha256':PT_REV54}
        and sha(RETENTION54_STUDY/'seal.json')==record['new_hashes']['seal.json']
        and authority.get('implementation_sha256')==config['new_core'],'historical applied/new global source binding differs')
    return config


def pt_guard():
    path=PT_PACKET/'revision_guard.py'
    pt_require(path.is_file() and not path.is_symlink() and path.resolve()==path and sha(path)==PT_GUARD_SHA,
        'exact protected administrative revision guard required')
    from types import ModuleType
    module=ModuleType('prompt_transport_revision_guard');module.__file__=str(path)
    exec(compile(path.read_bytes(),str(path),'exec'),module.__dict__)
    return module


def pt_operator():
    from types import SimpleNamespace
    return SimpleNamespace(ROOT=ROOT,OPS=OPS,__file__=__file__,read=read,write=write,sha=sha,digest=digest,
        api=api,authorize_ongoing=authorize_ongoing,controls=controls,reviewed_map=pt_map)


def prompt_transport_resume_deadline(study,state,remaining_wall,*,owned_outer=None):
    if Path(study)==ROOT/'.scratch/concept-driver-20261020-follow-000019':
        pt_require(ca19_selected(authorize_ongoing().get('implementation_sha256')),'exact new19 current source required')
        api()  # Initialize the genuine fresh API once; never bypass its cache/import checks.
        return ca19_guard().resume_deadline(study,state,owned_outer=owned_outer)
    pt_lineage()
    return pt_guard().resume_deadline(pt_operator(),study,state,remaining_wall,owned_outer=owned_outer)


def pt_retention12_witness():
    """Exact old-source verification, with parent bytes never relabeled or edited."""
    config=pt_config()
    spec=authorize_ongoing().get('retention12_maintenance',{})
    path=RETENTION12_PACKET/'OLD_VERIFICATION.json'
    if (spec.get('authorized') is not True or len(set(spec.get('independent_reviewers',[])))<2 or
        spec.get('parent')!=str(RETENTION12_PARENT) or spec.get('destination')!=str(RETENTION12_DESTINATION) or
        spec.get('old_implementation_sha256')!=PROMPT_VIEW_IMPL or spec.get('implementation_sha256')!=RETENTION12_IMPL or
        spec.get('old_verification_sha256')!=sha(path) or path.is_symlink()):
        raise RuntimeError('exact reviewed retention12 witness authority required')
    witness=read(path)
    if (witness.get('schema')!='math-gkm.retention12-old-parent-verification.v1' or
        witness.get('genuine_old_study_verify_passed') is not True or witness.get('study')!=str(RETENTION12_PARENT) or
        witness.get('old_implementation_sha256')!=PROMPT_VIEW_IMPL or digest(witness.get('implementation'))!=PROMPT_VIEW_IMPL or
        witness.get('parent_round')!=52 or witness.get('accepted_count')!=71 or
        witness.get('parent_status')!='finite_budget_finished; root_open'):
        raise RuntimeError('genuine exact old-D7 parent52 verification required')
    expected={'seal.json','arms/baseline/state.json','arms/exploration/state.json','protocol.json',
        'CONTINUATION_PROVENANCE.json','MIGRATION_FINISHED.json','MIGRATION_INITIAL_STATE.json',
        'seed/seed-files.json','seed/contract.json'}
    hashes=witness.get('parent_hashes',{})
    if set(hashes)!=expected or hashes['arms/exploration/state.json']!=RETENTION12_PARENT_STATE:
        raise RuntimeError('retention12 immutable parent scope differs')
    for name,expected_hash in hashes.items():
        source=RETENTION12_PARENT/safe_relative(name)
        if source.is_symlink() or sha(source)!=expected_hash:raise RuntimeError('verified retention12 parent bytes changed')
    for name,row in witness.get('archive_files',{}).items():
        relative=safe_relative(name);archived=RETENTION12_PACKET/relative
        if len(relative.parts)!=1 or archived.is_symlink() or archived.stat().st_size!=row['bytes'] or sha(archived)!=row['sha256']:
            raise RuntimeError('retention12 permanent original archive differs')
        source=Path(row['source'])
        changed={ROOT/name for name in RETENTION12_CHANGES}|{Path(__file__),OPS/'FOLLOW.json'}
        declared={ROOT/name for name in PT_BEFORE}|{OPS/'follow.py'}
        if source in declared:
            pt_require(not source.is_symlink(),'declared current source cannot be a symlink')
            pt_declared_source_reference(source,row['sha256'],sha(source),config)
        elif source not in changed and (source.is_symlink() or sha(source)!=row['sha256']):
            raise RuntimeError('retention12 unchanged original metadata differs')
    if not witness.get('archive_files'):raise RuntimeError('retention12 permanent originals required')
    metadata=witness.get('operational_metadata_files')
    if (not isinstance(metadata,dict) or not 1<=len(metadata)<=10000 or
        digest(metadata)!=witness.get('native_closure',{}).get('metadata_files_binding')):
        raise RuntimeError('retention12 bounded closed-effect metadata binding required')
    for name,expected_hash in metadata.items():
        source=Path(name)
        if (not source.is_absolute() or not source.is_relative_to(ROOT/'.scratch') or
            source.name not in ('receipt.json','spec.json','process.json','watchdog.json','worker.json','result.json','FINISHED.json') or
            source.is_symlink() or not source.is_file() or source.resolve()!=source or sha(source)!=expected_hash):
            raise RuntimeError('retention12 closed receipt or validator metadata changed')
    state=api()['common'].load_state(RETENTION12_PARENT/'arms/exploration/state.json')
    if (state.get('round')!=52 or state.get('status')!='finite_budget_finished; root_open' or
        len(state['research']['knowledge'])!=71 or any(state.get(k) is not None for k in ('active','active_intent','resolution')) or
        digest(state['research']['knowledge'])!=witness.get('accepted_registry_binding')):
        raise RuntimeError('retention12 finalized accepted/accounting boundary changed')
    if ((RETENTION12_PARENT/'STOP.json').exists() or (OPS/'STOP.json').exists() or
        (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists()):raise RuntimeError('retention12 STOP or cleanup hold')
    return witness


# Separate fixed19 prompt-claim alias tip. Historical PT17 functions/records
# above retain their original semantics; no legacy config/grant is retargeted.
CA19_CORE='ef2a7656a54fade2d64256ea2ee527f25795f3e90bb1a0ca0c16045e69e10dbe'
CA19_PACKET=OPS/'claim-alias19-maintenance-20261023'
CA19_GUARD_SHA='e6e2fb11774a0d5914c2069fba4435f0e9208d5d58b35bd09837121a6a561996'
CA19_GUARD=None


def ca19_selected(implementation):
    return implementation==CA19_CORE


def ca19_guard():
    global CA19_GUARD
    authority=authorize_ongoing();grant=authority.get('claim_alias19_maintenance',{})
    path=CA19_PACKET/'revision_guard.py'
    pt_require(authority.get('implementation_sha256')==CA19_CORE
        and grant.get('schema')=='math-gkm.study19-claim-alias-maintenance.v1'
        and grant.get('authorized') is True
        and len(set(grant.get('independent_reviewers',[])))>=2
        and grant.get('module_path')==str(path)
        and grant.get('module_sha256')==CA19_GUARD_SHA
        and path.is_file() and not path.is_symlink() and path.resolve()==path
        and sha(path)==CA19_GUARD_SHA,'exact separately reviewed fixed19 guard required')
    if CA19_GUARD is None:
        from types import ModuleType
        module=ModuleType('claim_alias19_revision_guard');module.__file__=str(path)
        data=ca19_source_bytes(path)
        pt_require(hashlib.sha256(data).hexdigest()==CA19_GUARD_SHA,'actual compiled guard buffer differs')
        exec(compile(data,str(path),'exec'),module.__dict__)
        CA19_GUARD=module
    pt_require(Path(CA19_GUARD.__file__)==path and sha(path)==CA19_GUARD_SHA,
        'new19 guard origin/source changed')
    return CA19_GUARD



def ca19_source_bytes(path):
    """Fixed owned descriptor read; authenticate the bytes actually compiled."""
    import stat
    pt_require(path==CA19_PACKET/'revision_guard.py','fixed new19 guard path required')
    flags=os.O_RDONLY|os.O_DIRECTORY|os.O_NOFOLLOW|os.O_CLOEXEC
    directory=os.open('/',flags);descriptor=None
    try:
        for part in path.parent.parts[1:]:
            fresh=os.open(part,flags,dir_fd=directory);os.close(directory);directory=fresh
        descriptor=os.open(path.name,os.O_RDONLY|os.O_NOFOLLOW|os.O_CLOEXEC|os.O_NONBLOCK,dir_fd=directory)
        before=os.fstat(descriptor)
        pt_require(stat.S_ISREG(before.st_mode) and before.st_uid==os.getuid()
            and not before.st_mode&(stat.S_IWGRP|stat.S_IWOTH) and before.st_size<=1024**2,
            'owned bounded guard source required')
        chunks=[];total=0
        while True:
            block=os.read(descriptor,65536)
            if not block:break
            total+=len(block);pt_require(total<=1024**2,'guard source bound exceeded');chunks.append(block)
        after=os.fstat(descriptor)
        fingerprint=lambda r:(r.st_dev,r.st_ino,r.st_mode,r.st_uid,r.st_gid,r.st_size,r.st_mtime_ns,r.st_ctime_ns)
        pt_require(fingerprint(before)==fingerprint(after),'guard source changed during descriptor read')
        return b''.join(chunks)
    finally:
        if descriptor is not None:os.close(descriptor)
        os.close(directory)


# Separate retention-scan19 capacity profile. Historical CA19/PT17/ret54
# records, source, grants and consumed intents retain their literal identities.
CS19_CORE='996d37b699ebeff1f2966ab19268ded7c9b370f4c84362da76e99de23adce2ce'
CS19_PACKET=OPS/'retention-scan19-maintenance-20261024'
CS19_GUARD_SHA='35682dc8884b97d0750a47517d4486e00afd15b922cc6c8b8930ee2e78ebd0f2'
CS19_GUARD=None

def cs19_selected(implementation):return implementation==CS19_CORE

def cs19_guard():
    global CS19_GUARD
    authority=authorize_ongoing();grant=authority.get('retention_scan19_maintenance',{});path=CS19_PACKET/'retention_scan_guard.py'
    pt_require(authority.get('implementation_sha256')==CS19_CORE
        and grant.get('schema')=='math-gkm.retention-scan19-maintenance.v1'
        and grant.get('authorized') is True
        and type(grant.get('independent_reviewers')) is list
        and all(type(x) is str and x.strip() for x in grant['independent_reviewers'])
        and len(set(grant['independent_reviewers']))>=2
        and grant.get('module_path')==str(path) and grant.get('module_sha256')==CS19_GUARD_SHA,
        'exact separately reviewed capacity19 guard required')
    if CS19_GUARD is None:
        from types import ModuleType
        data=cs19_source_bytes(path);pt_require(hashlib.sha256(data).hexdigest()==CS19_GUARD_SHA,'actual capacity guard buffer differs')
        module=ModuleType('retention_scan19_revision_guard');module.__file__=str(path)
        exec(compile(data,str(path),'exec'),module.__dict__);CS19_GUARD=module
    pt_require(Path(CS19_GUARD.__file__)==path and sha(path)==CS19_GUARD_SHA,'capacity guard source changed')
    return CS19_GUARD

def cs19_source_bytes(path):
    """Fixed owned descriptor read; authenticate actual compiled guard bytes."""
    import stat
    pt_require(path==CS19_PACKET/'retention_scan_guard.py','fixed capacity19 guard path required')
    flags=os.O_RDONLY|os.O_DIRECTORY|os.O_NOFOLLOW|os.O_CLOEXEC
    directory=os.open('/',flags);descriptor=None
    try:
        for part in path.parent.parts[1:]:
            fresh=os.open(part,flags,dir_fd=directory);os.close(directory);directory=fresh
        descriptor=os.open(path.name,os.O_RDONLY|os.O_NOFOLLOW|os.O_CLOEXEC|os.O_NONBLOCK,dir_fd=directory)
        before=os.fstat(descriptor)
        pt_require(stat.S_ISREG(before.st_mode) and before.st_uid==os.getuid()
            and not before.st_mode&(stat.S_IWGRP|stat.S_IWOTH) and before.st_size<=1024**2,
            'owned bounded capacity guard required')
        chunks=[];total=0
        while True:
            block=os.read(descriptor,65536)
            if not block:break
            total+=len(block);pt_require(total<=1024**2,'capacity guard source bound exceeded');chunks.append(block)
        after=os.fstat(descriptor)
        fingerprint=lambda r:(r.st_dev,r.st_ino,r.st_mode,r.st_uid,r.st_gid,r.st_size,r.st_mtime_ns,r.st_ctime_ns)
        pt_require(fingerprint(before)==fingerprint(after)==fingerprint(os.stat(path.name,dir_fd=directory,follow_symlinks=False)),
            'capacity guard changed during descriptor read')
        return b''.join(chunks)
    finally:
        if descriptor is not None:os.close(descriptor)
        os.close(directory)

def retention_scan19_resume_deadline(study,state,*,owned_outer=None):
    pt_require(cs19_selected(authorize_ongoing().get('implementation_sha256')),'exact capacity19 source required')
    api()  # Genuine fresh coherent imports; no legacy globals/cache rebinding.
    return cs19_guard().resume_deadline(study,state,owned_outer=owned_outer)


if __name__=='__main__':
    try:main()
    except (RuntimeError,OSError,ValueError,KeyError,TypeError) as exc:
        print(canonical(dict(operational_error=type(exc).__name__,reason=str(exc),goal_achieved=False)),file=sys.stderr)
        raise SystemExit(2)
