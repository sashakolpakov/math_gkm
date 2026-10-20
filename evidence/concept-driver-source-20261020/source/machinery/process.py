"""Codex/Astra: bounded process observations, never proof admission.
Process groups cover ordinary descendants; hostile setsid escape requires the
supervisor's OS containment. Output is capped jointly across stdout and stderr.
"""
import os
import selectors
import signal
import subprocess
import time
from .resources import admission, Guard, ResourceFailure, cleanup_hold, limits, headroom, child_exited, cleanup_private_group


def run(argv, *, cwd, env, timeout=30, output_bytes=65536, resource_limits=None,
        scope=None, tree_only=False, log_path=None):
    start = time.monotonic_ns()
    try:
        if tree_only:
            # Outer test observer owns no heavy lease. Leaf validators reserve it.
            headroom(limits(resource_limits))
            return _run(argv, cwd=cwd, env=env, timeout=timeout,
                        output_bytes=output_bytes, cap=limits(resource_limits), scope=scope,log_path=log_path)
        with admission('validator-or-tool', resource_limits) as cap:
            return _run(argv,cwd=cwd,env=env,timeout=timeout,output_bytes=output_bytes,
                        cap=cap,scope=scope,log_path=log_path)
    except (ResourceFailure,OSError,ValueError) as exc:
        return dict(argv=list(map(str,argv)), returncode=-1, stdout='', stderr=str(exc),
                    termination='resource_guard: '+str(exc), captured_bytes=0,
                    elapsed_ns=time.monotonic_ns()-start, operationally_incomplete=True)

def _run(argv, *, cwd, env, timeout, output_bytes, cap,scope=None,log_path=None):
    if not 0 < timeout <= cap['timeout'] or not 0 < output_bytes <= cap['output_bytes']:
        raise ValueError('invalid process limits')
    start = time.monotonic_ns()
    guard = Guard(0, scope or env.get('TMPDIR', cwd), cap)
    p=None; selector=None; log=None
    captured = {'stdout': bytearray(), 'stderr': bytearray()}
    total = 0
    reason = None
    def kill_child():
        # Popen retains the unreaped child handle. Never signal a numeric group
        # after exit, where PGID reuse could target unrelated processes.
        if p and p.returncode is None: p.kill()
    try:
        if log_path is not None: log=log_path.open('xb')
        if signal.getsignal(signal.SIGCHLD)!=signal.SIG_DFL:
            raise ResourceFailure('default SIGCHLD required for unreaped private group')
        p = subprocess.Popen(argv, cwd=cwd, env=env, stdout=subprocess.PIPE,
                             stderr=subprocess.PIPE, start_new_session=True)
        guard.bind(p.pid)  # First operation after Popen: no late root adoption.
        selector = selectors.DefaultSelector()
        for stream, name in [(p.stdout, 'stdout'), (p.stderr, 'stderr')]:
            os.set_blocking(stream.fileno(), False)
            selector.register(stream, selectors.EVENT_READ, name)
        while True:
            # Do not reap the leader before its private group is cleaned. A
            # normal immediate exit can leave an unseen orphan holding pipes.
            exited=child_exited(p)
            if exited:
                # Nonblocking finite drain only; orphan pipe EOF is not required.
                for stream,name in ((p.stdout,'stdout'),(p.stderr,'stderr')):
                    while True:
                        try: data=os.read(stream.fileno(),8192)
                        except BlockingIOError: break
                        if not data: break
                        available=output_bytes-total
                        captured[name].extend(data[:available])
                        if log: log.write(data[:available]); log.flush()
                        total+=min(len(data),available)
                        if len(data)>available: reason='output_limit'; break
                    if reason: break
                break
            try:
                guard.check()
            except ResourceFailure as exc:
                reason = 'resource_guard: '+str(exc)
                break
            if (time.monotonic_ns() - start) / 1e9 >= timeout:
                reason = 'timeout'
                break
            for key, _ in selector.select(0.02):
                data = os.read(key.fileobj.fileno(), 8192)
                if not data:
                    selector.unregister(key.fileobj)
                    continue
                available = output_bytes - total
                captured[key.data].extend(data[:available])
                if log:
                    log.write(data[:available]); log.flush()
                total += min(len(data), available)
                if len(data) > available:
                    reason = 'output_limit'
                    break
            if reason:
                break
    except (OSError,ValueError,ResourceFailure) as exc:
        reason='operationally_incomplete: '+type(exc).__name__+': '+str(exc)
        if p: cleanup_hold(reason,guard.owned)
    finally:
        # Always clean ordinary orphans, including on a successful parent exit,
        # while the direct child still reserves the private process-group ID.
        cleanup_errors=[]
        if p:
            try: cleanup_private_group(p)
            except (ResourceFailure,OSError,ValueError) as exc: cleanup_errors.append(str(exc))
        try: guard.cleanup()
        except (ResourceFailure,OSError,ValueError) as exc: cleanup_errors.append(str(exc))
        if cleanup_errors:
            reason=reason or 'unresolved_cleanup: '+'; '.join(cleanup_errors)
        try:
            kill_child()
            if p:
                p.wait(); p.stdout.close(); p.stderr.close()
        finally:
            if selector: selector.close()
            if log: log.close()
        if cleanup_errors: cleanup_hold('; '.join(cleanup_errors),guard.owned)
    return {'argv': list(map(str, argv)), 'returncode': p.returncode if p else -1,
            **{k: bytes(v).decode('utf-8', errors='replace') for k, v in captured.items()},
            'termination': reason, 'captured_bytes': total,
            'resources': guard.receipt(),
            'operationally_incomplete': bool(reason),
            'elapsed_ns': time.monotonic_ns() - start}
