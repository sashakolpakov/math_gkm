import MathGKM.Accepted4758af360dbc864d40dbc7ac

/- Machine-authored round84. Exact reciprocal factor premise; applicability
to actual matching fibers is not assumed by any unconditional conclusion. -/
namespace ReciprocalR84
noncomputable section
open Polynomial RealPolynomialR52 RealConeR52

def expr (c : ℝ) (s e : ℕ) (qs : List ℝ) : Polynomial ℝ :=
  C c * X^s * (1+X)^e * (qs.map (fun q => X^2+C q*X+1)).prod

def Factors (P : Polynomial ℝ) (L : ℕ) : Prop :=
  P=0 ∨ ∃ (c : ℝ) (s e : ℕ) (qs : List ℝ),
    0<c ∧ e≤1 ∧ (∀ q ∈ qs, 1≤q) ∧
    P=expr c s e qs ∧ L=2*s+e+2*qs.length

def Pal (P : Polynomial ℝ) (L : ℕ) : Prop := P.natDegree≤L ∧ reflect L P=P

theorem pal_mul {P Q : Polynomial ℝ} {d e : ℕ} (hP : Pal P d) (hQ : Pal Q e) :
    Pal (P*Q) (d+e) := by
  refine ⟨(natDegree_mul_le.trans (Nat.add_le_add hP.1 hQ.1)),?_⟩
  rw [reflect_mul P Q hP.1 hQ.1,hP.2,hQ.2]

theorem pal_pow {P : Polynomial ℝ} {d : ℕ} (hP : Pal P d) (n : ℕ) :
    Pal (P^n) (d*n) := by
  induction n with
  | zero => simp [Pal]
  | succ n ih =>
    simpa [pow_succ,Nat.mul_succ] using pal_mul ih hP

theorem expr_pal (c : ℝ) (s e : ℕ) (qs : List ℝ) :
    Pal (expr c s e qs) (2*s+e+2*qs.length) := by
  have hm : Pal (C c*X^s) (2*s) := by
    refine ⟨?_,?_⟩
    · exact (natDegree_C_mul_le _ _).trans (by simp; omega)
    · rw [reflect_C_mul_X_pow,revAt_le (by omega)]
      congr 2 <;> omega
  have hl : Pal (1+X : Polynomial ℝ) 1 := by
    constructor
    · compute_degree
    · have h1 : reflect 1 (1 : Polynomial ℝ)=X := by simpa using reflect_C (1 : ℝ) 1
      simp only [reflect_add,h1,reflect_one_X,add_comm]
  have hq : ∀ q : ℝ, Pal (X^2+C q*X+1) 2 := by
    intro q
    constructor
    · compute_degree
    · have h1 : reflect 2 (1 : Polynomial ℝ)=X^2 := by simpa using reflect_C (1 : ℝ) 2
      have h2 : reflect 2 (X^2 : Polynomial ℝ)=1 := by simpa [revAt] using reflect_monomial 2 2 (R := ℝ)
      have hx : reflect 2 (C q*X)=C q*X := by simpa [revAt] using reflect_C_mul_X_pow (c := q) 2 1
      simp only [reflect_add,h1,h2,hx]
      ring
  have hp : Pal (qs.map (fun q => X^2+C q*X+1)).prod (2*qs.length) := by
    induction qs with
    | nil => simp [Pal]
    | cons q qs ih => simpa [List.map_cons,List.prod_cons,Nat.mul_add,Nat.add_comm] using pal_mul (hq q) ih
  simpa [expr] using pal_mul (pal_mul hm (by simpa using pal_pow hl e)) hp

theorem factors_cone (P : Polynomial ℝ) (L : ℕ) (h : Factors P L) : Cone (seq P) := by
  apply Accepted4758af360dbc864d40dbc7ac.obligation
  rcases h with h | ⟨c,s,e,qs,hc,he,hq,hP,hL⟩
  · exact Or.inl h
  right
  refine ⟨c,s,List.replicate e 1,qs.map (fun q => (q,1)),hc,?_,?_,?_⟩
  · intro r hr; simp only [List.mem_replicate] at hr; rcases hr with ⟨_,rfl⟩; norm_num
  · intro q hmem
    obtain ⟨z,hz,rfl⟩ := List.mem_map.mp hmem
    have hh := hq z hz
    exact ⟨by dsimp; linarith,by norm_num,by dsimp; nlinarith⟩
  · simpa [expr,List.map_map,Function.comp_def,add_comm] using hP

theorem transport (P : Polynomial ℝ) (L : ℕ) (h : Factors P L) :
    (∀ r, r≤L → P.coeff r=P.coeff (L-r)) ∧
    (∀ r, 0≤P.coeff r) ∧
    (∀ i j k, i<j → j<k → 0<P.coeff i → 0<P.coeff k → 0<P.coeff j) ∧
    (∀ r, P.coeff r*P.coeff (r+2)≤P.coeff (r+1)^2) ∧
    (∀ r, 2*r<L → P.coeff r≤P.coeff (r+1)) ∧
    (∀ r, L<r → P.coeff r=0) := by
  have hc := factors_cone P L h
  have hp : Pal P L := by
    rcases h with rfl | ⟨c,s,e,qs,hc,he,hq,rfl,rfl⟩
    · simp [Pal]
    · exact expr_pal c s e qs
  have hs : ∀ r, r≤L → P.coeff r=P.coeff (L-r) := by
    intro r hr
    have hh := congrArg (fun Q : Polynomial ℝ => Q.coeff r) hp.2
    simpa only [coeff_reflect,revAt_le hr] using hh.symm
  have hn : ∀ r, 0≤P.coeff r := by
    intro r; simpa only [seq_nat] using hc.1 (r:ℤ)
  refine ⟨hs,hn,?_,raw_consequence P hc,?_,?_⟩
  · intro i j k hij hjk hi hk
    have hh := hc.2.2 (i:ℤ) (j:ℤ) (k:ℤ) (by omega) (by omega)
    simp only [seq_nat] at hh
    exact hh hi hk
  · intro r hr
    by_cases he : L=2*r+1
    · have hh := hs r (by omega)
      have hh' : L-r=r+1 := by omega
      rw [hh'] at hh; exact hh.le
    have hh := inward (seq P) hc (L-2*r-2) (r:ℤ)
    have e0 : (r:ℤ)+(L-2*r-2:ℕ)+2=((L-r:ℕ):ℤ) := by omega
    have e1 : (r:ℤ)+(L-2*r-2:ℕ)+1=((L-(r+1):ℕ):ℤ) := by omega
    have e2 : (r:ℤ)+1=((r+1:ℕ):ℤ) := by omega
    rw [e0,e1,e2] at hh
    simp only [seq_nat] at hh
    rw [← hs r (by omega),← hs (r+1) (by omega)] at hh
    nlinarith [hn r,hn (r+1)]
  · intro r hr; exact coeff_eq_zero_of_natDegree_lt (lt_of_le_of_lt hp.1 hr)

end
end ReciprocalR84
#print axioms ReciprocalR84.transport
