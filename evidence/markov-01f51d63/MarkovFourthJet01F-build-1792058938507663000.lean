import MarkovProjectionJet6905
/-! Machine-authored live request 01f51d63. Exact fourth logarithmic jets.
The displayed integer polynomial is 24 times the fourth formal logarithm
coefficient when the constant coefficient is one. No logarithm or division
is needed in any definition or proof. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 4000000

def logFour01F (p : R[X]) : R :=
 24*p.coeff 4-24*p.coeff 1*p.coeff 3-12*(p.coeff 2)^2+
 24*(p.coeff 1)^2*p.coeff 2-6*(p.coeff 1)^4
def ratioOne01F (p q : R[X]) : R := p.coeff 1
def ratioTwo01F (p q : R[X]) : R := p.coeff 2-p.coeff 1*q.coeff 1
def ratioThree01F (p q : R[X]) : R :=
 p.coeff 3-p.coeff 2*q.coeff 1+p.coeff 1*((q.coeff 1)^2-q.coeff 2)

theorem coeff_mul_four01F (p q : R[X]) :
 (p*q).coeff 4=p.coeff 0*q.coeff 4+p.coeff 1*q.coeff 3+
 p.coeff 2*q.coeff 2+p.coeff 3*q.coeff 1+p.coeff 4*q.coeff 0 := by
 simp [Polynomial.coeff_mul,Finset.Nat.antidiagonal_succ,
   Finset.Nat.antidiagonal_zero,add_assoc]

def localFour01F (m : Mat16 R[X]) (r s t : R) : R :=
 let g1 := m.d.coeff 1
 let g2 := m.d.coeff 2+m.c.coeff 1*r
 let g3 := m.d.coeff 3+m.c.coeff 1*s+m.c.coeff 2*r
 let g4 := m.d.coeff 4+m.c.coeff 1*t+m.c.coeff 2*s+m.c.coeff 3*r
 24*g4-24*g1*g3-12*g2^2+24*g1^2*g2-6*g1^4

theorem ratio_mul01F (m n : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) :
 ratioOne01F (mm16 m n).b (mm16 m n).d=m.b.coeff 1 ∧
 ratioTwo01F (mm16 m n).b (mm16 m n).d=
 m.b.coeff 2+m.a.coeff 1*ratioOne01F n.b n.d-m.b.coeff 1*m.d.coeff 1 ∧
 ratioThree01F (mm16 m n).b (mm16 m n).d=
 m.b.coeff 3+m.a.coeff 1*ratioTwo01F n.b n.d+m.a.coeff 2*ratioOne01F n.b n.d-
 (m.b.coeff 2+m.a.coeff 1*ratioOne01F n.b n.d)*m.d.coeff 1+
 m.b.coeff 1*((m.d.coeff 1)^2-m.d.coeff 2-m.c.coeff 1*ratioOne01F n.b n.d) := by
 obtain ⟨ma,mb,mc,md⟩ := hm
 obtain ⟨na,nb,nc,nd⟩ := hn
 simp only [ratioOne01F,ratioTwo01F,ratioThree01F,mm16,Polynomial.coeff_add,
   coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,ma,mb,mc,md,na,nb,nc,nd]
 constructor
 · ring
 constructor <;> ring

theorem logFour_mul01F (m n : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) :
 logFour01F (mm16 m n).d=logFour01F n.d+
 localFour01F m (ratioOne01F n.b n.d) (ratioTwo01F n.b n.d) (ratioThree01F n.b n.d) := by
 obtain ⟨ma,mb,mc,md⟩ := hm
 obtain ⟨na,nb,nc,nd⟩ := hn
 simp only [logFour01F,localFour01F,ratioOne01F,ratioTwo01F,ratioThree01F,
   mm16,Polynomial.coeff_add,coeff_mul_one46,coeff_mul_two8934,
   coeff_mul_three6905,coeff_mul_four01F,ma,mb,mc,md,na,nb,nc,nd]
 ring

def headRatioOne01F : List (Mat16 R[X]) → R
 | [] => 0
 | m::_ => m.b.coeff 1
def headRatioTwo01F : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.b.coeff 2+m.a.coeff 1*headRatioOne01F ms-m.b.coeff 1*m.d.coeff 1
def headRatioThree01F : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.b.coeff 3+m.a.coeff 1*headRatioTwo01F ms+m.a.coeff 2*headRatioOne01F ms-
   (m.b.coeff 2+m.a.coeff 1*headRatioOne01F ms)*m.d.coeff 1+
   m.b.coeff 1*((m.d.coeff 1)^2-m.d.coeff 2-m.c.coeff 1*headRatioOne01F ms)
def openFour01F : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => localFour01F m (headRatioOne01F ms) (headRatioTwo01F ms)
     (headRatioThree01F ms)+openFour01F ms

theorem product_ratios01F (w : List (Mat16 R[X]))
 (h : ∀ m∈w,Projection6905 m) :
 ratioOne01F (projProduct6905 w).b (projProduct6905 w).d=headRatioOne01F w ∧
 ratioTwo01F (projProduct6905 w).b (projProduct6905 w).d=headRatioTwo01F w ∧
 ratioThree01F (projProduct6905 w).b (projProduct6905 w).d=headRatioThree01F w := by
 induction w with
 | nil => simp [projProduct6905,ratioOne01F,ratioTwo01F,ratioThree01F,
     headRatioOne01F,headRatioTwo01F,headRatioThree01F]
 | cons m ms ih =>
   have ht : ∀ z∈ms,Projection6905 z := by intro z hz; exact h z (by simp [hz])
   cases ms with
   | nil => simp [projProduct_single6905,ratioOne01F,ratioTwo01F,ratioThree01F,
       headRatioOne01F,headRatioTwo01F,headRatioThree01F]
   | cons n ns =>
     have hh := ratio_mul01F m (projProduct6905 (n::ns)) (h m (by simp))
       (projProduct_shape6905 n ns ht)
     obtain ⟨h1,h2,h3⟩ := ih ht
     simpa only [projProduct6905,headRatioOne01F,headRatioTwo01F,headRatioThree01F,
       h1,h2,h3] using hh

theorem product_openFour01F (w : List (Mat16 R[X]))
 (h : ∀ m∈w,Projection6905 m) :
 logFour01F (projProduct6905 w).d=openFour01F w := by
 induction w with
 | nil => simp [projProduct6905,logFour01F,openFour01F]
 | cons m ms ih =>
   have ht : ∀ z∈ms,Projection6905 z := by intro z hz; exact h z (by simp [hz])
   cases ms with
   | nil => simp [projProduct_single6905,logFour01F,openFour01F,localFour01F,
       headRatioOne01F,headRatioTwo01F,headRatioThree01F]
   | cons n ns =>
     have hh := logFour_mul01F m (projProduct6905 (n::ns)) (h m (by simp))
       (projProduct_shape6905 n ns ht)
     obtain ⟨h1,h2,h3⟩ := product_ratios01F (n::ns) ht
     change logFour01F (mm16 m (projProduct6905 (n::ns))).d=_
     rw [hh,h1,h2,h3,ih ht,openFour01F]
     ring

theorem head_ratios_local01F (w : List (Mat16 R[X])) :
 headRatioOne01F w=headRatioOne01F (w.take 1) ∧
 headRatioTwo01F w=headRatioTwo01F (w.take 2) ∧
 headRatioThree01F w=headRatioThree01F (w.take 3) := by
 rcases w with _ | ⟨m,w⟩ <;> simp [headRatioOne01F,headRatioTwo01F,headRatioThree01F]
 cases w with
 | nil => simp [headRatioOne01F,headRatioTwo01F]
 | cons n w =>
   cases w <;> simp [headRatioOne01F,headRatioTwo01F]

end
end MathGKM.Markov
