"""Pinned E1 lexical functions only; no campaign data or operational authority."""
import json,time
END=None

def need(ok, message='request-file23 source or operational binding refused'):
    if END is not None and time.monotonic() >= END:
        raise RuntimeError('existing bounded maintenance interval exhausted')
    if not ok:
        raise RuntimeError(message)

def _end(s, start):
    stack = []
    quoted = escaped = False
    i = start
    while i < len(s):
        c = s[i]
        if quoted:
            if escaped:
                escaped = False
            elif c == 92:
                escaped = True
            elif c == 34:
                quoted = False
                if not stack and s[start] == 34:
                    return i + 1
        elif c == 34:
            quoted = True
        elif c in (123, 91):
            stack.append(c)
        elif c in (125, 93):
            if not stack:
                return i
            need((stack.pop(), c) in ((123, 125), (91, 93)))
            if not stack:
                return i + 1
        elif c == 44 and (not stack):
            return i
        i += 1
    need(not stack and (not quoted))
    return i

def fields(s):
    need(s[:1] == b'{' and s[-1:] == b'}')
    result = {}
    i = 1
    while i < len(s) - 1:
        need(s[i] == 34)
        end = _end(s, i)
        key = json.loads(s[i:end])
        need(key not in result and s[end:end + 1] == b':')
        start = end + 1
        end = _end(s, start)
        result[key] = s[start:end]
        i = end
        if i < len(s) - 1:
            need(s[i] == 44)
            i += 1
    return result

def select(f, names):
    return {k: json.loads(f[k]) for k in names if k in f}
