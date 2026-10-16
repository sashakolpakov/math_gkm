import MarkovVerticalProjectionMDE6
import MarkovVerticalSecondSeedMDE6
/-! Machine-authored request de6168c6. Exact second trace moment reduction.
All denominators are cleared under explicit nonzero evaluation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false

def vd1MDE6 (x : ℝ) (r : Bool) := if r then 3+2*x else 4/x+6+3*x
def vd2MDE6 (x : ℝ) (r : Bool) := if r then (x+1)^2 else 4/x+11+10*x+3*x^2
def vb1MDE6 (x : ℝ) (r : Bool) := if r then x+2 else 2/x+2+x
def vc1MDE6 (x : ℝ) (r : Bool) := if r then 1+2/x else 2/x^2+2/x+1

theorem vproj_jetsMDE6 (x : ℝ) (hx : x≠0) (r : Bool) :
 (vprojMDE6 x r).d.coeff 1=vd1MDE6 x r ∧
 (vprojMDE6 x r).d.coeff 2=vd2MDE6 x r ∧
 (vprojMDE6 x r).b.coeff 1=vb1MDE6 x r ∧
 (vprojMDE6 x r).c.coeff 1=vc1MDE6 x r := by
 cases r <;> refine ⟨?_,?_,?_,?_⟩
 all_goals
   norm_num [vprojMDE6,vshortMDE6,vlongMDE6,hscaleM13D,vswapMDE6,
     vKaM9E1,vKcM9E1,mm16,Polynomial.coeff_add,Polynomial.coeff_C_mul,
     Polynomial.mul_coeff_zero,coeff_mul_one46,coeff_mul_two8934,
     Polynomial.coeff_one,Polynomial.coeff_X,Polynomial.coeff_X_pow,
     vd1MDE6,vd2MDE6,vb1MDE6,vc1MDE6]
   field_simp
   <;> ring

def vDMDE6 (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p _ _ => vd1MDE6 x p) a b q t u
def vKMDE6 (x a b q t u : ℝ) :=
 boolMomentADB2 (fun p r _ => 2*vd2MDE6 x p-(vd1MDE6 x p)^2+
   2*vc1MDE6 x p*vb1MDE6 x r) a b q t u

theorem vmoment_seedMDE6 (x a b q t u : ℝ) (hx : x≠0) :
 let D := vDMDE6 x a b q t u
 let K := vKMDE6 x a b q t u
 x^3*(D^2+K-2*(x+1)*D+2*(x+1)^2)=
 (v2seedMDE6 a (a-b) (a-2*b+q)).eval x := by
 dsimp only
 norm_num only [vDMDE6,vKMDE6,boolMomentADB2,boolJetADB2,
   vd1MDE6,vd2MDE6,vb1MDE6,vc1MDE6,
   v2seedMDE6,v2c0MDE6,v2c1MDE6,v2c2MDE6,v2c3MDE6,v2c4MDE6,v2c5MDE6]
 simp only [Polynomial.eval_add,Polynomial.eval_mul,Polynomial.eval_pow,
   Polynomial.eval_C,Polynomial.eval_X]
 norm_num only
 field_simp
 <;> ring

theorem vsource_momentsMDE6 (x : ℝ) (hx : x≠0) (rest : List Bool)
 (ha : 4 ≤ (frame rest).mid.b) :
 let a := (frame rest).mid.b
 let b := (frame rest).mid.a
 let q := 2*b-a
 let t := min (a-b) (3*b-a)
 let u := 3*b-2*a
 let T := tr16 (projProduct6905 ((sourceWord28 rest).map (vprojMDE6 x)))
 T.coeff 0=1 ∧ T.coeff 1=vDMDE6 x a b q t u ∧
 2*T.coeff 2=(vDMDE6 x a b q t u)^2+vKMDE6 x a b q t u := by
 dsimp only
 obtain ⟨h0,h1,h2,_⟩ := hsource_momentsM13D (vprojMDE6 x)
   (vproj_shapeMDE6 x hx) rest ha
 have hd (r : Bool) := (vproj_jetsMDE6 x hx r).1
 have he (r : Bool) := (vproj_jetsMDE6 x hx r).2.1
 have hb (r : Bool) := (vproj_jetsMDE6 x hx r).2.2.1
 have hc (r : Bool) := (vproj_jetsMDE6 x hx r).2.2.2
 simp only [hsourceMomentM13D,hlocalKM13D,hsingleKM13D,hd,he,hb,hc] at h1 h2
 exact ⟨h0,h1,h2⟩

end
end MathGKM.Markov
