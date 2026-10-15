import MarkovThirdMoments6905
/-! Machine-authored request 6905e489. Finite local-moment aggregation.
Count identities are explicit hypotheses; no source-family claim is made here. -/
namespace MathGKM.Markov
noncomputable section
open scoped BigOperators
variable {R α : Type*} [CommRing R]

theorem localK_group6905 (y : R) (p q : Bool) :
 localK6905 y p q= (-1+2*y)+bit6905 p*(-4*y)+
 bit6905 q*(-1-4*y+y^2)+(bit6905 p*bit6905 q)*(8*y^3) := by
 rw [localK_expand6905]; ring

theorem localL_group6905 (y : R) (p q r : Bool) :
 localL6905 y p q r= (2-12*y+6*y^2)+
 bit6905 p*(12*y-12*y^2+4*y^3)+bit6905 q*(2+18*y-18*y^2-10*y^3)+
 bit6905 r*(12*y^3)+(bit6905 p*bit6905 q)*(-120*y^3-96*y^4)+
 (bit6905 q*bit6905 r)*(-24*y^3)+(bit6905 p*bit6905 r)*(24*y^4)+
 (bit6905 p*bit6905 q*bit6905 r)*(-24*y^4+24*y^5) := by
 rw [localL_expand6905]; ring

theorem localK_sum6905 (s : Finset α) (p q : α → Bool) (y c r a : R)
 (hc : (s.card:R)=c) (hp : (∑ i∈s,bit6905 (p i))=r)
 (hq : (∑ i∈s,bit6905 (q i))=r)
 (ha : (∑ i∈s,bit6905 (p i)*bit6905 (q i))=a) :
 (∑ i∈s,localK6905 y (p i) (q i))=momentK6905 y c r a := by
 simp_rw [localK_group6905,Finset.sum_add_distrib,←Finset.sum_mul]
 rw [hp,hq,ha]
 simp only [Finset.sum_const,nsmul_eq_mul,hc,momentK6905]
 ring

theorem localL_sum6905 (s : Finset α) (p q v : α → Bool) (y c r a t u : R)
 (hc : (s.card:R)=c) (hp : (∑ i∈s,bit6905 (p i))=r)
 (hq : (∑ i∈s,bit6905 (q i))=r) (hv : (∑ i∈s,bit6905 (v i))=r)
 (ha : (∑ i∈s,bit6905 (p i)*bit6905 (q i))=a)
 (hb : (∑ i∈s,bit6905 (q i)*bit6905 (v i))=a)
 (ht : (∑ i∈s,bit6905 (p i)*bit6905 (v i))=t+u)
 (hu : (∑ i∈s,bit6905 (p i)*bit6905 (q i)*bit6905 (v i))=u) :
 (∑ i∈s,localL6905 y (p i) (q i) (v i))=momentL6905 y c r a t u := by
 simp_rw [localL_group6905,Finset.sum_add_distrib,←Finset.sum_mul]
 rw [hp,hq,hv,ha,hb,ht,hu]
 simp only [Finset.sum_const,nsmul_eq_mul,hc,momentL6905]
 ring

#print axioms localK_sum6905
#print axioms localL_sum6905
end
end MathGKM.Markov
