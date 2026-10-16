import MarkovLiftRatioMAE9
/-! Machine-authored fee405c8. Exact positive polynomial certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
def cutCertificate1MFEE (t s : ℚ) : ℚ :=
 (1*t^11*s+2*t^11+10*t^10*s^2+97*t^10*s+154*t^10+41*t^9*s^3+765*t^9*s^2+4034*t^9*s+5336*t^9+88*t^8*s^4+2634*t^8*s^3+25704*t^8*s^2+96498*t^8*s+109844*t^8+104*t^7*s^5+4780*t^7*s^4+74010*t^7*s^3+501062*t^7*s^2+1489105*t^7*s+1492890*t^7+64*t^6*s^6+4736*t^6*s^5+112100*t^6*s^4+1194652*t^6*s^3+6288942*t^6*s^2+15656001*t^6*s+14067306*t^6+16*t^5*s^7+2400*t^5*s^6+91224*t^5*s^5+1482332*t^5*s^4+12215185*t^5*s^3+53186521*t^5*s^2+114879996*t^5*s+93785692*t^5+480*t^4*s^7+36896*t^4*s^6+962880*t^4*s^5+12086532*t^4*s^4+82077362*t^4*s^3+307289328*t^4*s^2+589912524*t^4*s+442414376*t^4+5616*t^3*s^7+297504*t^3*s^6+6012000*t^3*s^5+62217080*t^3*s^4+362514188*t^3*s^3+1198630276*t^3*s^2+2081509488*t^3*s+1447200688*t^3+32096*t^2*s^7+1326752*t^2*s^6+22197408*t^2*s^5+197430080*t^2*s^4+1015059368*t^2*s^3+3022845520*t^2*s^2+4813360160*t^2*s+3126445120*t^2+89792*t*s^7+3103104*t*s^6+44866048*t*s^5+353066368*t*s^4+1635257440*t*s^3+4452845312*t*s^2+6572157056*t*s+4014538752*t+98560*s^7+2974720*s^6+38295040*s^5+272419840*s^4+1154944000*s^3+2910530560*s^2+4017377280*s+2321141760)/1
theorem cut_certificate_nonneg1MFEE (t s : ℚ) (ht : 0 ≤ t) (hs : 0 ≤ s) :
 0 ≤ cutCertificate1MFEE t s := by
 unfold cutCertificate1MFEE
 positivity
theorem cut_certificate_identity1MFEE (t s : ℚ) :
 (let j := s+2; 2*j*(t+j+4)^2*liftWeightMAE9 j (t+1) 1*liftWeightMAE9 j (t+1) 0*liftDenMAE9 t 0*liftDenMAE9 (t+2) 1*(t+5)-j*(t+j+4)*(t+j+5)*(t+4)*liftWeightMAE9 j t 0*liftWeightMAE9 j (t+2) 1*liftDenMAE9 (t+1) 1*liftDenMAE9 (t+1) 0)=cutCertificate1MFEE t s := by
 unfold cutCertificate1MFEE liftWeightMAE9 liftDenMAE9
 dsimp
 ring
end
end MathGKM.Markov
