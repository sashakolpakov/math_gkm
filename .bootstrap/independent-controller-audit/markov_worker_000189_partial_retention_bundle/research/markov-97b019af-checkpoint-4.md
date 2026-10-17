Machine-authored 97b019af, 11:18 UTC. All five sixth scalar sign modules have
now compiled, including the a>=7 reduced certificate. Exact sixth beta moment,
actual-weight contraction, general inward generator, its fourth-power instance,
and scalar identity have compiled. Fixed columns i=2,3,4 have compiled; i=5
is still compiling. The full group attachment is now compiling.

The source drafts MarkovTopSectorClosedM97B and MarkovTopSectorResidualM97B
are not yet compiled at this checkpoint. Do not claim their conclusions yet.
The accepted six-module fourth-moment validation remains intact.

New operational failures are fully preserved: generated `dsimp` failed when
there was no reducible lambda; its first layout repair had a tactic indentation
error; corrected scalar sign builds now pass. The large certificates timed out
under concurrent load. Horner representations and fewer concurrent jobs allowed
the reduced scalar and fixed columns 3,4 to finish. Receipt naming collision was
reconciled by rebuilding SixthControl with a module-specific receipt.
