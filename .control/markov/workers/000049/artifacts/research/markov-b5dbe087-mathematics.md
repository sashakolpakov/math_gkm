# Vertical top-face inequalities and transfer obstructions

Machine-authored request b5dbe087bddc41aaa420318d5cb776a1. No novelty claim.
The full pinned Conjecture63 remains unresolved. Formal validation is recorded
separately; finite experiments do not establish universal statements.

For source a/b let d=a+b−1, N=b−1, B=a−1 and D=i+j=d−2.
Write L=A(i,j), M=A(i,j+1), R=A(i,j+2), F=choose(D,i). The inherited
homogeneous layer formulas, with the new vertical middle coefficient bridge, give

    (j+1)M = F[B(j+1)+Ni],
    (j+1)(j+2)R = (D+1)(D+2)F,
    2D(D−1)L = TF,
    T=N(N−1)i(i−1)+2(BN+N−3B−1)ij+B(B−1)j(j−1).

We have N+B=D+1, B≥0 and N≥B+1. For D≥2 the raw gap clears to

    2D(D−1)(j+1)²(j+2)(M²−LR)=F² G,
    G=2D(D−1)(j+2)[B(j+1)+Ni]²−(j+1)(D+1)(D+2)T.

The generator expresses (2D)²G as a positive polynomial in nonnegative
variables i−2,j,2B,D−2B for i≥2. Separate certificates use j−1 for i=1
and j−2 for i=0. There are 101, 19 and 15 nonzero monomials respectively.
Lean checks the identities by ring normalization and their signs by order
reasoning, then cancels only the strictly positive displayed factor.

The source theorem source_top_vertical_rawB5 covers every path and every
polygon triple ending on the top face. Small degrees force a=1 and use the
inherited full numerator-one theorem. Thus no small case, zero coefficient or
endpoint is dropped. The large-degree algebra even covers the displayed
nonnegative index positions without a polygon assumption.

The constant one in this raw vertical inequality is optimal uniformly across
sources. For path replicate(j+1,false), corresponding to 1/(j+3), the valid
top-ending vertical triple at i=1 has coefficients [j+1,j+2,j+3]. Its gap is
exactly 1. For any real c>1 an Archimedean choice of j makes
c(j+1)(j+3)>(j+2)². vertical_uniform_constant_sharpB5 proves this with
actual source coefficients and all three polygon guards. This is an obstruction
to a strict uniform multiplicative strengthening, not to raw log-concavity.

Combining the new vertical theorem with inherited horizontal and diagonal
theorems gives root_iff_interiorB5. Its residual Interior63B5 retains all
paths and all three polygon guards. The remaining horizontal and vertical
triples have i+j+3≤d; the remaining diagonal triples have i+j+5≤d.
Equivalently, it removes exactly the triples wholly contained in the top
three homogeneous layers. Both directions and both endpoint clauses are
checked. The residual proposition remains unproved and infinite.

## Global invariant investigation

Using the exact two-state affine transfer, the script tests ULC in s with
ambient degree N=word length+1 separately for f, g and F=yf+g, and tests
adjacent minors in (s,j). All words of length≤10 were enumerated. The
individual-state ULC hypotheses fail, for example g on AAAB has row triple
[2,11,32] at s=1,j=2 and scaled gap −42. Source-word scans are kept separate
because these arbitrary words are not automatically source central words.

For actual sources through denominator 45, the TP2 candidate fails already
for 8/9. Its ambient entries C(1,6), C(2,6), C(1,7), C(2,7) are
[12,464,8,296], with determinant −160. No pinned three-point inequality is
reversed by this four-position minor.

The inherited exact Pell formulas yield a universal expression. On path
replicate(k+j,true), with j≥4, the determinant formed from raw positions
(k+2,j),(k+3,j),(k+1,j+1),(k+2,j+1) is

    32[(k+2)³−j((k+2)²−(k+2)−1)−2].

For k=0 it equals 32(6−j), strictly negative for every j≥7. All four
positions are in the actual source polygon. In ambient coordinates this is
C(1,j)C(2,j+1)−C(2,j)C(1,j+1). The universal formula and its exact source
and ambient interpretation are checked in MarkovShearObstructionB5 if listed
as successfully validated in the final manifest.

The palindrome scan tested 8,189 words of length≤22, retaining coefficient
zeros. Neither individual-state nor terminal-sum ambient ULC failed in its
8,860,294 recorded checks. This suggests a stronger palindrome-specific
induction hypothesis but proves none. Palindromic gas words already have a
checked sum-of-squares representation in MarkovSquares28b1; that inherited
result is not rediscovered or credited as new here.

A direct form in the newer ambient coordinates is useful for that proposed
induction. Both affine transfer matrices share

    K(x) = [[1+x,−x],[−x,x]],
    K T_A = [[xy,0],[0,x]],
    K T_B = [[y+xy²,xy],[xy,x]].

For Q_w(p,q)=(p,q)K T_w(p,q)^T, the exact sandwich identity is
Q_(r w r)(p,q)=Q_w(T_r(p,q)^T). Its central cases are

    Q_empty=p²+x(q−p)²,
    Q_A=x(yp²+q²),
    Q_B=yp²+x(yp+q)².

The source seed (p,q)=(x(1+y),1+x(1+y)) satisfies Q_w=xF_w.
MarkovAmbientFormB5 checks these identities over every commutative ring and
connects the seed expression to every source path without division by x.
These identities alone do not establish log-concavity or a preserved
coefficient inequality. They are a direct-coordinate form of the inherited
square structure, not a claimed new general sum-of-squares theorem.

The mixed term needed to combine the two state rows is a distinct obligation.
At ambient degree N, put A=(s+2)(N−s), B=(s+1)(N−s−1),
f_k=[x^(s+k)y^(j−1)]f (zero if j=0), g_k=[x^(s+k)y^j]g.
The terminal gap decomposes exactly as

    B(f_1+g_1)²−A(f_0+g_0)(f_2+g_2)
      =(B f_1²−A f_0 f_2)+(B g_1²−A g_0 g_2)
        +2B f_1g_1−A(f_0g_2+g_0f_2).

Even for palindromes the mixed term alone need not be nonnegative: word
ABBBBBBBBBA, s=1,j=9 has f=[0,10,524], g=[4,170,3692] and mixed gap
−1168. The total gap remains nonnegative in the tested cases. This arbitrary
palindrome is not silently identified with a source word. All-source mixed
nonnegativity is a separate candidate, still unproved. The exact tests and
their bounds are in synchrony.json and source-mixed-stress.json.

The final stress completed all 84 selected reduced fractions, with denominator
at most 120, testing 821960 triples for each of the two component gaps, the
mixed gap and the terminal gap. No failure occurred. Inputs and seed are saved;
these selected inputs are not exhaustive rational coverage. The palindrome
ULC test counts only existing left coefficients; when the left coefficient is
zero the tested inequality follows directly from the nonnegative square and
nonnegative scalar weight. Internal and right coefficient zeros are retained.
