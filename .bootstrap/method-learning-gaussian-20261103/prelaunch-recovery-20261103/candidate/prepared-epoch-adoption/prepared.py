"""INACTIVE exact prepared-freeze adoption; no preflight or model replay.

The post-freeze suffix is copied from the source-pinned original epoch migrator.
Helpers and mathematical receipt checks remain that original implementation.
The actual new helper identity is recorded explicitly in provenance and marker.
"""
import copy
import hashlib
import importlib.util
import json
import os
import sys
from pathlib import Path
import time
from types import SimpleNamespace

ROOT=Path('/Users/sasha/math_gkm')
ORIGIN=ROOT/'.bootstrap/method-learning-gaussian-20261103/continuation/epoch.py'
ORIGIN_SHA='ccce0ae7147894b20b3b5afa6911a1fc334ef35bebab2bc286cd11911adf5e9d'
if hashlib.sha256(ORIGIN.read_bytes()).hexdigest()!=ORIGIN_SHA:raise RuntimeError('original migration source changed')
sys.path.insert(0,str(ROOT))
spec=importlib.util.spec_from_file_location('prepared_epoch_original_helpers',ORIGIN)
E=importlib.util.module_from_spec(spec);spec.loader.exec_module(E)
common=E.common;study=E.study;knowledge=E.knowledge;snapshot_routing=E.snapshot_routing
study_observer=E.study_observer;study_discoveries=E.study_discoveries
SCHEMA=E.SCHEMA
for _name in ('own_path','copy_history','copy_finished','copy_jobs','copy_pending_discoveries','required_snapshots','copy_snapshot','copy_method_state','namespace_applications'):
    globals()[_name]=getattr(E,_name)


def need(value,message):
    if not value:raise common.Invalid(message)


def reference(row):
    need(isinstance(row,dict) and set(row)=={'path','sha256'},'typed prepared artifact reference required')
    path=Path(row['path'])
    need(path.is_absolute() and path.resolve()==path and path.is_relative_to(ROOT) and common.sha(path)==row['sha256'],
         'prepared artifact reference changed or escaped')
    return path


def pristine_workspace(ar):
    need(not (ar/'workspace/history').exists(),'prepared workspace contains partial history')
    for directory,dirs,files in os.walk(ar/'workspace',followlinks=False):
        dirs[:]=[name for name in dirs if name not in ('.lake','.scratch','.git') and not (Path(directory)/name).is_symlink()]
        need(not any(name.endswith('.epoch-copy') for name in files),'prepared workspace contains interrupted copy')
    need(common.inventory(ar/'workspace')==common.verify_snapshot(ar/'snapshots/initial')['files'] and
         not any((ar/name).exists() for name in ('jobs','inherited','history','snapshots/epoch-start')),
         'prepared workspace has unqualified partial inheritance or role effects')


def finish_prepared(parent,destination,*,curation,profile,contract_path,handoff,expected_source_sha256,arm='exploration'):
    """Finish one exact pristine freeze. No call to study.freeze occurs here."""
    need(common.sha(__file__)==expected_source_sha256,'prepared helper source changed')
    parent,destination=Path(parent).resolve(),Path(destination).resolve()
    h=common.read(reference(handoff));need(h.get('schema')=='math-gkm.gaussian-prepared-epoch-handoff.v1' and
        h.get('study')==str(parent) and h.get('destination')==str(destination) and h.get('arm')==arm=='exploration',
        'prepared handoff belongs to another exact parent/destination')
    need(parent!=destination and parent.is_relative_to(ROOT) and destination.is_relative_to(ROOT),
         'prepared continuation scope differs')
    E.headroom(E.limits())
    with common.lock(parent/'controller.lock'):
        with common.lock(destination/'controller.lock'):
            protocol=study.verify(parent);study.verify(destination)
            old_arm=parent/'arms'/arm;old=common.load_state(old_arm/'state.json')
            E.validate_closed_parent(parent,arm,protocol,old)
            contract=common.read(contract_path)
            need(contract==common.read(parent/'seed/contract.json')==common.read(destination/'seed/contract.json'),
                 'prepared continuation exact contract differs')
            suite_path=Path(curation)/'suite.json';suite=common.read(suite_path)
            provenance=common.read(suite_path.parent/'provenance.json')
            configuration=common.read(profile) if isinstance(profile,(str,Path)) else copy.deepcopy(profile)
            start=old['round'];additional=configuration['rounds'];configuration['rounds']=start+additional
            expected_protocol={**study.DEFAULT,**configuration};study.validate_protocol(expected_protocol)
            need(common.read(destination/'protocol.json')==expected_protocol,'prepared funded protocol differs')
            prepared_seal=common.read(reference(h['prepared_seal']['archive']))
            need(reference(h['prepared_seal']['current'])==destination/'seal.json' and
                 h['prepared_seal']['current']['sha256']==h['prepared_seal']['archive']['sha256'] and
                 common.read(destination/'seal.json')==prepared_seal and prepared_seal.get('suite')==common.digest(suite) and
                 prepared_seal.get('curation')==provenance,'prepared seed/panel/curation seal changed')
            from machinery.study_deployment import reuse_deployment
            reuse_deployment(prepared_seal['deployment_preflight'])
            need(not (destination/'CONTINUATION_PROVENANCE.json').exists() and not (destination/'MIGRATION_FINISHED.json').exists(),
                 'prepared transfer has already crossed its inheritance boundary')
            for mode in ('baseline','exploration'):
                row=h['prepared_states'][mode]
                need(reference(row['current'])==destination/'arms'/mode/'state.json' and row['current']['sha256']==row['archive']['sha256'],
                     'prepared zero-call state pin differs')
                reference(row['archive']);state=common.load_state(destination/'arms'/mode/'state.json')
                need(state.get('round')==0 and state.get('calls')==0 and state.get('meta_calls')==0 and state.get('status')=='ready' and
                     state.get('active') is None and state.get('active_intent') is None and state.get('resolution') is None and
                     not state['research'].get('knowledge') and not state['research'].get('components'),
                     'prepared destination is not the pristine zero-call freeze')
                ar=destination/'arms'/mode
                pristine_workspace(ar)
            parent_state_hash=common.sha(old_arm/'state.json');parent_seal_hash=common.sha(parent/'seal.json')
            need(common.digest(suite)!=common.read(parent/'seal.json')['suite'],'prepared challenge panel is not fresh')
            copies=E.CopyBudget()
            resume={'schema':'math-gkm.prepared-epoch-resume.v1','handoff':handoff,
                'helper_source_sha256':expected_source_sha256,'original_migration_source_sha256':ORIGIN_SHA,
                'prepared_seal_sha256':h['prepared_seal']['archive']['sha256'],
                'prepared_state_sha256':{mode:row['archive']['sha256'] for mode,row in h['prepared_states'].items()},
                'deployment_receipt_sha256':h['deployment_receipt']['sha256'],
                'preflight_replayed':False,'curation_replayed':False,'model_calls':0}
            fresh_seal = common.read(destination/'seal.json')
            parent_seal = common.read(parent/'seal.json')
            if fresh_seal['seed'] != parent_seal['seed']:
                raise common.Invalid('continuation exact clean seed changed')
            fresh_arm, workspace = destination/'arms'/arm, destination/'arms'/arm/'workspace'
            old_ws = old_arm/'workspace'
            source_inventory = common.inventory(old_ws)
            for name, expected in source_inventory.items():
                copies.file(old_ws/name, workspace/name, expected, replace=True)
            copy_history(old_ws/'history', workspace/'history', copies)
            research = copy.deepcopy(old['research'])
            remaps = []
            for group in ('knowledge', 'components'):
                for identifier, record in research.get(group, {}).items():
                    source = own_path(record['validation_bundle']['directory'], old_arm)
                    target = fresh_arm/'inherited/validators'/identifier
                    migrated = copy_finished(source, target, record, copies)
                    knowledge.verify_record(migrated, workspace)
                    research[group][identifier] = migrated
                    remaps.append({'id': identifier, 'original': str(source), 'copy': str(target),
                                   'finished_sha256': record['validation_bundle']['finished_sha256']})
            inherited_jobs = copy_jobs(old_arm, fresh_arm, old, copies)
            dependencies = copy_pending_discoveries(old_arm, fresh_arm, old_ws, workspace, research, copies)
            bindings = {}
            for name in required_snapshots(old, protocol):
                if name == 'initial':
                    # Native freeze already creates the exact pristine seed. It must
                    # agree with original clean initial before any continued work.
                    bindings[name] = copy_snapshot(old_arm/'snapshots'/name, fresh_arm/'snapshots'/name, copies)
                else:
                    bindings[name] = copy_snapshot(old_arm/'snapshots'/name, fresh_arm/'snapshots'/name, copies)
            method_queue, method_archives, method_remaps = copy_method_state(old_arm, fresh_arm, old, copies, bindings)
            application_remaps = namespace_applications(fresh_arm, suite, parent_state_hash)
            fresh = common.load_state(fresh_arm/'state.json')
            continued = copy.deepcopy(fresh)
            continued.update(research=research, round=start, phase='research',
                status='ready', reviewed_rounds=list(old['reviewed_rounds']),
                receipts=[item['path'] for item in inherited_jobs],
                receipt_hashes={item['path']: item['receipt_hash'] for item in inherited_jobs},
                counted_jobs=[item['key'] for item in inherited_jobs])
            if method_queue is not None:
                continued['method_learning'] = method_queue
            old_accounting = {key: value for key, value in old.items() if key != 'research'}
            provenance = {'schema': SCHEMA, 'parent_study': str(parent), 'arm': arm,
                'parent_state_sha256': parent_state_hash, 'parent_seal_sha256': parent_seal_hash,
                'parent_research_sha256': common.digest(old['research']),
                'new_research_sha256': common.digest(research),
                'start_round': start, 'end_round': start+additional,
                'old_accounting': old_accounting, 'inherited_main_jobs': inherited_jobs,
                'accounting_scope': 'New allowance only; old costs retained at parent and here. Inherited receipt elapsed must not be counted as new work.',
                'validator_remaps': remaps, 'original_pending_dependencies': dependencies,
                'historical_snapshots': bindings, 'method_archives_retained': method_archives,
                'method_descriptor_path_remaps': method_remaps,
                'application_id_remaps': application_remaps,
                'method_panel_chronology': 'Previously untested carried methods first use a fresh panel selected after acquisition by an independent curator not shown the acquired method; not a predevelopment panel claim.',
                'original_comparison': 'Immutable at original parent; successor is noncomparative own-history goal work.',
                'original_clean_initial_preserved': True,
                'routing_scope': 'Prospective capture may require fresh native rebuilding; actual routing qualification is recorded in MIGRATION_FINISHED.',
                'created': time.time()}
            provenance['prepared_resume'] = resume
            common.write(destination/'CONTINUATION_PROVENANCE.json', provenance)
            seal = fresh_seal
            seal['continuation_provenance_sha256'] = common.sha(destination/'CONTINUATION_PROVENANCE.json')
            seal['baseline_adjustments'] = ['dormant pristine baseline placeholder; exploration own-history continuation',
                                          'new finite allowance, original costs retained',
                                          'fresh private panel; no inherited comparison is relabeled fresh']
            plan = common.read(destination/'audit/plan.json')
            plan['checkpoints'] = ['initial', 'epoch-start']+[f'round-{r:04d}' for r in range(start, start+additional)]+['terminal']
            plan['initial_scope'] = 'Original clean initial preserved for historical predecessor lookup.'
            plan['epoch_start_scope'] = 'Actual inherited mathematical state and notes, prospectively sealed.'
            plan['continuation_provenance_sha256'] = seal['continuation_provenance_sha256']
            common.write(destination/'audit/plan.json', plan)
            seal['observer_plan'] = plan; seal['audit_plan_sha256'] = common.sha(destination/'audit/plan.json')
            common.write(destination/'seal.json', seal)
            seal_hash = common.digest(seal)
            for mode in ('baseline', 'exploration'):
                path = destination/'arms'/mode/'state.json'
                value = continued if mode == arm else common.load_state(path)
                value['seal_hash'] = seal_hash
                common.save_state(path, value)
            # Capture actual continued inputs in a NEW snapshot; never replace clean T.
            routing = None
            if snapshot_routing.ENABLED:
                routing = snapshot_routing.freeze_snapshot(destination, fresh_arm, workspace,
                    fresh_arm/'snapshots/epoch-start', research,
                    study.Arm(destination, arm, -1).admitted(research))
            else:
                common.snapshot(workspace, fresh_arm/'snapshots/epoch-start', research['policy'],
                                study.Arm(destination, arm, -1).admitted(research))
            study_observer.checkpoint(destination, arm, 'epoch-start', continued,
                                     fresh_arm/'snapshots/epoch-start')
            for key in research.get('pending_discoveries', {}):
                study_discoveries.verify(SimpleNamespace(root=fresh_arm, mode=arm), research, workspace, key)
            study.verify(destination)
            if common.sha(old_arm/'state.json') != parent_state_hash or common.inventory(old_ws) != source_inventory:
                raise common.Invalid('continuation parent changed during migration')
            marker = {'schema': SCHEMA, 'parent_state_sha256': parent_state_hash,
                      'state_sha256': common.sha(fresh_arm/'state.json'),
                      'seal_sha256': common.sha(destination/'seal.json'),
                      'provenance_sha256': common.sha(destination/'CONTINUATION_PROVENANCE.json'),
                      'epoch_start_binding': common.verify_snapshot(fresh_arm/'snapshots/epoch-start')['binding'],
                      'copied_files': copies.files, 'copied_bytes': copies.bytes,
                      'epoch_start_routing_reusable': bool(routing and routing.get('reusable')),
                      'source_sha256': common.sha(__file__), 'finished_at': time.time(),
                      'migration_origin_source_sha256': ORIGIN_SHA,
                      'prepared_handoff': handoff, 'prepared_resume_binding': common.digest(resume)}
            common.write(destination/'MIGRATION_FINISHED.json', marker)
            return {'study': str(destination), 'start_round': start, 'end_round': start+additional,
                    'provenance_path': str(destination/'CONTINUATION_PROVENANCE.json'),
                    'parent_state_sha256': parent_state_hash, 'epoch_start_binding': marker['epoch_start_binding'],
                    'knowledge_count': len(research.get('knowledge', {})),
                    'component_count': len(research.get('components', {})),
                    'pending_method_count': len((method_queue or {}).get('pending', [])),
                    'epoch_start_routing_reusable': marker['epoch_start_routing_reusable'],
                    'copied_files': copies.files, 'copied_bytes': copies.bytes}
