import MarkovFourthRunMomentBE
/-! Machine-authored 062809ba. Staged block expansion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
theorem lower0K062 : lowerMatrix487 0=⟨U^1*C (1*X),U^1*C (1),U^1*C (1*X),C (1)+U^1*C (1)⟩ := by
 apply Mat16.ext <;> norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V] <;> ring
theorem lower1K062 : lowerMatrix487 1=⟨U^1*C (2*X + 1*X^2)+U^2*C (1*X + 2*X^2 + 1*X^3),U^1*C (1)+U^2*C (1 + 2*X + 1*X^2),C (2*X)+U^1*C (3*X + 2*X^2)+U^2*C (1*X + 2*X^2 + 1*X^3),C (1)+U^1*C (2 + 1*X)+U^2*C (1 + 2*X + 1*X^2)⟩ := by
 rw [lowerMatrix_step487 0,lower0K062]
 apply Mat16.ext <;> norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V] <;> ring
theorem lower2K062 : lowerMatrix487 2=⟨U^1*C (2*X + 2*X^2 + 1*X^3)+U^2*C (3*X + 8*X^2 + 7*X^3 + 2*X^4)+U^3*C (1*X + 4*X^2 + 6*X^3 + 4*X^4 + 1*X^5),U^1*C (1)+U^2*C (2 + 5*X + 4*X^2 + 1*X^3)+U^3*C (1 + 4*X + 6*X^2 + 4*X^3 + 1*X^4),C (2*X + 2*X^2)+U^1*C (5*X + 8*X^2 + 4*X^3)+U^2*C (4*X + 11*X^2 + 10*X^3 + 3*X^4)+U^3*C (1*X + 4*X^2 + 6*X^3 + 4*X^4 + 1*X^5),C (1)+U^1*C (3 + 4*X + 2*X^2)+U^2*C (3 + 8*X + 7*X^2 + 2*X^3)+U^3*C (1 + 4*X + 6*X^2 + 4*X^3 + 1*X^4)⟩ := by
 rw [lowerMatrix_step487 1,lower1K062]
 apply Mat16.ext <;> norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V] <;> ring
theorem lower3K062 : lowerMatrix487 3=⟨U^1*C (2*X + 2*X^2 + 2*X^3 + 1*X^4)+U^2*C (5*X + 16*X^2 + 20*X^3 + 12*X^4 + 3*X^5)+U^3*C (4*X + 19*X^2 + 36*X^3 + 34*X^4 + 16*X^5 + 3*X^6)+U^4*C (1*X + 6*X^2 + 15*X^3 + 20*X^4 + 15*X^5 + 6*X^6 + 1*X^7),U^1*C (1)+U^2*C (3 + 8*X + 8*X^2 + 4*X^3 + 1*X^4)+U^3*C (3 + 14*X + 26*X^2 + 24*X^3 + 11*X^4 + 2*X^5)+U^4*C (1 + 6*X + 15*X^2 + 20*X^3 + 15*X^4 + 6*X^5 + 1*X^6),C (2*X + 2*X^2 + 2*X^3)+U^1*C (7*X + 16*X^2 + 16*X^3 + 6*X^4)+U^2*C (9*X + 32*X^2 + 44*X^3 + 28*X^4 + 7*X^5)+U^3*C (5*X + 24*X^2 + 46*X^3 + 44*X^4 + 21*X^5 + 4*X^6)+U^4*C (1*X + 6*X^2 + 15*X^3 + 20*X^4 + 15*X^5 + 6*X^6 + 1*X^7),C (1)+U^1*C (4 + 7*X + 6*X^2 + 2*X^3)+U^2*C (6 + 20*X + 26*X^2 + 16*X^3 + 4*X^4)+U^3*C (4 + 19*X + 36*X^2 + 34*X^3 + 16*X^4 + 3*X^5)+U^4*C (1 + 6*X + 15*X^2 + 20*X^3 + 15*X^4 + 6*X^5 + 1*X^6)⟩ := by
 rw [lowerMatrix_step487 2,lower2K062]
 apply Mat16.ext <;> norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V] <;> ring
theorem lower4K062 : lowerMatrix487 4=⟨U^1*C (2*X + 2*X^2 + 2*X^3 + 2*X^4 + 1*X^5)+U^2*C (7*X + 24*X^2 + 36*X^3 + 32*X^4 + 17*X^5 + 4*X^6)+U^3*C (9*X + 48*X^2 + 108*X^3 + 132*X^4 + 93*X^5 + 36*X^6 + 6*X^7)+U^4*C (5*X + 34*X^2 + 99*X^3 + 160*X^4 + 155*X^5 + 90*X^6 + 29*X^7 + 4*X^8)+U^5*C (1*X + 8*X^2 + 28*X^3 + 56*X^4 + 70*X^5 + 56*X^6 + 28*X^7 + 8*X^8 + 1*X^9),U^1*C (1)+U^2*C (4 + 11*X + 12*X^2 + 8*X^3 + 4*X^4 + 1*X^5)+U^3*C (6 + 30*X + 63*X^2 + 72*X^3 + 48*X^4 + 18*X^5 + 3*X^6)+U^4*C (4 + 27*X + 78*X^2 + 125*X^3 + 120*X^4 + 69*X^5 + 22*X^6 + 3*X^7)+U^5*C (1 + 8*X + 28*X^2 + 56*X^3 + 70*X^4 + 56*X^5 + 28*X^6 + 8*X^7 + 1*X^8),C (2*X + 2*X^2 + 2*X^3 + 2*X^4)+U^1*C (9*X + 24*X^2 + 32*X^3 + 24*X^4 + 8*X^5)+U^2*C (16*X + 67*X^2 + 120*X^3 + 116*X^4 + 60*X^5 + 13*X^6)+U^3*C (14*X + 78*X^2 + 183*X^3 + 232*X^4 + 168*X^5 + 66*X^6 + 11*X^7)+U^4*C (6*X + 41*X^2 + 120*X^3 + 195*X^4 + 190*X^5 + 111*X^6 + 36*X^7 + 5*X^8)+U^5*C (1*X + 8*X^2 + 28*X^3 + 56*X^4 + 70*X^5 + 56*X^6 + 28*X^7 + 8*X^8 + 1*X^9),C (1)+U^1*C (5 + 10*X + 10*X^2 + 6*X^3 + 2*X^4)+U^2*C (10 + 38*X + 62*X^2 + 56*X^3 + 28*X^4 + 6*X^5)+U^3*C (10 + 54*X + 123*X^2 + 152*X^3 + 108*X^4 + 42*X^5 + 7*X^6)+U^4*C (5 + 34*X + 99*X^2 + 160*X^3 + 155*X^4 + 90*X^5 + 29*X^6 + 4*X^7)+U^5*C (1 + 8*X + 28*X^2 + 56*X^3 + 70*X^4 + 56*X^5 + 28*X^6 + 8*X^7 + 1*X^8)⟩ := by
 rw [lowerMatrix_step487 3,lower3K062]
 apply Mat16.ext <;> norm_num [lowerMatrix487,lowerRun487,ambientWord5c,ambientT5c,mm16,U,V] <;> ring
end
end MathGKM.Markov
