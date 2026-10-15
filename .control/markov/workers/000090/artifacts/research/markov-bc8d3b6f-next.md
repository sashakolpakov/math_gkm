# Revisable next research actions

The full pinned root remains open. Use final `validation.json` to distinguish
accepted modules from generated or rejected drafts.

`research/MarkovFourthBinomialBC.lean` now provides a compact route from the
actual source polynomial to every fourth-slice coefficient, for all run
lengths and predecessor denominators at least five:

* `fourth_normalizeBC`: common denominator `(1-X)^8` with a factored polynomial
  numerator, valid uniformly in n, c, r with c>=5.
* `source_fourth_clearedBC`: the exact source polynomial identity.
* `source_fourth_binomialBC`: the raw coefficient is a finite binomial sum,
  with the uniform scalar 24 and no support filtering.

The main remaining pre-shift bridge is no longer an arbitrary fraction-field
coefficient extraction. It is a polynomial truncation statement. Show that
the numerator at `Z=X^n` and at `Z=0` have identical coefficients in the
required initial interval, then identify the latter with the inherited
411-term numerator and its 202-term coefficient shape. The ring-map laws of
`fourthNumeratorBC` and its components may make a quotient by `(X^n)` useful.
The experimental shifted blocks begin at `X^(n+2)`; this stronger support
bound still needs proof if the endpoint of the proposed interval uses it.

An expanded candidate for the zero-Z identity is in `MarkovFourthLowBC.lean`.
It timed out after 100 seconds and is excluded from the final inventory.
A more economical proof may first show that the zero-Z local
moments depend only on their second Boolean entry, and simplify the cyclic
moment before expanding the global polynomial. Avoid replaying the expensive
expanded rational local-moment drafts: the accepted factored assembly replaces
them and their failures are retained.

The inherited pre-shift gap certificates still require Lean checking and
connection to raw coefficients; they do not follow from a coefficient identity
alone. Handle low boundary positions, shifted blocks, and c=2,3,4 explicitly.
Horizontal, vertical, and higher-diagonal interiors remain separate root
obligations, so another representation may be more useful than extending
this slice route. No full-root closure without every correspondence bridge.
