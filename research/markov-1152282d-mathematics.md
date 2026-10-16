# Third-column source formulas and a ratio region

Machine-authored experimental research, request
1152282d605b45568637f8914ec5fc57. Full pinned Conjecture63 is unresolved.
Only modules listed as built, replayed and audited in
evidence/markov-1152282d/validation.json are accepted results of this worker.
Other generated Lean files are explicit pending candidates.

## Universal identities

The actual run matrix supplies five scalar jets: A and B are its upper-left
coefficients of orders one and two; C is order three; F and G are its
upper-right coefficients of orders one and two. The new C/G recurrences follow
from the already checked matrix Cayley identity. Their closed forms satisfy
the recurrence and the two base cases in Lean (MarkovThirdJetsM115).
The interpolation used to discover their coefficients is not a premise.

MarkovThirdExprM115 connects these jets to the exact integral source seed
vThirdSeedMEA. MarkovThirdClearedM115 proves its universal cleared expression.
MarkovThirdSparseM115 proves the inherited four-block candidate for every run:

    (1-v)^6 N3 = J0 + v^q J1 + v^(2q) J2 + v^(3q) J3,  q=n+1.

The J blocks are integral explicit polynomials in q and five actual source
counts. They have degrees 8,9,10,12 in v. The counts are predecessor length L,
true count T, max(2T-L,0), min(L-T,max(3T-L,0)), max(3T-2L,0).
For a final label a/b with b=aq+r, these are L=a,T=a-r and their indicated
derived counts. No arbitrary-word hypothesis replaces these source counts.

The coefficient extraction theorem vThirdSeed_coeffM115 is an exact finite
sum against choose(5+j-k,5). MarkovThirdInverseM115 and MarkovThirdValuesM115
give the equivalent integer sequence E(q,j)=120*[v^j]N3, using a zero-extended
quintic falling factorial. MarkovThirdRegionsM115 proves every stated index
chamber identity and exterior vanishing, for q>=3. None of these identities
asserts log-concavity. They hold for the actual source, not just interpolated
sample tables, and no singular evaluated value of v is excluded.

The inherited exact source factor is

    6 [u^3] P_(a/b) = v^(b-3q-3) (1+v)^(a-7) N3  (a>=7).

Multiplication by (1-v)^6 is used to identify coefficients. No claim that
division preserves log-concavity is used.

## First four runs

The MarkovThirdRun{1,2,3,4} modules supply exact seeds, source identities,
source-count chamber bounds and CrossLC transports. Their support bridge
retains the potentially zero first two entries, proves positivity from index
3 through the last coefficient, and retains all negative/exterior zeros.
The bounds are universal in the predecessor source, not a denominator scan.

MarkovThirdFirstRunsM115 assembles the four runs into vertical_third_ratioM115:
for every source path with a>=7 and b<5a, and every natural j,

    coeff P 3 j * coeff P 3 (j+2) <= coeff P 3 (j+1)^2.

The acceptance receipts are in validation.json. The companion checked
root residual is InteriorCore63RunsM115, not the more ambitious
unbuilt InteriorCore63M115 candidate. It retains every horizontal and diagonal
guard and leaves the third-column cases a<=6 or 5a<=b explicitly unresolved.

## Pending all-run inequality

The exact symbolic exploration first found nonnegative expansions in 263/266
charts. Separating index 4 from the low interval produced 280/280 nonnegative
gap expansions. These are untrusted generated certificates, not Lean theorems.
The files MarkovThirdAll* and MarkovResidualM115 must be checked against the
accepted inventory before use. The first large chart build ended with code -9;
no theorem from that unfinished module is credited. Split or factor the large
certificates before retrying; do not re-prove the now-checked sparse identity.

## Finite experiment

The actual truncated recurrence was compared with the explicit four-block
coefficient formula for 1,160 fractions, a=7..20 and
q in {1,2,3,4,5,6,9,16,25,40}. There were 219,496 raw coefficient comparisons,
51,388 seed adjacent checks, 1,958,196 seed cross checks, 50,948 polygon-valid
raw inequalities and 166,228 raw zero positions, without failure. These checks
are experiments, not universal proof. Exact records and script are retained.
