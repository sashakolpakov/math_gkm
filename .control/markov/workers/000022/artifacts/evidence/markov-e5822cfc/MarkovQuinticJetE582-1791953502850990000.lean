import MarkovQuinticExprE582

/-! Machine-authored request e5822cfc. Quintic induction with boundary data. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxRecDepth 8000
set_option maxHeartbeats 2000000
set_option linter.unusedSimpArgs false

def RowQuinticE582 {R : Type*} [CommRing R]
 (x n m s t h k a b : R) (d e r : Bool) (p : Polynomial R × Polynomial R) : Prop :=
 RowQuartic4f8 x n m s t e r p ∧
 6*p.2.coeff 3=qthirdE582 x n m s d e r ∧
 120*(p.1.coeff 5+x*p.2.coeff 4)=quinticExprE582 x n m s t h k
   (a+if r then 0 else 1) (b+if hitFE582 d e r then 1 else 0)

theorem quintic_initialE582 {R : Type*} [CommRing R] (x : R) (d e r : Bool) :
 RowQuinticE582 x 3 ((if d then 1 else 0)+(if e then 1 else 0)+(if r then 1 else 0))
  ((if d=e then 0 else 1)+(if e=r then 0 else 1))
  (if d=r ∧ e=false then 1 else 0) 0 0
  (if d then 0 else 1) (if hitFE582 d e r then 1 else 0) d e r
  (rowStep774 x (rowStep774 x (rowStep774 x (1,1) d) e) r) := by
 refine ⟨?_,?_,?_⟩
 · simpa [show (2:R)+1=3 by ring] using quartic_step4f8 x 2 ((if d then 1 else 0)+(if e then 1 else 0))
     (if d=e then 0 else 1) 0 d e r _ (quartic_initial4f8 x d e)
 all_goals cases d <;> cases e <;> cases r <;>
   simp [rowStep774,quinticExprE582,qthirdE582,cubicExpr5a7,qsecond4f8,hitFE582,
     add_mul,mul_assoc,Polynomial.coeff_X_mul,Polynomial.coeff_X_mul_zero,
     Polynomial.coeff_one,Polynomial.coeff_X,Polynomial.coeff_C] <;> ring

theorem quintic_stepE582 {R : Type*} [CommRing R]
 (x n m s t h k a b : R) (d e r z : Bool) (p : Polynomial R × Polynomial R)
 (hp : RowQuinticE582 x n m s t h k a b d e r p) :
 RowQuinticE582 x (n+1) (m+if z then 1 else 0)
  (s+if r=z then 0 else 1) (t+if e=z ∧ r=false then 1 else 0)
  (h+if hitHE582 d e r z then 1 else 0)
  (k+if hitKE582 d e r z then 1 else 0) a b e r z (rowStep774 x p z) := by
 obtain ⟨hc,hq3,h5⟩ := hp
 refine ⟨quartic_step4f8 x n m s t e r z p hc,?_,?_⟩
 · obtain ⟨⟨_,_,_,h3⟩,hq2,_⟩ := hc
   cases z <;> cases r <;>
     simp [rowStep774,qthirdE582,add_mul,mul_assoc,Polynomial.coeff_X_mul,
       Polynomial.coeff_X_mul_zero] at h3 hq2 ⊢
   all_goals first | linear_combination h3+3*hq2 | linear_combination h3
 · rw [quintic_transitionE582]
   have h4 := hc.2.2
   cases z <;>
     simp [rowStep774,add_mul,mul_assoc,Polynomial.coeff_X_mul,
       Polynomial.coeff_X_mul_zero] at h5 h4 hq3 ⊢
   · linear_combination h5+5*x*h4+20*x*hq3
   · linear_combination h5+5*(x+1)*h4-20*x*hq3

def quadsHE582 (d e r : Bool) : List Bool → ℕ
 | [] => 0
 | z::zs => (if hitHE582 d e r z then 1 else 0)+quadsHE582 e r z zs
def quadsKE582 (d e r : Bool) : List Bool → ℕ
 | [] => 0
 | z::zs => (if hitKE582 d e r z then 1 else 0)+quadsKE582 e r z zs
def endTripleE582 (d e r : Bool) : List Bool → Bool × Bool × Bool
 | [] => (d,e,r)
 | z::zs => endTripleE582 e r z zs

theorem quintic_foldE582 {R : Type*} [CommRing R]
 (x n m s t h k a b : R) (d e r : Bool) (p : Polynomial R × Polynomial R)
 (hp : RowQuinticE582 x n m s t h k a b d e r p) (w : List Bool) :
 let last := endTripleE582 d e r w
 120*((w.foldl (rowStep774 x) p).1.coeff 5+x*(w.foldl (rowStep774 x) p).2.coeff 4)=
 quinticExprE582 x (n+w.length) (m+w.count true)
  (s+switchesFrom5a7 r w) (t+triples4f8 e r w)
  (h+quadsHE582 d e r w) (k+quadsKE582 d e r w)
  (a+if last.2.2 then 0 else 1) (b+if hitFE582 last.1 last.2.1 last.2.2 then 1 else 0) := by
 induction w generalizing n m s t h k d e r p with
 | nil =>
   convert hp.2.2 using 1 <;>
     simp [switchesFrom5a7,triples4f8,quadsHE582,quadsKE582,endTripleE582] <;> ring
 | cons z zs ih =>
   have hh := ih (n+1) (m+if z then 1 else 0) (s+if r=z then 0 else 1)
     (t+if e=z ∧ r=false then 1 else 0) (h+if hitHE582 d e r z then 1 else 0)
     (k+if hitKE582 d e r z then 1 else 0) e r z _ (quintic_stepE582 x n m s t h k a b d e r z p hp)
   cases z <;> cases r <;> cases e <;> cases d <;>
     (convert hh using 1 <;>
     simp [switchesFrom5a7,triples4f8,quadsHE582,quadsKE582,endTripleE582,
       hitHE582,hitKE582,List.count_cons,add_assoc,add_comm,add_left_comm] <;> ring)

theorem word_quinticE582 {R : Type*} [CommRing R]
 (x : R) (d e r : Bool) (w : List Bool) :
 let last := endTripleE582 d e r w
 120*(wordQuotient774 x (d::e::r::w)).coeff 5=
 quinticExprE582 x (d::e::r::w).length ((d::e::r::w).count true)
  (switchesFrom5a7 d (e::r::w)) (triples4f8 d e (r::w))
  (quadsHE582 d e r w) (quadsKE582 d e r w)
  ((if d then 0 else 1)+(if last.2.2 then 0 else 1))
  ((if hitFE582 d e r then 1 else 0)+(if hitFE582 last.1 last.2.1 last.2.2 then 1 else 0)) := by
 have h := quintic_foldE582 x 3
   ((if d then 1 else 0)+(if e then 1 else 0)+(if r then 1 else 0))
   ((if d=e then 0 else 1)+(if e=r then 0 else 1))
   (if d=r ∧ e=false then 1 else 0) 0 0
   (if d then 0 else 1) (if hitFE582 d e r then 1 else 0) d e r _
   (quintic_initialE582 x d e r) w
 cases d <;> cases e <;> cases r <;>
   (convert h using 1 <;>
   simp [wordQuotient774,switchesFrom5a7,triples4f8,List.count_cons,List.length_cons,
     mul_assoc,Polynomial.coeff_X_mul,add_assoc,add_comm,add_left_comm] <;> norm_num <;> ring)

#print axioms word_quinticE582
end
end MathGKM.Markov
