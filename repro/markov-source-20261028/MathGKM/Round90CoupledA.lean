import MathGKM.Round89RankA
/- Machine-authored round89. Both alpha-one allocations are retained exactly. -/
namespace SparseCoupledR90
open SparseRankR89
open Polynomial SparseColorR88 MatchingProjectionR64 FullFiberRankR80
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 1500000
def shifted (s d i j b : ℕ) : ℤ := if i=0 then 0 else count s d (i-1) j b
def punctured (s d i j b : ℕ) : ℤ :=
  if j=0 ∨ b=0 then 0 else shifted s d i (j-1) (b-1)
theorem u_cell_coeff (s d i j b : ℕ) :
    (((u*(T^s*Ccell^d)).coeff i).coeff j).coeff b=shifted s d i j b := by
  cases i with
  | zero => simp [u,coeff_X_mul_zero,shifted]
  | succ i => simpa [u,shifted,coeff_X_mul,count] using cell_coeff s d i j b
theorem zv_coeff (P : Three) (i j b : ℕ) :
    (((z*v*P).coeff i).coeff j).coeff b=
      if j=0 ∨ b=0 then 0 else (((P.coeff i).coeff (j-1)).coeff (b-1)) := by
  have he : z*v*P=C (C X*X)*P := by simp [z,v]
  rw [he,coeff_C_mul]
  cases j with
  | zero => simp [coeff_mul_X_zero]
  | succ j =>
    rw [show C X*X*P.coeff i=C X*(X*P.coeff i) by ring,coeff_C_mul,coeff_X_mul]
    cases b with
    | zero => simp
    | succ b => simp [coeff_X_mul]
theorem one_count_one (n i j b : ℕ) :
    ((B (2*n+4) 1 i j).coeff 1).coeff b=(n+1 : ℤ)*shifted 2 n i j b := by
  rw [← A_coeff,Acceptedd27f69fdf63f74746e2e53d6.obligation.1]
  have he : ((n+1 : ℕ) : Three)*u*T^2*Ccell^n=((n+1 : ℕ) : Three)*(u*(T^2*Ccell^n)) := by ring
  rw [he]
  simp only [coeff_natCast_mul]
  rw [u_cell_coeff]
  push_cast
  rfl
theorem one_count_zero (n i j b : ℕ) :
    ((B (2*n+6) 0 i j).coeff 1).coeff b=
      (n+3 : ℤ)*shifted 4 n i j b+2*punctured 2 n i j b := by
  rw [← A_coeff,Acceptedd27f69fdf63f74746e2e53d6.obligation.2.1]
  have he : u*T^2*Ccell^n*(((n+3 : ℕ) : Three)*T^2+2*z*v)=
      ((n+3 : ℕ) : Three)*(u*(T^4*Ccell^n))+2*(z*v*(u*(T^2*Ccell^n))) := by ring
  rw [he]
  simp only [coeff_add,coeff_natCast_mul,coeff_ofNat_mul]
  rw [u_cell_coeff,zv_coeff]
  unfold punctured
  split_ifs <;> simp [u_cell_coeff]
theorem shifted_conservation (s d i j b : ℕ)
    (h : shifted s d i j b ≠ 0) : i+j+b+1=s+2*d+2 := by
  unfold shifted at h
  split_ifs at h with hi
  · contradiction
  · unfold count at h
    split_ifs at h with hc
    · omega
    · contradiction
theorem punctured_conservation (s d i j b : ℕ)
    (h : punctured s d i j b ≠ 0) : i+j+b+1=s+2*d+4 := by
  unfold punctured at h
  split_ifs at h with hz
  · contradiction
  · have he := shifted_conservation s d i (j-1) (b-1) h
    omega
theorem one_large_conservation (n sigma i j b : ℕ) (hs : sigma ≤ 1)
    (h : ((B (2*n+6) sigma i j).coeff 1).coeff b ≠ 0) :
    i+j+b+1=2*n+6 := by
  rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
  · rw [one_count_zero] at h
    by_cases h0 : shifted 4 n i j b=0
    · have h1 : punctured 2 n i j b ≠ 0 := by intro hh; simp [h0,hh] at h
      have he := punctured_conservation 2 n i j b h1
      omega
    · have he := shifted_conservation 4 n i j b h0
      omega
  · rw [show 2*n+6=2*(n+1)+4 by omega,one_count_one] at h
    have h1 : shifted 2 (n+1) i j b ≠ 0 := by intro hh; simp [hh] at h
    have he := shifted_conservation 2 (n+1) i j b h1
    omega
theorem rank_one_sum (N sigma j L b r : ℕ) (hr : r ≤ L) :
    (rankPoly N sigma j L 1 b).coeff r=
      ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
        ((((B N sigma r j).coeff 0).coeff q.1)*(((B N sigma (L-r) j).coeff 1).coeff q.2)+
        (((B N sigma r j).coeff 1).coeff q.1)*(((B N sigma (L-r) j).coeff 0).coeff q.2)) := by
  rw [(Accepted0beeba7c6244e2295e3e804c.obligation.1 N sigma j L 1 b r).2 hr,
    mul_coeff_one,coeff_add,coeff_mul,coeff_mul,← Finset.sum_add_distrib]
theorem rank_one_conservation (n sigma j L b r : ℕ) (hs : sigma ≤ 1)
    (h : (rankPoly (2*n+6) sigma j L 1 b).coeff r ≠ 0) :
    L+2*j+b+1=2*(2*n+6) := by
  classical
  have hr : r ≤ L := by
    by_contra hh
    exact h (rank_tail _ _ _ _ _ _ _ (by omega))
  rw [rank_one_sum _ _ _ _ _ _ hr] at h
  obtain ⟨q,hq,hh⟩ := Finset.exists_ne_zero_of_sum_ne_zero h
  have he := Finset.HasAntidiagonal.mem_antidiagonal.mp hq
  have hz : ∀ i k, ((B (2*n+6) sigma i j).coeff 0).coeff k ≠ 0 → i+j+k=2*n+6 := by
    intro i k hk
    have hz := zero_conservation (n+3) sigma i j k hs
    rw [show 2*(n+3)=2*n+6 by omega] at hz
    exact hz hk
  by_cases hfirst : (((B (2*n+6) sigma r j).coeff 0).coeff q.1)*
      (((B (2*n+6) sigma (L-r) j).coeff 1).coeff q.2)=0
  · have hh' : (((B (2*n+6) sigma r j).coeff 1).coeff q.1)*
        (((B (2*n+6) sigma (L-r) j).coeff 0).coeff q.2) ≠ 0 := by
      intro hh0; simp [hfirst,hh0] at hh
    have hp := one_large_conservation n sigma r j q.1 hs (mul_ne_zero_iff.mp hh').1
    have hq' := hz (L-r) q.2 (mul_ne_zero_iff.mp hh').2
    omega
  · have hp := hz r q.1 (mul_ne_zero_iff.mp hfirst).1
    have hq' := one_large_conservation n sigma (L-r) j q.2 hs (mul_ne_zero_iff.mp hfirst).2
    omega
theorem one_small :
    (∀ sigma, A 1 0 sigma=0) ∧ A 1 2 1=0 ∧ A 1 2 0=u ∧ A 1 4 0=2*u*T^2 := by
  have hb0 := A_boundaries 0
  have hb1 := A_boundaries 1
  have h20 := one_step 0 0
  have h21 := one_step 0 1
  have h30 := one_step 1 0
  have h40 := one_step 2 0
  have hz : A 0 2 0=T^2 := by simpa using (zero_orientation_zero 0).2
  norm_num [hb0.1,hb0.2.1,hb0.2.2.1,hb0.2.2.2,
    hb1.1,hb1.2.2.1,hb1.2.2.2] at h20 h21 h30 h40
  rw [h20] at h30
  rw [h30,hz] at h40
  exact ⟨fun sigma => (A_boundaries sigma).2.2.1,h21,h20,by rw [h40];ring⟩
theorem one_conservation (n sigma i j b : ℕ) (hs : sigma ≤ 1)
    (h : ((B (2*n) sigma i j).coeff 1).coeff b ≠ 0) :
    i+j+b+1=2*n := by
  rcases n with _|_ | _ |n
  · rw [← A_coeff,one_small.1] at h
    simp at h
  · rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
    · have he : A 1 2 0=u*(T^0*Ccell^0) := by simp [one_small.2.2.1]
      rw [show 2*1=2 by omega,← A_coeff,he,u_cell_coeff] at h
      have hh := shifted_conservation 0 0 i j b h
      omega
    · rw [show 2*1=2 by omega,← A_coeff,one_small.2.1] at h
      simp at h
  · rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
    · have he : A 1 4 0=2*(u*(T^2*Ccell^0)) := by rw [one_small.2.2.2]; simp;ring
      rw [show 2*2=4 by omega,← A_coeff,he] at h
      simp only [coeff_ofNat_mul,u_cell_coeff] at h
      have hh : shifted 2 0 i j b ≠ 0 := by intro hz; simp [hz] at h
      have hh' := shifted_conservation 2 0 i j b hh
      omega
    · rw [show 2*2=2*0+4 by omega,one_count_one] at h
      have hh : shifted 2 0 i j b ≠ 0 := by intro hz; simp [hz] at h
      have hh' := shifted_conservation 2 0 i j b hh
      omega
  · exact one_large_conservation n sigma i j b hs h
def oneCount : ℕ → ℕ → ℕ → ℕ → ℕ → ℤ
  | 0,_,_,_,_ => 0
  | 1,sigma,i,j,b => if sigma=0 then shifted 0 0 i j b else 0
  | 2,sigma,i,j,b => if sigma=0 then 2*shifted 2 0 i j b else shifted 2 0 i j b
  | n+3,sigma,i,j,b => if sigma=0 then
      (n+3 : ℤ)*shifted 4 n i j b+2*punctured 2 n i j b
    else (n+2 : ℤ)*shifted 2 (n+1) i j b
theorem one_count (n sigma i j b : ℕ) (hs : sigma ≤ 1) :
    ((B (2*n) sigma i j).coeff 1).coeff b=oneCount n sigma i j b := by
  rcases n with _|(_|(_|n))
  · rw [← A_coeff,one_small.1]
    rfl
  · rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
    · have he : A 1 2 0=u*(T^0*Ccell^0) := by simp [one_small.2.2.1]
      rw [show 2*1=2 by omega,← A_coeff,he,u_cell_coeff]
      rfl
    · rw [show 2*1=2 by omega,← A_coeff,one_small.2.1]
      rfl
  · rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
    · have he : A 1 4 0=2*(u*(T^2*Ccell^0)) := by rw [one_small.2.2.2]; simp;ring
      rw [show 2*2=4 by omega,← A_coeff,he]
      simp only [coeff_ofNat_mul,u_cell_coeff]
      rfl
    · rw [show 2*2=2*0+4 by omega,one_count_one]
      simp [oneCount]
  · rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
    · simpa [oneCount,show 2*(n+1+1+1)=2*n+6 by omega] using one_count_zero n i j b
    · simpa [oneCount,show 2*(n+1+1+1)=2*(n+1)+4 by omega,
        Nat.cast_add,Nat.cast_one,add_assoc] using one_count_one (n+1) i j b
theorem rank_one_closed (n sigma j L b r : ℕ) (hs : sigma ≤ 1) (hr : r ≤ L) :
    (rankPoly (2*n) sigma j L 1 b).coeff r=
      ∑ q ∈ Finset.HasAntidiagonal.antidiagonal b,
        (count (isolated n sigma) (cells n sigma) r j q.1*oneCount n sigma (L-r) j q.2+
         oneCount n sigma r j q.1*count (isolated n sigma) (cells n sigma) (L-r) j q.2) := by
  rw [rank_one_sum _ _ _ _ _ _ hr]
  apply Finset.sum_congr rfl
  intro q hq
  rw [zero_count _ _ _ _ _ hs,zero_count _ _ _ _ _ hs,
    one_count _ _ _ _ _ hs,one_count _ _ _ _ _ hs]
theorem rank_one_all_conservation (n sigma j L b r : ℕ) (hs : sigma ≤ 1)
    (h : (rankPoly (2*n) sigma j L 1 b).coeff r ≠ 0) : L+2*j+b+1=4*n := by
  classical
  have hr : r ≤ L := by
    by_contra hh
    exact h (rank_tail _ _ _ _ _ _ _ (by omega))
  rw [rank_one_sum _ _ _ _ _ _ hr] at h
  obtain ⟨q,hq,hh⟩ := Finset.exists_ne_zero_of_sum_ne_zero h
  have he := Finset.HasAntidiagonal.mem_antidiagonal.mp hq
  by_cases hfirst : (((B (2*n) sigma r j).coeff 0).coeff q.1)*
      (((B (2*n) sigma (L-r) j).coeff 1).coeff q.2)=0
  · have hh' : (((B (2*n) sigma r j).coeff 1).coeff q.1)*
        (((B (2*n) sigma (L-r) j).coeff 0).coeff q.2) ≠ 0 := by
      intro hh0; simp [hfirst,hh0] at hh
    have hp := one_conservation n sigma r j q.1 hs (mul_ne_zero_iff.mp hh').1
    have hq' := zero_conservation n sigma (L-r) j q.2 hs (mul_ne_zero_iff.mp hh').2
    omega
  · have hp := zero_conservation n sigma r j q.1 hs (mul_ne_zero_iff.mp hfirst).1
    have hq' := one_conservation n sigma (L-r) j q.2 hs (mul_ne_zero_iff.mp hfirst).2
    omega
end
end SparseCoupledR90
#print axioms SparseCoupledR90.rank_one_all_conservation
