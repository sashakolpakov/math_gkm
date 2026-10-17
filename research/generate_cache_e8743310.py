"""Machine-authored exact expression DAG; generated certificates require Lean checking."""
from pathlib import Path
from math import factorial, comb
import json,sys
from generate_template_6738b4ea import add2,mul2,lean

def generate(c):
    nodes=[]; index={}; arrays=[]; lines=[]
    def node(tag,*args):
        key=(tag,*args)
        if key in index:return index[key]
        i=len(nodes);index[key]=i;nodes.append(key)
        E=lambda j:f'e{c}_{j}ME87'
        D=lambda j:f'd{c}_{j}ME87'
        H=lambda j:f'h{c}_{j}ME87'
        if tag=='c':p=[[args[0]]];expr=f'.c ({args[0]})';proof='by rfl'
        elif tag=='x':p=[[],[1]];expr='.x';proof='by rfl'
        elif tag=='k':p=[[0,1]];expr='.k';proof='by rfl'
        else:
            a,b=args
            p=(add2 if tag=='add' else mul2)(arrays[a],arrays[b])
            expr=f'.{tag} {E(a)} {E(b)}'
            proof=f'cache_{tag}ME87 _ _ _ _ _ {H(a)} {H(b)} (by decide +kernel)'
        arrays.append(p)
        lines.extend([f'def {E(i)} : PolyExprM673 := {expr}',f'def {D(i)} : DenseZM673 := {lean(p)}',
                      f'theorem {H(i)} : exprDenseM673 {E(i)}={D(i)} := {proof}'])
        return i
    C=lambda n:node('c',n)
    add=lambda a,b:node('add',a,b)
    mul=lambda a,b:node('mul',a,b)
    def falling(e,n):
        a=C(1)
        for j in range(n):a=mul(a,add(e,C(-j)))
        return a
    def product(N,a,b,e,f):
        return mul(mul(C(factorial(N)//(factorial(a)*factorial(b))),falling(e,a)),falling(f,b))
    def top(K,j):
        ans=C(0);e=add(node('x'),C(2*j+8));f=add(node('k'),C(K));g=add(node('k'),C(K+1))
        for l in range(j+4):
            term=mul(C(comb(j+l,j)),add(product(2*j+5,j+3-l,j+l,e,f),mul(C(4),product(2*j+5,j+3-l,j+l+2,e,g))))
            ans=add(ans,term)
        return ans
    tops=[top(c+2,j) for j in range(c,c+3)]
    u=(c+4)*factorial(2*c+5)*factorial(2*c+9)
    v=-(c+5)*factorial(2*c+7)**2
    gap=add(mul(mul(C(u),tops[1]),tops[1]),mul(mul(C(v),tops[0]),tops[2]))
    assert all(v>=0 for row in arrays[gap] for v in row)
    header='import MarkovCacheME87\n/-! Machine-authored e8743310. Staged exact certificate; no finite parameter bound. -/\nnamespace MathGKM.Markov\nset_option maxHeartbeats 800000000\nset_option maxRecDepth 1000000\nset_option compiler.extract_closed false\n'
    bridge=[]
    for j,i in zip(range(c,c+3),tops):
        bridge.append(f'theorem literal{c}_{j}ME87 : topFastExprM673 {c+2} {j}=e{c}_{i}ME87 := by rfl')
        bridge.append(f'theorem top_cached{c}_{j}ME87 : exprDenseM673 (topIntExprM673 {c+2} {j})=d{c}_{i}ME87 :=\n (congrArg exprDenseM673 ((top_int_fastM673 {c+2} {j}).trans literal{c}_{j}ME87)).trans h{c}_{i}ME87')
    # Expression equality uses only the fast choose representation, then the DAG certificate.
    bridge.append(f'theorem gap_literal{c}ME87 : templateGapExprM673 {c}=e{c}_{gap}ME87 := by\n unfold templateGapExprM673\n rw [top_int_fastM673,top_int_fastM673,top_int_fastM673,literal{c}_{c}ME87,literal{c}_{c+1}ME87,literal{c}_{c+2}ME87]\n rfl')
    bridge.append(f'theorem template_certificate_{c}ME87 : denseNonnegM673 (exprDenseM673 (templateGapExprM673 {c})) := by\n have he := (congrArg exprDenseM673 gap_literal{c}ME87).trans h{c}_{gap}ME87\n rw [he]\n decide +kernel')
    bridge.append(f'theorem template_strong_{c}ME87 (d T : ℕ) (hT : {c+2} ≤ T) :\n ({c+5}:ℤ)*topMassM55C d T {c}*topMassM55C d T {c+2} ≤\n ({c+4}:ℤ)*topMassM55C d T {c+1}^2 :=\n template_integer_transferM673 {c} template_certificate_{c}ME87 d T hT')
    src=header+'\n'.join(lines+bridge)+'\nend MathGKM.Markov\n'
    p=Path(f'research/MarkovCachedC{c}ME87.lean');p.write_text(src)
    return dict(column=c,nodes=len(nodes),bytes=len(src.encode()),gap_entries=sum(map(len,arrays[gap])),path=str(p))

if __name__=='__main__':
    data=[generate(c) for c in map(int,sys.argv[1:])]
    Path('evidence/markov-e8743310/generated-cache-'+sys.argv[1]+'.json').write_text(json.dumps(data,indent=2))
    print(json.dumps(data))
