# Global cut partitions for the ambient transfer

Machine-authored live request a27f6d422b1a478c976694b9ca5c9a54. No novelty
claim. Full published Conjecture63 remains unresolved. Only final successful
validation receipts count as formal evidence.

For a word w, use the inherited positive ambient transfer
T_r=D_r+x c_r H, where H=(1,1)^T(y,1), c_A=1, c_B=1+y,
D_A=[[0,0],[0,1]], and D_B=[[y,0],[2y,1]]. Append one B to w.
The inherited scalar is exactly (y,1) T_(wB) (0,1)^T.

The first row (p,q) has two possible transitions at a position:

* Skip: (p,q)D_A=(0,q), or (p,q)D_B=(y(p+2q),q).
* Select: multiply by x c_r(p+q), then reset the row to (y,1).

Let C(y,p,q;w;s) count exactly s selected positions with these weights.
For the empty word C(0)=q and C(s+1)=0. At r followed by v,

    C(y,p,q;rv;0)=C(y,d_r(p,q),q;v;0),
    C(y,p,q;rv;s+1)=C(y,d_r(p,q),q;v;s+1)
                    +c_r(p+q) C(y,y,1;v;s).

MarkovCutPartitionA27 proves universally that this is the ordinary x
coefficient of the transfer scalar. It proves the zero count C(...;0)=q,
vanishing above the word length, and scalar nonnegativity for nonnegative
real inputs. The latter is explicitly scalar nonnegativity, not an assertion
that pointwise positivity alone implies coefficientwise positivity.

For every actual source path, every natural i,j,s with i+j=a+s, the checked
bridge is

    A(i,j)=[y^j] C(y,y,1;central(path) B;s).

There is no cutoff, normalization, specialization y=1, or suppressed zero.
MarkovCutRootA27 extends this to every original grid position by returning zero
when i+j<a, and proves this is the actual raw coefficient there too. Its
root_iff_cutA27 is an exact equivalence with all three original inequalities
and their three polygon guards. Neither side of this equivalence is proved.

## Explicit gap weights

Write p_u for the first row entry after skipping a gap u, starting at (y,1),
and R(u)=p_u+1. Selecting positions k_1<...<k_s in wB contributes the product
of c_(k_h) R(gap_h); the unselected suffix after the last position contributes
1. For zero selected positions the contribution is 1. This subset description
is the direct expansion of the checked select/skip recursion. The explicit
finite-subset sum is independently tested in Python; it is not a separately
formalized Finset identity.

The universally checked gap formulas are

    R(B^q)=1+2(y+...+y^q)+y^(q+1),
    R(u A B^q)=1+2(y+...+y^q).

Thus a gap weight depends only on its trailing B run and whether the gap is
pure B. In particular its coefficient list is [1,2,...,2,1] or [1,2,...,2].
The q=0 cases are included: the empty gap has weight 1+y, and a gap ending
in A has weight 1. MarkovCutGapsA27 proves these over every commutative ring.

There is no uniform sign for splitting a gap. If alpha_v is the skipped
first-state output starting at (1,0), and beta_v that starting at (0,1),
the checked identity is

    R(u)R(v)-(1+y)R(uv)=(p_u-y)(1+beta_v-alpha_v).

For u=v=A this equals -y; for u=B,v=A it equals y+y^2. This rules out both
unconditional signs for this particular local split comparison, without
refuting a global sum inequality or a source-specific comparison.

## Experiments and obstructions

The independent subset expansion matched all 511 words of length at most 8,
enumerating 174762 subsets. It found the column triple [20,14,10] for
w=BAB^5, at s=1 and j=2,3,4. MarkovCutObstructionA27 proves the exact
univariate slice 8+20y+20y^2+14y^3+10y^4+6y^5+2y^6 and 14^2<20*10.
The virtual label is reduced 7/9, and all three original positions
(6,2),(5,3),(4,4) lie in that polygon. The word is not a palindrome, and
the checked source-central-palindrome theorem proves it cannot be the central
word of any source path. This is an obstruction to arbitrary-word diagonal
closure, not a refutation of the pinned root. Earlier research already records
arbitrary-word diagonal failures; no discovery priority is claimed.

The initial transfer experiment changed states to h=g-f, for which
A maps (f,h) to (x((1+y)f+h),f+h), and B maps it to
((y+x(1+y)^2)f+x(1+y)h,(1+y)f+h). These are positive updates and
F=(1+y)f+h, but their mixed horizontal gap is negative already for source
1/3 at s=j=0. This rejects that termwise route; the total gap is nonnegative.
The 1023 arbitrary words and 627 source fractions in positive-state-probe.json
also distinguish failures of arbitrary-word components from source results.

For the original (yf,g) decomposition, polygon-guarded tests covered 8191
arbitrary words of length at most 12 and 75 seeded longer words, totaling
1280367 triples per component/mixed/terminal test. The mixed gap fails for
w=BA^9 at s=2,j=2: f=[21,108,348], g=[7,102,584], weighted gap -432.
The total gap remains positive. No source identification is asserted.

A separate algebra probe explored the normalized second horizontal row.
Its broad statistic envelope 0<=t<=2m fails at N=4,m=1,t=2,s=1, with
normalized numerators [48,112,336]; this statistic is not realizable by that
word length/count. Replacing the upper bound by 2m-1 for mixed words gave
3206630 finite tests without failure. Attempted sparse-polynomial certificates
still have negative terms, and no universal second-row strengthening is proved.
The formulas and failed certificates are retained for reproducibility.

All experiments are finite evidence. The global cut formulation still needs
an aggregation proof using exact source-word restrictions in all directions.
