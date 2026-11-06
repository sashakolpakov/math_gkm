import MathGKM.Round28RenewalA

/-! Machine-authored endpoint counting arrays, round28. -/
namespace RenewalR28
open MathGKM.Markov
noncomputable section

def mc (b i j : ℕ) : ℤ :=
  if i=0 then if j=b then 1 else 0 else
  if i+j≤b then ((i+j).choose i : ℤ)*((b-j-1).choose (i-1) : ℤ) else 0

def gc (b i j : ℕ) : ℤ :=
  if i=0 then 0 else
  if i+j≤b then ((i+j-1).choose (i-1) : ℤ)*((b-j-1).choose (i-1) : ℤ) else 0

theorem gc_step (b i j : ℕ) : gc (b+1) (i+1) j=mc b i j+gc b (i+1) j := by
  by_cases hs : i+1+j≤b+1
  · by_cases hb : i+1+j≤b
    · cases i with
      | zero =>
        have hj : j≠b := by omega
        simp [gc,mc,hj,hb,hs]
      | succ i =>
        have hi : i+1≠0 := by omega
        have hi2 : i+1+1≠0 := by omega
        have hprev : i+1+j≤b := by omega
        have hbj : b-j-1+1=b-j := by omega
        have hbj2 : b+1-j-1=b-j := by omega
        simp only [gc,mc,hi,hi2,if_false,hs,hb,hprev,if_true,
          Nat.add_sub_cancel, Nat.add_sub_cancel_right]
        rw [show i+1+1+j-1=i+1+j by omega,hbj2,← hbj,Nat.choose_succ_succ']
        push_cast
        ring
    · have he : i+j=b := by omega
      cases i with
      | zero =>
        have hj : j=b := by omega
        subst j
        simp [mc,gc]
        omega
      | succ i =>
        have hz : b-j-1=i := by omega
        have hz2 : b+1-j-1=i+1 := by omega
        have hn : i+1+1+j-1=b := by omega
        have hp : i+1+j≤b := by omega
        simp [mc,gc,hs,hb,hp,hn,hz,hz2,he]
  · have hp : ¬i+j≤b := by omega
    have hq : ¬i+1+j≤b := by omega
    have hj : i=0 → j≠b := by omega
    simpa [gc,mc,hs,hp,hq] using hj

theorem mc_v_step (b i j : ℕ) :
    mc (b+1) i (j+1)=mc b i j+gc (b+1) i (j+1) := by
  cases i with
  | zero => simp [mc,gc]
  | succ i =>
    by_cases hs : i+1+(j+1)≤b+1
    · have hp : i+1+j≤b := by omega
      have hj : b+1-(j+1)-1=b-j-1 := by omega
      have hn : i+1+(j+1)=i+j+1+1 := by omega
      have hn2 : i+1+j=i+j+1 := by omega
      simp only [mc,gc,Nat.succ_ne_zero,if_false,hs,hp,if_true,
        Nat.add_sub_cancel, Nat.add_sub_cancel_right]
      rw [hj,hn,hn2,Nat.choose_succ_succ]
      push_cast
      ring
    · have hp : ¬i+1+j≤b := by omega
      simp [mc,gc,hs,hp]

theorem mc_jzero (b i : ℕ) : mc (b+1) i 0=gc (b+1) i 0 := by
  cases i with
  | zero => simp [mc,gc]
  | succ i => simp [mc,gc]

end
end RenewalR28
