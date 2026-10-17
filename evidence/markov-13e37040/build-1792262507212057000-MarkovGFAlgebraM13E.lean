import MarkovThreeSeriesM9E2
/-! Machine-authored 13e3704044384ce789e16ba0f49af882. Exact rational
generating-function algebra. Binomial coefficient extraction is a separate bridge. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 10000

def gfSourceNumM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) : R :=
 if r then v-v*t+2*v^2-3*v^2*t+v^2*t^2+v^3-4*v^3*t+3*v^3*t^2-3*v^4*t+4*v^4*t^2-v^4*t^3-v^5*t+3*v^5*t^2-2*v^5*t^3+v^6*t^2-v^6*t^3+2*u*v-5*u*v*t+3*u*v^2-15*u*v^2*t+6*u*v^2*t^2-15*u*v^3*t+15*u*v^3*t^2-4*u*v^4*t+11*u*v^4*t^2-u*v^4*t^3+3*u*v^5*t^2+3*u^2*v-12*u^2*v*t-21*u^2*v^2*t+9*u^2*v^2*t^2-6*u^2*v^3*t+12*u^2*v^3*t^2+3*u^2*v^4*t^2+u^3-9*u^3*v*t-4*u^3*v^2*t+4*u^3*v^2*t^2+u^3*v^3*t^2-u^4*v*t
 else v^2-v^2*t+2*v^3-3*v^3*t+v^3*t^2+v^4-4*v^4*t+3*v^4*t^2-3*v^5*t+4*v^5*t^2-v^5*t^3-v^6*t+3*v^6*t^2-2*v^6*t^3+v^7*t^2-v^7*t^3+5*u*v^2-8*u*v^2*t+4*u*v^3-19*u*v^3*t+9*u*v^3*t^2-15*u*v^4*t+15*u*v^4*t^2-5*u*v^5*t+11*u*v^5*t^2+4*u*v^6*t^2-u*v^6*t^3+4*u^2*v-4*u^2*v*t+6*u^2*v^2-24*u^2*v^2*t-27*u^2*v^3*t+12*u^2*v^3*t^2-10*u^2*v^4*t+13*u^2*v^4*t^2+6*u^2*v^5*t^2+u^3+4*u^3*v-9*u^3*v*t-21*u^3*v^2*t-10*u^3*v^3*t+5*u^3*v^3*t^2+4*u^3*v^4*t^2+u^4-6*u^4*v*t-5*u^4*v^2*t+u^4*v^3*t^2-u^5*v*t

def gfDNumM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) : R :=
 if r then u^3+8*u^3*v*t+26*u^3*v^2*t+8*u^3*v^2*t^2+16*u^3*v^3*t+82*u^3*v^3*t^2+163*u^3*v^4*t^2+48*u^3*v^4*t^3+92*u^3*v^5*t^2+260*u^3*v^5*t^3+4*u^3*v^5*t^4+10*u^3*v^6*t^2+376*u^3*v^6*t^3+97*u^3*v^6*t^4+172*u^3*v^7*t^3+358*u^3*v^7*t^4+4*u^3*v^7*t^5+17*u^3*v^8*t^3+392*u^3*v^8*t^4+74*u^3*v^8*t^5+136*u^3*v^9*t^4+220*u^3*v^9*t^5+8*u^3*v^10*t^4+184*u^3*v^10*t^5+19*u^3*v^10*t^6+42*u^3*v^11*t^5+56*u^3*v^11*t^6+34*u^3*v^12*t^6+4*u^3*v^13*t^6+4*u^3*v^13*t^7+u^3*v^14*t^7+11*u^4*v*t+12*u^4*v^2*t+16*u^4*v^2*t^2+100*u^4*v^3*t^2+95*u^4*v^4*t^2+78*u^4*v^4*t^3+15*u^4*v^5*t^2+280*u^4*v^5*t^3+8*u^4*v^5*t^4+208*u^4*v^6*t^3+140*u^4*v^6*t^4+29*u^4*v^7*t^3+342*u^4*v^7*t^4+7*u^4*v^7*t^5+190*u^4*v^8*t^4+92*u^4*v^8*t^5+16*u^4*v^9*t^4+176*u^4*v^9*t^5+66*u^4*v^10*t^5+19*u^4*v^10*t^6+35*u^4*v^11*t^6+8*u^4*v^12*t^6+u^4*v^13*t^7+3*u^5*v*t+8*u^5*v^2*t^2+24*u^5*v^3*t^2+6*u^5*v^4*t^2+30*u^5*v^4*t^3+56*u^5*v^5*t^3+4*u^5*v^5*t^4+12*u^5*v^6*t^3+48*u^5*v^6*t^4+60*u^5*v^7*t^4+3*u^5*v^7*t^5+8*u^5*v^8*t^4+28*u^5*v^8*t^5+24*u^5*v^9*t^5+6*u^5*v^10*t^6+4*u^5*v^11*t^6
 else u^3+4*u^3*v+4*u^3*v*t+34*u^3*v^2*t+56*u^3*v^3*t+42*u^3*v^3*t^2+19*u^3*v^4*t+184*u^3*v^4*t^2+8*u^3*v^4*t^3+220*u^3*v^5*t^2+136*u^3*v^5*t^3+74*u^3*v^6*t^2+392*u^3*v^6*t^3+17*u^3*v^6*t^4+4*u^3*v^7*t^2+358*u^3*v^7*t^3+172*u^3*v^7*t^4+97*u^3*v^8*t^3+376*u^3*v^8*t^4+10*u^3*v^8*t^5+4*u^3*v^9*t^3+260*u^3*v^9*t^4+92*u^3*v^9*t^5+48*u^3*v^10*t^4+163*u^3*v^10*t^5+82*u^3*v^11*t^5+16*u^3*v^11*t^6+8*u^3*v^12*t^5+26*u^3*v^12*t^6+8*u^3*v^13*t^6+u^3*v^14*t^7+u^4+8*u^4*v*t+35*u^4*v^2*t+19*u^4*v^3*t+66*u^4*v^3*t^2+176*u^4*v^4*t^2+16*u^4*v^4*t^3+92*u^4*v^5*t^2+190*u^4*v^5*t^3+7*u^4*v^6*t^2+342*u^4*v^6*t^3+29*u^4*v^6*t^4+140*u^4*v^7*t^3+208*u^4*v^7*t^4+8*u^4*v^8*t^3+280*u^4*v^8*t^4+15*u^4*v^8*t^5+78*u^4*v^9*t^4+95*u^4*v^9*t^5+100*u^4*v^10*t^5+16*u^4*v^11*t^5+12*u^4*v^11*t^6+11*u^4*v^12*t^6+4*u^5*v*t+6*u^5*v^2*t+24*u^5*v^3*t^2+28*u^5*v^4*t^2+8*u^5*v^4*t^3+3*u^5*v^5*t^2+60*u^5*v^5*t^3+48*u^5*v^6*t^3+12*u^5*v^6*t^4+4*u^5*v^7*t^3+56*u^5*v^7*t^4+30*u^5*v^8*t^4+6*u^5*v^8*t^5+24*u^5*v^9*t^5+8*u^5*v^10*t^5+3*u^5*v^11*t^6

def gfLow0M13E {R : Type*} [CommRing R] (v t : R) (r : Bool) : R :=
 if r then v+2*v^2-v^2*t+v^3-4*v^3*t-7*v^4*t+2*v^4*t^2-6*v^5*t+7*v^5*t^2-2*v^6*t+12*v^6*t^2-v^6*t^3+12*v^7*t^2-6*v^7*t^3+6*v^8*t^2-12*v^8*t^3+v^9*t^2-12*v^9*t^3+2*v^9*t^4-7*v^10*t^3+6*v^10*t^4-2*v^11*t^3+7*v^11*t^4+4*v^12*t^4-v^12*t^5+v^13*t^4-2*v^13*t^5-v^14*t^5
 else v^2+2*v^3-v^3*t+v^4-4*v^4*t-7*v^5*t+2*v^5*t^2-6*v^6*t+7*v^6*t^2-2*v^7*t+12*v^7*t^2-v^7*t^3+12*v^8*t^2-6*v^8*t^3+6*v^9*t^2-12*v^9*t^3+v^10*t^2-12*v^10*t^3+2*v^10*t^4-7*v^11*t^3+6*v^11*t^4-2*v^12*t^3+7*v^12*t^4+4*v^13*t^4-v^13*t^5+v^14*t^4-2*v^14*t^5-v^15*t^5

def gfLow1M13E {R : Type*} [CommRing R] (v t : R) (r : Bool) : R :=
 if r then 2*v+3*v^2-2*v^2*t-3*v^3*t-v^4*t-3*v^5*t-v^5*t^2+2*v^6*t^3-v^7*t^2+3*v^7*t^3+2*v^8*t^3+3*v^9*t^3-v^9*t^4-3*v^10*t^4+v^11*t^4-v^12*t^5
 else 5*v^2+4*v^3-5*v^3*t-6*v^4*t-9*v^5*t+2*v^5*t^2-5*v^6*t+6*v^6*t^2+7*v^7*t^2+3*v^7*t^3+6*v^8*t^2-2*v^8*t^3+v^9*t^2-3*v^9*t^3-2*v^10*t^3-3*v^10*t^4-2*v^11*t^3+v^11*t^4+2*v^12*t^4+v^13*t^4-v^14*t^5

def gfLow2M13E {R : Type*} [CommRing R] (v t : R) (r : Bool) : R :=
 if r then 3*v+5*v^2*t+18*v^3*t+6*v^4*t+2*v^4*t^2+5*v^5*t^2-3*v^6*t^3-16*v^7*t^3-10*v^8*t^3-6*v^9*t^4-4*v^10*t^4
 else 4*v+6*v^2+10*v^3*t+16*v^4*t+3*v^5*t-5*v^6*t^2-2*v^7*t^2-6*v^7*t^3-18*v^8*t^3-5*v^9*t^3-3*v^10*t^4

def gfLowNumM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) : R :=
 gfLow0M13E v t r+u*gfLow1M13E v t r+u^2*gfLow2M13E v t r
def gfSmallM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 (1-v*t)*(1-v^2*t)-u*v*t
def gfCubeM13E {R : Type*} [CommRing R] (u v t : R) : R :=
 1-((u+v+1)^3-3*v*(u+v+1))*t+v^3*t^2
def gfRampM13E {R : Type*} [CommRing R] (v t : R) : R := (1-v^3*t^2)^2
def gfUpperM13E {R : Type*} [CommRing R] (v t : R) : R := (1-v^3*t)^3
def gfLowerM13E {R : Type*} [CommRing R] (v t : R) : R := (1-v*t)*(1-v^2*t)^2
def gfENumM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) : R :=
 if r then 4*u^3*v^4*t^3*(2+v^3*t^2) else 4*u^3*v^3*t^2*(1+2*v^3*t^2)

theorem gf_algebraM13E {R : Type*} [CommRing R] (u v t : R) (r : Bool) :
 gfSourceNumM13E u v t r*gfRampM13E v t*gfUpperM13E v t*gfLowerM13E v t =
 gfDNumM13E u v t r*gfLowerM13E v t*gfSmallM13E u v t+
 gfENumM13E u v t r*gfUpperM13E v t*gfCubeM13E u v t+
 gfLowNumM13E u v t r*gfSmallM13E u v t*gfCubeM13E u v t*gfRampM13E v t := by
 cases r <;> simp only [gfSourceNumM13E,gfRampM13E,gfUpperM13E,gfLowerM13E,
   gfSmallM13E,gfCubeM13E,gfDNumM13E,gfENumM13E,gfLowNumM13E,
   gfLow0M13E,gfLow1M13E,gfLow2M13E,Bool.false_eq_true,if_false,if_true] <;> ring

end
end MathGKM.Markov
