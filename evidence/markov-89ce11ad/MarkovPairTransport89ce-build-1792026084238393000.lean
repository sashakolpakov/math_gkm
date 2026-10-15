import MarkovPairOrder89ce
/-! Machine-authored 89ce11ad. Finite nonnegative transport certificates
for pair-weighted gaps. Source existence of certificates remains open. -/
namespace MathGKM.Markov
noncomputable section
open Finset

theorem finite_transport_nonneg89 {ι : Type*} (D : Finset ι)
 (G R W : ι → ℝ) (M : ι → ι → ℝ)
 (hnW : ∀ x∈D,0≤W x) (hnR : ∀ x∈D,0≤R x)
 (hnM : ∀ x∈D,∀ y∈D,0≤M x y)
 (ho : ∀ x∈D,∀ y∈D,M x y≠0 → W x≤W y)
 (hid : ∀ x∈D,G x=R x+(∑ y∈D,M y x)-(∑ y∈D,M x y)) :
 0≤∑ x∈D,G x*W x := by
 have hm : (∑ x∈D,∑ y∈D,M x y*W x)≤∑ x∈D,∑ y∈D,M x y*W y := by
  apply sum_le_sum
  intro x hx
  apply sum_le_sum
  intro y hy
  by_cases hz : M x y=0
  · simp [hz]
  · exact mul_le_mul_of_nonneg_left (ho x hx y hy hz) (hnM x hx y hy)
 have hr : 0≤∑ x∈D,R x*W x :=
  sum_nonneg (fun x hx => mul_nonneg (hnR x hx) (hnW x hx))
 have he : (∑ x∈D,G x*W x)=
     (∑ x∈D,R x*W x)+(∑ x∈D,∑ y∈D,M x y*W y)-
       (∑ x∈D,∑ y∈D,M x y*W x) := by
  calc
   _=(∑ x∈D,R x*W x)+(∑ x∈D,∑ y∈D,M y x*W x)-
       (∑ x∈D,∑ y∈D,M x y*W x) := by
    simp_rw [sum_congr rfl hid]
    simp only [sub_mul,add_mul,Finset.sum_mul,Finset.sum_sub_distrib,
      Finset.sum_add_distrib]
   _=_ := by rw [Finset.sum_comm (f:=fun x y => M y x*W x)]
 rw [he]
 linarith

theorem degree_transport_nonneg89 (D : Finset (ℕ × ℕ))
 (G R : ℕ × ℕ → ℝ) (M : (ℕ × ℕ) → (ℕ × ℕ) → ℝ)
 (hnR : ∀ x∈D,0≤R x) (hnM : ∀ x∈D,∀ y∈D,0≤M x y)
 (ho : ∀ x∈D,∀ y∈D,M x y≠0 → DegreePairLE89 x y)
 (hid : ∀ x∈D,G x=R x+(∑ y∈D,M y x)-(∑ y∈D,M x y))
 (w : ℕ → ℝ) (hn : ∀ i,0≤w i) (hm : Monotone w)
 (ha : ∀ i,w i*w (i+2)≤w (i+1)^2) :
 0≤∑ x∈D,G x*(w x.1*w x.2) := by
 apply finite_transport_nonneg89 D G R (fun x => w x.1*w x.2) M
 · intro x hx;exact mul_nonneg (hn _) (hn _)
 · exact hnR
 · exact hnM
 · intro x hx y hy hM
   exact degree_pair_order_unsorted89 hn hm
     (natCross_of_increasing_adjacent89 w hn hm ha) x y (ho x hx y hy hM)
 · exact hid

#print axioms finite_transport_nonneg89
#print axioms degree_transport_nonneg89
end
end MathGKM.Markov
