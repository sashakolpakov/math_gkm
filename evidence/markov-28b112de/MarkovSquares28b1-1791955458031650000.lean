import MarkovPalindrome28b1

/-! Machine-authored 28b112de. Positive sum-of-squares representations for
all source paths. These are exact raw polynomial identities, not LC closure. -/
namespace MathGKM.Markov
noncomputable section

def gasQuad28 {R : Type*} [CommRing R] (u v t : R) (w : List Bool) (x y : R) : R :=
 let m := gasWord80 u v t w
 v*x^2*m.a+u*v*x*y*m.b+x*y*m.c+u*y^2*m.d

theorem gasQuad_sandwich28 {R : Type*} [CommRing R] (u v t : R)
 (w : List Bool) (r : Bool) (x y : R) :
 gasQuad28 u v t (r::(w++[r])) x y =
 gasQuad28 u v t w (v*x+u*y+if r then t*x else 0)
   (v*x+u*y+if r then 0 else t*y) := by
 cases r <;> simp [gasQuad28,gasWord80,gasWord_append80,gasT80,mm16] <;> ring

theorem gasQuad_nil28 {R : Type*} [CommRing R] (u v t x y : R) :
 gasQuad28 u v t [] x y=v*x^2+u*y^2 := by simp [gasQuad28,gasWord80]

theorem gasQuad_single28 {R : Type*} [CommRing R] (u v t x y : R) (r : Bool) :
 gasQuad28 u v t [r] x y=(v*x+u*y)^2+t*(if r then v*x^2 else u*y^2) := by
 cases r <;> simp [gasQuad28,gasWord80,gasT80,mm16] <;> ring

def PositiveSquares28 (p : BiPoly) : Prop :=
 ∃ f g : BiPoly, PolyNonneg16 f ∧ PolyNonneg16 g ∧
   (p=V*f^2+U*g^2 ∨ p=f^2+U*g^2 ∨ p=f^2+V*g^2)

theorem palindrome_squares28 (w : List Bool) (hw : List.Palindrome w)
 (x y : BiPoly) (hx : PolyNonneg16 x) (hy : PolyNonneg16 y) :
 PositiveSquares28 (gasQuad28 U V 1 w x y) := by
 induction hw generalizing x y with
 | nil => exact ⟨x,y,hx,hy,Or.inl (gasQuad_nil28 _ _ _ _ _)⟩
 | singleton r =>
   have hn := poly_add_nonneg16 (poly_mul_nonneg16 poly_V_nonneg16 hx)
     (poly_mul_nonneg16 poly_U_nonneg16 hy)
   cases r
   · refine ⟨V*x+U*y,y,hn,hy,Or.inr (Or.inl ?_)⟩
     simp [gasQuad_single28]
   · refine ⟨V*x+U*y,x,hn,hx,Or.inr (Or.inr ?_)⟩
     simp [gasQuad_single28]
 | @cons_concat r w hw ih =>
   rw [gasQuad_sandwich28]
   have hn := poly_add_nonneg16 (poly_mul_nonneg16 poly_V_nonneg16 hx)
     (poly_mul_nonneg16 poly_U_nonneg16 hy)
   apply ih
   · cases r
     · simpa using hn
     · simpa using poly_add_nonneg16 hn hx
   · cases r
     · simpa using poly_add_nonneg16 hn hy
     · simpa using hn

/-- Every actual source numerator has one of three positive weighted-square
forms. No claim that such forms automatically preserve raw log-concavity. -/
theorem source_positive_squares28 (path : List Bool) :
 PositiveSquares28 (frame path).mid.p := by
 rw [source_gas_exact28]
 have h := palindrome_squares28 (gasCore28 path) (gasCore_palindrome28 path)
   1 1 poly_one_nonneg16 poly_one_nonneg16
 simpa [gasQuad28,gasScalar80] using h

#print axioms gasQuad_sandwich28
#print axioms source_positive_squares28
end
end MathGKM.Markov
