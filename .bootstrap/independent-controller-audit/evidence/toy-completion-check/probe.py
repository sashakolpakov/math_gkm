from pathlib import Path
import json
from machinery import completion
from machinery.trust import ROOT,sha
from machinery.engine import atomic
base={"root_file":"MathGKM/Markov.lean","root_sha256":sha(ROOT/"MathGKM/Markov.lean"),"correspondence_obligations":["toy_meaning"],"classification":"TOY FIXTURE ONLY; NOT MARKOV"}
results={}
for kind,target,decl in [("proof","MathGKM.Markov.ToyTruth","True.intro"),("refutation","MathGKM.Markov.ToyFalsehood","MathGKM.Markov.toy_refutation")]:
 contract={**base,"root_declaration":target}
 claim={"kind":kind,"module":"MathGKM.Markov","declaration":decl,"correspondence":"toy-correspondence.md"}
 bundle=completion.prepare(contract,claim)
 audit={"bundle_hash":bundle["bundle_hash"],"accepted":True,"reviewer":"independent isolated toy fixture","checks":{"toy_meaning":"Toy only: target unfolds to True for proof, False for refutation. No claim about Markov."}}
 results[kind]=completion.verify(contract,claim,ROOT/(kind+"-accepted"),audit=audit)
 results[kind+"_missing_audit"]=completion.verify(contract,claim,ROOT/(kind+"-missing-audit"))
 bad={**audit,"checks":{}}
 results[kind+"_missing_obligation"]=completion.verify(contract,claim,ROOT/(kind+"-missing-obligation"),audit=bad)
checks={"proof_accepts":results["proof"]["resolved"],"refutation_accepts":results["refutation"]["resolved"],"proof_missing_audit_rejected":not results["proof_missing_audit"]["resolved"] and results["proof_missing_audit"]["lean_exact_root_checked"],"refutation_missing_audit_rejected":not results["refutation_missing_audit"]["resolved"] and results["refutation_missing_audit"]["lean_exact_root_checked"],"missing_obligation_rejected":all("undischarged source obligation" in results[k+"_missing_obligation"]["rejection"] for k in ("proof","refutation"))}
atomic(ROOT/"audit-toy-result.json",{"classification":"ISOLATED TOY API FIXTURE; NOT PUBLISHED MARKOV", "checks":checks,"results":results,"source_hashes":{str(p.relative_to(ROOT)):sha(p) for p in (ROOT/"machinery").glob("*.py")}})
print(json.dumps(checks,indent=2))
assert all(checks.values())
