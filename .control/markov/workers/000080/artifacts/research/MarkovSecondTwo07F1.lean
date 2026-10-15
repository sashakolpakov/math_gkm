import MarkovSecondShape07F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem second_Two_shift07F1 (t s : ℤ) (ht : 0 ≤ t) (hs : 0 ≤ s) :
 secondShape07F1 (t+s+4) 2 1 (2*t+s+8)*secondShape07F1 (t+s+4) 2 1 (2*t+s+10) ≤
 (secondShape07F1 (t+s+4) 2 1 (2*t+s+9))^2 := by
 have he : (secondShape07F1 (t+s+4) 2 1 (2*t+s+9))^2-
  secondShape07F1 (t+s+4) 2 1 (2*t+s+8)*secondShape07F1 (t+s+4) 2 1 (2*t+s+10)=((((((((921600*s+13824000)*s+88012800)*s+304128000)*s+616089600)*s+718848000)*s+362880000)*t+(((((((737280*s+17510400)*s+163584000)*s+814464000)*s+2391736320)*s+4285670400)*s+4504550400)*s+2068416000))*t+((((((((230400*s+6451200)*s+77184000)*s+506880000)*s+2017382400)*s+5071564800)*s+8081395200)*s+7644672000)*s+3201120000)) := by
  unfold secondShape07F1
  ring
 have hp : 0 ≤ ((((((((921600*s+13824000)*s+88012800)*s+304128000)*s+616089600)*s+718848000)*s+362880000)*t+(((((((737280*s+17510400)*s+163584000)*s+814464000)*s+2391736320)*s+4285670400)*s+4504550400)*s+2068416000))*t+((((((((230400*s+6451200)*s+77184000)*s+506880000)*s+2017382400)*s+5071564800)*s+8081395200)*s+7644672000)*s+3201120000)) := by positivity
 omega
end
end MathGKM.Markov
