import MarkovCubicCycle6905
/-! Machine-authored request 6905e489. Newton identities turn the cubic
connected-string expansion into three scalar moments. Arbitrary commutative
rings, arbitrary ordered block lists of length at least four. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]

def powerSum6905 (k : ℕ) : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => (m.d.coeff 1)^k+powerSum6905 k ms
def same126905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 1*m.d.coeff 2+same126905 ms
def pairPenalty6905 : List (Mat16 R[X]) → R
 | [] => 0
 | [_] => 0
 | m::n::ns => m.c.coeff 1*n.b.coeff 1*(m.d.coeff 1+n.d.coeff 1)+pairPenalty6905 (n::ns)

theorem elementary2_newton6905 (ms : List (Mat16 R[X])) :
 2*elementary26905 ms=(sumD6905 ms)^2-powerSum6905 2 ms := by
 induction ms with
 | nil => simp [elementary26905,sumD6905,powerSum6905]
 | cons m ms ih =>
   simp only [elementary26905,sumD6905,powerSum6905]
   linear_combination ih

theorem elementary3_newton6905 (ms : List (Mat16 R[X])) :
 6*elementary36905 ms=(sumD6905 ms)^3-
 3*sumD6905 ms*powerSum6905 2 ms+2*powerSum6905 3 ms := by
 induction ms with
 | nil => simp [elementary36905,sumD6905,powerSum6905]
 | cons m ms ih =>
   simp only [elementary36905,sumD6905,powerSum6905]
   linear_combination ih+3*m.d.coeff 1*(elementary2_newton6905 ms)

theorem mixed12_moment6905 (ms : List (Mat16 R[X])) :
 mixed126905 ms=sumD6905 ms*single26905 ms-same126905 ms := by
 induction ms with
 | nil => simp [mixed126905,sumD6905,single26905,same126905]
 | cons m ms ih =>
   simp only [mixed126905,sumD6905,single26905,same126905]
   linear_combination ih

theorem pairFar_moment6905 (ms : List (Mat16 R[X])) :
 pairFar6905 ms=sumD6905 ms*pair26905 ms-pairPenalty6905 ms := by
 induction ms with
 | nil => simp [pairFar6905,sumD6905,pair26905,pairPenalty6905]
 | cons m ms ih =>
   cases ms with
   | nil => simp [pairFar6905,sumD6905,pair26905,pairPenalty6905,firstB6905]
   | cons n ns =>
     simp only [pairFar6905]
     rw [←show pairFar6905 (n::ns)=pairFar6905 (n::ns) from rfl]
     -- Keep the tail induction identity intact while expanding the head.
     change pairFar6905 (n::ns)+m.d.coeff 1*pair26905 (n::ns)+
       m.c.coeff 1*n.b.coeff 1*sumD6905 ns=_
     rw [ih]
     simp only [sumD6905,pair26905,pairPenalty6905,firstB6905]
     ring

def cyclicK6905 (m n : Mat16 R[X]) (ms : List (Mat16 R[X])) (p q : Mat16 R[X]) : R :=
 let w := m::n::(ms++[p,q])
 2*single26905 w+2*(pair26905 w+q.c.coeff 1*m.b.coeff 1)-powerSum6905 2 w
def cyclicL6905 (m n : Mat16 R[X]) (ms : List (Mat16 R[X])) (p q : Mat16 R[X]) : R :=
 let w := m::n::(ms++[p,q])
 2*powerSum6905 3 w-6*same126905 w+6*single36905 w+
 6*(pair36905 w+q.c.coeff 1*m.b.coeff 2+q.c.coeff 2*m.b.coeff 1)-
 6*(pairPenalty6905 w+q.c.coeff 1*m.b.coeff 1*(q.d.coeff 1+m.d.coeff 1))+
 6*(triple36905 w+p.c.coeff 1*q.a.coeff 1*m.b.coeff 1+
 q.c.coeff 1*m.a.coeff 1*n.b.coeff 1)

theorem cyclicCubic_moments6905 (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X])) :
 6*cyclicCubic6905 m n ms p q=(sumD6905 (m::n::(ms++[p,q])))^3+
 3*sumD6905 (m::n::(ms++[p,q]))*cyclicK6905 m n ms p q+
 cyclicL6905 m n ms p q := by
 let w := m::n::(ms++[p,q])
 have he := elementary3_newton6905 w
 have hm := mixed12_moment6905 w
 have hf := pairFar_moment6905 w
 have hd : sumD6905 w=m.d.coeff 1+sumD6905 (n::(ms++[p]))+q.d.coeff 1 := by
   simp [w,sumD6905,sumD_append6905]; ring
 change 6*cyclicCubic6905 m n ms p q=(sumD6905 w)^3+
   3*sumD6905 w*cyclicK6905 m n ms p q+cyclicL6905 m n ms p q
 unfold cyclicCubic6905 cyclicK6905 cyclicL6905
 change 6*(single36905 w+mixed126905 w+elementary36905 w+
   pair36905 w+pairFar6905 w+triple36905 w+
   q.c.coeff 1*m.b.coeff 2+q.c.coeff 2*m.b.coeff 1+
   q.c.coeff 1*m.b.coeff 1*sumD6905 (n::(ms++[p]))+
   p.c.coeff 1*q.a.coeff 1*m.b.coeff 1+q.c.coeff 1*m.a.coeff 1*n.b.coeff 1)=_
 linear_combination he+6*hm+6*hf-6*q.c.coeff 1*m.b.coeff 1*hd

theorem projection_trace3_moments6905 (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::(ms++[p,q]), Projection6905 z) :
 6*(tr16 (projProduct6905 (m::n::(ms++[p,q])))).coeff 3=
 (sumD6905 (m::n::(ms++[p,q])))^3+
 3*sumD6905 (m::n::(ms++[p,q]))*cyclicK6905 m n ms p q+
 cyclicL6905 m n ms p q := by
 rw [projection_trace3_cyclic6905 m n p q ms h,cyclicCubic_moments6905]

#print axioms elementary3_newton6905
#print axioms pairFar_moment6905
#print axioms projection_trace3_moments6905
end
end MathGKM.Markov
