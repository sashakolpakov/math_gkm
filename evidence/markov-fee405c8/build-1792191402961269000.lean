import MarkovLiftRatioMAE9
/-! Machine-authored fee405c8. Exact positive polynomial certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192
def cutCertificate0MFEE (t s : ℚ) : ℚ :=
 (1*t^11*s^2+5*t^11*s+6*t^11+10*t^10*s^3+127*t^10*s^2+445*t^10*s+462*t^10+41*t^9*s^4+892*t^9*s^3+6347*t^9*s^2+17470*t^9*s+16032*t^9+88*t^8*s^5+2930*t^8*s^4+33972*t^8*s^3+174854*t^8*s^2+401306*t^8*s+330908*t^8+104*t^7*s^6+5192*t^7*s^5+90334*t^7*s^4+736136*t^7*s^3+3028959*t^7*s^2+6013013*t^7*s+4513422*t^7+64*t^6*s^7+5080*t^6*s^6+131064*t^6*s^5+1582088*t^6*s^4+10122266*t^6*s^3+35131955*t^6*s^2+61847637*t^6*s+42709294*t^6+16*t^5*s^8+2560*t^5*s^7+104072*t^5*s^6+1849880*t^5*s^5+17383557*t^5*s^4+92712524*t^5*s^3+280749153*t^5*s^2+446324744*t^5*s+286075292*t^5+512*t^4*s^8+41536*t^4*s^7+1158664*t^4*s^6+15972368*t^4*s^5+124453918*t^4*s^4+574606728*t^4*s^3+1554138952*t^4*s^2+2262517396*t^4*s+1356216936*t^4+6288*t^3*s^8+349824*t^3*s^7+7568112*t^3*s^6+86404800*t^3*s^5+581146516*t^3*s^4+2384583440*t^3*s^3+5861903988*t^3*s^2+7902294752*t^3*s+4459058992*t^3+37152*t^2*s^8+1613056*t^2*s^7+28994752*t^2*s^6+286025856*t^2*s^5+1708034536*t^2*s^4+6351266112*t^2*s^3+14384830528*t^2*s^2+18122980928*t^2*s+9682339584*t^2+106048*t*s^8+3863552*t*s^7+60331904*t*s^6+529819136*t*s^5+2868754784*t*s^4+9815218688*t*s^3+20708852800*t*s^2+24574089216*t*s+12494797056*t+117504*s^8+3760128*s^7+52618752*s^6+420581376*s^5+2098930176*s^4+6689267712*s^3+13269136896*s^2+14930915328*s+7258761216)/1
theorem cut_certificate_nonneg0MFEE (t s : ℚ) (ht : 0 ≤ t) (hs : 0 ≤ s) :
 0 ≤ cutCertificate0MFEE t s := by
 unfold cutCertificate0MFEE
 positivity
theorem cut_certificate_identity0MFEE (t s : ℚ) :
 (let j := s+2; 2*j^2*(t+j+4)^2*(liftWeightMAE9 j (t+1) 1)^2*liftDenMAE9 t 0*liftDenMAE9 (t+2) 2*(t+5)-j*(j-1)*(t+j+4)*(t+j+5)*(t+4)*liftWeightMAE9 j t 0*liftWeightMAE9 j (t+2) 2*(liftDenMAE9 (t+1) 1)^2)=cutCertificate0MFEE t s := by
 unfold cutCertificate0MFEE liftWeightMAE9 liftDenMAE9
 dsimp
 ring
end
end MathGKM.Markov
