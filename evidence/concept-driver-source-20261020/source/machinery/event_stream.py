"""Bounded JSONL reader. Oversized provider lines are retained on disk, skipped
as usage metadata, and never allocated whole in memory."""
import json

def events(path, max_line=1048576):
    if not path.exists(): return
    with path.open('rb') as f:
        while True:
            raw=f.readline(max_line+1)
            if not raw: break
            if len(raw)>max_line:
                while raw and not raw.endswith(b'\n'): raw=f.readline(max_line+1)
                yield {'type':'usage_parse_failure','reason':'oversized line retained; usage unknown'}
                continue
            try:
                item=json.loads(raw)
                if isinstance(item,dict): yield item
            except (ValueError,UnicodeError):
                continue
