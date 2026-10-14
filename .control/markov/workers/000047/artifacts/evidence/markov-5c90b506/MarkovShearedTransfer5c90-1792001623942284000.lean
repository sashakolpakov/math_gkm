import MarkovHorizontalB46
import MarkovMechanicalGoal3eda
/-! Machine-authored 5c90b506. A positive transfer linear in the horizontal
ambient-degree variable. Exact algebra only; no log-concavity is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

/-- Substitute u=x and v=x*y. -/
def horizontalShear5c : BiPoly →+* BiPoly :=
 eval₂RingHom (eval₂RingHom (Int.castRingHom BiPoly) (U*V)) U

theorem horizontalShear_U5c : horizontalShear5c U=U := by
 simp [horizontalShear5c,U]
theorem horizontalShear_V5c : horizontalShear5c V=U*V := by
 simp [horizontalShear5c,V]

theorem horizontalShear_monomial5c (i j : ℕ) (z : ℤ) :
 horizontalShear5c (monomial i (monomial j z))=
   monomial (i+j) (monomial j z) := by
 have hm (a b : ℕ) : monomial a (monomial b z)=(z:BiPoly)*V^b*U^a := by
   simp [← C_mul_X_pow_eq_monomial,U,V]
 rw [hm,hm,map_mul,map_mul,map_pow,map_pow,map_intCast,
   horizontalShear_U5c,horizontalShear_V5c]
 ring

theorem horizontalShear_coeff5c (p : BiPoly) (i j : ℕ) :
 coeff (horizontalShear5c p) (i+j) j=coeff p i j := by
 induction p using Polynomial.induction_on' with
 | add p q hp hq => simp only [map_add,coeff,Polynomial.coeff_add] at *; omega
 | monomial n p =>
   induction p using Polynomial.induction_on' with
   | add p q hp hq => simp only [map_add,coeff,Polynomial.coeff_add] at *; omega
   | monomial m z =>
     rw [horizontalShear_monomial5c]
     by_cases hm : m=j
     · subst m
       by_cases hn : n=i <;> simp [coeff,Polynomial.coeff_monomial,hn]
     · by_cases hs : n+m=i+j <;> by_cases hn : n=i <;>
         simp [coeff,Polynomial.coeff_monomial,hm,hs,hn]

def ambientH5c {R : Type*} [CommRing R] (y : R) : Mat16 R := ⟨y,1,y,1⟩
def ambientD5c {R : Type*} [CommRing R] (y : R) (r : Bool) : Mat16 R :=
 if r then ⟨y,0,2*y,1⟩ else ⟨0,0,0,1⟩
def ambientT5c {R : Type*} [CommRing R] (x y : R) (r : Bool) : Mat16 R :=
 if r then ⟨y+x*y*(1+y),x*(1+y),2*y+x*y*(1+y),1+x*(1+y)⟩
 else ⟨x*y,x,x*y,1+x⟩

theorem ambient_rank_one5c {R : Type*} [CommRing R] (y : R) :
 mm16 (ambientH5c y) (ambientH5c y)=
 ⟨(1+y)*y,1+y,(1+y)*y,1+y⟩ := by
 apply Mat16.ext <;> simp [ambientH5c,mm16] <;> ring

def ambientWord5c {R : Type*} [CommRing R] (x y : R) : List Bool → Mat16 R
 | [] => ⟨1,0,0,1⟩
 | r::rs => mm16 (ambientT5c x y r) (ambientWord5c x y rs)
def ambientScalar5c {R : Type*} [CommRing R] (x y : R) (w : List Bool) : R :=
 let m := ambientWord5c x y w
 (y*m.a+m.c)*x*(1+y)+(y*m.b+m.d)*(1+x*(1+y))

/-- Denominator-free diagonal gauge. This avoids division by x at zero. -/
def Gauge5c (p q : Mat16 BiPoly) (a : ℕ) : Prop :=
 horizontalShear5c p.a=U^a*q.a ∧
 U*horizontalShear5c p.b=U^a*q.b ∧
 horizontalShear5c p.c=U^(a+1)*q.c ∧
 horizontalShear5c p.d=U^a*q.d

theorem gauge_mul5c {p q p' q' : Mat16 BiPoly} {a b : ℕ}
 (hp : Gauge5c p q a) (hq : Gauge5c p' q' b) :
 Gauge5c (mm16 p p') (mm16 q q') (a+b) := by
 obtain ⟨h1,h2,h3,h4⟩ := hp
 obtain ⟨g1,g2,g3,g4⟩ := hq
 unfold Gauge5c
 simp only [mm16,map_add,map_mul,pow_add]
 constructor
 · rw [h1,g1,g3,pow_succ]
   calc
    _ = U^a*q.a*(U^b*q'.a)+(U*horizontalShear5c p.b)*U^b*q'.c := by ring
    _ = _ := by rw [h2]; ring
 constructor
 · calc
    _ = horizontalShear5c p.a*(U*horizontalShear5c p'.b)+
      (U*horizontalShear5c p.b)*horizontalShear5c p'.d := by ring
    _ = _ := by rw [h1,g2,h2,g4]; ring
 constructor
 · rw [h3,g1,h4,g3,pow_succ,pow_succ]
   ring
 · rw [h3,g4,h4,pow_succ]
   calc
    _ = U^a*q.c*(U*horizontalShear5c p'.b)+U^a*q.d*(U^b*q'.d) := by ring
    _ = _ := by rw [g2]; ring

theorem gauge_letter5c (r : Bool) :
 Gauge5c (if r then rawB18 else rawA18) (ambientT5c U V r)
   (if r then 1 else 0) := by
 cases r <;> unfold Gauge5c <;> refine ⟨?_,?_,?_,?_⟩ <;>
   simp [rawA18,rawB18,ambientT5c,S,
     horizontalShear_U5c,horizontalShear_V5c,map_add,map_mul] <;> ring

theorem gauge_word5c (w : List Bool) :
 Gauge5c (rawWord80 w) (ambientWord5c U V w) (w.count true) := by
 induction w with
 | nil => simp [Gauge5c,rawWord80,ambientWord5c]
 | cons r rs ih =>
   have h := gauge_mul5c (gauge_letter5c r) ih
   cases r <;> simpa [rawWord80,ambientWord5c,List.count_cons,Nat.add_comm] using h

theorem ambient_word_boundary5c {R : Type*} [CommRing R] (x y : R) (w : List Bool) :
 (ambientWord5c x y (false::(w++[true]))).b=x*ambientScalar5c x y w := by
 have app (z t : List Bool) : ambientWord5c x y (z++t)=
     mm16 (ambientWord5c x y z) (ambientWord5c x y t) := by
   induction z with
   | nil => simp [ambientWord5c,mm_one_left774]
   | cons r rs ih => simp only [List.cons_append,ambientWord5c,ih,mm_assoc16]
 simp [ambientWord5c,app,ambientT5c,ambientScalar5c,mm16]
 ring

theorem raw_word_ambient5c (w : List Bool) :
 horizontalShear5c (rawWord80 (false::(w++[true]))).b=
 U^(w.count true+1)*ambientScalar5c U V w := by
 have h := (gauge_word5c (false::(w++[true]))).2.1
 rw [ambient_word_boundary5c] at h
 have hz : (U : BiPoly) ≠ 0 := Polynomial.X_ne_zero
 apply mul_left_cancel₀ hz
 simpa [List.count_cons,List.count_append,mul_assoc,mul_left_comm,mul_comm] using h

#print axioms horizontalShear_coeff5c
#print axioms gauge_word5c
#print axioms raw_word_ambient5c
end
end MathGKM.Markov
