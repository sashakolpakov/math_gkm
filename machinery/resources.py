"""Shared host admission and ownership-scoped observation, never proof evidence.

One heavy lease covers validators, replay, inspectors and external proposers.
Limits can only be lowered by callers. Darwin charges native birth-bound
phys_footprint plus bounded observer RSS, with a separate absolute RSS cap.
Linux retains historical RSS caps. Missing observations fail closed.
"""
import contextlib
import fcntl
import json
import os
from pathlib import Path
import shutil
import signal
import subprocess
import selectors
import time
import errno
import stat
import math

GiB = 1024**3
ROOT = Path(__file__).resolve().parents[1]
LIMITS = dict(rss_sustained=4*GiB, rss_hard=5*GiB, sustained_seconds=3,
              footprint_sustained=4*GiB, footprint_hard=5*GiB, rss_absolute=8*GiB,
              admit_free=8*GiB, memory_admit_free=8*GiB, hard_free=5*GiB, growth=GiB,
              processes=24, poll_seconds=1, timeout=1800, output_bytes=GiB)
PROFILE_SHA256 = 'feada5a82c264d2ad98824a2ecd884b0b8242c7a6b6effb2b37c52228488abd4'
PROFILE_PATH = 'config/darwin-memory-profile-006.json'

def darwin_profile():
    return os.uname().sysname == 'Darwin'

def profile_identity():
    from .study_common import sha
    if sha(ROOT/PROFILE_PATH) != PROFILE_SHA256:
        raise ResourceFailure('monitor_unavailable: approved memory profile changed')
    return dict(path=PROFILE_PATH,sha256=PROFILE_SHA256,
                metric='charged_phys_footprint' if darwin_profile() else 'aggregate_rss')

class ResourceFailure(RuntimeError):
    pass

def cleanup_hold(reason, owned=None):
    """A supervisor must reconcile this durable hold before another launch."""
    from .study_common import write
    base=ROOT/'.scratch/resources'
    base.mkdir(parents=True,exist_ok=True)
    write(base/'UNRESOLVED_CLEANUP.json',dict(reason=str(reason),owned=owned or {},
        created=time.time(),status='unresolved; no automatic release'))

def limits(overrides=None):
    out = dict(LIMITS)
    if darwin_profile(): out['memory_admit_free'] = 7*GiB
    for k,v in (overrides or {}).items():
        if (k not in out or isinstance(v, bool) or not isinstance(v, (int,float))
                or (isinstance(v, float) and not math.isfinite(v)) or v <= 0):
            raise ResourceFailure('invalid resource limit')
        # Headroom floors may be raised, all other caps may only be reduced.
        if (k in ('admit_free','memory_admit_free','hard_free') and v < out[k]) or (k not in ('admit_free','memory_admit_free','hard_free') and v > out[k]):
            raise ResourceFailure('resource override increases immutable global bound')
        out[k] = v
    return out

_LAST_OBSERVER=None

def observation(argv):
    """Small, bounded OS observer, deliberately outside the guarded launcher."""
    global _LAST_OBSERVER
    p = None
    try:
        p = subprocess.Popen(argv, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        data=bytearray(); start=time.monotonic()
        with selectors.DefaultSelector() as selector:
            for stream in (p.stdout,p.stderr):
                os.set_blocking(stream.fileno(),False)
                selector.register(stream,selectors.EVENT_READ)
            while selector.get_map():
                if time.monotonic()-start>2: raise ResourceFailure('observer timeout')
                for key,_ in selector.select(.02):
                    block=os.read(key.fd,8192)
                    if not block: selector.unregister(key.fileobj); continue
                    if len(data)+len(block)>2**20: raise ResourceFailure('observer output bound')
                    data.extend(block)
            p.wait(timeout=max(.01,2-(time.monotonic()-start)))
        if p.returncode: raise ResourceFailure('observer nonzero exit')
        _LAST_OBSERVER=(p.pid,tuple(argv))
        return data.decode(errors='strict')
    except (OSError,ValueError,UnicodeError,subprocess.TimeoutExpired,ResourceFailure) as exc:
        raise ResourceFailure('monitor_unavailable: '+str(argv[0])+': '+str(exc)) from exc
    finally:
        if p:
            if p.poll() is None: p.kill()
            p.wait()
            p.stdout.close(); p.stderr.close()

# ABI and narrow observer observations: shipped repair-004-inputs Darwin probes
# and openly labelled supervisor-operational-watch-reference.py; no certification.
_DARWIN = None
def darwin_api():
    global _DARWIN
    if _DARWIN is None:
        import ctypes as c
        class BSDInfo(c.Structure):
            _fields_=[(n,c.c_uint32) for n in
                ('flags','status','xstatus','pid','ppid','uid','gid','ruid','rgid','svuid','svgid','rfu')]+[
                ('comm',c.c_char*16),('name',c.c_char*32)]+[
                (n,c.c_uint32) for n in ('nfiles','pgid','pjobc','e_tdev','e_tpgid')]+[
                ('nice',c.c_int32),('start_sec',c.c_uint64),('start_usec',c.c_uint64)]
        class ShortBSDInfo(c.Structure):
            _fields_=[(n,c.c_uint32) for n in ('pid','ppid','pgid','status')]+[
                ('comm',c.c_char*16)]+[(n,c.c_uint32) for n in
                ('flags','uid','gid','ruid','rgid','svuid','svgid','rfu')]
        lib=c.CDLL('/usr/lib/libproc.dylib',use_errno=True)
        lib.proc_pidinfo.argtypes=[c.c_int,c.c_int,c.c_uint64,c.c_void_p,c.c_int]
        lib.proc_pidinfo.restype=c.c_int
        lib.proc_pidpath.argtypes=[c.c_int,c.c_void_p,c.c_uint32]
        lib.proc_pidpath.restype=c.c_int
        _DARWIN=(c,lib,BSDInfo,ShortBSDInfo)
    return _DARWIN

def process_status(pid):
    """Birth/parent/group including unreaped zombies; never reaps a child."""
    try:
        if os.uname().sysname == 'Darwin':
            c,lib,BSDInfo,_=darwin_api()
            info=BSDInfo(); c.set_errno(0)
            size=lib.proc_pidinfo(int(pid),3,1,c.byref(info),c.sizeof(info))
            error=c.get_errno()
            if size==0 and error==errno.ESRCH: return None
            if size==0 and error==errno.EPERM:
                raise PermissionError(error,'full BSDINFO denied',str(pid))
            if size!=c.sizeof(info) or info.pid!=pid:
                raise ResourceFailure('monitor_unavailable: proc_pidinfo')
            return dict(identity=str(info.start_sec)+':'+str(info.start_usec),
                ppid=info.ppid,pgid=info.pgid,zombie=info.status==5)
        with open('/proc/'+str(pid)+'/stat') as f: raw=f.read(8192)
        fields=raw[raw.rindex(')')+2:].split()
        return dict(identity=fields[19],ppid=int(fields[1]),pgid=int(fields[2]),zombie=fields[0]=='Z')
    except FileNotFoundError: return None
    except PermissionError: raise
    except (OSError,ValueError,IndexError) as exc:
        raise ResourceFailure('monitor_unavailable: birth/parent identity') from exc

def current_process(pid):
    info=process_status(pid)
    if info is None or info['zombie']: return None
    return dict(identity=info['identity'],ppid=info['ppid'])

_RUSAGE = None
def darwin_rusage_api():
    """Public rusage_info_v4, 296 bytes; no private structure or offset guessing."""
    global _RUSAGE
    if _RUSAGE is None:
        c,lib,_,_=darwin_api()
        fields=('user_time system_time pkg_idle_wkups interrupt_wkups pageins wired_size '
            'resident_size phys_footprint proc_start_abstime proc_exit_abstime child_user_time '
            'child_system_time child_pkg_idle_wkups child_interrupt_wkups child_pageins '
            'child_elapsed_abstime diskio_bytesread diskio_byteswritten cpu_time_qos_default '
            'cpu_time_qos_maintenance cpu_time_qos_background cpu_time_qos_utility '
            'cpu_time_qos_legacy cpu_time_qos_user_initiated cpu_time_qos_user_interactive '
            'billed_system_time serviced_system_time logical_writes lifetime_max_phys_footprint '
            'instructions cycles billed_energy serviced_energy interval_max_phys_footprint runnable_time').split()
        class UsageV4(c.Structure):
            _fields_=[('ri_uuid',c.c_uint8*16)]+[('ri_'+n,c.c_uint64) for n in fields]
        if (c.sizeof(UsageV4)!=296 or c.alignment(UsageV4)!=8 or
            UsageV4.ri_phys_footprint.offset!=72 or UsageV4.ri_proc_start_abstime.offset!=80 or
            UsageV4.ri_lifetime_max_phys_footprint.offset!=240):
            raise ResourceFailure('monitor_unavailable: public rusage V4 ABI')
        lib.proc_pid_rusage.argtypes=[c.c_int,c.c_int,c.POINTER(UsageV4)]
        lib.proc_pid_rusage.restype=c.c_int
        _RUSAGE=(c,lib,UsageV4)
    return _RUSAGE

def native_footprint(pid,birth):
    before=current_process(pid)
    if not before or before['identity']!=birth:
        raise ResourceFailure('monitor_unavailable: footprint birth before query')
    try:
        c,lib,Usage=darwin_rusage_api()
        data=Usage(); c.set_errno(0)
        rc=lib.proc_pid_rusage(pid,4,c.byref(data)); error=c.get_errno()
        if rc!=0 or error!=0:
            raise ResourceFailure('monitor_unavailable: public rusage return '+str(rc)+' errno '+str(error))
        after=current_process(pid)
        if after!=before or not data.ri_proc_start_abstime:
            raise ResourceFailure('monitor_unavailable: footprint birth after query')
        return dict(pid=pid,birth=birth,phys_footprint_bytes=int(data.ri_phys_footprint),
            resident_bytes=int(data.ri_resident_size),start_abstime=int(data.ri_proc_start_abstime))
    except (OSError,AttributeError,TypeError) as exc:
        raise ResourceFailure('monitor_unavailable: native footprint') from exc

def privileged_observer(pid,parent,parent_identity):
    """Only a bounded kernel-identified root-setuid /bin/ps; no EPERM wildcard."""
    if os.uname().sysname!='Darwin':
        raise ResourceFailure('monitor_unavailable: unapproved privileged child')
    c,lib,_,Short=darwin_api()
    info=Short(); c.set_errno(0)
    size=lib.proc_pidinfo(pid,13,1,c.byref(info),c.sizeof(info))
    if size==0 and c.get_errno()==errno.ESRCH: return None
    if size!=c.sizeof(info): raise ResourceFailure('monitor_unavailable: public observer identity')
    if info.status==5: return None
    path=c.create_string_buffer(4096); c.set_errno(0)
    length=lib.proc_pidpath(pid,path,len(path))
    if length<=0:
        if c.get_errno()==errno.ESRCH: return None
        raise ResourceFailure('monitor_unavailable: observer executable')
    mode=os.stat('/bin/ps')
    if not (info.pid==pid and info.ppid==parent and info.uid==0 and info.ruid==os.getuid()
            and info.svuid==0 and path.value==b'/bin/ps'
            and mode.st_uid==0 and stat.S_ISREG(mode.st_mode) and mode.st_mode&stat.S_ISUID):
        raise ResourceFailure('monitor_unavailable: unapproved privileged child')
    before=current_process(parent)
    if not before or before['identity']!=parent_identity:
        raise ResourceFailure('monitor_unavailable: observer parent changed')
    # The PUBLIC API has no birth field. Reconfirm all public identity bytes and
    # executable across the parent check; never put this helper into birth-owned.
    again=Short()
    if lib.proc_pidinfo(pid,13,1,c.byref(again),c.sizeof(again))!=c.sizeof(again):
        if c.get_errno()==errno.ESRCH: return None
        raise ResourceFailure('monitor_unavailable: observer recheck')
    path2=c.create_string_buffer(4096)
    if lib.proc_pidpath(pid,path2,len(path2))<=0:
        if c.get_errno()==errno.ESRCH: return None
        raise ResourceFailure('monitor_unavailable: observer path recheck')
    if bytes(info)!=bytes(again) or path2.value!=b'/bin/ps':
        raise ResourceFailure('monitor_unavailable: observer identity changed')
    return dict(pid=pid,ppid=parent,executable='/bin/ps',euid=info.uid,ruid=info.ruid)

def headroom(cap):
    """Admission floors without acquiring a second nonreentrant heavy lease."""
    if (ROOT/'.scratch/resources/UNRESOLVED_CLEANUP.json').exists():
        raise ResourceFailure('unresolved_owned_cleanup_hold')
    if shutil.disk_usage(ROOT).free<cap['admit_free']: raise ResourceFailure('admission_disk_headroom')
    if available_memory()<cap['memory_admit_free']: raise ResourceFailure('admission_memory_headroom')

def child_exited(p):
    # Caller must keep SIGCHLD at SIG_DFL and must not poll()/wait() until cleanup.
    info=process_status(p.pid)
    if not info or info['ppid']!=os.getpid():
        raise ResourceFailure('monitor_unavailable: unreaped direct child disappeared')
    return info['zombie']

def cleanup_private_group(p):
    """Popen(start_new_session=True), SIGCHLD default, NEVER previously reaped.

    The unreaped direct-child PID reserves the original private PGID even after
    an immediate normal exit. Ordinary unseen orphans remain in this group.
    Detached hostile sessions still require OS containment.
    """
    if p.returncode is not None:
        raise ResourceFailure('unresolved cleanup: private group ownership already released')
    errors=[]
    try:
        os.killpg(p.pid,signal.SIGKILL)
    except ProcessLookupError: pass
    except PermissionError: pass  # independently check live group below
    deadline=time.monotonic()+1
    while True:
        live=[]
        # A separate complete group sample distinguishes zombie-only EPERM.
        text=observation(['/bin/ps','-axo','pid=,pgid=,stat='])
        observed_self=False
        for line in text.splitlines():
            fields=line.split()
            if len(fields)!=3: raise ResourceFailure('monitor_unavailable: group sample')
            pid,group=map(int,fields[:2])
            observed_self |= pid==os.getpid()
            if group==p.pid and not fields[2].startswith('Z'): live.append(pid)
        if not observed_self: raise ResourceFailure('monitor_unavailable: incomplete group sample')
        if not live: return
        if time.monotonic()>=deadline:
            raise ResourceFailure('unresolved cleanup: live private group '+str(live))
        time.sleep(.02)

def available_memory():
    if os.uname().sysname == 'Darwin':
        import re
        text = observation(['/usr/bin/vm_stat'])
        page = re.search(r'page size of (\d+) bytes',text)
        counts = dict(re.findall(r'^(Pages [^:]+):\s+(\d+)\.',text,re.M))
        if not page or not all(k in counts for k in ('Pages free','Pages inactive','Pages speculative')):
            raise ResourceFailure('monitor_unavailable: Darwin vm_stat format')
        return sum(int(counts[k]) for k in ('Pages free','Pages inactive','Pages speculative'))*int(page[1])
    try:
        with open('/proc/meminfo') as f:
            for line in f:
                if line.startswith('MemAvailable:'): return int(line.split()[1])*1024
    except OSError as exc:
        raise ResourceFailure('monitor_unavailable: available memory') from exc
    raise ResourceFailure('monitor_unavailable: available memory')

def process_table():
    table = {}
    for line in observation(['/bin/ps','-axo','pid=,ppid=,rss=,lstart=,comm=']).splitlines():
        fields = line.split(None,8)
        if len(fields) < 9: continue
        try: pid,ppid,rss = map(int,fields[:3])
        except ValueError as exc: raise ResourceFailure('monitor_unavailable: malformed ps row') from exc
        table[pid] = dict(ppid=ppid,rss=rss*1024,identity=' '.join(fields[3:8]),command=fields[8],
            own_observer=(_LAST_OBSERVER==(pid,('/bin/ps','-axo','pid=,ppid=,rss=,lstart=,comm=')) and ppid==os.getpid()))
    if not table: raise ResourceFailure('monitor_unavailable: process table')
    return table

def disk_bytes(root):
    total=count=0
    def failed(exc): raise ResourceFailure('monitor_unavailable: disk scan: '+str(exc))
    for directory,dirs,files in os.walk(root,followlinks=False,onerror=failed):
        dirs[:] = [d for d in dirs if d not in ('.git','__pycache__') and not
            (d=='packages' and Path(directory).name=='.lake') and not (Path(directory)/d).is_symlink()]
        for name in files:
            p=Path(directory)/name
            if p.is_symlink(): continue
            try: total += p.stat().st_size
            except FileNotFoundError: continue
            count+=1
            if count>100000: raise ResourceFailure('monitor_unavailable: disk scan bound')
    return total

@contextlib.contextmanager
def admission(kind='validator', overrides=None):
    cap=limits(overrides)
    base=ROOT/'.scratch/resources'
    base.mkdir(parents=True,exist_ok=True)
    with (base/'heavy.lock').open('a') as f:
        try: fcntl.flock(f,fcntl.LOCK_EX|fcntl.LOCK_NB)
        except BlockingIOError: raise ResourceFailure('shared_heavy_reservation_busy')
        if (base/'UNRESOLVED_CLEANUP.json').exists(): raise ResourceFailure('unresolved_owned_cleanup_hold')
        try:
            headroom(cap)
        except (OSError,ValueError) as exc: raise ResourceFailure('monitor_unavailable: admission: '+str(exc)) from exc
        # Reservation is not measured RSS, elapsed time, or provider usage.
        receipt=base/(str(os.getpid())+'-'+str(time.time_ns())+'.json')
        from .study_common import write
        start=time.monotonic()
        record=dict(kind=kind,pid=os.getpid(),allocated_caps=cap,profile=profile_identity(),status='reserved',time=time.time())
        write(receipt,record)
        try:
            yield cap
        except BaseException as exc:
            record.update(status='released_after_failure',failure=type(exc).__name__+': '+str(exc))
            raise
        else: record['status']='released'
        finally:
            record.update(released=time.time(),lease_elapsed_seconds=time.monotonic()-start,
                cleanup_hold=(base/'UNRESOLVED_CLEANUP.json').exists())
            write(receipt,record)
            fcntl.flock(f,fcntl.LOCK_UN)

class Guard:
    def __init__(self,pid,scope,cap=None):
        self.pid=0; self.scope=Path(scope); self.cap=limits(cap)
        self.owned={}; self.last=0; self.over_since=None
        self.samples=[]; self.peak_rss=0; self.bound=False; self.helper_started={}
        self.profile=profile_identity(); self.peak_footprint=0; self.termination_cause=None
        self.baseline=disk_bytes(self.scope)
        if pid: self.bind(pid)
    def bind(self,pid):
        if self.bound: raise ResourceFailure('root identity is immutable')
        self.bound=True; self.pid=pid
        info=current_process(pid)
        if info is None:
            status=process_status(pid)
            if status and status['ppid']==os.getpid(): info=status
        if info is not None: self.owned[pid]=info['identity']
        # A missing root is never adopted later, even if its PID reappears.
    def check(self,force=False):
        try: return self._check(force)
        except ResourceFailure as exc:
            self.termination_cause=str(exc)
            if 'monitor_unavailable' in str(exc): cleanup_hold(exc,self.owned)
            raise
        except (OSError,ValueError) as exc:
            cleanup_hold(exc,self.owned)
            raise ResourceFailure('monitor_unavailable: '+str(exc)) from exc
    def _check(self,force=False):
        now=time.monotonic()
        if not force and now-self.last<self.cap['poll_seconds']: return
        self.last=now
        try: table=process_table()
        except (OSError,ValueError) as exc: raise ResourceFailure('monitor_unavailable: process table') from exc
        owned=set()
        for p,identity in self.owned.items():
            now_info=current_process(p)
            if p in table and now_info and now_info['identity']==identity: owned.add(p)
        helpers={}
        self.helper_started={p:t for p,t in self.helper_started.items() if p in table}
        changed=True
        while changed:
            changed=False
            for p,v in table.items():
                if p in self.owned or v['ppid'] not in owned: continue
                try: child=current_process(p)
                except PermissionError:
                    parent=v['ppid']
                    helper=privileged_observer(p,parent,self.owned[parent])
                    if helper:
                        since=self.helper_started.setdefault(p,now)
                        helper.update(rss=v['rss'],observed_seconds=now-since)
                        if helper['rss']>64*1024**2 or now-since>3:
                            raise ResourceFailure('monitor_unavailable: privileged observer bound')
                        helpers[p]=helper
                    continue
                if not child or child['ppid']!=v['ppid']: continue
                parent=current_process(child['ppid'])
                if not parent or parent['identity']!=self.owned[child['ppid']]: continue
                # Confirm the child again after the parent; never replace a seen birth.
                if current_process(p)!=child: continue
                self.owned[p]=child['identity']; owned.add(p); changed=True
        if len(helpers)>4: raise ResourceFailure('monitor_unavailable: privileged observer concurrency')
        own_observers=[v for p,v in table.items() if v.get('own_observer') and p not in owned and p not in helpers]
        if any(v['rss']>64*1024**2 for v in own_observers):
            raise ResourceFailure('monitor_unavailable: system observer RSS bound')
        rss=sum(table[p]['rss'] for p in owned)+sum(h['rss'] for h in helpers.values())+sum(v['rss'] for v in own_observers)
        native=[native_footprint(p,self.owned[p]) for p in sorted(owned)] if darwin_profile() else []
        helper_charge=sum(h['rss'] for h in helpers.values())+sum(v['rss'] for v in own_observers)
        charged=sum(r['phys_footprint_bytes'] for r in native)+helper_charge if darwin_profile() else None
        process_count=len(owned)+len(helpers)+len(own_observers)
        available=available_memory(); free=shutil.disk_usage(self.scope).free
        growth=disk_bytes(self.scope)-self.baseline
        compilers=sum(Path(table[p]['command']).name in ('lean','leanchecker') for p in owned)
        sample=dict(rss_sum=rss,available_memory_estimate=available,free_disk=free,growth=growth,owned_processes=process_count,compilers=compilers,privileged_observers=list(helpers.values()))
        sample.update(charged_phys_footprint=charged,native_birth_owned=native,helper_rss_charge=helper_charge)
        self.samples=(self.samples+[sample])[-8:]
        self.peak_rss=max(self.peak_rss,rss)
        if charged is not None: self.peak_footprint=max(self.peak_footprint,charged)
        metric=charged if charged is not None else rss
        prefix='footprint' if charged is not None else 'rss'
        if metric>self.cap[prefix+'_sustained']:
            self.over_since=self.over_since or now
        else: self.over_since=None
        reason = ('rss_absolute' if charged is not None and rss>self.cap['rss_absolute'] else
                  prefix+'_hard' if metric>self.cap[prefix+'_hard'] else
                  prefix+'_sustained' if self.over_since is not None and now-self.over_since>=self.cap['sustained_seconds'] else
                  'disk_headroom' if free<self.cap['hard_free'] else
                  'memory_pressure_or_low_available' if available<self.cap['hard_free'] else
                  'disk_growth' if growth>self.cap['growth'] else
                  'process_limit' if process_count>self.cap['processes'] else
                  'compiler_concurrency' if compilers>1 else None)
        if reason: raise ResourceFailure(reason)
    def cleanup(self):
        # Recheck start identity: never signal a recycled or unrelated PID.
        errors=[]
        for pid,identity in reversed(list(self.owned.items())):
            try:
                info=current_process(pid)
                if pid!=os.getpid() and info and info['identity']==identity:
                    try: os.kill(pid,signal.SIGKILL)
                    except ProcessLookupError: pass
                    deadline=time.monotonic()+1
                    while time.monotonic()<deadline:
                        after=current_process(pid)
                        if not after or after['identity']!=identity: break
                        time.sleep(.01)
                    else: errors.append('owned identity still live after SIGKILL: '+str(pid))
            except (ResourceFailure,OSError,ValueError) as exc: errors.append(str(exc))
        if errors:
            cleanup_hold('; '.join(errors),self.owned)
            raise ResourceFailure('unresolved cleanup: '+'; '.join(errors))
    def receipt(self):
        return dict(limits=self.cap,last_samples=self.samples,peak_rss_observed=self.peak_rss,
            peak_charged_phys_footprint_observed=self.peak_footprint if darwin_profile() else None,
            profile=self.profile,termination_cause=self.termination_cause,
            owned_identities=self.owned,scope=str(self.scope),monitor='Darwin native birth-bound phys_footprint plus conservative bounded helper RSS; separate raw RSS; Linux RSS; available memory estimate; OS pressure level unavailable',ownership='birth-bound descendants plus narrowly verified bounded public /bin/ps observers; private unreaped-leader group cleanup; hostile detached escape requires OS sandbox')
