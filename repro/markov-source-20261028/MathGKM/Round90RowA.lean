import MathGKM.Round90BinomialA

/- Machine-authored round90. Actual alpha-zero row, with all guards retained. -/
namespace SparseRankR90
open Polynomial SparseRankR89 FullFiberRankR80
noncomputable section
set_option maxHeartbeats 2000000

def row (n sigma j i : ℕ) : ℤ :=
  count (isolated n sigma) (cells n sigma) i j (2*n-i-j)

theorem row_nonneg (n sigma j i : ℕ) : 0 ≤ row n sigma j i := count_nonneg _ _ _ _ _

theorem row_positive (n sigma j i : ℕ) :
    0 < row n sigma j i ↔ i+j ≤ 2*n ∧
      2*n ≤ i+j+cells n sigma ∧ 2*n ≤ i+2*j := by
  rw [row,count_positive_even]
  omega

theorem row_interval (n sigma j x y z : ℕ) (hxy : x<y) (hyz : y<z)
    (hx : 0<row n sigma j x) (hz : 0<row n sigma j z) : 0<row n sigma j y := by
  rw [row_positive] at hx hz ⊢
  omega

theorem row_eval (n sigma j i q x : ℕ) (hq : i+j+q=2*n)
    (hqd : q ≤ cells n sigma) (hqj : q ≤ j) (hx : x+q=n) :
    row n sigma j i = ((cells n sigma).choose q : ℤ)*((2*x).choose i : ℤ) := by
  have hd := dimension n sigma
  have hqi : 2*n-i-j=q := by omega
  have hm : isolated n sigma+2*(cells n sigma-q)=2*x := by omega
  simp only [row,hqi,count]
  rw [if_pos ⟨hqd,hqj,by omega⟩,hm]

theorem row_step (n sigma j i q x : ℕ) (hs : sigma≤1)
    (hq : i+j+q=2*n) (hx : x+q=n)
    (h0 : 0<row n sigma j i) (h1 : 0<row n sigma j (i+1)) :
    (if sigma=1 then (i+1 : ℤ)*(2*x+1-i : ℕ)
      else (x : ℤ)*(i+1 : ℤ)*(2*x+1-i : ℕ))*row n sigma j (i+1) =
    (if sigma=1 then 2*(q : ℤ)*(2*x+1 : ℤ)
      else 2*(q : ℤ)*(x+1 : ℤ)*(2*x+1 : ℤ))*row n sigma j i := by
  have hp0 := (row_positive n sigma j i).mp h0
  have hp1 := (row_positive n sigma j (i+1)).mp h1
  have hd := dimension n sigma
  have hcells : cells n sigma ≤ n := by simp [cells]; split_ifs <;> omega
  have hq1 : 1≤q := by omega
  have hqd : q≤cells n sigma := by omega
  have hqj : q≤j := by omega
  have hi : i≤2*x := by omega
  have e0 := row_eval n sigma j i q x hq hqd hqj hx
  have e1 := row_eval n sigma j (i+1) (q-1) (x+1) (by omega) (by omega) (by omega) (by omega)
  rw [e0,e1]
  have hh := adjacent_product (cells n sigma) q (2*x) i hq1 hqd hi
  rw [show 2*x+2=2*(x+1) by omega] at hh
  rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
  · have hn : 1≤n := by omega
    have hc : cells n 0=n-1 := by simp [cells]
    have he : cells n 0-q+1=x := by rw [hc]; omega
    simp only [he,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one] at hh
    simp only [show ¬(0:ℕ)=1 by omega,if_false]
    convert hh using 1 <;> push_cast <;> ring
  · have hc : cells n 1=n := by simp [cells]
    have he : cells n 1-q+1=x+1 := by rw [hc]; omega
    rw [he] at hh
    have hh' : (x+1 : ℤ)*
        (((i+1 : ℤ)*(2*x+1-i : ℕ))*
        (((cells n 1).choose (q-1) : ℤ)*((2*(x+1)).choose (i+1) : ℤ))) =
      (x+1 : ℤ)*(2*(q : ℤ)*(2*x+1 : ℤ)*
        (((cells n 1).choose q : ℤ)*((2*x).choose i : ℤ))) := by
      convert hh using 1 <;> push_cast <;> ring
    have heq := mul_left_cancel₀ (show (x+1 : ℤ)≠0 by omega) hh'
    simpa using heq

theorem ratio_lc_int (f0 f1 f2 A0 A1 B0 B1 : ℤ)
    (h0 : 0≤f0) (h1 : 0≤f1) (hA0 : 0<A0) (hA1 : 0<A1)
    (eq0 : A0*f1=B0*f0) (eq1 : A1*f2=B1*f1)
    (hr : B1*A0≤B0*A1) : f0*f2≤f1^2 := by
  have hid : A0*A1*(f1^2-f0*f2)=f0*f1*(B0*A1-B1*A0) := by
    linear_combination A1*f1*eq0 - A0*f0*eq1
  have hp := mul_nonneg (mul_nonneg h0 h1) (sub_nonneg.mpr hr)
  have hA := mul_pos hA0 hA1
  nlinarith

theorem row_lc (n sigma j i : ℕ) (hs : sigma≤1) :
    row n sigma j i*row n sigma j (i+2) ≤ row n sigma j (i+1)^2 := by
  by_cases h0 : row n sigma j i=0
  · rw [h0,zero_mul]; positivity
  by_cases h2 : row n sigma j (i+2)=0
  · rw [h2,mul_zero]; positivity
  have hp0 : 0<row n sigma j i := lt_of_le_of_ne (row_nonneg _ _ _ _) (Ne.symm h0)
  have hp2 : 0<row n sigma j (i+2) := lt_of_le_of_ne (row_nonneg _ _ _ _) (Ne.symm h2)
  have hp1 := row_interval n sigma j i (i+1) (i+2) (by omega) (by omega) hp0 hp2
  have hd0 := (row_positive _ _ _ _).mp hp0
  have hd2 := (row_positive _ _ _ _).mp hp2
  let q := 2*n-i-j
  let x := n-q
  have hcn : cells n sigma≤n := by simp [cells]; split_ifs <;> omega
  have hq : i+j+q=2*n := by dsimp [q]; omega
  have hx : x+q=n := by dsimp [x,q]; omega
  have hq2 : 2≤q := by omega
  have hi : i≤2*x := by omega
  have e0 := row_step n sigma j i q x hs hq hx hp0 hp1
  have e1 := row_step n sigma j (i+1) (q-1) (x+1) hs (by omega) (by omega) hp1
    (by simpa [Nat.add_assoc] using hp2)
  have em0 : ((2*x+1-i : ℕ):ℤ)=2*(x:ℤ)-(i:ℤ)+1 := by omega
  have em1 : ((2*(x+1)+1-(i+1) : ℕ):ℤ)=2*(x:ℤ)-(i:ℤ)+2 := by omega
  have eq : ((q-1 : ℕ):ℤ)=(q:ℤ)-1 := by omega
  rw [em0] at e0
  rw [em1,eq] at e1
  simp only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,Nat.add_assoc] at e0 e1
  rcases (show sigma=0 ∨ sigma=1 by omega) with rfl|rfl
  · have hcx : 1≤x := by
      have hh : cells n 0=n-1 := by simp [cells]
      omega
    simp only [show ¬(0:ℕ)=1 by omega,if_false] at e0 e1
    have ha0 : 0 < (x:ℤ)*(i+1 : ℤ)*(2*(x:ℤ)-(i:ℤ)+1) :=
      mul_pos (mul_pos (by omega) (by omega)) (by omega)
    have ha1 : 0 < ((x:ℤ)+1)*((i:ℤ)+1+1)*(2*(x:ℤ)-(i:ℤ)+2) :=
      mul_pos (mul_pos (by omega) (by omega)) (by omega)
    apply ratio_lc_int _ _ _ _ _ _ _ (row_nonneg _ _ _ _) (row_nonneg _ _ _ _) ha0 ha1 e0 e1
    convert ratio_comparison_zero (q:ℤ) x i (by omega) (by omega) (by omega) (by omega) using 1 <;> ring
  · simp only [show (1:ℕ)=1 from rfl,if_true] at e0 e1
    have ha0 : 0 < (i+1 : ℤ)*(2*(x:ℤ)-(i:ℤ)+1) := mul_pos (by omega) (by omega)
    have ha1 : 0 < ((i:ℤ)+1+1)*(2*(x:ℤ)-(i:ℤ)+2) := mul_pos (by omega) (by omega)
    apply ratio_lc_int _ _ _ _ _ _ _ (row_nonneg _ _ _ _) (row_nonneg _ _ _ _) ha0 ha1 e0 e1
    convert ratio_comparison (q:ℤ) x i (by omega) (by omega) (by omega) (by omega) using 1 <;> ring

end
end SparseRankR90
