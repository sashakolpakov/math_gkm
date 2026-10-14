# Quartic residual slices

Machine-authored request 4f8ceeeb08e4428892713ab6457705dd. The full pinned
Conjecture63 remains unresolved. No historical novelty claim is made.

For a core word w of length n>=2, let m count B letters, s count adjacent
unequal letters, and t count length-three blocks AAA or BAB. Put u=x*z,v=z
in the exact positive quotient matrices. The coefficient of z^4 is
(A+B*x+C*x^2+D*x^3+E*x^4)/24, where

    A = m(m-1)(m-2)(m-3)
    B = 4[(n-8)m^3+18m^2+(5n-22)m-6n+12]+48(1-m)s+48t
    C = 6[n^2(m^2+3m+6)+n(-11m^2-9m-18)+26m^2-10m+12]
        +(144-48n)s
    D = 4(n-1)(n-2)[3n+m(n-6)]
    E = (n+1)n(n-1)(n-2).

MarkovQuarticJet4f8 proves this over every commutative ring. Its proof tracks
the exact two-state row recurrence, the inherited cubic jet, a formula for
twice the second coefficient of the second state, and 24 times the fourth
coefficient of the terminal scalar. The initial word has two letters. Each
append updates s according to whether the last two letters differ, and t
according to whether the last three letters are AAA or BAB. The eight Boolean
transitions are polynomial identities checked in Lean. No interpolated identity
is taken as a premise. Empty and one-letter cores are excluded explicitly.

The word statistics satisfy 0<=s<=2(n-m) and 0<=t<=n-m: charge switches to
A letters (inherited proof), and each counted triple to its A center (new
proof). For m>=6 and n>=m, B is bounded below by B(s=2(n-m),t=0) and above
by B(s=0,t=n-m). C is bounded below by C(s=2(n-m)) and above by C(s=0).
After substituting m=x+6,n=x+6+y, the two lower bounds and each of

    B_low^2-A*C_high,
    C_low^2-B_high*D,
    D^2-C_high*E

expand with nonnegative coefficients in nonnegative x,y. The checked
quartic_cert4f8 proves these polynomial certificates; monotonicity yields
AC<=B^2, BD<=C^2, CE<=D^2. Coefficients past degree four vanish.

For actual source paths, source_word774 gives n=b-2,m=a-1 and an exact
identity with quotientSlice774. Thus a>=7 supplies m>=6 and a core with at
least two letters. The theorem fifth_quotient_adjacent4f8 proves every adjacent
inequality of the actual quotient slice r=4, including its zero extension.
The previously proved interval-support theorem supplies CrossLC, and the
exact factorization multiplies by (1+x)^(a+b-9). This is an ordinary binomial
smoothing, not normalization of coefficients. Under a>=7 and a<b, its exponent
is nonnegative. The final theorem fifth_raw_logConcave4f8 states

    A(i,j+2) A(i+2,j) <= A(i+1,j+1)^2
    whenever i+j+6=a+b-1,

for every path with a>=7 and every natural i,j. The omitted homogeneous
variable has exponent four. No polygon guard is needed for this stronger
line-specific inequality. This is only one diagonal family, not the full root.

Initial exploration rediscovered the already established cubic result in
5a7c193a. MarkovCubicJet4f8 records the alternate adjacency statistic and was
checked, but is explicitly duplicative. The new quartic work began after the
earlier cubic report was found and read. An unrestricted-word failure 4,6,10
at degree six was likewise already known; it is not a source counterexample.

The quartic formula was suggested by exact interpolation on 1,020 words.
A separate exact scan checked 32,764 words of lengths 2 through 14, with no
formula or quartic-LC failures. The raw source scan checked 323 fractions with
b<=32 and 8,550 fifth-diagonal triples, including 1,582 triples with a<7.
These observations are finite evidence only. The small-a cases are not proved
by this invocation. Evidence: evidence/markov-4f8ceeeb/quartic-check.json.

A live hosted search retrieved the publisher's original Conjecture 6.3 and
the arXiv entry. No external theorem entered the proof as an assumption.
Source: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html .
