# Integral pairs and source-prefix obstructions

Machine-authored request 10d1575180b64743bae4589161aa0716. The exact pinned Conjecture63 remains unresolved. The mathematical modules compile; final kernel replay and axiom status are recorded separately in evidence/markov-10d15751/validation.json.

## A raw model with the scaling made explicit

Write x=u, y=v, h=1+x. The top row (Q,P) of the raw positive matrix word starts at (1,0). Appending the expanded atomic letters has the exact updates

    A: (Q,P) -> (y(Q+xP), Q+hP),
    C: (Q,P) -> ((1+y)Q+xyP, Q+xP),
    B = A followed by C.

MarkovRawPrefixM10D identifies this pair with the inherited gas matrix product, then identifies its P component on every expanded sourceWord28 path with the protected raw numerator (frame path).mid.p. This is an ordinary polynomial identity, with no factorial or coefficient-dependent normalization.

After the first A, let k be the number of additional original A/B letters, and let (F,H) be the inherited positive horizontal residual pair. The integral substitution phi sends y to yh² and fixes x. MarkovRawConjugacyM10D and MarkovWordConjugacyM10D prove

    phi(Q)=h^(k+1) F,     phi(P)=h^k H.

The proof is preserved separately by atomic A and C, using only polynomial ring identities. Induction covers every original Boolean tail w after the first A, with k=length(w); there is no moment, denominator, or word-length cutoff. At row j it yields

    h^(2j) [y^j]P = h^k [y^j]H.

For an arbitrary word H denotes the positive hdiff state. Its identification with the separately defined hresidualM511 is asserted only for actual source words, where the inherited hresidual_diffM511 theorem applies.

For 2j<=k this gives raw = h^(k-2j) residual. For k<=2j it gives residual = h^(2j-k) raw. Both directions of polynomial factorization are proved, including equality at the dividing index. These identities do not allow cancellation of log-concavity. In particular the high-index raw inequalities remain required.

MarkovSourceConjugacyM10D specializes the integral word identity to every actual source path and row, with k=b-1 and H_j exactly hresidualM511. This supplies a direct integral proof of the inherited cleared source identity. It does not remove any region from the exact residual InteriorCore63MF8.

## Why requiring both residual states to be LC at every source prefix fails

For every n>=0, after the original word A^(n+2) B A, the second row of the auxiliary F state is exactly

    2x+5x²+(n+4)x³.

MarkovPrefixObstructionM10D proves this from the actual hK word recurrence, starting with the first two row identities along A runs. For every n>=9 its consecutive coefficients satisfy 25<2(n+4).

MarkovSourcePrefixM10D proves that this word is the prefix of length n+4 of the actual source at 2/(2n+5), whose path is false^(n+1) followed by true. Thus the obstruction occurs on an unbounded family of actual source prefixes. It concerns an auxiliary F state, not the final residual H or the protected raw source polynomial. At n=9 the ambient source is 2/23 and the failing F triple is [2,5,13].

## A polygon-valid raw failure at a source prefix is still not a root refutation

Let W=A B B B B B A B B. It is the length-nine prefix of the source word for 11/13, path [true,true,true,true,true,false]. Its counts are a=7,b=9. The raw matrix b-entry has coefficients

    A(4,4)=10, A(5,3)=14, A(6,2)=20.

All three positions satisfy InPolygon 7 9, but 14²=196<200=10*20. MarkovRawPrefixM10D proves the exact matrix/word identity, the prefix provenance, all three coefficients, all polygon guards, and the reversed inequality.

Crucially, it also proves W is not sourceWord28 path for any path. At prefix length six W has five B letters, while the source mechanical-prefix theorem at 7/9 forces floor(7*6/9)=4. This is a formal source-family exclusion, not an omitted bridge.

MarkovPrefixScopeM10D proves the contrasting actual 7/9 source triple is [4,12,20], with all polygon guards and 4*20<=12². In the enclosing actual 11/13 source all three positions have coefficient zero and lie below its polygon. Neither source polynomial refutes Conjecture63. The new failure rules out enlarging the target to all raw prefixes of source words even if one keeps the count-based polygon guards.

## Experiments and limits

The grouped recurrence probe covered 2,397 source-prefix states through denominator 30. Same-row synchronization, weighted synchronization, auxiliary F-row LC, and one proposed grouped C comparison all had failures. H-row LC had none in this finite probe. The raw-prefix probe covered 4,096 distinct prefixes through denominator 42 and made 8,519,796 coefficient comparisons; it found 257 diagonal failures and no coordinate failure. These are strategy experiments, not universal inequalities.

That initial raw-prefix diagnostic enumerated supported centers. The separate probe_raw_prefix_zero_10d15751.py rerun explicitly retained zero centers and tested every center in the full degree triangle plus a zero boundary layer. It made 11,447,217 comparisons and found the same 257 diagonal failures and no coordinate failure. Its authoritative zero-inclusive result is raw-prefix-zero-experiments.json; the initial program and result are preserved.

A final scope-check rerun made the same comparisons with an explicit assertion that no failing prefix is the completed source word. It passed, recording completed_source_failures=0 in raw-prefix-scope-experiments.json. This remains finite evidence only.

The truncated-row probe tested rows zero through eight on all reduced interior fractions with denominator at most 70 and a recorded deterministic sample up to 400. It checked 31,611 distinct prefixes. Its 2,653,926 adjacent comparisons found no H-prefix, complete-source H, or complete-source F failure. Zero coefficients were retained. Truncation only removes higher y-degrees, which cannot affect lower rows in the positive recurrence. Inputs and code are saved; no proof claim is based on this finite calculation.

The raw horizontal closure-cone probe is a separate strategy experiment; its final result is raw-cone-experiments.json. None of the experimental predicates is silently adopted as a Lean premise.

The latter probe tested 630 enlarged words and 631,476 comparisons. Both raw components' horizontal LC survived, but their same-row, next-Q, and next-P mixed inequalities failed. The grouped B-to-P comparison had no failure. This reinforces the need to control the sum of signed gap contributions, rather than demand every mixed term be nonnegative. It is finite advice only; arbitrary-word horizontal LC remains unproved.

The explicit theorem universal_source_prefix_failureM10D refutes the proposed all-source-prefix WeakLC enlargement itself. Its target is not Conjecture63, and completion remains null.

Final local validation passed all seven mathematical modules and 40 theorem axiom closures. All selected declarations passed isolated kernel replay. This reused compiled imports and did not perform a whole-source rebuild or independent completion audit.
