import MathGKM.Accepteda37f2ddec9fd5f541b13b66c
import MathGKM.Acceptedd27f69fdf63f74746e2e53d6

/- Machine-authored round89. Exact coefficient extraction, with guards. -/
namespace SparseRankR89
open Polynomial SparseColorR88 MatchingProjectionR64
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 1500000
abbrev UV :=  Polynomial (Polynomial ℤ)
def move : Three →+* Polynomial UV := 
  Polynomial.Bivariate.swap.toRingHom.comp
    (Polynomial.mapRingHom Polynomial.Bivariate.swap.toRingHom)
def t : UV :=  X+C X
def y : UV :=  C X
theorem move_coeff (P : Three) (b i j : ℕ) :
    (((move P).coeff b).coeff i).coeff j = (((P.coeff i).coeff j).coeff b) :=  by
  unfold move
  rw [RingHom.comp_apply]
  change (((Polynomial.Bivariate.swap
    (P.map Polynomial.Bivariate.swap.toRingHom)).coeff b).coeff i).coeff j  =  _
  rw [SparseColorR88.swap_coeff]
  simp only [Polynomial.coeff_map]
  exact SparseColorR88.swap_coeff (P.coeff i) b j
attribute [local simp] Polynomial.Bivariate.swap_X Polynomial.Bivariate.swap_Y
  Polynomial.Bivariate.swap_C_C
theorem move_T : move T = C t :=  by simp [move,T,u,v,t]
theorem move_cell : move Ccell = C (t^2)+C y*X :=  by
  simp [move,Ccell,T,u,v,z,t,y]
theorem binomial_coeff {R : Type*} [CommRing R] (a c : R) (d b : ℕ) :
    ((C a+C c*X)^d).coeff b  = 
      if b ≤ d then (d.choose b : R)*a^(d-b)*c^b else 0 :=  by
  classical
  rw [add_comm,add_pow,finsetSum_coeff]
  have ht : ∀ k : ℕ, ((C c*X)^k*(C a)^(d-k)*(d.choose k : Polynomial R)).coeff b  = 
      if b = k then (d.choose k : R)*a^(d-k)*c^k else 0 :=  by
    intro k
    have he : (C c*X)^k*(C a)^(d-k)*(d.choose k : Polynomial R) = 
        C ((d.choose k : R)*a^(d-k)*c^k)*X^k :=  by
      simp only [mul_pow,← map_pow]
      rw [map_mul,map_mul]
      simp only [map_natCast]
      ring
    rw [he,coeff_C_mul_X_pow]
  simp only [ht]
  by_cases hb : b ≤ d
  · simp [Finset.sum_ite_eq',Finset.mem_range,Nat.lt_succ_iff,hb]
  · simp [Finset.sum_ite_eq',Finset.mem_range,Nat.lt_succ_iff,hb]
theorem cell_beta (s d b : ℕ) :
    (move (T^s*Ccell^d)).coeff b  = 
      if b ≤ d then (d.choose b : UV)*y^b*t^(s+2*(d-b)) else 0 :=  by
  rw [map_mul,map_pow,map_pow,move_T,move_cell,← map_pow,coeff_C_mul,binomial_coeff]
  by_cases hb : b ≤ d
  · simp only [hb,if_true]
    rw [pow_add,pow_mul]
    ring
  · simp [hb]
theorem t_coeff (m i j : ℕ) :
    ((t^m).coeff i).coeff j  =  if i+j = m then (m.choose i : ℤ) else 0 :=  by
  rw [t,coeff_X_add_C_pow]
  by_cases hi : i  ≤  m
  · rw [show (X : Polynomial ℤ)^(m-i)*(m.choose i : Polynomial ℤ) = 
        C (m.choose i : ℤ)*X^(m-i) by simp only [map_natCast]; ring]
    rw [coeff_C_mul_X_pow]
    by_cases h : i+j = m
    · rw [if_pos (show j = m-i by omega),if_pos h]
    · rw [if_neg (show j ≠ m-i by omega),if_neg h]
  · simp [Nat.choose_eq_zero_of_lt (by omega : m < i),show i+j ≠ m by omega]
theorem cell_coeff (s d i j b : ℕ) :
    (((T^s*Ccell^d).coeff i).coeff j).coeff b  = 
      if b ≤ d ∧ b ≤ j ∧ i+j+b = s+2*d then
        (d.choose b : ℤ)*((s+2*(d-b)).choose i : ℤ) else 0 :=  by
  rw [← move_coeff,cell_beta]
  by_cases hb : b ≤ d
  · simp only [hb,if_true]
    have he : (d.choose b : UV)*y^b*t^(s+2*(d-b)) = 
        C (C (d.choose b : ℤ)*X^b)*t^(s+2*(d-b)) :=  by
      simp [y,map_mul,map_pow]
    rw [he,coeff_C_mul]
    by_cases hj : b ≤ j
    · rw [show C (d.choose b : ℤ)*X^b*((t^(s+2*(d-b))).coeff i) = 
          C (d.choose b : ℤ)*(((t^(s+2*(d-b))).coeff i)*X^b) by ring]
      rw [coeff_C_mul,coeff_mul_X_pow',if_pos hj,t_coeff]
      by_cases hd : i+j+b = s+2*d
      · simp [hj,hd,show i+(j-b) = s+2*(d-b) by omega]
      · simp [hj,hd,show i+(j-b) ≠ s+2*(d-b) by omega]
    · rw [show C (d.choose b : ℤ)*X^b*((t^(s+2*(d-b))).coeff i) = 
          C (d.choose b : ℤ)*(((t^(s+2*(d-b))).coeff i)*X^b) by ring]
      simp [coeff_mul_X_pow',hj]
  · simp [hb]
def count (s d i j b : ℕ) : ℤ := 
  if b  ≤  d ∧ b  ≤  j ∧ i+j+b = s+2*d then
    (d.choose b : ℤ)*((s+2*(d-b)).choose i : ℤ) else 0
def cells (n sigma : ℕ) : ℕ :=  if sigma = 1 then n else n-1
def isolated (n sigma : ℕ) : ℕ :=  if n = 0 ∨ sigma = 1 then 0 else 2
theorem even_zero (n sigma : ℕ) (hs : sigma  ≤  1) :
    A 0 (2*n) sigma = T^(isolated n sigma)*Ccell^(cells n sigma) :=  by
  rcases n with _|n
  · simpa [isolated,cells] using (Accepteda37f2ddec9fd5f541b13b66c.obligation.2.1 sigma).1
  · rcases (show sigma = 0 ∨ sigma = 1 by omega) with rfl|rfl
    · simpa [isolated,cells,show 2*(n+1) = 2*n+2 by omega] using
        (Accepteda37f2ddec9fd5f541b13b66c.obligation.2.2.2.2.2 n).2
    · simpa [isolated,cells] using
        (Accepteda37f2ddec9fd5f541b13b66c.obligation.2.2.2.2.1 (n+1)).1
theorem A_coeff (c N sigma i j b : ℕ) :
    (((A c N sigma).coeff i).coeff j).coeff b = ((B N sigma i j).coeff c).coeff b :=  by
  exact congrArg (fun P : Polynomial ℤ  => P.coeff b)
    (Accepteda37f2ddec9fd5f541b13b66c.obligation.1 (F N sigma) c i j)
theorem zero_count (n sigma i j b : ℕ) (hs : sigma  ≤  1) :
    ((B (2*n) sigma i j).coeff 0).coeff b = 
      count (isolated n sigma) (cells n sigma) i j b :=  by
  rw [← A_coeff,even_zero n sigma hs]
  exact cell_coeff _ _ _ _ _
theorem count_nonneg (s d i j b : ℕ) : 0  ≤  count s d i j b :=  by
  unfold count
  split_ifs  <;> positivity
theorem count_positive (s d i j b : ℕ) :
    0  <  count s d i j b ↔ b  ≤  d ∧ b  ≤  j ∧
      i+j+b = s+2*d ∧ i  ≤  s+2*(d-b) :=  by
  unfold count
  by_cases h : b  ≤  d ∧ b  ≤  j ∧ i+j+b = s+2*d
  · rw [if_pos h]
    simp only [h.1,h.2.1,h.2.2,true_and]
    have hb : 0  <  (d.choose b : ℤ) :=  by exact_mod_cast Nat.choose_pos h.1
    rw [mul_pos_iff_of_pos_left hb]
    have hc : (0 : ℤ)  <  ((s+2*(d-b)).choose i : ℤ) ↔ i  ≤  s+2*(d-b) :=  by
      norm_cast
      constructor
      · intro hp
        by_contra hn
        simp [Nat.choose_eq_zero_of_lt (by omega : s+2*(d-b) < i)] at hp
      · exact Nat.choose_pos
    rw [hc]
  · rw [if_neg h]
    simp only [lt_self_iff_false,false_iff]
    tauto
theorem zero_conservation (n sigma i j b : ℕ) (hs : sigma  ≤  1)
    (hnz : ((B (2*n) sigma i j).coeff 0).coeff b  ≠  0) : i+j+b = 2*n :=  by
  rw [zero_count n sigma i j b hs] at hnz
  unfold count at hnz
  split_ifs at hnz with h
  · have he : isolated n sigma+2*cells n sigma = 2*n :=  by
      rcases n with _|n  <;> simp [isolated,cells]  <;> split_ifs  <;> omega
    omega
  · exact False.elim (hnz rfl)
end
end SparseRankR89
#print axioms SparseRankR89.cell_coeff
