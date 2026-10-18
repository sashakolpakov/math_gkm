"""Named exact proposition DAG. Edges are only installed after Lean admission.
Graph closure is a planning aid; only a separately checked composition is math.
"""
from .study_common import Invalid,digest

def graph(state,contract):
    root=dict(constant=contract['root_declaration'],module=contract['root_file'][:-5].replace('/','.'),
              context=contract['root_sha256'],status='open')
    dag=state.setdefault('proposition_dag',dict(root='root',nodes={'root':root},edges={}))
    if dag['nodes']['root']['constant']!=root['constant'] or dag['nodes']['root']['context']!=root['context']:
        raise Invalid('immutable root/context changed')
    return dag

def prepare(dag,item):
    target=item.get('target_id','root')
    if target not in dag['nodes']: raise Invalid('unknown exact reduction target')
    residuals=item.get('residuals',[])
    known=item.get('premises',[])
    if not isinstance(residuals,list) or any(not isinstance(r,dict) or set(r)!={'id','statement'} or
            not isinstance(r['id'],str) or not r['id'] or not isinstance(r['statement'],str) or
            not r['statement'].strip() for r in residuals):
        raise Invalid('new residuals accept exactly id and statement; controller fields forbidden')
    if not isinstance(known,list) or any(not isinstance(k,str) for k in known):
        raise Invalid('premises must be existing node ids')
    if len(set(known))!=len(known) or any(k not in dag['nodes'] for k in known):
        raise Invalid('unknown or duplicate premise')
    if any(r['id'] in dag['nodes'] for r in residuals):
        raise Invalid('named propositions are immutable; reference existing premises explicitly')
    ids=known+[r['id'] for r in residuals]
    if not ids or len(set(ids))!=len(ids): raise Invalid('distinct nonempty premises required')
    adjacency={k:[p for e in v for p in e['premises']] for k,v in dag['edges'].items()}
    adjacency.setdefault(target,[]).extend(ids)
    def visit(k,path):
        if k in path: raise Invalid('residual cycle')
        for p in adjacency.get(k,[]): visit(p,path|{k})
    visit(target,set())
    return target,ids,[{'id':k,'statement':dag['nodes'][k]['constant'],
        'existing_constant':dag['nodes'][k]['constant']} for k in known]+[{'id':r['id'],'statement':r['statement']} for r in residuals]

def conjunction(xs):
    return xs[0] if len(xs)==1 else '⟨'+', '.join(xs)+'⟩'

def projection(term,index,count):
    return '('+term+')'+'.2'*index+('.1' if index<count-1 else '')

def composition(dag,state,target='root'):
    visits=0
    def plan(k,path):
        nonlocal visits
        visits+=1
        if visits>4096: raise Invalid('composition planning bound; no mathematical conclusion')
        if k in path: raise Invalid('residual cycle')
        node=dag['nodes'][k]
        if node.get('proof'):
            return node['proof'],[],[node['proof_id']],[node['proof_module']],[]
        edges=dag['edges'].get(k,[])
        if edges:
            choices=[]
            for edge in reversed(edges):
                children=[plan(p,path|{k}) for p in edge['premises']]
                leaves=list(dict.fromkeys(p for c in children for p in c[1]))
                used=[edge['id']]+[p for c in children for p in c[2]]
                imports=[edge['module']]+[p for c in children for p in c[3]]
                routes=[dict(target=k,edge=edge['id'],premises=edge['premises'])]+[p for c in children for p in c[4]]
                choices.append(('('+edge['proof']+' '+conjunction([c[0] for c in children])+')',leaves,used,imports,routes))
            # Prefer a closed alternate route. Open-leaf count is a syntactic
            # planning tie-break, never a scalar research reward/difficulty claim.
            return min(choices,key=lambda c:(len(c[1]),len(c[2])))
        return '@@'+k+'@@',[k],[],[],[]
    if target not in dag['nodes']: raise Invalid('unknown composition target')
    term,leaves,used,imports,routes=plan(target,set())
    if not used: raise Invalid('unconnected proposition has no checked composition path')
    for n,k in enumerate(leaves):
        term=term.replace('@@'+k+'@@',projection('h',n,len(leaves)))
        imports.append(dag['nodes'][k]['module'])
    goal=dag['nodes'][target]['constant']; imports.append(dag['nodes'][target]['module'])
    if leaves:
        goal='('+' ∧ '.join(dag['nodes'][k]['constant'] for k in leaves)+') → '+goal
        term='fun h => '+term
    return dict(statement=goal,term=term,open_leaves=leaves,
                dependencies=sorted(set(used)),modules=sorted(set(imports)),target=target,selected_routes=routes)
