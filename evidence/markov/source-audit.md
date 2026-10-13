# Primary-source audit, 2026-10-13

Read in this live session: [published Evans--Veselov--Winn](https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html),
[arXiv v2](https://arxiv.org/html/2501.14882v2),
[Evans 2026](https://arxiv.org/html/2604.18333v1), and the Markov section of
[Bergeron 2026](https://arxiv.org/html/2608.30979v1).

Target: Conjecture 6.3, with Definitions 6.1/6.2. Raw coefficients A_ij of
P(u,v,w), u=x²,v=y²,w=z². Degree d=a+b-1; coefficient A_ij multiplies
u^i v^j w^(d-i-j). The three steps are (1,0),(0,1),(1,-1).
Every consecutive lattice position is retained, including zero coefficients.
Only triples inside the polygon impose inequalities; one/two-term lines are
vacuous. Reduced 0<a<=b; 0/1 is the separate P=1 endpoint.

The Lean representation is nested integer polynomials, outer u, inner v,
after w=1. The polygon is a*b<=b*i+a*j, i+j<=a+b-1. No division and no
truncated index subtraction in the tested triples. `Conjecture63` includes
all finite Stern--Brocot paths between 0/1 and 1/1, plus endpoints.
The root middle is 1/2. Each left/right update uses source equation (8),
specialized to w=1. Standard Stern--Brocot coverage identifies these paths
with every interior reduced rational; this indexing correspondence is
audited mathematically here, not yet a Lean coverage theorem.

Evans (20 April 2026) constructs a matching for each polygon lattice point.
That establishes support, not the multiplicity inequalities required here.
Its conclusion explicitly leaves coefficient values for further study.
Its reference numbering for saturation differs from the published original.
Bergeron's two-variable deformations satisfy a different equation (12.1);
their proposed log-concavity is not a resolution of this target. Searches
for full 6.3 and Markov coefficient log-concavity located no primary resolution.

Source boundary formulae and Fibonacci family are already partial results
in the original paper. Reproving those is not a new resolution. In particular
the published third-upper-diagonal theorem has a/b<=3/5. Experiments will
test what obstructs its real-rootedness proof beyond this range.

Chronology: source reads began before the Markov run was initialized. The
first two run events register these readings, not newly caused searches.
