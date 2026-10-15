# Cyclic cubic expansion and exact source pattern counts

Machine-authored live request `6905e489e1b94101b2cfdfbd54247a99`.
Full pinned `MathGKM.Markov.Conjecture63` remains unresolved. No novelty claim.
Validation receipts and source hashes are in `evidence/markov-6905e489/`.

## Reconciled partial effects

Read MISSION.md, docs/DESIGN.md, the pinned root/contract, inherited index,
independent target, residual and mathematical audits, and the latest completed
report. Inspected the actual worker 72–74 event logs and receipts. Worker 72
left four failed builds of its pattern module, with no accepted object/replay.
Its last failure was an induction-hypothesis simplification mismatch. Workers
73 and 74 failed routing before any research action. All 91 checked inherited,
predecessor, and interrupted-worker artifacts matched their recorded hashes.
The repair is a NEW module; no prior artifact or controller record was edited.

## Exact circular source statistics

`MarkovTriplePatterns6905` repairs the previous proof in a new file.
`MarkovCyclicPatterns6905` additionally proves the interpretation as circular
length-three windows: append the first two letters to the source word and scan
without counting artificial initial letters. This includes the length-two word.
For every finite source path with label a/b, the proved counts are

    #111 = max(3a−2b,0)
    #101 = min(b−a,max(3a−b,0)).

Natural subtraction implements the maxima. The inherited #11 formula remains
`max(2a−b,0)`. Source words begin 0 and end 1; the circular interpretation is
proved, not inferred from sample words.

## Universal cubic expansion

Consider any finite ordered list of polynomial 2×2 matrices with constant
coefficient P=diag(0,1). Write their first coefficients as a_i,b_i,c_i,d_i,
and their second coefficients as a2_i,b2_i,c2_i,d2_i, with d3_i the bottom-right
third coefficient. For cycle length at least four, the new proofs establish

    T3 = e3(d) + Σ d2_i(D−d_i) + Σ d3_i
       + Σ (c_i b2_(i+1) + c2_i b_(i+1))
       + Σ c_i b_(i+1)(D−d_i−d_(i+1))
       + Σ c_i a_(i+1) b_(i+2),       D=Σ d_i.

Indices are cyclic. The Lean representation uses recursively defined scalar
ordered sums plus explicit wrap terms, retaining all multiplicities. It does
not replace the cyclic list by a multiset. `projection_trace3_cyclic6905` is
the exact polynomial coefficient identity. The generic ring can have arbitrary
signs; positivity and log-concavity are not assumptions or conclusions.

Length three needs the additional term a_1 a_2 a_3. Length two omits the
three-distinct-factor contribution and needs a_1 a2_2+a2_1 a_2. These corrections
are proved separately in `MarkovCubicClusters6905`. Length one is its literal
matrix trace, not an application of the large-cycle formula.

`MarkovCyclicMoments6905` proves the Newton-identity form

    6 T3 = D³+3 D K+L,

where K and L are the explicitly defined cyclic sums in that module. The proof
also establishes the elementary-symmetric, mixed-moment, and excluded-endpoint
pair identities used in this conversion. This statement is universal over
commutative rings and lists of at least four blocks.

## Connection to source blocks and the remaining assembly

`MarkovCubicSource6905` constructs the gauged list of arbitrary run blocks
AB^n, proves its common constant projection, telescopes its product, and proves
trace preservation on a closed cycle. `source_raw3_cyclic6905` identifies its
third-cut result with the actual integer coefficient A(i,j) for i+j=a+3.
The explicit premises specify the actual run decomposition and its first/last
blocks; no coefficient formula or inequality is assumed by that bridge.

For the low-slope substitution A→A, B→AB, `MarkovBooleanJets6905` proves the
entire gauged matrices and their relevant coefficients. Every first-order
upper-right entry equals 1 and every bottom-right cubic entry is zero. Its
local moment contractions are checked by Bool cases and ring identities.
`MarkovMomentSums6905` aggregates these identities under explicit finite-count
hypotheses. `MarkovPermutationMoments6905` discharges those count relations for
an arbitrary finite Boolean permutation orbit, with its own exact orbit counts.

For a cyclic binary word of length c with r ones, q adjacent 11 patterns,
t patterns 101 and u patterns 111, these local sums give the expressions

    D = c+r(1+3y)
    K = −c+2cy−r−8ry+ry²+8qy³
    L = 2c−12cy+6cy²+2r+30ry−30ry²+6ry³
        −144qy³−96qy⁴+24ty⁴+24uy⁵.

The exact polynomial

    D³+3DK+L−3(1+y)(D²+K)+6(1+y)²D−6(1+y)³

has, at EVERY nonnegative coefficient index, the inherited `thirdSeq75`
coefficients. This all-index equality, including zero tails, is proved in
`MarkovThirdMoments6905`. The factor six is uniform, not a factorial or
index-dependent normalization. Its trace-moment hypotheses imply exactly
`ThirdFormula75`, which remains unproved for all sources.

`MarkovSourceMoments6905` reuses the already established source first/second
slice identities to prove the stated D and K moments for every path false::rest
(the second moment excludes the c=2 correction). Thus
`source_third_of_cubic_moment6905` needs ONLY the actual cubic trace moment as
an additional premise. Here c=(frame rest).mid.b, r=(frame rest).mid.a and
q=max(2r−c,0); t,u stay explicit parameters until source assembly.

The unfinished bridge is concrete: identify the recursively ordered cyclic
sums for the gauged source list with the permutation-orbit sums of its Boolean
word; identify those orbit counts with the proved circular scans; substitute
the source counts. No theorem silently assumes that these representations
coincide. Small c and the rational chamber boundaries in the earlier
log-concavity certificates must also be handled before a universal third-slice
inequality. Even that result would cover one slice of one direction only.

## Experiments, source use, and operational limits

`probe_cubic_6905.py` independently multiplied random integer cubic matrix jets:
1,000 checks at lengths 1–40, including the small-cycle corrections, agreed.
It checked 1,965 source pattern pairs through denominator 80. Separately, literal
pinned polynomial recurrence and a backward cut recurrence agreed at 1,884
third-slice coefficient positions (listed sources, denominator at most 35).
All arithmetic was exact. These are finite experiments, not proofs.

The live [published paper](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html)
was consulted for its raw numerator conventions and Definition 6.2/Conjecture
6.3. The target concerns all three principal directions on the Newton polygon.
No retrieved assertion became a Lean axiom. No literature novelty claim is made.

The sandbox denies .scratch, so unique research/evidence paths were used.
A zsh heredoc failed because it could not create a temporary file; scripts and
Python -c avoided that limitation. Sage was not found; GAP was found but unused.
Rejected Lean builds and a pre-execution Python syntax failure are preserved.
Builds reuse pinned inherited compiled imports; they are NOT a fresh rebuild
of the entire dependency closure or an independent completion audit.
