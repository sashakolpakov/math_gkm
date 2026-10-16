import MarkovHorizontalLCM13D
/-! Machine-authored request de6168c6. Six-term second vertical seed.
This module proves its coefficient inequality, not its source identity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000

def v2c0MDE6 {R : Type*} [CommRing R] (s : R) := 8*s
def v2c1MDE6 {R : Type*} [CommRing R] (r : R) := 16*r^2
def v2c2MDE6 {R : Type*} [CommRing R] (a r : R) := 24*r^2+24*a*r+8*a-40*r
def v2c3MDE6 {R : Type*} [CommRing R] (a r : R) :=
 17*r^2+34*a*r+9*a^2-45*r-5*a+2
def v2c4MDE6 {R : Type*} [CommRing R] (a r : R) :=
 6*r^2+18*a*r+12*a^2-16*r-16*a+4
def v2c5MDE6 {R : Type*} [CommRing R] (a r : R) :=
 r^2+4*a*r+4*a^2-3*r-6*a+2
def v2seedMDE6 {R : Type*} [CommRing R] (a r s : R) : R[X] :=
 C (v2c0MDE6 s)+C (v2c1MDE6 r)*X+C (v2c2MDE6 a r)*X^2+
 C (v2c3MDE6 a r)*X^3+C (v2c4MDE6 a r)*X^4+C (v2c5MDE6 a r)*X^5
def V2GoodMDE6 (a r s : ℝ) : Prop :=
 0 ≤ v2c0MDE6 s ∧ 0 ≤ v2c1MDE6 r ∧ 0 < v2c2MDE6 a r ∧
 0 < v2c3MDE6 a r ∧ 0 < v2c4MDE6 a r ∧ 0 < v2c5MDE6 a r ∧
 v2c0MDE6 s*v2c2MDE6 a r ≤ v2c1MDE6 r^2 ∧
 v2c1MDE6 r*v2c3MDE6 a r ≤ v2c2MDE6 a r^2 ∧
 v2c2MDE6 a r*v2c4MDE6 a r ≤ v2c3MDE6 a r^2 ∧
 v2c3MDE6 a r*v2c5MDE6 a r ≤ v2c4MDE6 a r^2

theorem v2lowMDE6 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 V2GoodMDE6 (2*(x+1)+y) (x+1) 0 := by
 unfold V2GoodMDE6
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 all_goals first
 | (simp only [v2c0MDE6,v2c1MDE6,v2c2MDE6,v2c3MDE6,v2c4MDE6,v2c5MDE6]; ring_nf; positivity)
 | (apply sub_nonneg.mp
    simp only [v2c0MDE6,v2c1MDE6,v2c2MDE6,v2c3MDE6,v2c4MDE6,v2c5MDE6]
    ring_nf; positivity)

theorem v2highMDE6 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 V2GoodMDE6 (2*(x+1)+y) (x+1+y) y := by
 unfold V2GoodMDE6
 refine ⟨?_,?_,?_,?_,?_,?_,?_,?_,?_,?_⟩
 all_goals first
 | (simp only [v2c0MDE6,v2c1MDE6,v2c2MDE6,v2c3MDE6,v2c4MDE6,v2c5MDE6]; ring_nf; positivity)
 | (apply sub_nonneg.mp
    simp only [v2c0MDE6,v2c1MDE6,v2c2MDE6,v2c3MDE6,v2c4MDE6,v2c5MDE6]
    ring_nf; positivity)

theorem v2goodMDE6 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a) :
 V2GoodMDE6 a r (2*r-a:ℕ) := by
 have hrR : (1:ℝ) ≤ r := by exact_mod_cast hr
 have hraR : (r:ℝ)+1 ≤ a := by exact_mod_cast hra
 by_cases h : 2*r ≤ a
 · have hR : 2*(r:ℝ) ≤ a := by exact_mod_cast h
   have he : 2*(r-1+1)+(a-2*(r:ℝ))=a := by ring
   have hh := v2lowMDE6 (r-1) (a-2*(r:ℝ)) (by linarith) (by linarith)
   rw [he,sub_add_cancel] at hh
   simpa [Nat.sub_eq_zero_of_le h] using hh
 · have hR : (a:ℝ) ≤ 2*r := by exact_mod_cast (show a ≤ 2*r by omega)
   have he : 2*((a:ℝ)-r-1+1)+(2*r-a)=a := by ring
   have hf : (a:ℝ)-r-1+1+(2*r-a)=r := by ring
   have hh := v2highMDE6 (a-r-1) (2*(r:ℝ)-a) (by linarith) (by linarith)
   rw [he,hf] at hh
   have hs : ((2*r-a:ℕ):ℝ)=2*(r:ℝ)-a := by
     rw [Nat.cast_sub (by omega),Nat.cast_mul,Nat.cast_ofNat]
   rw [hs]
   exact hh

theorem v2seed_crossMDE6 (a r : ℕ) (hr : 1 ≤ r) (hra : r < a) :
 CrossLC (CoeffSeq (v2seedMDE6 (a:ℝ) r (2*r-a:ℕ))) := by
 obtain ⟨h0,h1,h2,h3,h4,h5,h6,h7,h8,h9⟩ := v2goodMDE6 a r hr hra
 rw [v2seedMDE6,six_coeffM13D]
 exact six_crossM13D _ _ _ _ _ _ h0 h1 h2 h3 h4 h5 h6 h7 h8 h9

end
end MathGKM.Markov
