import MarkovCutPositiveFe01
/-! Machine-authored 07a7e5b7. Exact degree of individual masks, computed
without expanding their polynomials. This is not a log-concavity assertion. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

def maskDegree07a7 (d : ℕ) : List (Bool × Bool) → ℕ
  | [] => 0
  | (r,b)::rs => if b then d+(if r then 1 else 0)+maskDegree07a7 1 rs
    else maskDegree07a7 (if r then d+1 else 0) rs

theorem maskDegree_bound07a7 (m : List (Bool × Bool)) (d : ℕ) :
    maskDegree07a7 d m ≤ d+2*m.length := by
  induction m generalizing d with
  | nil => simp [maskDegree07a7]
  | cons rb rs ih =>
    obtain ⟨r,b⟩ := rb
    cases b <;> cases r <;> simp only [maskDegree07a7,if_true,if_false,
      Bool.false_eq_true,List.length_cons]
    · have h := ih 0; omega
    · have h := ih (d+1); omega
    · have h := ih 1; omega
    · have h := ih 1; omega

theorem mask_ne_zero07a7 (m : List (Bool × Bool)) :
    maskWeight340 (X:ℝ[X]) X 1 m ≠ 0 := by
  intro he
  have h := mask_coeff_zeroFe01 m
  rw [he] at h
  norm_num at h

theorem mask_natDegree_general07a7 (m : List (Bool × Bool)) (p : ℝ[X])
    (hp : p.coeff 0=0) :
    (maskWeight340 X p 1 m).natDegree=maskDegree07a7 p.natDegree m := by
  induction m generalizing p with
  | nil => simp [maskWeight340,maskDegree07a7]
  | cons rb rs ih =>
    obtain ⟨r,b⟩ := rb
    have hp1 : p+1 ≠ 0 := by
      intro h; have := congrArg (fun f : ℝ[X] => f.coeff 0) h
      simp [hp] at this
    have hp2 : p+2 ≠ 0 := by
      intro h; have := congrArg (fun f : ℝ[X] => f.coeff 0) h
      simp [hp] at this
    have hd1 : (p+1).natDegree=p.natDegree := by
      simpa using (Polynomial.natDegree_add_C (p:=p) (a:=(1:ℝ)))
    have hd2 : (p+2).natDegree=p.natDegree := by
      change (p+C (2:ℝ)).natDegree=p.natDegree
      exact Polynomial.natDegree_add_C
    have hX : (1+(X:ℝ[X])) ≠ 0 := by
      intro h; have := congrArg (fun f : ℝ[X] => f.coeff 0) h
      norm_num at this
    have hdX : (1+(X:ℝ[X])).natDegree=1 := by
      rw [add_comm]
      simpa using (Polynomial.natDegree_add_C (p:=(X:ℝ[X])) (a:=(1:ℝ)))
    cases b with
    | false =>
      cases r with
      | false => simpa [maskWeight340,maskDegree07a7,cutChargeA27] using ih 0 (by simp)
      | true =>
        have hi := ih (X*(p+2)) (by simp)
        simp only [maskWeight340,maskDegree07a7,cutChargeA27,if_false,if_true,
          Bool.false_eq_true, mul_one]
        rw [hi,Polynomial.natDegree_mul (by exact Polynomial.X_ne_zero) hp2,hd2]
        simp [Nat.add_comm]
    | true =>
      have hi := ih X (by simp)
      cases r with
      | false =>
        simp only [maskWeight340,maskDegree07a7,cutFactorA27,if_true,if_false,
          Bool.false_eq_true,one_mul,Nat.add_zero]
        rw [Polynomial.natDegree_mul hp1 (mask_ne_zero07a7 rs),hd1,hi]
        simp
      | true =>
        simp only [maskWeight340,maskDegree07a7,cutFactorA27,if_true]
        rw [Polynomial.natDegree_mul (mul_ne_zero hX hp1) (mask_ne_zero07a7 rs),
          Polynomial.natDegree_mul hX hp1,hd1,hi]
        simp [hdX,Nat.add_comm]

theorem mask_natDegree07a7 (m : List (Bool × Bool)) :
    (maskWeight340 (X:ℝ[X]) X 1 m).natDegree=maskDegree07a7 1 m := by
  simpa using mask_natDegree_general07a7 m X (by simp)

def degreeLayer07a7 {R : Type*} [CommRing R] (y : R) (w : List Bool)
    (s d : ℕ) : R :=
  (((cutMasksFe01 w s).filter (fun m => maskDegree07a7 1 m=d)).map
    (maskWeight340 y y 1)).sum

def degreePrefix07a7 {R : Type*} [CommRing R] (y : R) (w : List Bool)
    (s d : ℕ) : R :=
  (((cutMasksFe01 w s).filter (fun m => maskDegree07a7 1 m≤d)).map
    (maskWeight340 y y 1)).sum

theorem degreePrefix_exhaust07a7 {R : Type*} [CommRing R] (y : R)
    (w : List Bool) (s d : ℕ) (hd : 1+2*w.length≤d) :
    degreePrefix07a7 y w s d=cutCoeffA27 y y 1 w s := by
  unfold degreePrefix07a7
  rw [List.filter_eq_self.mpr,cutMasks_sumFe01]
  intro m hm
  obtain ⟨h,_⟩ := cutMasks_specFe01 w s m hm
  have hl : m.length=w.length := by simpa using congrArg List.length h
  have hb := maskDegree_bound07a7 m 1
  simpa only [decide_eq_true_eq] using (show maskDegree07a7 1 m≤d by omega)

theorem source_degreePrefix_coeff07a7 (path : List Bool) (i j s d : ℕ)
    (hs : i+j=(frame path).mid.a+s)
    (hd : 1+2*(central28 path++[true]).length≤d) :
    coeff (frame path).mid.p i j =
    (degreePrefix07a7 (X:ℤ[X]) (central28 path++[true]) s d).coeff j := by
  rw [degreePrefix_exhaust07a7 _ _ _ _ hd,source_cut_coeffA27 path i j s hs]

#print axioms mask_natDegree07a7
#print axioms degreePrefix_exhaust07a7
#print axioms source_degreePrefix_coeff07a7
end
end MathGKM.Markov
