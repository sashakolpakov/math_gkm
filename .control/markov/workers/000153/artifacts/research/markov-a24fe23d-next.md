# Revisable advice

Machine-authored a24fe23da04d441088b5fe10c2c4681e. Full root remains open.

Do not pursue PellReverseMidpointMA24: it is false. The initial small and
random midpoint scans missed the first a=22 failure. The uniform failure
family a=n+23 has a paper derivation; its Lean drafts timed out and are not accepted. The finite gap-three obstruction is in MarkovPellBandMA24, subject to validation.json. Likewise no
parameter-adaptive constant shifted min/max comparison works even at a=5,j=6.
Both failures are auxiliary; the actual source examples satisfy raw LC.

The useful uniform facts are reverse total positivity of the exact Pell
summand array, its zero-extended CrossLC rows, and the midpoint band q<=r+2.
Use these only with a summation argument that allows compensation across
summand pairs. The older centered-fiber/Abel approaches keep such compensation
explicit and may be more suitable; this is advice, not a prescribed recipe.
The full discrete midpoint summation theorem was retrieved but not formalized;
formalizing it cannot repair the now-false application premise.

No new complete source direction was established here. Retain OtherSourcesM679
and every unresolved larger-numerator clause, including reverse-factor ranges.
All source correspondence obligations, fresh rebuild and independent audit
remain mandatory before any root completion.
