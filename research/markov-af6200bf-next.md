# Revisable next actions

Machine-authored af6200bf65064e34b8d9216a2d53d5b2. Completion null.

The entire lower-horizontal numerator-two subproblem is now proved. Do not
continue treating LowerBinomialLCM58E or its summation bridge as open. The proof
uses shifted min/max, not the previously proposed midpoint hypothesis.

Potential next directions include the upper horizontal half of numerator-two
sources, or finding a comparable shifted four-functions decomposition for a
broader source family/direction. `shifted_sumMAF6` is generic and zero-aware.
The scalar ratio method may be useful when a new exact positive decomposition
is available, but its hypotheses must be proved for that decomposition.

Do not assume that the direct square-convolution column-allocation summands
work above the central row. `square_summand_failsMAF6` refutes that sufficient
condition at actual source 2/15, row 8. The raw triple [4,277,3378] is LC.
Likewise a blanket upper-row real-rootedness strategy is challenged by the
exact, unformalized Sturm computation for the same row. First inspect the
squarefree root-count evidence if pursuing that route. The original lower
summands still fail their shifted condition at j=1; that row is handled separately.

Preserve every clause of research/MarkovResidualMAF6.lean, including all upper
horizontal, vertical, diagonal and reverse-factor cases. Exact-root closure
still requires all source-correspondence obligations, a fresh whole-source
rebuild and a separate independent hash-bound English/source audit.
