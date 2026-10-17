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
            if op == 'reverse_agenda':
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
