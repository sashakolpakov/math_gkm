"""Codex/Astra: bounded process observations, never proof admission.
Process groups cover ordinary descendants; hostile setsid escape requires the
supervisor's OS containment. Output is capped jointly across stdout and stderr.
"""
import os
import selectors
import signal
import subprocess
import time


def run(argv, *, cwd, env, timeout=30, output_bytes=65536):
    if not 0 < timeout <= 180 or not 0 < output_bytes <= 1048576:
        raise ValueError('invalid process limits')
    start = time.monotonic_ns()
    p = subprocess.Popen(argv, cwd=cwd, env=env, stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE, start_new_session=True)
    selector = selectors.DefaultSelector()
    for stream, name in [(p.stdout, 'stdout'), (p.stderr, 'stderr')]:
        os.set_blocking(stream.fileno(), False)
        selector.register(stream, selectors.EVENT_READ, name)
    captured = {'stdout': bytearray(), 'stderr': bytearray()}
    total = 0
    reason = None
    def kill_group():
        try:
            os.killpg(p.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
    try:
        while selector.get_map():
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
                total += min(len(data), available)
                if len(data) > available:
                    reason = 'output_limit'
                    break
            if reason:
                break
        if reason:
            kill_group()
        remaining = max(0.01, timeout - (time.monotonic_ns() - start) / 1e9)
        try:
            p.wait(timeout=remaining)
        except subprocess.TimeoutExpired:
            reason = 'timeout'
            kill_group()
            p.wait()
    finally:
        kill_group()
        # Also reap on read/select exceptions, not only on the normal wait path.
        p.wait()
        selector.close()
        p.stdout.close()
        p.stderr.close()
    return {'argv': list(map(str, argv)), 'returncode': p.returncode,
            **{k: bytes(v).decode('utf-8', errors='replace') for k, v in captured.items()},
            'termination': reason, 'captured_bytes': total,
            'elapsed_ns': time.monotonic_ns() - start}
