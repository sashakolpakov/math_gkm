# Cubic quotient calculation, worker 5a7c193a

Machine-authored mathematical work. This is not a claim of historical novelty
or of full Conjecture 6.3. Validation receipts determine accepted source hashes.

Let the positive matrix word be A w B, with nonempty core w, and write n for
its length, m for its B count, and s for the number of adjacent unequal letters
in the core. Set u=x*t, v=t. The cubic homogeneous slice of the upper-right
matrix entry is A+B*x+C*x^2+D*x^3, where

    A = m(m-1)(m-2)/6,
    B = [2(n-1)+3m-5m^2+nm+nm^2-4s]/2,
    C = [2n(n-1)+m(n-1)(n-4)]/2,
    D = (n+1)n(n-1)/6.

The empty core is excluded from this formula: its cubic coefficient is zero,
whereas this expression at n=m=s=0 has B=-1. This exception was found by an
inconsistent exact interpolation and is not suppressed. The checked row-state
proof starts after the first core letter and then works over every commutative
ring, clearing denominators by six. The row invariant additionally records
the previous letter, the second coefficient of the first row entry and the
first coefficient of its second entry. This makes all four transitions exact
polynomial identities. See MarkovCubicJet5a7.lean.

For a source path, the existing word theorem gives n=b-2 and m=a-1. The
universal combinatorial bound s<=2(n-m) follows by charging each change of
letter to an occurrence of A. No sharper balanced-word identity is needed
for the cubic inequality. When m>=3, put m=x+3,n=m+y, with x,y>=0. Bound B
between B(s=2y) and B(s=0). After scaling A,B,C,D by six, each of

    B(2y), B(2y)^2-A*C, C^2-B(0)*D, B(2y)*C-A*D

expands in x,y with nonnegative coefficients. The Lean proof checks the
expansions with ring normalization and positivity. For m=0,1,2, A=0;
the remaining C^2>=B(0)*D is checked at the appropriate integer lower bounds
on n. The case m=n=2 must be isolated: the corresponding extension to real
2<n<3 is not valid. No real-parameter interpolation is substituted for it.

Source quotient positivity supplies nonnegativity of all four coefficients.
Three inequalities AC<=B^2, BD<=C^2, AD<=BC directly imply CrossLC for the
zero-extended four-term sequence, including zero coefficients. Scaling by
six is canceled, and the inherited exact upper-slice factorization transports
this to raw source coefficients when d=a+b-1>=6.

An independent exploratory scan of unrestricted words found ABABBBBB at
homogeneous slice r=6 with coefficients [0,0,2,4,6,10,7]; the central triple
4,6,10 violates LC. This enlarged word family is not the source family.
Thus the low-order argument cannot justify all higher slices by arbitrary-word
closure. Recorded experiments and interpolation are finite evidence only.

The later palindrome scan tested 8,189 words of total length at most 24 and
950,259 quotient-diagonal triples in the upper regime. The first failure was
ABABBBBBABB, with a=8,b=11,r=9 and coefficients
[0,0,0,0,4,8,12,20,23,10]. Thus 12^2<8*20. Its core is palindromic, its label
is reduced, and r is exactly half of d=18. Nevertheless it is not the source
word: the actual Farey path RRLR gives ABBABBBABBB and slice
[0,0,0,0,0,0,8,20,23,10]. The scan explicitly compares both words. Some later
enlarged-family examples have noncoprime counts; their comparison field uses
the reduced rational and is not a claim of an equal-degree source polynomial.
The reduced 8/11 example already suffices to show that palindromicity and
coprimality do not rescue the enlarged-family strategy. This remains finite
experimental evidence, not a Lean refutation of any source theorem.

Primary publisher retrieved live:
https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
No outside mathematical assertion was introduced as an axiom.
