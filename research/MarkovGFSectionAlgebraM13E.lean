import MarkovGFAlgebraM13E
/-! Machine-authored 13e37040. Polynomial trisection certificate. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 20000000
set_option maxRecDepth 10000
def gfMasterDenM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 (1-v*t^2)^2*(1-v*t)^3*((1-t)*(1-v*t)-u*t)
def gfMasterNumM13E {R : Type*} [CommRing R] (u v t : R) : R := u^3*t*(1+v*t^2)^2
def gfConjugateM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 (1+v*t^2+v^2*t^4)^2*(1+v*t+v^2*t^2)^3*
 (1+(u+v+1)*t+((u+v+1)^2-v)*t^2+(u+v+1)*v*t^3+v^2*t^4)
def gfD0NumM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 u^3*t+8*u^3*v*t+10*u^3*v^2*t+24*u^3*v^2*t^2+88*u^3*v^3*t^2+10*u^3*v^3*t^3+83*u^3*v^4*t^2+128*u^3*v^4*t^3+16*u^3*v^5*t^2+304*u^3*v^5*t^3+36*u^3*v^5*t^4+226*u^3*v^6*t^3+256*u^3*v^6*t^4+u^3*v^6*t^5+44*u^3*v^7*t^3+446*u^3*v^7*t^4+44*u^3*v^7*t^5+u^3*v^8*t^3+256*u^3*v^8*t^4+226*u^3*v^8*t^5+36*u^3*v^9*t^4+304*u^3*v^9*t^5+16*u^3*v^9*t^6+128*u^3*v^10*t^5+83*u^3*v^10*t^6+10*u^3*v^11*t^5+88*u^3*v^11*t^6+24*u^3*v^12*t^6+10*u^3*v^12*t^7+8*u^3*v^13*t^7+u^3*v^14*t^7+2*u^4*t+5*u^4*v*t+36*u^4*v^2*t^2+68*u^4*v^3*t^2+20*u^4*v^3*t^3+20*u^4*v^4*t^2+170*u^4*v^4*t^3+228*u^4*v^5*t^3+60*u^4*v^5*t^4+65*u^4*v^6*t^3+296*u^4*v^6*t^4+2*u^4*v^6*t^5+2*u^4*v^7*t^3+296*u^4*v^7*t^4+65*u^4*v^7*t^5+60*u^4*v^8*t^4+228*u^4*v^8*t^5+170*u^4*v^9*t^5+20*u^4*v^9*t^6+20*u^4*v^10*t^5+68*u^4*v^10*t^6+36*u^4*v^11*t^6+5*u^4*v^12*t^7+2*u^4*v^13*t^7+u^5*t+12*u^5*v^2*t^2+7*u^5*v^3*t^2+10*u^5*v^3*t^3+48*u^5*v^4*t^3+24*u^5*v^5*t^3+24*u^5*v^5*t^4+u^5*v^6*t^3+70*u^5*v^6*t^4+u^5*v^6*t^5+24*u^5*v^7*t^4+24*u^5*v^7*t^5+48*u^5*v^8*t^5+10*u^5*v^9*t^5+7*u^5*v^9*t^6+12*u^5*v^10*t^6+u^5*v^12*t^7

theorem gf_master_normM13E {R : Type*} [CommRing R] (u v t : R) :
 gfMasterDenM13E u v t*gfConjugateM13E u v t=
 gfRampM13E v (t^3)*gfUpperM13E v (t^3)*gfCubeM13E u v (t^3) := by
 simp only [gfMasterDenM13E,gfConjugateM13E,gfRampM13E,gfUpperM13E,gfCubeM13E]
 ring

theorem gf_master_numerM13E {R : Type*} [CommRing R] (u v t : R) :
 gfMasterNumM13E u v t*gfConjugateM13E u v t=
 gfD0NumM13E u v (t^3)+t*gfDNumM13E u v (t^3) true+t^2*gfDNumM13E u v (t^3) false := by
 simp only [gfMasterNumM13E,gfConjugateM13E,gfD0NumM13E,gfDNumM13E,
   Bool.false_eq_true,if_true,if_false]
 ring
end
end MathGKM.Markov
