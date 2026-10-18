# Exact validation commands and results
All commands used the explicit Homebrew/elan PATH and Git environment recorded in VALIDATION.json. No model calls.

## focused-001
10 passing neutral configuration/mock/fixture tests; pretest-001

```sh
/opt/homebrew/bin/python3 -m unittest -v tests.test_sol_deployment
```

Exit 0; 11.57338975003222 seconds; cap 180 seconds; timeout=False.
Log: `evidence/neutral-validation/maintenance-sol-deployment-20261018/focused-001.log`; SHA256 `0ff82c65b6d92bfe03f9413d33664ae59b9afcd38fec0e243b43ebfb057054d1`.

## lean-controls-001
4 passing targeted tests; real unwrapped neutral Lean and argv/recovery; static dispositions bind unchanged affected code

```sh
/opt/homebrew/bin/python3 -m unittest -v tests.test_revision_static_checkpoint.RealLeanMechanisms.test_true_proof_and_missing_premise_are_different tests.test_revision_static_checkpoint.RealLeanMechanisms.test_hidden_premise_with_spoofed_empty_reports_rejected tests.test_study_v2.StudyFixtures.test_live_argv_constructed_only_and_read_grants_are_isolated tests.test_study_v2.StudyFixtures.test_finite_budget_failure_and_uncertain_recovery_without_replay
```

Exit 0; 50.347010708996095 seconds; cap 180 seconds; timeout=False.
Log: `evidence/neutral-validation/maintenance-sol-deployment-20261018/lean-controls-001.log`; SHA256 `d90a1d6e9b599be6097b641599b7efa6a373f1bd702d3eccb442aef717ba2ced`.

## connected-001
failed source-seal guard after builder edited controller while running; retained without repair

```sh
/opt/homebrew/bin/python3 -m unittest -v tests.test_revision_static_checkpoint.RealLeanMechanisms.test_connected_cycle_delayed_use_policy_install_and_next_actual_request
```

Exit 1; 130.87151829199865 seconds; cap 480 seconds; timeout=False.
Log: `evidence/neutral-validation/maintenance-sol-deployment-20261018/connected-001.log`; SHA256 `b340fbbf8720e0b12c16d4763321555eb82f3c7fae237c47ae25a1b07dc5484e`.

## focused-002
11 passing final neutral configuration/mock/fixture tests; pretest-002

```sh
/opt/homebrew/bin/python3 -m unittest -v tests.test_sol_deployment
```

Exit 0; 6.208578416961245 seconds; cap 180 seconds; timeout=False.
Log: `evidence/neutral-validation/maintenance-sol-deployment-20261018/focused-002.log`; SHA256 `cea3b9bfce6fd3fb044cdd59a450d5594332aa5dd6a7980903b39d0ba3013f26`.

## connected-002
corrective fresh connected neutral fixture run; pretest-002; real unwrapped Lean, no OS deployment attestation

```sh
/opt/homebrew/bin/python3 -m unittest -v tests.test_revision_static_checkpoint.RealLeanMechanisms.test_connected_cycle_delayed_use_policy_install_and_next_actual_request
```

Exit -9; 480.0064637080068 seconds; cap 480 seconds; timeout=True.
Log: `evidence/neutral-validation/maintenance-sol-deployment-20261018/connected-002.log`; SHA256 `25c7e277728ed9cb801dbca7c26a4040a7f38bcbc826211c36cb852883325498`.

## deployment-002
actual real-wrapper startup diagnostic; failed closed in nested environment; not mathematical validation

```sh
/opt/homebrew/bin/python3 -m machinery.study_deployment --out evidence/neutral-validation/maintenance-sol-deployment-20261018/deployment-attempt-002 --seconds 120
```

Exit 1; 0.1831782499793917 seconds; cap 130 seconds; timeout=False.
Log: `evidence/neutral-validation/maintenance-sol-deployment-20261018/deployment-002.log`; SHA256 `a430a27ae302fe0052c55a8feec0806d13f526de13647816838bccad75d7b972`.

Deployment remains unvalidated. Approved-host command, at a new path:

```sh
/opt/homebrew/bin/python3 -m machinery.study_deployment --out .scratch/deployment-host-001 --seconds 120
```

Use studies/v2-study-sol.json only for a separately authorized fresh study after reviewed deployed validation. Preserve the panel/root/opportunity budgets and all interrupted/infrastructure-failed outcomes.
