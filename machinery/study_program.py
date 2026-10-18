"""Versioned executable request programs, interpreted as data (never eval).

This is an intentionally bounded extension language, not arbitrary Python. Its
control flow changes the next request's memory/agenda/portfolio projection.
Installation is experimental and only follows the matched continuation gate.
"""
import copy
from .study_common import Invalid, digest

REFERENCE = {'schema': 'math-gkm.request-program.v1', 'code': []}


def validate(program):
    if not isinstance(program, dict) or set(program) != {'schema', 'code'} or program['schema'] != REFERENCE['schema']:
        raise Invalid('executable request program schema mismatch')
    count = 0
    def walk(code, depth=0):
        nonlocal count
        if not isinstance(code, list) or depth > 8:
            raise Invalid('request program is not bounded')
        for ins in code:
            count += 1
            if count > 64 or not isinstance(ins, dict):
                raise Invalid('request program instruction bound')
            op = ins.get('op')
            if op == 'select_obligation' and set(ins)=={'op','id'} and isinstance(ins['id'],str) and ins['id']:
                continue
            if op == 'reuse_library' and set(ins)=={'op','ids'} and isinstance(ins['ids'],list) and len(ins['ids'])<=64 and all(isinstance(x,str) for x in ins['ids']):
                continue
            if op == 'allocate' and set(ins)=={'op','exploration_percent'} and type(ins['exploration_percent']) is int and 0<=ins['exploration_percent']<=100:
                continue
            if op == 'budgets' and set(ins)=={'op','tool_seconds','validation_seconds'} and all(type(ins[k]) is int and 1<=ins[k]<=1800 for k in ('tool_seconds','validation_seconds')):
                continue
            if op == 'reassess' and set(ins)=={'op','after_rounds'} and type(ins['after_rounds']) is int and 1<=ins['after_rounds']<=64:
                continue
            if op in ('reverse_agenda', 'reverse_portfolio') and set(ins) == {'op'}:
                continue
            if op in ('rotate_agenda', 'keep_observations') and set(ins) == {'op', 'n'}:
                if type(ins['n']) is int and 0 <= ins['n'] <= 64:
                    continue
            if op == 'if_open_obligations' and set(ins) == {'op', 'then', 'else'}:
                walk(ins['then'], depth+1)
                walk(ins['else'], depth+1)
                continue
            raise Invalid('unknown or authority-changing instruction')
    walk(program['code'])
    return program


def execute(program, request):
    validate(program)
    out = copy.deepcopy(request)
    trace = []
    def run(code):
        for ins in code:
            op = ins['op']
            trace.append(op)
            if op == 'select_obligation':
                obligations=out.get('remaining_obligations',{})
                if ins['id']!='root' and ins['id'] not in obligations:
                    raise Invalid('strategy selected unknown exact obligation')
                if ins['id']!='root' and obligations[ins['id']]['status']!='open':
                    out['strategy_reassessment']={'reason':'selected obligation closed after checked proof',
                        'previous_focus':ins['id'],'action':'own proposer reassess within next ordinary allowance'}
                    out['research_focus']='root'
                    out['reassess_after_rounds']=1
                else:
                    out['research_focus']=ins['id']
            elif op == 'reuse_library':
                library={**out.get('knowledge',{}),**out.get('components',{})}
                if any(k not in library for k in ins['ids']): raise Invalid('strategy selected unaccepted library')
                out['reuse_interfaces']={k:library[k] for k in ins['ids']}
            elif op == 'allocate':
                # A repeatable allocation, without claiming random-trial evidence.
                out['work_mode']='exploration' if (out['round']*37)%100<ins['exploration_percent'] else 'exploitation'
            elif op == 'budgets':
                out['execution_budget']={
                    'tool_seconds':min(ins['tool_seconds'],out['limits']['call_seconds']),
                    'validation_seconds':min(ins['validation_seconds'],out['limits']['validation_seconds'])}
            elif op == 'reassess':
                out['reassess_after_rounds']=min(ins['after_rounds'],out['limits']['episode_rounds'],out.get('reassess_after_rounds',64))
            elif op == 'reverse_agenda':
                out['agenda'].reverse()
            elif op == 'reverse_portfolio':
                out['portfolio'].reverse()
            elif op == 'rotate_agenda' and out['agenda']:
                n = ins['n'] % len(out['agenda'])
                out['agenda'] = out['agenda'][n:] + out['agenda'][:n]
            elif op == 'keep_observations':
                out['observations'] = out['observations'][-ins['n']:] if ins['n'] else []
            elif op == 'if_open_obligations':
                opened = any(r.get('status') == 'open' for r in out.get('remaining_obligations', {}).values())
                run(ins['then'] if opened else ins['else'])
    run(program['code'])
    out['program_execution'] = {'program_hash': digest(program), 'input_hash': digest(request),
                                'executed': trace, 'status': 'experimental interpreter; refinement unproved'}
    return out


def proposal(value, round_index):
    validate(value)
    return {'program': copy.deepcopy(value), 'hash': digest(value), 'proposed_round': round_index,
            'mode': 'experimental_executable', 'migration': 'identity on knowledge/contract/history/budgets',
            'certified_switch': False}
