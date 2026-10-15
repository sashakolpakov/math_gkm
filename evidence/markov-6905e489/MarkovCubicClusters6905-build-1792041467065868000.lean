import MarkovProjectionJet6905
/-! Machine-authored request 6905e489. Exact connected-string expansion of the
bottom-right cubic jet. The definitions below are scalar ordered sums, not
matrix products; multiplicities and the order of every factor are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false
variable {R : Type*} [CommRing R]

def single26905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 2+single26905 ms
def single36905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 3+single36905 ms
def elementary26905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 1*sumD6905 ms+elementary26905 ms
def elementary36905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 1*elementary26905 ms+elementary36905 ms
def mixed126905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.d.coeff 2*sumD6905 ms+m.d.coeff 1*single26905 ms+mixed126905 ms
def pair26905 : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => m.c.coeff 1*firstB6905 ms+pair26905 ms
def pair36905 : List (Mat16 R[X]) → R
 | [] => 0
 | [_] => 0
 | m::n::ns => m.c.coeff 1*n.b.coeff 2+m.c.coeff 2*n.b.coeff 1+pair36905 (n::ns)
def pairFar6905 : List (Mat16 R[X]) → R
 | [] => 0
 | [_] => 0
 | m::n::ns => pairFar6905 (n::ns)+m.d.coeff 1*pair26905 (n::ns)+
   m.c.coeff 1*n.b.coeff 1*sumD6905 ns
def triple36905 : List (Mat16 R[X]) → R
 | [] => 0
 | [_] => 0
 | m::n::ns => m.c.coeff 1*n.a.coeff 1*firstB6905 ns+triple36905 (n::ns)

theorem score2_clusters6905 (ms : List (Mat16 R[X])) :
 score26905 ms=single26905 ms+elementary26905 ms+pair26905 ms := by
 induction ms with
 | nil => simp [score26905,single26905,elementary26905,pair26905]
 | cons m ms ih =>
   simp only [score26905,single26905,elementary26905,pair26905,ih]; ring

theorem score3_clusters6905 (ms : List (Mat16 R[X])) :
 score36905 ms=single36905 ms+mixed126905 ms+elementary36905 ms+
   pair36905 ms+pairFar6905 ms+triple36905 ms := by
 induction ms with
 | nil => simp [score36905,single36905,mixed126905,elementary36905,
     pair36905,pairFar6905,triple36905]
 | cons m ms ih =>
   cases ms with
   | nil => simp [score36905,single36905,mixed126905,elementary36905,
       pair36905,pairFar6905,triple36905,sumD6905,score26905,
       firstB6905,firstB26905,single26905,elementary26905]
   | cons n ns =>
     simp only [score36905] at ⊢
     rw [←show score36905 (n::ns)=
       n.d.coeff 3+score36905 ns+n.d.coeff 2*sumD6905 ns+
       n.d.coeff 1*score26905 ns+n.c.coeff 2*firstB6905 ns+
       n.c.coeff 1*firstB26905 ns from rfl]
     rw [ih,score2_clusters6905]
     simp only [single36905,mixed126905,elementary36905,pair36905,
       pairFar6905,triple36905,firstB6905,firstB26905]
     ring

def lastC6905 : List (Mat16 R[X]) → R
 | [] => 0
 | [m] => m.c.coeff 1
 | _::n::ns => lastC6905 (n::ns)

theorem projProduct_c16905 (m : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::ms, Projection6905 z) :
 (projProduct6905 (m::ms)).c.coeff 1=lastC6905 (m::ms) := by
 induction ms generalizing m with
 | nil => simp [projProduct_single6905,lastC6905]
 | cons n ns ih =>
   have hn : ∀ z∈n::ns, Projection6905 z := by
     intro z hz; exact h z (by simp only [List.mem_cons] at hz ⊢; tauto)
   exact (projection_mul_jets6905 m (projProduct6905 (n::ns))
     (h m (by simp)) (projProduct_shape6905 n ns hn)).c1.trans (ih n hn)

theorem projProduct_a16905 (m n : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::ms, Projection6905 z) :
 (projProduct6905 (m::n::ms)).a.coeff 1=0 := by
 exact (projection_mul_jets6905 m (projProduct6905 (n::ms))
   (h m (by simp)) (projProduct_shape6905 n ms (by
     intro z hz; exact h z (by simp only [List.mem_cons] at hz ⊢; tauto)))).a1

theorem projProduct_c2_append6905 (m n : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈(m::ms)++[n], Projection6905 z) :
 (projProduct6905 ((m::ms)++[n])).c.coeff 2=
 lastC6905 (m::ms)*n.a.coeff 1+sumD6905 (m::ms)*n.c.coeff 1+n.c.coeff 2 := by
 have hm : ∀ z∈m::ms, Projection6905 z := by
   intro z hz; exact h z (List.mem_append_left _ hz)
 rw [projProduct_append6905,projProduct_single6905]
 rw [(projection_mul_jets6905 (projProduct6905 (m::ms)) n
   (projProduct_shape6905 m ms hm) (h n (by simp))).c2,
   projProduct_c16905 m ms hm,(projProduct_summary6905 m ms hm).2.2.1]

/-- At least four factors: the cubic trace has a linear cluster score and
three exact wrap terms. The c2 term can be opened by projProduct_c2_append6905.
No assumption about a source family or positivity occurs. -/
theorem projection_trace3_long6905 (m n k l : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::k::l::ms, Projection6905 z) :
 (tr16 (projProduct6905 (m::n::k::l::ms))).coeff 3=
 score36905 (m::n::k::l::ms)+
 m.a.coeff 1*n.b.coeff 1*lastC6905 (k::l::ms)+
 m.b.coeff 1*(projProduct6905 (n::k::l::ms)).c.coeff 2+
 m.b.coeff 2*lastC6905 (k::l::ms) := by
 have hn : ∀ z∈n::k::l::ms, Projection6905 z := by
   intro z hz; exact h z (by simp only [List.mem_cons] at hz ⊢; tauto)
 have hk : ∀ z∈k::l::ms, Projection6905 z := by
   intro z hz; exact hn z (by simp only [List.mem_cons] at hz ⊢; tauto)
 have hj := projection_mul_jets6905 m (projProduct6905 (n::k::l::ms))
   (h m (by simp)) (projProduct_shape6905 n _ hn)
 have hjn := projection_mul_jets6905 n (projProduct6905 (k::l::ms))
   (hn n (by simp)) (projProduct_shape6905 k _ hk)
 have ha2 : (projProduct6905 (n::k::l::ms)).a.coeff 2=
   n.b.coeff 1*lastC6905 (k::l::ms) := by
   change (mm16 n _).a.coeff 2=_
   rw [hjn.a2,projProduct_a16905 k l ms hk,projProduct_c16905 k _ hk]
   ring
 have hd := (projProduct_summary6905 m (n::k::l::ms) h).2.2.2.2
 simp only [tr16,Polynomial.coeff_add]
 rw [hd]
 change (mm16 m _).a.coeff 3+_=_
 rw [hj.a3,ha2,projProduct_a16905 n k (l::ms) hn,
   projProduct_c16905 n _ hn]
 simp only [lastC6905]
 ring

/-- The omitted all-first-order top-left cycle is real at length three. -/
theorem projection_trace3_three6905 (m n p : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) (hp : Projection6905 p) :
 (tr16 (mm16 m (mm16 n p))).coeff 3=
 score36905 [m,n,p]+m.a.coeff 1*n.a.coeff 1*p.a.coeff 1+
 m.a.coeff 1*n.b.coeff 1*p.c.coeff 1+
 m.b.coeff 1*(n.c.coeff 1*p.a.coeff 1+n.d.coeff 1*p.c.coeff 1+p.c.coeff 2)+
 m.b.coeff 2*p.c.coeff 1 := by
 have hnp := projection_mul6905 n p hn hp
 have hj := projection_mul_jets6905 m (mm16 n p) hm hnp
 have hnj := projection_mul_jets6905 n p hn hp
 have hd := (projProduct_summary6905 m [n,p] (by
   intro z hz; simp only [List.mem_cons,List.mem_nil_iff,or_false] at hz
   rcases hz with rfl|rfl|rfl <;> assumption)).2.2.2.2
 simp only [projProduct6905,mm_one_right774] at hd
 simp only [tr16,Polynomial.coeff_add]
 rw [hd,hj.a3,hnj.a1,hnj.a2,hnj.c1,hnj.c2]
 ring

theorem projection_trace3_two6905 (m n : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) :
 (tr16 (mm16 m n)).coeff 3=
 score36905 [m,n]+m.a.coeff 1*n.a.coeff 2+m.a.coeff 2*n.a.coeff 1+
 m.b.coeff 1*n.c.coeff 2+m.b.coeff 2*n.c.coeff 1 := by
 have h := projection_mul_jets6905 m n hm hn
 simp only [tr16,Polynomial.coeff_add]
 rw [h.a3,h.d3]
 simp [score36905,sumD6905,score26905,firstB6905,firstB26905]
 ring

#print axioms score3_clusters6905
#print axioms projection_trace3_long6905
#print axioms projection_trace3_three6905
#print axioms projection_trace3_two6905
end
end MathGKM.Markov
