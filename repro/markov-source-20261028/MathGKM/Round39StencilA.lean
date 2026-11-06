import MathGKM.Round39MixtureA
import MathGKM.Round38ControlA
import MathGKM.Accepted3c265afc977f227a9f6535e7

/-! Machine-authored round39. Exact integer-zero-extended stencil. All shifted
compatibility premises are explicit; none is asserted for reachable states. -/
namespace ShiftedR39
open MathGKM.Markov StateCrossR38
open scoped BigOperators
noncomputable section
set_option maxHeartbeats 1500000

theorem zadd (P Q : BiPoly) (i j : ℤ) :
    zcoeff (P+Q) i j=zcoeff P i j+zcoeff Q i j := by
  simp only [zcoeff]
  split_ifs <;> simp [coeff]

theorem zshift (P : BiPoly) (a b : ℕ) (i j : ℤ) :
    zcoeff (U^a*V^b*P) i j=zcoeff P (i-a) (j-b) := by
  simp only [zcoeff,RightR30.coeff_shift,RightR30.shift]
  by_cases hi : 0 ≤ i
  · by_cases hj : 0 ≤ j
    · simp only [hi,hj,and_self,ite_true]
      by_cases ha : (a : ℤ) ≤ i
      · by_cases hb : (b : ℤ) ≤ j
        · have h1 : a ≤ i.toNat ∧ b ≤ j.toNat := by omega
          have h2 : 0 ≤ i-a ∧ 0 ≤ j-b := by omega
          have e1 : (i-a).toNat=i.toNat-a := by omega
          have e2 : (j-b).toNat=j.toNat-b := by omega
          simp only [if_pos h1,if_pos h2,e1,e2]
        · have h1 : ¬ (a ≤ i.toNat ∧ b ≤ j.toNat) := by omega
          have h2 : ¬ (0 ≤ i-a ∧ 0 ≤ j-b) := by omega
          simp only [if_neg h1,if_neg h2]
      · have h1 : ¬ (a ≤ i.toNat ∧ b ≤ j.toNat) := by omega
        have h2 : ¬ (0 ≤ i-a ∧ 0 ≤ j-b) := by omega
        simp only [if_neg h1,if_neg h2]
    · have h2 : ¬ (0 ≤ i-a ∧ 0 ≤ j-b) := by omega
      simp only [hj,and_false,if_false,if_neg h2]
  · have h2 : ¬ (0 ≤ i-a ∧ 0 ≤ j-b) := by omega
    simp only [hi,false_and,if_false,if_neg h2]

def f (P Q : BiPoly) (i j dx dy : ℤ) : Fin 5 → ℤ → ℤ :=
  ![fun t => zcoeff P (i+t*dx-2) (j+t*dy),
    fun t => zcoeff P (i+t*dx-1) (j+t*dy-1),
    fun t => zcoeff P (i+t*dx) (j+t*dy-2),
    fun t => zcoeff P (i+t*dx-1) (j+t*dy),
    fun t => zcoeff Q (i+t*dx) (j+t*dy-1)]
def weights (mid : Bool) : Fin 5 → ℕ := ![1,2,1,if mid then 1 else 0,1]
def output (mid : Bool) (P Q : BiPoly) : BiPoly :=
  if mid then (RightR30.T^2+U)*P+V*Q else RightR30.T^2*P+V*Q

theorem stencil (mid : Bool) (P Q : BiPoly) (i j dx dy t : ℤ) :
    zcoeff (output mid P Q) (i+t*dx) (j+t*dy)=
      ∑ r : Fin 5, (weights mid r : ℤ)*f P Q i j dx dy r t := by
  have he : RightR30.T^2*P=
    U^2*V^0*P+U^1*V^1*P+U^1*V^1*P+U^0*V^2*P := by
    dsimp [RightR30.T]; ring
  have hu : U*P=U^1*V^0*P := by simp
  have hv : V*Q=U^0*V^1*Q := by simp
  cases mid <;>
    simp only [output,Bool.false_eq_true,if_false,if_true,add_mul,he,hu,hv,zadd,zshift]
  all_goals simp [Fin.sum_univ_succ,weights,f]
  all_goals ring

def Direction (dx dy : ℤ) : Prop := (dx=1 ∧ dy=0) ∨ (dx=0 ∧ dy=1)
def CoordLC (P : BiPoly) : Prop :=
  ∀ i j dx dy : ℤ, Direction dx dy →
    zcoeff P i j*zcoeff P (i+2*dx) (j+2*dy) ≤ zcoeff P (i+dx) (j+dy)^2
def ShiftCross (P Q : BiPoly) : Prop :=
  ∀ i j dx dy : ℤ, Direction dx dy → ∀ r q : Fin 5, r ≠ q →
    Cross (f P Q i j dx dy r) (f P Q i j dx dy q)
def Premises (P Q : BiPoly) : Prop :=
  (∀ i j : ℤ, 0 ≤ zcoeff P i j ∧ 0 ≤ zcoeff Q i j) ∧
    CoordLC P ∧ CoordLC Q ∧ ShiftCross P Q

theorem shifted_lc (P Q : BiPoly) (hp : CoordLC P) (hq : CoordLC Q)
    (i j dx dy : ℤ) (hd : Direction dx dy) (r : Fin 5) :
    LC (f P Q i j dx dy r) := by
  have tr (R : BiPoly) (hr : CoordLC R) (a b : ℤ) :
      LC (fun t => zcoeff R (i+t*dx-a) (j+t*dy-b)) := by
    intro t
    convert hr (i+t*dx-a) (j+t*dy-b) dx dy hd using 1 <;> congr 2 <;> ring
  fin_cases r
  · simpa [f] using tr P hp 2 0
  · simpa [f] using tr P hp 1 1
  · simpa [f] using tr P hp 0 2
  · simpa [f] using tr P hp 1 0
  · simpa [f] using tr Q hq 0 1

theorem conditional_transfer (P Q : BiPoly) (h : Premises P Q) :
    CoordLC (output true P Q) ∧ CoordLC (output false P Q) := by
  have both (mid : Bool) : CoordLC (output mid P Q) := by
    intro i j dx dy hd
    have nn : ∀ r ∈ (Finset.univ : Finset (Fin 5)), ∀ t, 0 ≤ f P Q i j dx dy r t := by
      intro r hr t
      fin_cases r
      · exact (h.1 _ _).1
      · exact (h.1 _ _).1
      · exact (h.1 _ _).1
      · exact (h.1 _ _).1
      · exact (h.1 _ _).2
    have hh := family Finset.univ (f P Q i j dx dy) (weights mid) nn
      (fun r _ => shifted_lc P Q h.2.1 h.2.2.1 i j dx dy hd r)
      (fun r _ q _ hn => h.2.2.2 i j dx dy hd r q hn) 0
    dsimp only at hh
    rw [← stencil mid P Q i j dx dy 0,← stencil mid P Q i j dx dy (0+2),← stencil mid P Q i j dx dy (0+1)] at hh
    simpa using hh
  exact ⟨both true,both false⟩

theorem actual_step (k : ℕ) :
    RightR30.M (k+1)=output true (RightR30.M k) (RightR30.G k) ∧
    RightR30.G (k+1)=output false (RightR30.M k) (RightR30.G k) := by
  have hs := Accepted3c265afc977f227a9f6535e7.obligation.1.2.1
  have h0 := hs k
  have h1 := hs (k+1)
  rw [RenewalR28.state_step,← h0] at h1
  exact ⟨congrArg Prod.fst h1,congrArg Prod.snd h1⟩

theorem actual_conditional (k : ℕ) (h : Premises (RightR30.M k) (RightR30.G k)) :
    CoordLC (RightR30.M (k+1)) ∧ CoordLC (RightR30.G (k+1)) := by
  rw [(actual_step k).1,(actual_step k).2]
  exact conditional_transfer _ _ h

end
end ShiftedR39
