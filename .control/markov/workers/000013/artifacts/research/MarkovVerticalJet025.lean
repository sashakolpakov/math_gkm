import MarkovVerticalBoundaryB46

/-! Machine-authored request 02592c7b. First vertical jet, with exact
matrix multiplication and determinant/trace transport. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def columnJet025 (M : Mat16 BiPoly) : Polynomial ℤ :=
  (X+1)*M.a.coeff 1+M.c.coeff 1

def ZeroShape025 (M : Mat16 BiPoly) : Prop :=
  M.a.coeff 0=(X+1)*M.b.coeff 0 ∧ M.c.coeff 0=0 ∧ M.d.coeff 0=0

theorem shape_mul025 (M N : Mat16 BiPoly)
    (hm : ZeroShape025 M) (hn : ZeroShape025 N) :
    ZeroShape025 (mm16 M N) := by
  obtain ⟨ma,mc,md⟩ := hm
  obtain ⟨na,nc,nd⟩ := hn
  simp [ZeroShape025,mm16,Polynomial.coeff_add,Polynomial.mul_coeff_zero,
    ma,mc,md,na,nc,nd]
  ring

theorem columnJet_mul025 (M N : Mat16 BiPoly)
    (hm : ZeroShape025 M) (hn : ZeroShape025 N) :
    columnJet025 (mm16 M N)=
      N.a.coeff 0*columnJet025 M+M.a.coeff 0*columnJet025 N := by
  obtain ⟨ma,mc,md⟩ := hm
  obtain ⟨na,nc,nd⟩ := hn
  simp only [columnJet025,mm16,Polynomial.coeff_add,coeff_mul_one46,
    ma,mc,md,na,nc,nd]
  ring

/-- For source matrices with numerator a>=2, the first determinant jet
vanishes. This is the exact raw vertical-row adapter. -/
theorem vertical_jet_of_trace025 (M : Mat16 BiPoly)
    (hm : ZeroShape025 M) (hb : M.b.coeff 0 ≠ 0)
    (ht : tr16 M=S*M.b) (hd : (det16 M).coeff 1=0) :
    (X+1)^2*M.b.coeff 1=columnJet025 M-M.a.coeff 0 := by
  obtain ⟨ma,mc,md⟩ := hm
  have hdet := hd
  simp only [det16,Polynomial.coeff_sub,coeff_mul_one46,ma,mc,md] at hdet
  have hdc : (X+1)*M.d.coeff 1=M.c.coeff 1 := by
    apply (mul_left_cancel₀ hb)
    linear_combination hdet
  have htr := congrArg (fun p : BiPoly => p.coeff 1) ht
  simp [tr16,S,U,V,Polynomial.coeff_add,coeff_mul_one46,
    Polynomial.coeff_one] at htr
  unfold columnJet025
  rw [ma]
  linear_combination -(X+1)*htr+hdc

/-- A cleared additive statistic is preserved by concatenation. -/
theorem columnJet_scaled_mul025 (M N : Mat16 BiPoly)
    (hm : ZeroShape025 M) (hn : ZeroShape025 N)
    (scale f g : Polynomial ℤ)
    (hf : scale*columnJet025 M=M.a.coeff 0*f)
    (hg : scale*columnJet025 N=N.a.coeff 0*g) :
    scale*columnJet025 (mm16 M N)=(mm16 M N).a.coeff 0*(f+g) := by
  rw [columnJet_mul025 M N hm hn]
  have hz : (mm16 M N).a.coeff 0=M.a.coeff 0*N.a.coeff 0 := by
    simp [mm16,Polynomial.coeff_add,Polynomial.mul_coeff_zero,hn.2.1]
  rw [hz]
  linear_combination N.a.coeff 0*hf+M.a.coeff 0*hg

#print axioms columnJet_mul025
#print axioms vertical_jet_of_trace025
#print axioms columnJet_scaled_mul025
end
end MathGKM.Markov
