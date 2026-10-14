import MarkovHorizontalJet05ef
/-! Machine-authored 05ef7fab. The universal exact second horizontal row
identity. The integer score records adjacent B's and endpoint B's. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 8000
set_option linter.unusedSimpArgs false

def hdelta05ef {R : Type*} [CommRing R] (r z : Bool) : R :=
 if z then (if r then 4 else 2) else (if r then -2 else 0)
def htail05ef {R : Type*} [CommRing R] (r : Bool) : List Bool → R
 | [] => 0
 | z::zs => hdelta05ef r z + htail05ef z zs
def hlast05ef (r : Bool) : List Bool → Bool
 | [] => r
 | z::zs => hlast05ef z zs

theorem hsecond_fold05ef {R : Type*} [CommRing R] (x : R) (n m : ℕ) (a : R)
 (r : Bool) (p : Polynomial R × Polynomial R) (h : HSecond05ef x n m a r p)
 (w : List Bool) :
 HSecond05ef x (n+w.length) (m+w.count true) (a+htail05ef r w)
 (hlast05ef r w) (w.foldl (hrowStep46 x) p) := by
 induction w generalizing n m a r p with
 | nil => simpa [htail05ef,hlast05ef] using h
 | cons z zs ih =>
   have hh := ih (n+1) (m+if z then 1 else 0) (a+hdelta05ef r z) z
     (hrowStep46 x p z) (hsecond_step05ef x n m a r z p h)
   cases z <;> simpa [htail05ef,hlast05ef,List.count_cons,
     add_assoc,add_comm,add_left_comm] using hh

theorem hword_second05ef {R : Type*} [CommRing R] (x : R) (d : Bool) (w : List Bool) :
 2*(x+1)^3*(hword46 x (d::w)).coeff 2 =
 x^((d::w).count true)*(x+1)^(d::w).length*
 hseed05ef x (d::w).length ((d::w).count true)
   ((if d then 4 else 0)+htail05ef d w) := by
 have hh := hsecond_fold05ef x 1 (if d then 1 else 0) (if d then 4 else 0) d
   (hrowStep46 x (X,1) d) (hsecond_initial05ef x d) w
 have hn : 1+w.length=(d::w).length := by simp; omega
 have hm : (if d then 1 else 0)+w.count true=(d::w).count true := by
   cases d <;> simp [List.count_cons,Nat.add_comm]
 rw [hn,hm] at hh
 have hs := hh.2.2
 rw [hh.1.2.1] at hs
 convert hs using 1
 simp [hword46,hsecond05ef,add_mul,mul_add,mul_assoc,
   Polynomial.coeff_X_mul,Polynomial.coeff_C_mul]
 <;> ring

def hbb05ef (r : Bool) : List Bool → ℕ
 | [] => 0
 | z::zs => (if r && z then 1 else 0)+hbb05ef z zs

theorem htail_count05ef {R : Type*} [CommRing R] (d : Bool) (w : List Bool) :
 (if d then 4 else 0)+htail05ef (R:=R) d w =
 4*(hbb05ef d w : R)+(if d then 2 else 0)+(if hlast05ef d w then 2 else 0) := by
 induction w generalizing d with
 | nil => cases d <;> norm_num [htail05ef,hbb05ef,hlast05ef]
 | cons z zs ih =>
   have hh := ih z
   cases d <;> cases z <;>
     simp [htail05ef,hbb05ef,hlast05ef,hdelta05ef] at hh ⊢ <;>
     split_ifs at hh ⊢ <;> linear_combination hh

theorem source_horizontal_second05ef (path : List Bool) (hb : 3 ≤ (frame path).mid.b) :
 ∃ d : Bool, ∃ w : List Bool,
   (d::w).length+2=(frame path).mid.b ∧
   (d::w).count true+1=(frame path).mid.a ∧
   2*((X : Polynomial ℤ)+1)^3*(Bivariate.swap (frame path).mid.p).coeff 2 =
     X^((d::w).count true)*(X+1)^(d::w).length*
     hseed05ef X (d::w).length ((d::w).count true)
       (4*(hbb05ef d w : Polynomial ℤ)+(if d then 2 else 0)+(if hlast05ef d w then 2 else 0)) := by
 obtain ⟨w,hl,hc,he⟩ := source_hword46 path
 cases w with
 | nil => simp at hl; omega
 | cons d w =>
   refine ⟨d,w,hl,hc,?_⟩
   rw [he]
   simpa [htail_count05ef] using hword_second05ef (X : Polynomial ℤ) d w

#print axioms hword_second05ef
#print axioms htail_count05ef
#print axioms source_horizontal_second05ef
end
end MathGKM.Markov
