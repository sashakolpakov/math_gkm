# Matrix-word deductions, worker 774eaadc

Machine-authored research, not a completion claim. Write u=x*t, v=t in the
positive generators A=[[1,1],[u,u+v]], B=[[1+v,1],[u,u]]. For a word A w B,
let k=length(w) and m=count_B(w). Its upper-right entry q satisfies

    2[t^2]q = k(k+1)x^2 + 2((m+1)k-2m)x + m(m-1).

The proof tracks the upper row (p,q) after A w. Its constant coefficients are
both one, [t]p=k*x+m, and the invariant is

    2([t^2]p+x[t]q)=k(k+1)x^2+2((m+1)k-2m)x+m(m-1).

Appending A increases k; appending B increases k and m. The final B produces
p+x*t*q. MarkovWordJet774 checks this induction over arbitrary commutative rings.
Source words have k=b-2, m=a-1, giving the source's quadratic residual with
coefficients (a-1)(a-2)/2, ab-4a+2, (b-1)(b-2)/2. The exact bridge and its
validation status are recorded in MarkovWords774/MarkovThird774 and the manifest.

An exploratory Python invocation tested all 511 words A w B of length <=10;
the uv coefficient agreed with ab-4a+2 in every case. This prompted the
row-state derivation, but the finite check is not its proof.

The separate reproducible word_invariants_774.py experiment tested 1021 words
A w B with w palindromic and total length <=18. All satisfied the trace relation.
The first failure AABAAAAABAB has quotient u^1 coefficients at v^2,v^3,v^4
equal to 20,12,8, with 144<160. Its letter counts a=3,b=11 are coprime, so
coprimality, positive entries, palindromicity and the trace identity together
still do not suffice for quotient LC. No source path is claimed for this word.
The 101 cyclically balanced tested words had no failure; that is finite evidence.

Live source searches used the original publisher and arXiv:2604.18333v1, and
queries "Markov polynomials" "log-concavity" and "Markov polynomials"
"Conjecture 6.3" proof. No full proof was retrieved. The 2026 saturation paper
concerns support saturation, not a proved coefficient LC theorem. None of these
external statements is introduced as a Lean axiom.

Primary URLs: https://armj.math.stonybrook.edu/Articles/250708-Winn/index.html
and https://arxiv.org/html/2604.18333v1 . The row-state deduction above is this
worker's calculation; no historical novelty claim is made.
