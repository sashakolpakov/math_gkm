# First admitted structural bridge from the blended Markov study

The machine proved a recurrence description of the entire all-false branch. Write `U,V` for the two polynomial variables, set `S=U+V+1`, and define

```
Q(0)=1,  Q(1)=U+V,
Q(n+2)=S*Q(n+1)-V*Q(n).
```

For **every natural k**, the middle label of `frame (List.replicate k false)` is `(1,k+2)`, and its polynomial is `Q(k+2)`. The exact declaration is `MathGKM.Markov.LeftBranch0001.mid_left`; see the byte-exact [proof source](rebuild/source/MathGKM/MarkovLeftBranch0001.lean) and [original definitions](rebuild/source/MathGKM/Markov.lean).

This proves no log-concavity inequality. The separately submitted finite `WeakLC` claim for path `[false]` was not admitted because its inspection artifact exceeded the validator's limits; its failure history remains local and unchanged. General Markov log-concavity and correspondence with the published polynomial family remain separate obligations. This package contains no private held-out suite, curator/evaluation answers, current researcher files or build objects.

The retained official run passed four compiles, four kernel replays and trusted premise inspection. Its obligation closure reports only `Classical.choice`, `Quot.sound` and `propext`; interface and transport closures report none. No added axiom or proof placeholder was accepted. This preservation job ran no Lean tests, models or new proof checks.

## Contents and reproduction

The archive contains exactly the16 selected original source/receipt files plus an embedded manifest. [MANIFEST.json](MANIFEST.json) lists raw hashes/sizes and original host provenance; [VERIFICATION.json](VERIFICATION.json) records a second streaming read of every archive member. The ten small source/rebuild files are also copied byte for byte under `rebuild/` for inspection. Original failure catalogs from other attempts are excluded and remain local.

Use [public pinned010 source733914c8](https://github.com/sashakolpakov/math_gkm/commit/733914c8e7883f3eb6340d7f213ee7e3e4800d9b), Lean `leanprover/lean4:v4.32.2` and mathlib revision `905b95818eb32af7874a58b427f50c1711a5e96c`. The exact package pins are under [rebuild-pins](rebuild/rebuild-pins/lake-manifest.json). The published generic `repro/` suite can provision the pinned dependency workspace; this bridge is an additional recorded source closure, not an already-tested portable profile.

Extract the archive into a new empty directory. Follow [REBUILD.json](rebuild/REBUILD.json) and the retained [validator profile](rebuild/validator.sb), safely mapping their original absolute source/build/dependency/temp paths to the new workspace. Preserve the original permission boundary and recorded environment, with the new build directory first in `LEAN_PATH` and the pinned dependency paths following it. Do not reuse historical attempt ids.

Run the recorded order from `source/`: compile `MathGKM.Markov`, `MathGKM.MarkovLeftBranch0001`, `MathGKM.Target29afbfe864de98b5d01fd5bf`, then `StudyCheck`, each using the pinned `lean -j 1` and a separate output tree. Replay those four modules with the pinned `leanchecker`, then run `lean -j 1 StudyInspect.lean` to regenerate the declaration artifact. FINISHED and its complete original result/catalog are inside the archive for comparison; generated object hashes can depend on the relocated build context.

The original sandbox profile is macOS-specific and contains host paths. Relocation and dependency preparation remain required; this package does not claim a fresh cold bootstrap, unchanged-path replay on another host, newly tested portable profile, independent English-source equivalence, or the full conjecture. Lossless artifact packaging does not change the historical validation result.
