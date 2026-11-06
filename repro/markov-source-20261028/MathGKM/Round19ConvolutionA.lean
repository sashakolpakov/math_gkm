/- Machine-authored round-19 fresh candidate; static repair only, uncompiled. -/
/- Machine-authored round-18 exact-proposition recovery. Original namespace identities retained; uncompiled. -/
/- Machine-authored round-17 candidate. No local compilation is claimed.
   Independent binomial smoothing, with interval support and all zeros retained. -/
import MathGKM.Markov
open MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
namespace ConvolutionR19

def Nonnegative (a : ℕ → ℤ) : Prop := ∀ k, 0 ≤ a k
def RawLC (a : ℕ → ℤ) : Prop := ∀ k, a k*a (k+2) ≤ a (k+1)^2
def IntervalSupport (a : ℕ → ℤ) : Prop :=
  ∀ i j k, i<j → j<k → 0<a i → 0<a k → 0<a j
def Good (a : ℕ → ℤ) : Prop := Nonnegative a ∧ RawLC a ∧ IntervalSupport a
def smooth (a : ℕ → ℤ) (k : ℕ) : ℤ := a k + if k=0 then 0 else a (k-1)

theorem four_point (x y z w : ℤ)
    (hx : 0≤x) (hy : 0≤y) (hz : 0≤z) (hw : 0≤w)
    (h1 : x*z≤y^2) (h2 : y*w≤z^2)
    (hg : 0<x → 0<w → 0<y ∧ 0<z) : x*w≤y*z := by
  by_cases hxx : x=0
  · subst x
    simpa using mul_nonneg hy hz
  by_cases hww : w=0
  · subst w
    simpa using mul_nonneg hy hz
  have hp := hg (by omega) (by omega)
  have hm := mul_le_mul h1 h2 (mul_nonneg hy hw) (sq_nonneg y)
  have hh : (x*w)*(y*z)≤(y*z)*(y*z) := by
    calc
      (x*w)*(y*z) = (x*z)*(y*w) := by ring
      _ ≤ y^2*z^2 := hm
      _ = (y*z)*(y*z) := by ring
  exact le_of_mul_le_mul_right hh (mul_pos hp.1 hp.2)

theorem smooth_good (a : ℕ → ℤ) (ha : Good a) : Good (smooth a) := by
  rcases ha with ⟨hn,hl,hg⟩
  have hn' : Nonnegative (smooth a) := by
    intro k
    dsimp only [smooth]
    split_ifs
    · simpa using hn k
    · exact add_nonneg (hn k) (hn (k-1))
  refine ⟨hn',?_,?_⟩
  · intro k
    cases k with
    | zero =>
      have h := hl 0
      have hm := mul_nonneg (hn 0) (hn 1)
      norm_num [smooth] at h ⊢
      nlinarith [sq_nonneg (a 0)]
    | succ k =>
      have h1 := hl k
      have h2 := hl (k+1)
      have hm : a k*a (k+3) ≤ a (k+1)*a (k+2) := by
        apply four_point _ _ _ _ (hn _) (hn _) (hn _) (hn _) h1
          (by simpa [Nat.add_assoc] using h2)
        intro hp hq
        exact ⟨hg k (k+1) (k+3) (by omega) (by omega) hp hq,
          hg k (k+2) (k+3) (by omega) (by omega) hp hq⟩
      have e0 : k.succ-1=k := by omega
      have e1 : k.succ+1-1=k+1 := by omega
      have e2 : k.succ+2-1=k+2 := by omega
      simp only [smooth,if_neg (by omega : k.succ≠0),
        if_neg (by omega : k.succ+1≠0),if_neg (by omega : k.succ+2≠0),e0,e1,e2]
      simp only [Nat.succ_eq_add_one,Nat.add_assoc] at h2 ⊢
      nlinarith
  · intro i j k hij hjk hi hk
    have pos (r : ℕ) (hr : 0<smooth a r) :
        0<a r ∨ (0<r ∧ 0<a (r-1)) := by
      by_cases hz : r=0
      · left
        simpa [smooth,hz] using hr
      · dsimp only [smooth] at hr
        rw [if_neg hz] at hr
        by_cases hp : 0<a r
        · exact Or.inl hp
        · exact Or.inr ⟨by omega,by omega⟩
    have middle (l r : ℕ) (hlj : l<j) (hjr : j≤r)
        (hp : 0<a l) (hq : 0<a r) : 0<a j := by
      by_cases he : j=r
      · simpa [he] using hq
      · exact hg l j r hlj (by omega) hp hq
    have aj : 0<a j := by
      rcases pos i hi with hi'|⟨_,hi'⟩
      · rcases pos k hk with hk'|⟨_,hk'⟩
        · exact middle i k hij (by omega) hi' hk'
        · exact middle i (k-1) hij (by omega) hi' hk'
      · rcases pos k hk with hk'|⟨_,hk'⟩
        · exact middle (i-1) k (by omega) (by omega) hi' hk'
        · exact middle (i-1) (k-1) (by omega) (by omega) hi' hk'
    dsimp only [smooth]
    rw [if_neg (by omega : j≠0)]
    exact add_pos_of_pos_of_nonneg aj (hn (j-1))

theorem coeff_smooth (P : Polynomial ℤ) (k : ℕ) :
    (((1+Polynomial.X)*P).coeff k)=smooth P.coeff k := by
  cases k with
  | zero => simp [smooth,Polynomial.mul_coeff_zero]
  | succ k =>
    simp [smooth,add_mul,Polynomial.coeff_X_mul]

theorem binomial_good (P : Polynomial ℤ) (hP : Good P.coeff) (n : ℕ) :
    Good (((1+Polynomial.X)^n*P).coeff) := by
  induction n with
  | zero => simpa using hP
  | succ n ih =>
    rw [pow_succ',mul_assoc]
    have h := smooth_good _ ih
    have he : (((1+Polynomial.X)*((1+Polynomial.X)^n*P)).coeff)=
        smooth (((1+Polynomial.X)^n*P).coeff) := by
      funext k
      exact coeff_smooth _ k
    rw [he]
    exact h

def zcoeff (P : Polynomial ℤ) (q : ℤ) : ℤ :=
  if 0≤q then P.coeff q.toNat else 0

theorem good_zero_extension (P : Polynomial ℤ) (hP : Good P.coeff) :
    ∀ q : ℤ, zcoeff P q*zcoeff P (q+2)≤zcoeff P (q+1)^2 := by
  intro q
  by_cases hq : 0≤q
  · have h1 : 0≤q+1 := by omega
    have h2 : 0≤q+2 := by omega
    simp only [zcoeff,if_pos hq,if_pos h1,if_pos h2]
    have e1 : (q+1).toNat=q.toNat+1 := by omega
    have e2 : (q+2).toNat=q.toNat+2 := by omega
    rw [e1,e2]
    exact hP.2.1 q.toNat
  · rw [zcoeff,if_neg hq,zero_mul]
    exact sq_nonneg _

/-- A closed universal conditional convolution theorem. It includes n=0,
zero P, vanishing ends, and all zero-extended boundary triples. -/
theorem binomial_convolution (P : Polynomial ℤ)
    (hn : ∀ k, 0≤P.coeff k)
    (hg : ∀ i j k, i<j → j<k → 0<P.coeff i → 0<P.coeff k → 0<P.coeff j)
    (hl : ∀ k, P.coeff k*P.coeff (k+2)≤P.coeff (k+1)^2) :
    ∀ n : ℕ,
      (∀ k, 0≤((1+Polynomial.X)^n*P).coeff k) ∧
      (∀ q : ℤ, zcoeff ((1+Polynomial.X)^n*P) q*
        zcoeff ((1+Polynomial.X)^n*P) (q+2)≤
        zcoeff ((1+Polynomial.X)^n*P) (q+1)^2) := by
  intro n
  have h := binomial_good P ⟨hn,hl,hg⟩ n
  exact ⟨h.1,good_zero_extension _ h⟩

end ConvolutionR19
