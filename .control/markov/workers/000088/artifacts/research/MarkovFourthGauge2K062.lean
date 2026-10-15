import MarkovFourthRunMomentBE
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
theorem gauge2_00K062 :
 runBooleanGaugeADB2 2 false false=
 ⟨U^1*C (1*X^3)+U^2*C (-1*X + -6*X^2 + -11*X^3 + -8*X^4 + -2*X^5)+U^3*C (-1*X + -6*X^2 + -14*X^3 + -16*X^4 + -9*X^5 + -2*X^6),U^1*C (1)+U^2*C (2 + 5*X + 4*X^2 + 1*X^3)+U^3*C (1 + 4*X + 6*X^2 + 4*X^3 + 1*X^4),U^1*C (-1*X + -6*X^2 + -8*X^3 + -2*X^4 + 2*X^5)+U^2*C (-2*X + -13*X^2 + -34*X^3 + -49*X^4 + -42*X^5 + -20*X^6 + -4*X^7)+U^3*C (-1*X + -8*X^2 + -28*X^3 + -56*X^4 + -69*X^5 + -52*X^6 + -22*X^7 + -4*X^8),C (1)+U^1*C (3 + 6*X + 4*X^2)+U^2*C (3 + 12*X + 21*X^2 + 20*X^3 + 10*X^4 + 2*X^5)+U^3*C (1 + 6*X + 16*X^2 + 24*X^3 + 21*X^4 + 10*X^5 + 2*X^6)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
theorem gauge2_01K062 :
 runBooleanGaugeADB2 2 false true=
 ⟨U^1*C (1*X^4)+U^2*C (-1*X + -6*X^2 + -18*X^3 + -28*X^4 + -23*X^5 + -10*X^6 + -2*X^7)+U^3*C (-2*X + -15*X^2 + -50*X^3 + -94*X^4 + -106*X^5 + -71*X^6 + -26*X^7 + -4*X^8)+U^4*C (-1*X + -8*X^2 + -29*X^3 + -62*X^4 + -85*X^5 + -76*X^6 + -43*X^7 + -14*X^8 + -2*X^9),U^1*C (1)+U^2*C (3 + 8*X + 8*X^2 + 4*X^3 + 1*X^4)+U^3*C (3 + 14*X + 26*X^2 + 24*X^3 + 11*X^4 + 2*X^5)+U^4*C (1 + 6*X + 15*X^2 + 20*X^3 + 15*X^4 + 6*X^5 + 1*X^6),U^1*C (-1*X + -6*X^2 + -18*X^3 + -24*X^4 + -14*X^5 + -2*X^6)+U^2*C (-3*X + -22*X^2 + -74*X^3 + -144*X^4 + -177*X^5 + -142*X^6 + -74*X^7 + -24*X^8 + -4*X^9)+U^3*C (-3*X + -26*X^2 + -106*X^3 + -264*X^4 + -439*X^5 + -502*X^6 + -392*X^7 + -200*X^8 + -60*X^9 + -8*X^10)+U^4*C (-1*X + -10*X^2 + -47*X^3 + -136*X^4 + -267*X^5 + -370*X^6 + -365*X^7 + -252*X^8 + -116*X^9 + -32*X^10 + -4*X^11),C (1)+U^1*C (4 + 9*X + 8*X^2 + 2*X^3)+U^2*C (6 + 26*X + 48*X^2 + 48*X^3 + 28*X^4 + 10*X^5 + 2*X^6)+U^3*C (4 + 25*X + 70*X^2 + 114*X^3 + 116*X^4 + 73*X^5 + 26*X^6 + 4*X^7)+U^4*C (1 + 8*X + 29*X^2 + 62*X^3 + 85*X^4 + 76*X^5 + 43*X^6 + 14*X^7 + 2*X^8)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
theorem gauge2_10K062 :
 runBooleanGaugeADB2 2 true false=
 ⟨U^1*C (1*X^3)+U^2*C (-1*X + -6*X^2 + -11*X^3 + -8*X^4 + -2*X^5)+U^3*C (-1*X + -6*X^2 + -14*X^3 + -16*X^4 + -9*X^5 + -2*X^6),U^1*C (1)+U^2*C (2 + 5*X + 4*X^2 + 1*X^3)+U^3*C (1 + 4*X + 6*X^2 + 4*X^3 + 1*X^4),U^1*C (-1*X + -6*X^2 + -8*X^3 + -2*X^4 + 2*X^5 + 2*X^6)+U^2*C (-2*X + -13*X^2 + -34*X^3 + -51*X^4 + -54*X^5 + -42*X^6 + -20*X^7 + -4*X^8)+U^3*C (-1*X + -8*X^2 + -28*X^3 + -58*X^4 + -81*X^5 + -80*X^6 + -54*X^7 + -22*X^8 + -4*X^9),C (1)+U^1*C (3 + 6*X + 4*X^2 + 2*X^3)+U^2*C (3 + 12*X + 21*X^2 + 24*X^3 + 20*X^4 + 10*X^5 + 2*X^6)+U^3*C (1 + 6*X + 16*X^2 + 26*X^3 + 29*X^4 + 22*X^5 + 10*X^6 + 2*X^7)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
theorem gauge2_11K062 :
 runBooleanGaugeADB2 2 true true=
 ⟨U^1*C (1*X^4)+U^2*C (-1*X + -6*X^2 + -18*X^3 + -28*X^4 + -23*X^5 + -10*X^6 + -2*X^7)+U^3*C (-2*X + -15*X^2 + -50*X^3 + -94*X^4 + -106*X^5 + -71*X^6 + -26*X^7 + -4*X^8)+U^4*C (-1*X + -8*X^2 + -29*X^3 + -62*X^4 + -85*X^5 + -76*X^6 + -43*X^7 + -14*X^8 + -2*X^9),U^1*C (1)+U^2*C (3 + 8*X + 8*X^2 + 4*X^3 + 1*X^4)+U^3*C (3 + 14*X + 26*X^2 + 24*X^3 + 11*X^4 + 2*X^5)+U^4*C (1 + 6*X + 15*X^2 + 20*X^3 + 15*X^4 + 6*X^5 + 1*X^6),U^1*C (-1*X + -6*X^2 + -18*X^3 + -24*X^4 + -14*X^5 + -2*X^6 + 2*X^7)+U^2*C (-3*X + -22*X^2 + -74*X^3 + -146*X^4 + -189*X^5 + -178*X^6 + -130*X^7 + -70*X^8 + -24*X^9 + -4*X^10)+U^3*C (-3*X + -26*X^2 + -106*X^3 + -268*X^4 + -469*X^5 + -602*X^6 + -580*X^7 + -412*X^8 + -202*X^9 + -60*X^10 + -8*X^11)+U^4*C (-1*X + -10*X^2 + -47*X^3 + -138*X^4 + -283*X^5 + -428*X^6 + -489*X^7 + -422*X^8 + -268*X^9 + -118*X^10 + -32*X^11 + -4*X^12),C (1)+U^1*C (4 + 9*X + 8*X^2 + 4*X^3)+U^2*C (6 + 26*X + 48*X^2 + 54*X^3 + 44*X^4 + 26*X^5 + 10*X^6 + 2*X^7)+U^3*C (4 + 25*X + 70*X^2 + 120*X^3 + 144*X^4 + 125*X^5 + 74*X^6 + 26*X^7 + 4*X^8)+U^4*C (1 + 8*X + 29*X^2 + 64*X^3 + 97*X^4 + 106*X^5 + 83*X^6 + 44*X^7 + 14*X^8 + 2*X^9)⟩ := by
 apply Mat16.ext <;>
   norm_num [runBooleanGaugeADB2,gauge75,shear75,unshear75,lowerMatrix487,lowerRun487,
     List.replicate_succ,List.replicate_zero,ambientWord5c,ambientT5c,mm16,U,V,
     runSumA27,Finset.sum_range_succ,map_ofNat] <;> ring
end
end MathGKM.Markov
