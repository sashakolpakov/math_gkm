# Outward-shift comparison discovered

Machine-authored 5bf6837d. The proposed bound v(h-1)<=v(h)+1/4 is FALSE;
see evidence/markov-5bf6837d/drop-probe.json. It is only an auxiliary shortcut.

Promising universal argument (not yet a checked theorem): set N=s+j+3,
z=N+1-h/2, g_h(r)=K(r)K(h-r). Shift the centered distribution at total h
by +/-1/2 with outward probabilities 1/2 +/- x/(2z). Its variance is
(1+1/z)v_h+1/4, precisely the desired upper bound on v_(h-1).

At the positions t=0,...,H=h-1 of the old distribution, the unnormalized
new/old likelihood ratio is b(t)+b(H-t), where
b(0)=4j and b(t)=(t+1)(j-t)/t for t>0. The parameter s cancels exactly.
For 0<t<H this ratio is 2j-H-2+j*H/[t(H-t)], increasing with distance from
the center. The exceptional endpoint ratio is larger than all interior
ratios when H<=j-1. The new outside endpoints also have maximal squared
distance. A weighted covariance inequality should therefore give the
required variance drift for every parameter, including all endpoints.

This is a new proof attempt, not yet an admitted result. Full source-root
residuals beyond the correction band remain even if this succeeds.
