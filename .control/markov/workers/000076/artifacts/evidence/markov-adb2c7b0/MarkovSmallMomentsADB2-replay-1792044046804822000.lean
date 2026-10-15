import MarkovCyclicLocalBridgeADB2
/-! Machine-authored request adb2c7b0. Exact small-cycle cubic cumulants,
including the terms omitted by the length-at-least-four formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]

theorem projection_three_momentADB2 (m n p : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) (hp : Projection6905 p)
 (mb : m.b.coeff 1=1) (nb : n.b.coeff 1=1) (pb : p.b.coeff 1=1) :
 let T := tr16 (mm16 m (mm16 n p))
 6*T.coeff 3=6*T.coeff 1*T.coeff 2-2*(T.coeff 1)^3+
 edgeLADB2 m n+edgeLADB2 n p+edgeLADB2 p m+
 6*m.a.coeff 1*n.a.coeff 1*p.a.coeff 1 := by
 have hj := projection_mul_jets6905 m (mm16 n p) hm (projection_mul6905 n p hn hp)
 have hk := projection_mul_jets6905 n p hn hp
 dsimp only
 simp only [tr16,Polynomial.coeff_add,hj.a1,hj.d1,hj.a2,hj.d2,hj.a3,hj.d3,
   hk.a1,hk.b1,hk.c1,hk.d1,hk.a2,hk.b2,hk.c2,hk.d2,hk.a3,hk.d3,
   edgeLADB2,singleLADB2,mb,nb,pb]
 ring

theorem projection_two_momentADB2 (m n : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n)
 (mb : m.b.coeff 1=1) (nb : n.b.coeff 1=1) :
 let T := tr16 (mm16 m n)
 6*T.coeff 3=6*T.coeff 1*T.coeff 2-2*(T.coeff 1)^3+
 edgeLADB2 m n+edgeLADB2 n m+
 6*(m.a.coeff 1*n.a.coeff 2+m.a.coeff 2*n.a.coeff 1-
   m.c.coeff 1*n.a.coeff 1-n.c.coeff 1*m.a.coeff 1-
   T.coeff 1*m.a.coeff 1*n.a.coeff 1) := by
 have hj := projection_mul_jets6905 m n hm hn
 dsimp only
 simp only [tr16,Polynomial.coeff_add,hj.a1,hj.d1,hj.a2,hj.d2,hj.a3,hj.d3,
   edgeLADB2,singleLADB2,mb,nb]
 ring

#print axioms projection_three_momentADB2
#print axioms projection_two_momentADB2
end
end MathGKM.Markov
