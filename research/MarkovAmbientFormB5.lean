import MarkovShearedTransfer5c90
/-! Machine-authored b5dbe087. A direct common quadratic form for the
ambient matrices. Related to inherited gas squares; no LC closure is claimed. -/
namespace MathGKM.Markov
noncomputable section

def ambientFormB5 {R : Type*} [CommRing R] (x : R) : Mat16 R :=
 ⟨1+x,-x,-x,x⟩

theorem ambient_common_formB5 {R : Type*} [CommRing R] (x y : R) (r : Bool) :
 mm16 (ambientFormB5 x) (ambientT5c x y r)=
 if r then ⟨y+x*y^2,x*y,x*y,x⟩ else ⟨x*y,0,0,x⟩ := by
 cases r <;> apply Mat16.ext <;> simp [ambientFormB5,ambientT5c,mm16] <;> ring

def ambientQuadB5 {R : Type*} [CommRing R] (x y : R) (w : List Bool)
 (p q : R) : R :=
 let m := ambientWord5c x y w
 ((1+x)*p-x*q)*(m.a*p+m.b*q)+x*(q-p)*(m.c*p+m.d*q)

theorem ambient_word_appendB5 {R : Type*} [CommRing R] (x y : R)
 (w z : List Bool) :
 ambientWord5c x y (w++z)=mm16 (ambientWord5c x y w) (ambientWord5c x y z) := by
 induction w with
 | nil => simp [ambientWord5c,mm_one_left774]
 | cons r rs ih => simp only [List.cons_append,ambientWord5c,ih,mm_assoc16]

theorem ambient_quad_sandwichB5 {R : Type*} [CommRing R] (x y p q : R)
 (w : List Bool) (r : Bool) :
 let t := ambientT5c x y r
 ambientQuadB5 x y (r::(w++[r])) p q=
   ambientQuadB5 x y w (t.a*p+t.b*q) (t.c*p+t.d*q) := by
 cases r <;> simp [ambientQuadB5,ambientWord5c,ambient_word_appendB5,ambientT5c,mm16] <;> ring

theorem ambient_quad_emptyB5 {R : Type*} [CommRing R] (x y p q : R) :
 ambientQuadB5 x y [] p q=p^2+x*(q-p)^2 := by
 simp [ambientQuadB5,ambientWord5c]; ring

theorem ambient_quad_falseB5 {R : Type*} [CommRing R] (x y p q : R) :
 ambientQuadB5 x y [false] p q=x*(y*p^2+q^2) := by
 simp [ambientQuadB5,ambientWord5c,ambientT5c,mm16]; ring

theorem ambient_quad_trueB5 {R : Type*} [CommRing R] (x y p q : R) :
 ambientQuadB5 x y [true] p q=y*p^2+x*(y*p+q)^2 := by
 simp [ambientQuadB5,ambientWord5c,ambientT5c,mm16]; ring

theorem ambient_quad_scalarB5 {R : Type*} [CommRing R] (x y : R)
 (w : List Bool) :
 ambientQuadB5 x y w (x*(1+y)) (1+x*(1+y))=x*ambientScalar5c x y w := by
 simp only [ambientQuadB5,ambientScalar5c]; ring

theorem ambient_source_quadB5 (path : List Bool) :
 U*horizontalShear5c (frame path).mid.p=
 U^(frame path).mid.a*
   ambientQuadB5 U V (central28 path) (U*(1+V)) (1+U*(1+V)) := by
 rw [ambient_quad_scalarB5,source_ambient_identity5c]
 ring

#print axioms ambient_common_formB5
#print axioms ambient_quad_sandwichB5
#print axioms ambient_source_quadB5
end
end MathGKM.Markov
