"""Machine-authored pure Python subset worker. No host I/O capabilities.
Not an OS sandbox: full Python/GAP/Sage are supervisor execution requests.
"""
import ast
import builtins
from fractions import Fraction
import json
import resource
import operator
import sys

ALLOWED = {ast.Module, ast.Expr, ast.Assign, ast.AugAssign, ast.Name, ast.Load, ast.Store,
    ast.Constant, ast.List, ast.Tuple, ast.Dict, ast.Set, ast.Subscript, ast.Slice,
    ast.BinOp, ast.UnaryOp, ast.BoolOp, ast.Compare, ast.If, ast.IfExp, ast.For,
    ast.While, ast.Break, ast.Continue, ast.Pass, ast.FunctionDef, ast.arguments,
    ast.arg, ast.Return, ast.Call, ast.keyword, ast.ListComp, ast.SetComp, ast.DictComp,
    ast.GeneratorExp, ast.comprehension, ast.Add, ast.Sub, ast.Mult, ast.Div, ast.FloorDiv,
    ast.Mod, ast.Pow, ast.USub, ast.UAdd, ast.Not, ast.And, ast.Or, ast.Eq, ast.NotEq,
    ast.Lt, ast.LtE, ast.Gt, ast.GtE, ast.In, ast.NotIn, ast.Is, ast.IsNot}
SAFE_NAMES = ['abs','all','any','bool','dict','divmod','enumerate','filter','float',
              'int','len','list','map','max','min','pow','print','range','reversed',
              'round','set','sorted','str','sum','tuple','zip']


def validate(source):
    if len(source.encode()) > 32768:
        raise ValueError('program too large')
    tree = ast.parse(source)
    for node in ast.walk(tree):
        if type(node) not in ALLOWED:
            raise ValueError('unsupported pure-Python syntax: '+type(node).__name__)
        if isinstance(node, ast.Name) and node.id.startswith('_'):
            raise ValueError('private identifier')
        if isinstance(node, (ast.FunctionDef, ast.arg)):
            name = node.name if isinstance(node, ast.FunctionDef) else node.arg
            if name.startswith('_'):
                raise ValueError('private binding')
        if isinstance(node, ast.FunctionDef) and node.decorator_list:
            raise ValueError('decorators unsupported')
    return tree


def main():
    request = json.loads(sys.stdin.read())
    tree = validate(request['program'])
    resource.setrlimit(resource.RLIMIT_CPU, (5, 5))

    safe = {name: getattr(builtins, name) for name in SAFE_NAMES}
    safe['Fraction'] = Fraction
    def bounded_range(*args):
        r = range(*args)
        if len(r) > 10000:
            raise ValueError('range bound')
        return r
    ops = {'Add':operator.add, 'Sub':operator.sub, 'Mult':operator.mul,
           'Div':operator.truediv, 'FloorDiv':operator.floordiv, 'Mod':operator.mod,
           'Pow':operator.pow}
    def checked(x):
        if isinstance(x, int) and x.bit_length() > 16384:
            raise ValueError('integer bound')
        if isinstance(x, Fraction) and max(x.numerator.bit_length(), x.denominator.bit_length()) > 16384:
            raise ValueError('rational bound')
        if isinstance(x, (str, list, tuple, dict, set)) and len(x) > 100000:
            raise ValueError('collection bound')
        return x
    def binop(op,a,b):
        checked(a); checked(b)
        if op == 'Pow' and (not isinstance(b,int) or abs(b)>1024):
            raise ValueError('exponent bound')
        if op == 'Mult':
            for seq,n in [(a,b),(b,a)]:
                if isinstance(seq,(str,list,tuple)) and isinstance(n,int) and len(seq)*max(n,0)>100000:
                    raise ValueError('repetition bound')
        if op == 'Mod' and isinstance(a,str):
            raise ValueError('format allocation unsupported')
        return checked(ops[op](a,b))
    class BoundOperators(ast.NodeTransformer):
        def visit_BinOp(self,node):
            self.generic_visit(node)
            return ast.copy_location(ast.Call(func=ast.Name(id='__bounded_op',ctx=ast.Load()),
                args=[ast.Constant(type(node.op).__name__),node.left,node.right],keywords=[]),node)
        def visit_AugAssign(self,node):
            raise ValueError('augmented assignment unsupported by bounds')
    def bounded_fraction(a=0,b=1):
        if not isinstance(a,(int,Fraction)) or not isinstance(b,(int,Fraction)):
            raise ValueError('Fraction accepts bounded numeric arguments only')
        checked(a); checked(b)
        return checked(Fraction(a,b))
    safe['Fraction']=bounded_fraction
    safe['range']=bounded_range
    safe['pow']=lambda a,b: binop('Pow',a,b)
    steps=0
    def trace(frame,event,arg):
        nonlocal steps
        if frame.f_code.co_filename == '<pure-experiment>' and event in ('line','call'):
            steps+=1
            if steps>100000:
                raise ValueError('evaluation step budget')
        return trace
    tree=ast.fix_missing_locations(BoundOperators().visit(tree))
    scope = {'__builtins__': safe, 'data': request.get('data'), '__bounded_op':binop}
    sys.settrace(trace)
    try:
        exec(compile(tree, '<pure-experiment>', 'exec'), scope, scope)
    finally:
        sys.settrace(None)

if __name__ == '__main__':
    main()
