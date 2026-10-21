"""Post-replay trusted premise inspection. Schema 2 exports lossless Expr DAGs.

No candidate reports or noncryptographic expression hashes authorize acceptance.
Full sources remain in finished exact validator bundles.
"""
import json
import os
import stat
import hashlib
import re
from .study_common import Invalid, digest

SCHEMA = 'math-gkm.inspection-dag.v3'
IDENTITY_SCHEMA = 'math-gkm.expr-merkle-sha256.v2'
ARTIFACT_BYTES = 32*1024**2
LINE_BYTES = 1024**2
NODE_LIMIT = 1000000
DECL_LIMIT = WORK_LIMIT = 200000
EDGE_LIMIT = 2000000


class InspectionFailure(Invalid):
    """Controller-owned code and measurements, never arbitrary diagnostics."""
    def __init__(self, category, **measured):
        self.category, self.measured = category, measured
        super().__init__('trusted inspection: '+category)


def inspector(module, declarations, required=(), catalog_modules=(), artifact=None, nonce=None):
    from .completion import NAME
    from .inspection_stream import program
    if (not declarations or len(declarations)>16 or len(set(declarations))!=len(declarations)
            or not all(NAME.fullmatch(n) for n in (module,*declarations,*required,*catalog_modules))):
        raise Invalid('invalid inspector declaration')
    if artifact not in (None,'declarations.json'):
        raise Invalid('invalid inspector artifact name')
    if not isinstance(nonce,str) or not re.fullmatch(r"[0-9a-f]{64}",nonce):
        raise Invalid("fresh inspector nonce required")
    return program(module,declarations,required,catalog_modules,nonce)


def _unique_object(pairs):
    out={}
    for key,value in pairs:
        if key in out: raise Invalid('duplicate inspector field')
        out[key]=value
    return out


def _nat(value,bound):
    if type(value) is not int or not 0<=value<=bound:
        raise Invalid('invalid inspector count/reference')
    return value


def _strings(value):
    if not isinstance(value,list) or any(not isinstance(v,str) or len(v.encode())>4096 for v in value):
        raise Invalid('invalid inspector names')
    if len(value)!=len(set(value)): raise Invalid('duplicate inspector name')
    return value


def _leaf(v,tag):
    """Validate every non-Expr field, including metadata source syntax."""
    if not isinstance(v,list) or not v or not isinstance(v[0],str):
        raise Invalid('invalid structural field')
    k,*a=v
    signatures={
        'name': {'anonymous':(), 'str':('name','str'), 'num':('name','nat')},
        'level': {'zero':(), 'succ':('level',), 'max':('level','level'),
                  'imax':('level','level'), 'param':('name',), 'mvar':('name',)},
        'info': {'none':(), 'original':('sub','nat','sub','nat'), 'synthetic':('nat','nat','bool')},
        'pre': {'namespace':('name',), 'decl':('name','strings')},
        'syntax': {'missing':(), 'node':('info','name','syntax_list'),
                   'atom':('info','str'), 'ident':('info','sub','name','pre_list')},
        'data': {'string':('str',), 'bool':('bool',), 'name':('name',),
                 'nat':('nat',), 'int':('int',), 'syntax':('syntax',)}}
    sig=signatures[tag].get(k)
    if sig is None or len(a)!=len(sig): raise Invalid('unknown structural tag/arity')
    for x,kind in zip(a,sig): _field(x,kind)


def _field(x,kind):
    if kind=='str':
        if not isinstance(x,str): raise Invalid('invalid structural string')
    elif kind in ('nat','int'):
        if type(x) is not int or (kind=='nat' and x<0): raise Invalid('invalid structural integer')
    elif kind=='bool':
        if type(x) is not bool: raise Invalid('invalid structural boolean')
    elif kind=='sub':
        if not isinstance(x,list) or len(x)!=3: raise Invalid('invalid substring')
        for v,k in zip(x,('str','nat','nat')): _field(v,k)
    elif kind in ('strings','syntax_list','pre_list','name_list','level_list'):
        if not isinstance(x,list): raise Invalid('invalid structural list')
        for v in x: _field(v,{'strings':'str'}.get(kind,kind[:-5]))
    else: _leaf(x,kind)


def _node(tag,fields,refs,hashes):
    specs={'bvar':(('nat',),0), 'fvar':(('name',),0), 'mvar':(('name',),0),
        'sort':(('level',),0), 'const':(('name','level_list'),0), 'app':((),2),
        'lam':(('name','binder'),2), 'forallE':(('name','binder'),2),
        'letE':(('name','bool'),3), 'nat':(('nat',),0), 'string':(('str',),0),
        'proj':(('name','nat'),1), 'mdata':(None,1)}
    if tag not in specs: raise Invalid('unknown Expr constructor')
    sig,count=specs[tag]
    if not isinstance(fields,list) or not isinstance(refs,list) or len(refs)!=count:
        raise Invalid('malformed Expr')
    if sig is None:
        for pair in fields:
            if not isinstance(pair,list) or len(pair)!=2: raise Invalid('malformed metadata')
            _field(pair[0],'name'); _field(pair[1],'data')
    else:
        if len(fields)!=len(sig): raise Invalid('malformed Expr fields')
        for x,k in zip(fields,sig):
            if k=='binder':
                if x not in ('default','implicit','strictImplicit','instImplicit'): raise Invalid('unknown binder')
            else: _field(x,k)
    children=[hashes[_nat(i,len(hashes)-1)] for i in refs]
    return digest([IDENTITY_SCHEMA,'expr',tag,fields,children])


def _stream(source,declarations):
    hashes,table,rows,catalog=[],{},[],None
    total=0; phase='header'; ended=False; artifact_hash=hashlib.sha256()
    for raw in iter(lambda:source.readline(LINE_BYTES+1),b''):
        total+=len(raw)
        artifact_hash.update(raw)
        if len(raw)>LINE_BYTES:
            raise InspectionFailure("record_size_limit",observed_bytes=len(raw),limit_bytes=LINE_BYTES)
        if total>ARTIFACT_BYTES:
            raise InspectionFailure('artifact_size_limit',observed_bytes=total,limit_bytes=ARTIFACT_BYTES)
        if not raw.endswith(b'\n') or ended: raise Invalid('truncated/trailing inspector artifact')
        row=json.loads(raw,object_pairs_hook=_unique_object)
        if not isinstance(row,list) or not row: raise Invalid('invalid inspector record')
        tag,*a=row
        if phase=='header':
            if row!=['header',SCHEMA,list(declarations)]: raise Invalid('inspector schema/ordered roots mismatch')
            phase='table'; continue
        if tag=='expr' and phase in ('table','roots') and len(a)==4:
            i,t,f,refs=a
            if type(i) is not int or i!=len(hashes) or i>=NODE_LIMIT: raise Invalid('duplicate/out-of-order Expr')
            hashes.append(_node(t,f,refs,hashes))
        elif tag=='decl' and phase in ('table','roots') and len(a)==7:
            name,origin,kind,unsafe,levels,t,b=a
            _strings([name]); _strings([origin]); _field(levels,'name_list')
            if (name in table or len(table)>=DECL_LIMIT or type(unsafe) is not bool or
                    kind not in ('axiom','definition','theorem','opaque','quotient','inductive','constructor','recursor')):
                raise Invalid('duplicate/conflicting/invalid declaration')
            typ=hashes[_nat(t,len(hashes)-1)]
            body=None if b is None else hashes[_nat(b,len(hashes)-1)]
            version=digest([IDENTITY_SCHEMA,'declaration',kind,unsafe,levels,typ,body])
            table[name]=dict(name=name,origin=origin,identity_schema=IDENTITY_SCHEMA,
                semantic_sha256=version,body_present=b is not None)
        elif tag=='catalog' and phase=='table' and len(a)==1:
            catalog=_strings(a[0])
            if set(catalog)!=set(table): raise Invalid('incomplete/conflicting catalog coverage')
            phase='roots'
        elif tag=='root' and phase=='roots' and len(a)==6:
            name,axioms,constants,nodes,edges,duplicates=a
            if len(rows)>=len(declarations) or name!=declarations[len(rows)]: raise Invalid('inspected root mismatch')
            _strings(axioms); _strings(constants)
            if not set(axioms)<={'propext','Classical.choice','Quot.sound'}: raise Invalid('unpermitted inspected premises')
            if (name not in constants or any(n not in table for n in constants) or
                    not table[name]['body_present']): raise Invalid('missing declaration/body reference')
            _nat(nodes,WORK_LIMIT)
            for n in (edges,duplicates): _nat(n,EDGE_LIMIT)
            if nodes<1 or len(constants)>nodes or duplicates>edges or edges-duplicates!=nodes-1:
                raise Invalid('conflicting traversal counts')
            rows.append(dict(name=name,axioms=axioms,constants=[table[n] for n in constants],
                catalog=[table[n] for n in catalog] if not rows else [],identity_schema=IDENTITY_SCHEMA,
                inspection_schema=SCHEMA,traversal=dict(distinct_nodes=nodes,edges=edges,duplicate_edges=duplicates)))
        elif tag=='end' and phase=='roots' and len(a)==4:
            if a!=[len(hashes),len(table),len(rows),len(catalog)] or len(rows)!=len(declarations):
                raise Invalid('incomplete inspector counts')
            ended=True
        else: raise Invalid('malformed/out-of-order inspector record')
    if not ended: raise Invalid('unfinished inspector artifact')
    referenced=set(catalog)
    for row in rows: referenced.update(c['name'] for c in row['constants'])
    if referenced!=set(table): raise Invalid('unreferenced declaration record')
    for row in rows:
        row['artifact_sha256']=artifact_hash.hexdigest()
        row['artifact_bytes']=total
    return rows


def parse_artifact(record,declarations,path,*,nonce):
    if record['returncode'] or record['termination']: raise Invalid('trusted premise inspector failed')
    if not isinstance(nonce,str) or not re.fullmatch(r"[0-9a-f]{64}",nonce):
        raise Invalid("invalid expected completion nonce")
    markers=[line for line in record["stdout"].splitlines() if line.startswith("GKM_DECLARATIONS")]
    if len(markers)!=1:
        raise Invalid("missing or ambiguous producer completion")
    match=re.fullmatch(r"GKM_DECLARATIONS_COMPLETE_V3:([0-9a-f]{64}):([0-9]{1,8}):([0-9a-f]{64})",markers[0])
    if not match or match[1]!=nonce:
        raise Invalid("invalid or stale producer completion")
    completed=dict(schema="math-gkm.producer-completion.v3",nonce=nonce,
        artifact_bytes=int(match[2]),artifact_sha256=match[3])
    if path.name!='declarations.json' or path.is_symlink() or not path.is_file():
        raise Invalid('missing inspector artifact')
    try:
        fd=os.open(path,os.O_RDONLY|os.O_NOFOLLOW)
        with os.fdopen(fd,'rb') as source:
            before=os.fstat(source.fileno())
            if not stat.S_ISREG(before.st_mode): raise Invalid('nonregular inspector artifact')
            if before.st_size>ARTIFACT_BYTES:
                raise InspectionFailure('artifact_size_limit',observed_bytes=before.st_size,limit_bytes=ARTIFACT_BYTES)
            data=_stream(source,declarations)
            after=os.fstat(source.fileno()); named=path.stat(follow_symlinks=False)
            identity=lambda st:(st.st_dev,st.st_ino,st.st_size,st.st_mtime_ns,st.st_ctime_ns)
            if identity(before)!=identity(after) or identity(before)!=identity(named):
                raise Invalid('inspector artifact changed during parsing')
        if (data[0]["artifact_bytes"]!=completed["artifact_bytes"] or
                data[0]["artifact_sha256"]!=completed["artifact_sha256"]):
            raise Invalid("producer completion stream binding mismatch")
        for row in data: row["producer_completion"]=completed
        return data
    except InspectionFailure:
        raise
    except (OSError,ValueError,KeyError,TypeError,UnicodeError,RecursionError,IndexError) as exc:
        raise Invalid('malformed inspector artifact') from exc


def parse(record,declarations):
    raise Invalid('legacy inspector encoding requires a charged fresh v3 check')


def failure_artifact(path,declarations,record=None,*,nonce=None):
    """Read only a bounded regular, unchanged producer failure stream.

    This never returns an acceptance record; no stdout/exception prose is trusted.
    """
    from .own_feedback import TOKENS
    # A full artifact may leave no room for a terminal failure record. The
    # bounded trusted process control channel binds a failure to this attempt.
    if record is not None:
        if not record.get('returncode') or record.get('termination'): return None
        if not isinstance(nonce,str) or not re.fullmatch('[0-9a-f]{64}',nonce): return None
        markers=[v for v in record.get('stdout','').splitlines() if v.startswith('GKM_INSPECTION_FAILURE')]
        prefix='GKM_INSPECTION_FAILURE_V3:'+nonce+':'
        if len(markers)!=1 or not markers[0].startswith(prefix) or len(markers[0])>LINE_BYTES: return None
        try:
            value=json.loads(markers[0][len(prefix):])
            if not isinstance(value,list) or len(value)!=6 or value[0]!='failure' or value[1] not in TOKENS: return None
            if not all(type(n) is int and 0<=n<=NODE_LIMIT for n in value[2:4]): return None
            if value[1] in ('record_size_limit','artifact_size_limit'):
                if not all(type(n) is int and 0<n<2**63 for n in value[4:]) or value[4]<=value[5]: return None
                return dict(category=value[1],measured=dict(observed_bytes=value[4],limit_bytes=value[5]))
            if value[4:]!=[None,None]: return None
            return dict(category=value[1],measured={})
        except (ValueError,TypeError): return None
    if path.is_symlink(): return None
    try:
        with os.fdopen(os.open(path,os.O_RDONLY|os.O_NOFOLLOW),'rb') as source:
            before=os.fstat(source.fileno())
            if not stat.S_ISREG(before.st_mode) or before.st_size>ARTIFACT_BYTES: return None
            total=0; last=None; count=0
            for raw in iter(lambda:source.readline(LINE_BYTES+1),b''):
                total+=len(raw); count+=1
                if total>ARTIFACT_BYTES or len(raw)>LINE_BYTES or not raw.endswith(b'\n'): return None
                value=json.loads(raw,object_pairs_hook=_unique_object)
                if count==1 and value!=['header',SCHEMA,list(declarations)]: return None
                if last and last[0]=='failure': return None
                last=value
            after=os.fstat(source.fileno()); named=path.stat(follow_symlinks=False)
            identity=lambda st:(st.st_dev,st.st_ino,st.st_size,st.st_mtime_ns,st.st_ctime_ns)
            if identity(before)!=identity(after) or identity(before)!=identity(named): return None
            if (isinstance(last,list) and len(last)==6 and last[0]=='failure' and last[1] in TOKENS
                    and all(type(n) is int and 0<=n<=NODE_LIMIT for n in last[2:4])):
                if last[1] in ("record_size_limit","artifact_size_limit"):
                    if not all(type(n) is int and 0<n<2**63 for n in last[4:]): return None
                    if last[4]<=last[5]: return None
                    return dict(category=last[1],measured=dict(observed_bytes=last[4],limit_bytes=last[5]))
                if last[4:]!=[None,None]: return None
                return dict(category=last[1],measured={})
    except (OSError,ValueError,TypeError,KeyError,IndexError,RecursionError): pass
    return None


def used_versions(declarations,frozen_files):
    """Bind actual transitive closure to frozen sources and schema 2 identities."""
    result={}
    for c in declarations[0]['constants']:
        path=c['origin'].replace('.','/')+'.lean'
        if path in frozen_files:
            result[c['name']]={'module':c['origin'],'source_sha256':frozen_files[path],
                'identity_schema':c['identity_schema'],'semantic_sha256':c['semantic_sha256']}
    return result
