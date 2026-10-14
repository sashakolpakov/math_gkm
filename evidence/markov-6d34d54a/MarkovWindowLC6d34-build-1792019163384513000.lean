import MarkovConvolutionFe01
import MarkovCross774
import MarkovBinomialLC6ade
/-! Machine-authored request 6d34. Finite-window aggregation of negative
binomial sequences. No assertion of the full Markov root. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 2000000

theorem crossLC_balanced6d34 {f : ℤ → ℝ} (hf : CrossLC f)
    (i : ℤ) (n m : ℕ) :
    f i*f (i+n+m) ≤ f (i+n)*f (i+m) := by
  induction n generalizing i m with
  | zero => simp
  | succ n ih =>
    cases m with
    | zero => simp [mul_comm]
    | succ m =>
      have h := hf i (i+n+m+1) (by omega)
      have h' := ih (i+1) m
      push_cast at *
      have h'' : f (i+1)*f (i+n+m+1) ≤ f (i+1+n)*f (i+1+m) := by
        convert h' using 1 <;> congr 1 <;> omega
      convert le_trans h h'' using 1 <;> congr 1 <;> congr 1 <;> omega

theorem toe_seq6d34 (p : ℝ[X]) (a b : ℕ) :
    toeFe01 p a b=CoeffSeq p ((b:ℤ)-a) := by
  by_cases h : a≤b
  · simp [toeFe01,CoeffSeq,h,show ¬(b:ℤ)-a<0 by omega,
      show ((b:ℤ)-a).toNat=b-a by omega]
  · simp [toeFe01,CoeffSeq,h,show (b:ℤ)-a<0 by omega]

theorem crossLC_pf2_6d34 (p : ℝ[X]) (hp : CrossLC (CoeffSeq p)) :
    PolyPF2Fe01 p := by
  intro a b c d hab hcd
  simp only [toe_seq6d34]
  have h := crossLC_balanced6d34 hp ((c:ℤ)-b) (b-a) (d-c)
  have e1 : (c:ℤ)-b+↑(b-a)+↑(d-c)=(d:ℤ)-a := by omega
  have e2 : (c:ℤ)-b+↑(b-a)=(c:ℤ)-a := by omega
  have e3 : (c:ℤ)-b+↑(d-c)=(d:ℤ)-b := by omega
  rw [e1,e2,e3] at h
  nlinarith only [h]

theorem pf2_crossLC6d34 (p : ℝ[X]) (hn : ∀ k, 0≤p.coeff k)
    (hp : PolyPF2Fe01 p) : CrossLC (CoeffSeq p) := by
  intro i j hij
  by_cases hi : i<0
  · simp only [CoeffSeq,hi,if_true,zero_mul]
    apply mul_nonneg <;> split_ifs <;> first | exact le_rfl | exact hn _
  · have hj : ¬j<0 := by omega
    have hi1 : ¬i+1<0 := by omega
    have hj1 : ¬j+1<0 := by omega
    have h := hp 0 1 (i.toNat+1) (j.toNat+1) (by omega) (by omega)
    simp [toeFe01] at h
    simp only [CoeffSeq,hi,hj,hi1,hj1,if_false]
    rw [show (i+1).toNat=i.toNat+1 by omega,
      show (j+1).toNat=j.toNat+1 by omega]
    nlinarith only [h]

theorem coeffSeq_nonneg6d34 (p : ℝ[X]) (hn : ∀ k, 0≤p.coeff k)
    (k : ℤ) : 0≤CoeffSeq p k := by
  unfold CoeffSeq
  split_ifs <;> first | exact le_rfl | exact hn _

theorem crossLC_poly_mul6d34 (p q : ℝ[X])
    (hp : CrossLC (CoeffSeq p)) (hq : CrossLC (CoeffSeq q))
    (hnp : ∀ k, 0≤p.coeff k) (hnq : ∀ k, 0≤q.coeff k) :
    CrossLC (CoeffSeq (p*q)) := by
  apply pf2_crossLC6d34
  · intro k
    rw [Polynomial.coeff_mul]
    exact Finset.sum_nonneg (fun x _ => mul_nonneg (hnp x.1) (hnq x.2))
  · exact polyPF2_mulFe01 (crossLC_pf2_6d34 p hp) (crossLC_pf2_6d34 q hq)

def nbPoly6d34 (s N : ℕ) : ℝ[X] :=
  ∑ k ∈ Finset.range (N+1), Polynomial.monomial k ((k+s).choose s : ℝ)

theorem nbPoly_coeff6d34 (s N k : ℕ) :
    (nbPoly6d34 s N).coeff k=if k≤N then ((k+s).choose s : ℝ) else 0 := by
  classical
  simp [nbPoly6d34,Polynomial.coeff_monomial,Finset.sum_ite_eq',Nat.lt_succ_iff]

theorem nbPoly_nonneg6d34 (s N k : ℕ) : 0≤(nbPoly6d34 s N).coeff k := by
  rw [nbPoly_coeff6d34]
  split_ifs <;> positivity

theorem nbPoly_cross6d34 (s N : ℕ) : CrossLC (CoeffSeq (nbPoly6d34 s N)) := by
  apply crossLC_of_adjacent_interval774
  · exact coeffSeq_nonneg6d34 _ (nbPoly_nonneg6d34 s N)
  · intro k
    by_cases hk : k≤0
    · have hz : k-1<0 := by omega
      simp only [CoeffSeq,hz,if_true,zero_mul]
      exact sq_nonneg _
    · have hkm : ¬k-1<0 := by omega
      have hk0 : ¬k<0 := by omega
      have hkp : ¬k+1<0 := by omega
      simp only [CoeffSeq,hkm,hk0,hkp,if_false,nbPoly_coeff6d34]
      by_cases hN : (k+1).toNat≤N
      · rw [if_pos hN,if_pos (show k.toNat≤N by omega),
          if_pos (show (k-1).toNat≤N by omega)]
        have h := choose_upper_lc6 ((k-1).toNat+s) s
        have h' : (((k-1).toNat+s).choose s : ℝ)*
            (((k-1).toNat+s+2).choose s : ℝ) ≤
            (((k-1).toNat+s+1).choose s : ℝ)^2 := by exact_mod_cast h
        convert h' using 1 <;> congr 3 <;> omega
      · rw [if_neg hN,mul_zero]
        exact sq_nonneg _
  · intro i k j hik hkj hi hj
    have hi0 : ¬i<0 := by intro h; simp [CoeffSeq,h] at hi
    have hj0 : ¬j<0 := by omega
    have hk0 : ¬k<0 := by omega
    have hjN : j.toNat≤N := by
      by_contra h
      simp [CoeffSeq,hj0,nbPoly_coeff6d34,h] at hj
    simp only [CoeffSeq,hk0,if_false,nbPoly_coeff6d34,
      if_pos (show k.toNat≤N by omega)]
    exact_mod_cast Nat.choose_pos (show s≤k.toNat+s by omega)

theorem crossLC_reverse6d34 {f : ℤ → ℝ} (hf : CrossLC f) (N : ℤ) :
    CrossLC (fun k => f (N-k)) := by
  intro i j hij
  have h := hf (N-j-1) (N-i-1) (by omega)
  have e1 : N-i-1+1=N-i := by omega
  have e2 : N-j-1+1=N-j := by omega
  have e3 : N-(j+1)=N-j-1 := by omega
  have e4 : N-(i+1)=N-i-1 := by omega
  rw [e1,e2] at h
  simpa only [e3,e4,mul_comm] using h

theorem crossLC_product6d34 {f g : ℤ → ℝ} (hf : CrossLC f) (hg : CrossLC g)
    (hnf : ∀ k, 0≤f k) (hng : ∀ k, 0≤g k) : CrossLC (fun k => f k*g k) := by
  intro i j hij
  have h := mul_le_mul (hf i j hij) (hg i j hij)
    (mul_nonneg (hng _) (hng _)) (mul_nonneg (hnf _) (hnf _))
  convert h using 1 <;> ring

/-- Residual for a consecutive interval of repeated-B degree layers.
The first parameter is one less than the positive number of cuts. -/
def runIntervalSeq6d34 (s N width : ℕ) (k : ℤ) : ℝ :=
  CoeffSeq (nbPoly6d34 s N) k *
    CoeffSeq (nbPoly6d34 s N * nbPoly6d34 0 width) ((N:ℤ)-k)

theorem runInterval_cross6d34 (s N width : ℕ) :
    CrossLC (runIntervalSeq6d34 s N width) := by
  apply crossLC_product6d34 (nbPoly_cross6d34 s N)
    (crossLC_reverse6d34 (crossLC_poly_mul6d34 _ _ (nbPoly_cross6d34 s N)
      (nbPoly_cross6d34 0 width) (nbPoly_nonneg6d34 s N)
      (nbPoly_nonneg6d34 0 width)) N)
  · exact coeffSeq_nonneg6d34 _ (nbPoly_nonneg6d34 s N)
  · intro k
    apply coeffSeq_nonneg6d34
    intro j
    rw [Polynomial.coeff_mul]
    exact Finset.sum_nonneg (fun x _ => mul_nonneg (nbPoly_nonneg6d34 s N x.1)
      (nbPoly_nonneg6d34 0 width x.2))

theorem runInterval_smoothed_lc6d34 (s N width t : ℕ) (k : ℤ) :
    Pascal t (runIntervalSeq6d34 s N width) (k-1)*
      Pascal t (runIntervalSeq6d34 s N width) (k+1) ≤
      Pascal t (runIntervalSeq6d34 s N width) k^2 :=
  crossLC_adjacent (crossLC_pascal (runInterval_cross6d34 s N width) t) k

#print axioms runInterval_cross6d34
#print axioms runInterval_smoothed_lc6d34
end
end MathGKM.Markov
