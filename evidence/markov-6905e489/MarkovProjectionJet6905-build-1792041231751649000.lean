import MarkovRunGauge75
import MarkovSecondJet8934
/-! Machine-authored request 6905e489. Cubic jets of products with common
constant projection diag(0,1). Exact polynomial coefficients over any commutative
ring; no coefficient inequality or source formula is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]

def Projection6905 (m : Mat16 R[X]) : Prop :=
 m.a.coeff 0=0 ∧ m.b.coeff 0=0 ∧ m.c.coeff 0=0 ∧ m.d.coeff 0=1

theorem coeff_mul_three6905 (p q : R[X]) :
 (p*q).coeff 3=p.coeff 0*q.coeff 3+p.coeff 1*q.coeff 2+
 p.coeff 2*q.coeff 1+p.coeff 3*q.coeff 0 := by
 simp [Polynomial.coeff_mul,Finset.Nat.antidiagonal_succ,
   Finset.Nat.antidiagonal_zero,add_assoc]

theorem projection_mul6905 (m n : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) :
 Projection6905 (mm16 m n) := by
 obtain ⟨ma,mb,mc,md⟩ := hm
 obtain ⟨na,nb,nc,nd⟩ := hn
 simp [Projection6905,mm16,Polynomial.coeff_add,Polynomial.mul_coeff_zero,
   ma,mb,mc,md,na,nb,nc,nd]

structure ProjectionMulJets6905 (m n : Mat16 R[X]) : Prop where
 a1 : (mm16 m n).a.coeff 1=0
 b1 : (mm16 m n).b.coeff 1=m.b.coeff 1
 c1 : (mm16 m n).c.coeff 1=n.c.coeff 1
 d1 : (mm16 m n).d.coeff 1=m.d.coeff 1+n.d.coeff 1
 a2 : (mm16 m n).a.coeff 2=m.a.coeff 1*n.a.coeff 1+m.b.coeff 1*n.c.coeff 1
 b2 : (mm16 m n).b.coeff 2=m.a.coeff 1*n.b.coeff 1+
   m.b.coeff 1*n.d.coeff 1+m.b.coeff 2
 c2 : (mm16 m n).c.coeff 2=m.c.coeff 1*n.a.coeff 1+
   m.d.coeff 1*n.c.coeff 1+n.c.coeff 2
 d2 : (mm16 m n).d.coeff 2=m.c.coeff 1*n.b.coeff 1+
   m.d.coeff 1*n.d.coeff 1+m.d.coeff 2+n.d.coeff 2
 a3 : (mm16 m n).a.coeff 3=m.a.coeff 1*n.a.coeff 2+
   m.a.coeff 2*n.a.coeff 1+m.b.coeff 1*n.c.coeff 2+m.b.coeff 2*n.c.coeff 1
 d3 : (mm16 m n).d.coeff 3=m.c.coeff 1*n.b.coeff 2+
   m.c.coeff 2*n.b.coeff 1+m.d.coeff 1*n.d.coeff 2+
   m.d.coeff 2*n.d.coeff 1+m.d.coeff 3+n.d.coeff 3

theorem projection_mul_jets6905 (m n : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) : ProjectionMulJets6905 m n := by
 obtain ⟨ma,mb,mc,md⟩ := hm
 obtain ⟨na,nb,nc,nd⟩ := hn
 constructor <;>
   simp [mm16,Polynomial.coeff_add,coeff_mul_one46,coeff_mul_two8934,
     coeff_mul_three6905,ma,mb,mc,md,na,nb,nc,nd] <;> ring

def projProduct6905 : List (Mat16 R[X]) → Mat16 R[X]
 | [] => ⟨1,0,0,1⟩
 | m::ms => mm16 m (projProduct6905 ms)

theorem projProduct_single6905 (m : Mat16 R[X]) : projProduct6905 [m]=m := by
 simp [projProduct6905,mm_one_right774]

theorem projProduct_append6905 (ms ns : List (Mat16 R[X])) :
 projProduct6905 (ms++ns)=mm16 (projProduct6905 ms) (projProduct6905 ns) := by
 induction ms with
 | nil => simp [projProduct6905,mm_one_left774]
 | cons m ms ih => simp [projProduct6905,ih,mm_assoc16]

theorem projProduct_shape6905 (m : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::ms, Projection6905 z) : Projection6905 (projProduct6905 (m::ms)) := by
 induction ms generalizing m with
 | nil => simpa [projProduct_single6905] using h m (by simp)
 | cons n ns ih =>
   exact projection_mul6905 m (projProduct6905 (n::ns)) (h m (by simp))
     (ih n (by intro z hz; exact h z (by simp only [List.mem_cons] at hz ⊢; tauto)))

def firstB6905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::_ => m.b.coeff 1
def firstA6905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::_ => m.a.coeff 1
def sumD6905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 1+sumD6905 ms
def firstB26905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.b.coeff 2+m.b.coeff 1*sumD6905 ms+m.a.coeff 1*firstB6905 ms
def score26905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 2+score26905 ms+m.d.coeff 1*sumD6905 ms+
   m.c.coeff 1*firstB6905 ms
def score36905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 3+score36905 ms+m.d.coeff 2*sumD6905 ms+
   m.d.coeff 1*score26905 ms+m.c.coeff 2*firstB6905 ms+m.c.coeff 1*firstB26905 ms

theorem projProduct_summary6905 (m : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::ms, Projection6905 z) :
 (projProduct6905 (m::ms)).b.coeff 1=firstB6905 (m::ms) ∧
 (projProduct6905 (m::ms)).b.coeff 2=firstB26905 (m::ms) ∧
 (projProduct6905 (m::ms)).d.coeff 1=sumD6905 (m::ms) ∧
 (projProduct6905 (m::ms)).d.coeff 2=score26905 (m::ms) ∧
 (projProduct6905 (m::ms)).d.coeff 3=score36905 (m::ms) := by
 induction ms generalizing m with
 | nil => simp [projProduct_single6905,firstB6905,firstB26905,sumD6905,score26905,score36905]
 | cons n ns ih =>
   have hn : ∀ z∈n::ns, Projection6905 z := by
     intro z hz; exact h z (by simp only [List.mem_cons] at hz ⊢; tauto)
   obtain ⟨hb,hb2,hd,hd2,hd3⟩ := ih n hn
   have hh := projection_mul_jets6905 m (projProduct6905 (n::ns))
     (h m (by simp)) (projProduct_shape6905 n ns hn)
   change (mm16 m _).b.coeff 1=_ ∧ (mm16 m _).b.coeff 2=_ ∧
     (mm16 m _).d.coeff 1=_ ∧ (mm16 m _).d.coeff 2=_ ∧ (mm16 m _).d.coeff 3=_
   rw [hh.b1,hh.b2,hh.d1,hh.d2,hh.d3,hb,hb2,hd,hd2,hd3]
   simp only [firstB6905,firstB26905,sumD6905,score26905,score36905]
   constructor
   · rfl
   constructor
   · ring
   constructor
   · rfl
   constructor <;> ring

#print axioms projection_mul_jets6905
#print axioms projProduct_summary6905
end
end MathGKM.Markov
