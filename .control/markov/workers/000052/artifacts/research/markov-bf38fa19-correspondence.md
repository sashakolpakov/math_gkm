# Scope and correspondence

Machine-authored request bf38fa192cd64d11804e5c1de553ef23. Completion is null.
This report is not an independent hash-bound completion audit.

* Coverage: exact source recursions quantify over arbitrary finite paths;
  the inherited rational-coverage theorem is not replaced by the b<=100 scan.
  The new formula explicitly separates every all-true Pell path from every
  path containing a first false letter. No path-length bound is imposed.
* Source family: sourceWord28, central28 and frame are used literally.
  The shorter run word is proved to be sourceWord28 rest. The auxiliary
  four-run ordering example is not asserted to be an actual source witness.
* Homogeneity and coefficients: the inherited shear uses s=i+j-a and the
  source_cut_coeffA27 bridge extracts ordinary integer numerator coefficients.
  No variable specialization, factorial scaling or binomial normalization is
  used in the new source formula. The omitted homogeneous exponent is still
  a+b-1-i-j. Previously audited source-family and homogeneity bridges remain
  inherited; no new external assertion enters the Lean axiom context.
* Polygon: the coefficient identity holds at all natural indices of its
  slice. Any later log-concavity claim must retain the original three polygon
  guards. No polygon theorem is replaced or silently deduced from the scan.
* Directions, zeros, endpoints: the new equality addresses i+j=a+2, not all
  slices or any of the complete three directions. Zeros are retained. The
  two-run correction y^(a+2) is explicit; the single-run Pell case is explicit.
  Both root endpoint clauses and the original three directions are unchanged.
* Assumptions: successful local builds and separate kernel replays are listed
  in validation.json. They reuse pinned inherited compiled imports; this is
  not a fresh whole-source rebuild. Only propext, Classical.choice and
  Quot.sound occur in accepted printed axiom closures. Failed elaborations
  and their automatic sorryAx outputs are rejected, preserved attempts.
* Proof scope: there is no closed proof of Conjecture63 or its negation.
  The count-compressed formula, closed K coefficients and source adjacency
  bound still need their formal bridges. The new tail inequality is an
  abstract parameter certificate, not an unconditional raw-source theorem.

Mission/design, the target audit, the residual scope audit and the independent
mathematical review were read. The predecessor event log and artifacts were
reconciled; all 81 recorded hashes matched. Its final three replay timeouts
remain timeouts, and no possibly completed mutation was blindly replayed.
Protected root/contract hashes are unchanged. No packages, controllers,
permissions, prior evidence, construction or Agoh files were altered.
The higher-priority .scratch denial was respected. Hosted source reading,
unavailable Sage/SymPy, failed process enumeration, the interrupted expensive
experiment and rejected Lean elaborations are recorded as operational evidence.
