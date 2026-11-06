import MathGKM.Round29BinomialA

/-! Machine-authored endpoint-array consumer, committed round29. -/
namespace EndpointR29
open MathGKM.Markov RenewalR28
set_option maxHeartbeats 1000000

theorem mc_pos_formula (b i j : ℕ) (hi : 0 < i) (hs : i+j ≤ b) :
    mc b i j=((i+j).choose i : ℤ)*((b-j-1).choose (i-1) : ℤ) := by
  simp [mc,ne_of_gt hi,hs]

theorem mc_top (b i j : ℕ) (hs : i+j=b) : mc b i j=(b.choose i : ℤ) := by
  by_cases hi : i=0
  · subst i
    have hj : j=b := by omega
    simp [mc,hj]
  · rw [mc_pos_formula b i j (by omega) (by omega),hs]
    have he : b-j-1=i-1 := by omega
    simp [he]

theorem horizontal (b i j : ℕ) (hb : 1 ≤ b)
    (p0 : InPolygon 1 b i j) (p1 : InPolygon 1 b (i+1) j)
    (p2 : InPolygon 1 b (i+2) j) :
    mc b i j*mc b (i+2) j ≤ mc b (i+1) j^2 := by
  have hs : i+j+2 ≤ b := by simpa [InPolygon,Nat.add_comm,Nat.add_left_comm,Nat.add_assoc] using p2.2
  have hi : 0 < i := by
    by_contra h
    have hz : i=0 := by omega
    simp [InPolygon,hz] at p0
    omega
  rw [mc_pos_formula b i j hi (by omega),
    mc_pos_formula b (i+2) j (by omega) (by omega),
    mc_pos_formula b (i+1) j (by omega) (by omega)]
  have e1 : i+1-1=(i-1)+1 := by omega
  have e2 : i+2-1=(i-1)+2 := by omega
  have s0 : (i+j).choose i=(i+j).choose j := by
    rw [← Nat.choose_symm (by omega : i ≤ i+j)]
    congr 1  <;> omega
  have s1 : (i+1+j).choose (i+1)=(i+j+1).choose j := by
    rw [← Nat.choose_symm (by omega : i+1 ≤ i+1+j)]
    congr 1  <;> omega
  have s2 : (i+2+j).choose (i+2)=(i+j+2).choose j := by
    rw [← Nat.choose_symm (by omega : i+2 ≤ i+2+j)]
    congr 1  <;> omega
  rw [e1,e2,s0,s1,s2]
  exact product_lc _ _ _ _ _ _ (by positivity) (by positivity)
    (by positivity) (by positivity) (upper_lc (i+j) j) (choose_lc (b-j-1) (i-1))

theorem vertical (b i j : ℕ) (hb : 1 ≤ b)
    (p0 : InPolygon 1 b i j) (p1 : InPolygon 1 b i (j+1))
    (p2 : InPolygon 1 b i (j+2)) :
    mc b i j*mc b i (j+2) ≤ mc b i (j+1)^2 := by
  have hs : i+j+2 ≤ b := by simpa [InPolygon,Nat.add_comm,Nat.add_left_comm,Nat.add_assoc] using p2.2
  have hi : 0 < i := by
    by_contra h
    have hz : i=0 := by omega
    simp [InPolygon,hz] at p0
    omega
  rw [mc_pos_formula b i j hi (by omega),
    mc_pos_formula b i (j+2) hi (by omega),
    mc_pos_formula b i (j+1) hi (by omega)]
  have e1 : b-(j+1)-1=(b-(j+2)-1)+1 := by omega
  have e2 : b-j-1=(b-(j+2)-1)+2 := by omega
  rw [e1,e2,show i+(j+1)=i+j+1 by omega,show i+(j+2)=i+j+2 by omega]
  have h := upper_lc (b-(j+2)-1) (i-1)
  rw [mul_comm] at h
  exact product_lc _ _ _ _ _ _ (by positivity) (by positivity)
    (by positivity) (by positivity) (upper_lc (i+j) i) h

theorem diagonal (b i j : ℕ) (hb : 1 ≤ b)
    (p0 : InPolygon 1 b i (j+2)) (p1 : InPolygon 1 b (i+1) (j+1))
    (p2 : InPolygon 1 b (i+2) j) :
    mc b i (j+2)*mc b (i+2) j ≤ mc b (i+1) (j+1)^2 := by
  have hs : i+j+2 ≤ b := by simpa [InPolygon,Nat.add_comm,Nat.add_left_comm,Nat.add_assoc] using p0.2
  by_cases ht : i+j+2=b
  · rw [mc_top b i (j+2) (by omega),mc_top b (i+2) j (by omega),
      mc_top b (i+1) (j+1) (by omega)]
    exact choose_lc b i
  have hi : 0 < i := by
    by_contra h
    have hz : i=0 := by omega
    simp [InPolygon,hz] at p0
    omega
  rw [mc_pos_formula b i (j+2) hi (by omega),
    mc_pos_formula b (i+2) j (by omega) (by omega),
    mc_pos_formula b (i+1) (j+1) (by omega) (by omega)]
  have s0 : (b-(j+2)-1).choose (i-1)=(b-j-3).choose (b-i-j-2) := by
    rw [← Nat.choose_symm (by omega : i-1 ≤ b-(j+2)-1)]
    congr 1  <;> omega
  have s1 : (b-(j+1)-1).choose (i+1-1)=(b-j-3+1).choose (b-i-j-2) := by
    rw [← Nat.choose_symm (by omega : i+1-1 ≤ b-(j+1)-1)]
    congr 1  <;> omega
  have s2 : (b-j-1).choose (i+2-1)=(b-j-3+2).choose (b-i-j-2) := by
    rw [← Nat.choose_symm (by omega : i+2-1 ≤ b-j-1)]
    congr 1  <;> omega
  rw [s0,s1,s2,show i+(j+2)=i+j+2 by omega,
    show i+2+j=i+j+2 by omega,show i+1+(j+1)=i+j+2 by omega]
  exact product_lc _ _ _ _ _ _ (by positivity) (by positivity)
    (by positivity) (by positivity) (choose_lc (i+j+2) i)
    (upper_lc (b-j-3) (b-i-j-2))

theorem directional_bundle : ∀ b : ℕ, 1 ≤ b →
    (∀ i j, InPolygon 1 b i j → InPolygon 1 b (i+1) j →
      InPolygon 1 b (i+2) j → mc b i j*mc b (i+2) j ≤ mc b (i+1) j^2) ∧
    (∀ i j, InPolygon 1 b i j → InPolygon 1 b i (j+1) →
      InPolygon 1 b i (j+2) → mc b i j*mc b i (j+2) ≤ mc b i (j+1)^2) ∧
    (∀ i j, InPolygon 1 b i (j+2) → InPolygon 1 b (i+1) (j+1) →
      InPolygon 1 b (i+2) j → mc b i (j+2)*mc b (i+2) j ≤ mc b (i+1) (j+1)^2) := by
  intro b hb
  exact ⟨fun i j => horizontal b i j hb,fun i j => vertical b i j hb,
    fun i j => diagonal b i j hb⟩

end EndpointR29
