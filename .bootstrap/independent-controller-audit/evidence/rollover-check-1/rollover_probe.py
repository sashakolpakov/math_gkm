from pathlib import Path
import json,time
from machinery.controller import initialize,Controller,Locks,read,ROOT
start=time.monotonic()
d=initialize("independent-34-worker-fixture", contract_path=ROOT/"contracts/markov-goal.json",mode="bounded",workers=34,seconds=5,epoch_actions=32,transport="fixture")
locks=Locks(d)
try:
 Controller(d,locks.fds).run()
finally:
 locks.close()
s=read(d/"state.json"); e=read(d/"engine/state.json")
w32=read(d/"workers/000032/request.json"); w33=read(d/"workers/000033/request.json")
checks={"status_exhausted":s["status"]=="exhausted", "workers_34":s["workers_completed"]==34,"all_events_preserved":len(e["events"])==34,"epoch_one":e["epoch"]==1,"count_two":e["protocol"]["count"]==2,"archive_32":read(d/"engine/epoch-000000.json")["event_count"]==32,"distinct_ids":len(set(x["result"]["request_id"] for x in e["events"]))==34,"root_preserved":read(d/"contract.json")==read(ROOT/"contracts/markov-goal.json"),"cross_epoch_feedback":e["events"][31]["result"]["request_id"] in w32["feedback"][-1]["report"]["request_id"],"agenda_propagated":w33["agenda"]==e["events"][32]["result"]["report"]["agenda"],"no_mathematical_resolution":all(x["result"]["mathematical_resolution"] is False for x in e["events"])}
r={"checks":checks,"elapsed_seconds":time.monotonic()-start,"source_hashes":read(ROOT/"audit-source-hashes.json"),"fixture_only":True,"live_calls":0}
(ROOT/"audit-rollover-result.json").write_text(json.dumps(r,indent=2)+"\n")
print(json.dumps({"checks":checks,"elapsed_seconds":r["elapsed_seconds"]},indent=2))
assert all(checks.values())
