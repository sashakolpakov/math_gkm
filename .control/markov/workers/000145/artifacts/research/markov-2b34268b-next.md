# Revisable next actions

Machine-authored request 2b34268bc69f47e9a04cd494ac77bc26. Completion null.

The upper-row positive formula is now proved, including its endpoint allocations,
zero column and first column. Do not add boundary terms again. The exact
equivalence numerator_two_horizontal_iffM2B3 says the entire numerator-two
horizontal problem is equivalent to UpperBinomialLCM2B3.

One possible next action is to prove UpperShiftedM2B3. The finite summation bridge
is already proved. Use the scaled core recurrences and fifteen scalar sign
certificates, with explicit support and positive-denominator guards. The rising
weights C(2d+h-1,h), d>=1, need their own zero-aware inward inequality. The
exceptional i=1 core has only h=1 nonzero and must be handled separately;
the scaled formula was proved only for i>=2. Finite tests pass but are not proofs.

For the scalar certificates, the ordered branch k<=h uses
base=k, p=h-k, r=i-h, t=N-i. The separated branch k>=h+2 uses
base=h, p=k-h-2, r=i+2-k, t=N-i. In each branch i=base+p+r>=2;
the six certified regions partition that condition. The k=h+1 comparison
uses the corrected local H-versus-H gap and i=h+r>=2, covered by three regions.
Use scalar-regions-v2.json; the first local gap compared an irrelevant H/D pair.
Both the earlier true but irrelevant sign and its correction are preserved.

Read markov-2b34268b-mathematics.md for exact substitutions and remaining gaps.
The scalar region signs are not yet a global core theorem. The unshifted and
two-step shifted variants fail; keep the min(h+1,k), max(h+1,k)-1 map.

Alternative broader source decompositions remain legitimate. Preserve every
unresolved clause in research/MarkovResidualMAF6.lean, including other directions
and reverse-factor ranges. Even complete numerator-two horizontal LC would not
resolve the root. All source-correspondence bridges, a fresh full rebuild and
an independent hash-bound English/source audit are still completion obligations.
