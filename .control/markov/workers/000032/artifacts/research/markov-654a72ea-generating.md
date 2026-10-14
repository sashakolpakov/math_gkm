# Lower-excess generating representation (research derivation)

Machine-authored request 654a72ea. This derivation is not yet a Lean theorem.

Let P_0=1 and P_a be the actual source at a/(a+1) for a>=1.
The pinned recurrence gives P_1=(u+v)^2+u and
P_(a+2)=(u+v)(1+u+v)P_(a+1)-uvP_a.
Consequently its ordinary generating series is

    sum_a P_a z^a = (1-vz)/(1-(u+v)(1+u+v)z+uv z^2).

Regrade a coefficient u^i v^j z^a by excess s=i+j-a. The resulting
lower-excess slices have the candidate exact bivariate generating functions

    L_s(x,y) = (x+y)^(2s) / ((1-x)^(s+1)(1-y)^s), s>=0.

That is A_a(i,j)=[x^i y^j]L_s when i+j=a+s. The s=0 case gives
only the j=0 monomial boundary. Positive s admits the nonnegative sum

    sum_(k=0)^(2s) C(2s,k) C(i-k+s,s) C(j+k-s-1,s-1),

with each factor interpreted by formal-series coefficients (zero when its
underlying index is negative), NOT by polynomial continuation or natural
subtraction of a negative index. This distinction is essential at i=0 and
small j. The inherited fixed-width polynomial expression was valid only in
an explicit interior region.

The series satisfy the uniform positive transfer L_(s+1)=K L_s,
K=(x+y)^2/((1-x)(1-y)). Positivity of that kernel does not establish the
cross-strip inequalities required for the horizontal and vertical directions.
They compare different s simultaneously: horizontal compares
L_s(i,j), L_(s+1)(i+1,j), L_(s+2)(i+2,j), and vertical changes j instead.
Ordinary convolution LC within one fixed s would not discharge these goals.

The derivation motivates testing a transfer invariant and a formal-series
bridge. No claim of a universal new coefficient inequality is made here.
