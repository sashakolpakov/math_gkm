import MarkovThirdMomentMEA
/-! Machine-authored ead8a96f. Integral third-column seed from scaled blocks. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false
variable {R : Type*} [CommRing R]

def vBlockPolyMEA (x : R) (n : ℕ) (r : Bool) : Mat16 R[X] :=
 if r then hscaleM13D (C x) (vswapMDE6 (vKwordM9E1 x (runBlock025 n)))
 else vswapMDE6 (vKwordM9E1 x (runBlock025 (n+1)))

def vLocalKScaledMEA (t : R) (m n p : Mat16 R[X]) : R :=
 2*t*m.d.coeff 2-m.d.coeff 1^2+2*m.c.coeff 1*n.b.coeff 1
def vLocalLScaledMEA (t : R) (m n p : Mat16 R[X]) : R :=
 2*m.d.coeff 1^3-6*t*m.d.coeff 1*m.d.coeff 2+6*t^2*m.d.coeff 3+
 6*t*(m.c.coeff 1*n.b.coeff 2+m.c.coeff 2*n.b.coeff 1)-
 6*m.c.coeff 1*n.b.coeff 1*(m.d.coeff 1+n.d.coeff 1)+
 6*m.c.coeff 1*n.a.coeff 1*p.b.coeff 1

def vThirdSeedMEA (x : R) (n : ℕ) (rest : List Bool) : R :=
 let t := x^(n+2)
 let G := vBlockPolyMEA x n
 let D := hsourceMomentM13D (fun p _ _ => (G p).d.coeff 1) rest
 let K := hsourceMomentM13D (fun p q r => vLocalKScaledMEA t (G p) (G q) (G r)) rest
 let L := hsourceMomentM13D (fun p q r => vLocalLScaledMEA t (G p) (G q) (G r)) rest
 D^3+3*D*K+L-3*(x+1)*t*(D^2+K)+6*(x+1)^2*t^2*D-6*(x+1)^3*t^3

theorem hsourceMoment_scaleMEA (c : R) (f : Bool → Bool → Bool → R) (rest : List Bool) :
 hsourceMomentM13D (fun p q r => c*f p q r) rest=c*hsourceMomentM13D f rest := by
 simp only [hsourceMomentM13D,boolMomentADB2,boolJetADB2]; ring

theorem vLocalK_scaleMEA (t : R) (m n p : Mat16 R[X]) :
 vLocalKScaledMEA t (hscaleM13D (C t) m) (hscaleM13D (C t) n) (hscaleM13D (C t) p)=
 t^2*hlocalKM13D m n p := by
 simp only [vLocalKScaledMEA,hscaleM13D,Polynomial.coeff_C_mul,hlocalKM13D,hsingleKM13D]
 ring
theorem vLocalL_scaleMEA (t : R) (m n p : Mat16 R[X]) :
 vLocalLScaledMEA t (hscaleM13D (C t) m) (hscaleM13D (C t) n) (hscaleM13D (C t) p)=
 t^3*hlocalLM13D m n p := by
 simp only [vLocalLScaledMEA,hscaleM13D,Polynomial.coeff_C_mul,hlocalLM13D,singleLADB2]
 ring

theorem vBlock_normalizedMEA (x : ℝ) (hx : x≠0) (n : ℕ) (r : Bool) :
 vBlockPolyMEA x n r=hscaleM13D (C (x^(n+2))) (vGeneralProjMDE6 x n r) := by
 cases r
 · simpa only [vBlockPolyMEA,Bool.false_eq_true,if_false,Bool.not_false,if_true,
     vRunMDE6,show n+1+1=n+2 by omega] using vGeneral_letterMDE6 x hx n false
 · have hh := vGeneral_letterMDE6 x hx n true
   simp only [Bool.not_true,Bool.false_eq_true,if_false,add_zero] at hh
   simp only [vBlockPolyMEA,if_true]
   change hscaleM13D (C x) (vswapMDE6 (vRunMDE6 x n))=_
   rw [hh,vscale_scaleM9E1,←map_mul,←pow_succ']

theorem vThirdSeed_normalizedMEA (x : ℝ) (hx : x≠0) (n : ℕ) (rest : List Bool) :
 vThirdSeedMEA x n rest=x^(3*(n+2))*vThirdMomentMEA x n rest := by
 simp only [vThirdSeedMEA,vBlock_normalizedMEA x hx,
   hscaleM13D,Polynomial.coeff_C_mul] at *
 have hk (p q r : Bool) := vLocalK_scaleMEA (x^(n+2))
   (vGeneralProjMDE6 x n p) (vGeneralProjMDE6 x n q) (vGeneralProjMDE6 x n r)
 have hl (p q r : Bool) := vLocalL_scaleMEA (x^(n+2))
   (vGeneralProjMDE6 x n p) (vGeneralProjMDE6 x n q) (vGeneralProjMDE6 x n r)
 simp only [hscaleM13D] at hk hl
 rw [show (fun p q r => vLocalKScaledMEA (x^(n+2))
     ⟨C (x^(n+2))*(vGeneralProjMDE6 x n p).a,C (x^(n+2))*(vGeneralProjMDE6 x n p).b,
       C (x^(n+2))*(vGeneralProjMDE6 x n p).c,C (x^(n+2))*(vGeneralProjMDE6 x n p).d⟩
     ⟨C (x^(n+2))*(vGeneralProjMDE6 x n q).a,C (x^(n+2))*(vGeneralProjMDE6 x n q).b,
       C (x^(n+2))*(vGeneralProjMDE6 x n q).c,C (x^(n+2))*(vGeneralProjMDE6 x n q).d⟩
     ⟨C (x^(n+2))*(vGeneralProjMDE6 x n r).a,C (x^(n+2))*(vGeneralProjMDE6 x n r).b,
       C (x^(n+2))*(vGeneralProjMDE6 x n r).c,C (x^(n+2))*(vGeneralProjMDE6 x n r).d⟩)=
     (fun p q r => (x^(n+2))^2*hlocalKM13D (vGeneralProjMDE6 x n p)
       (vGeneralProjMDE6 x n q) (vGeneralProjMDE6 x n r)) from funext fun p => funext fun q => funext fun r => hk p q r]
 simp_rw [hl,hsourceMoment_scaleMEA]
 simp only [vThirdMomentMEA,vGeneralDMDE6,vGeneralKMDE6,vGeneralLMEA,pow_mul]
 ring
end
end MathGKM.Markov
