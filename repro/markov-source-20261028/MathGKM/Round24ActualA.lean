/- Machine-authored round-24 direct actual-family recurrence.
Only raw-selector, upper-support and reachable-label exports are consumed. -/
import MathGKM.Round24ShiftA
import MathGKM.Acceptedaf333bd1813e7443fe1fa432
open MathGKM.Markov ClearedLayersR20
noncomputable section
set_option maxHeartbeats 2000000
namespace RawDeficitR24

def deg (E : Label) : ℕ := E.a+E.b-1
def T : BiPoly := U+V
def layer (E : Label) (r : ℕ) : BiPoly := rawLayer E.p (deg E) r
def convolution (F M : Label) (r : ℕ) : BiPoly :=
  ∑ hk ∈ Finset.HasAntidiagonal.antidiagonal r, layer F hk.1*layer M hk.2

theorem layer_update (path : List Bool) (branch : Bool) (r : ℕ) :
    let f := frame path
    let F := if branch then f.hi else f.lo
    let O := if branch then f.lo else f.hi
    let Q := (advance f branch).mid
    layer Q r=T*convolution F f.mid r+
      (if r=0 then 0 else convolution F f.mid (r-1))-
      (if F.a+F.b≤r then U^F.a*V^F.b*layer O (r-(F.a+F.b)) else 0) := by
  dsimp only
  let f := frame path
  let F := if branch then f.hi else f.lo
  let O := if branch then f.lo else f.hi
  let Q := (advance f branch).mid
  have ar := Accepted0d2b83c94b4594d717e36331.obligation path
  change f.mid.a=f.lo.a+f.hi.a ∧ f.mid.b=f.lo.b+f.hi.b ∧ _ at ar
  have sp := Acceptedaf333bd1813e7443fe1fa432.obligation.1 path
  change Bounded f.lo.p (deg f.lo) ∧ Bounded f.mid.p (deg f.mid) ∧
    Bounded f.hi.p (deg f.hi) at sp
  have hF : Bounded F.p (deg F) := by
    cases branch
    · exact sp.1
    · exact sp.2.2
  have hO : Bounded O.p (deg O) := by
    cases branch
    · exact sp.2.2
    · exact sp.1
  have dm : deg Q=(deg F+deg f.mid)+1 := by
    have hl := ar.2.2.2.1
    have hh := ar.2.2.2.2.1
    cases branch <;> dsimp [Q,F,f,deg,advance] at * <;> omega
  have dc : deg Q=deg O+F.a+F.b+(F.a+F.b) := by
    have hl := ar.2.2.2.1
    have hh := ar.2.2.2.2.1
    cases branch <;> dsimp [Q,F,O,f,deg,advance] at * <;> omega
  have qp : Q.p=S*(F.p*f.mid.p)-U^F.a*V^F.b*O.p := by
    cases branch <;> dsimp [Q,F,O,f,advance] <;> ring
  have main : rawLayer (S*(F.p*f.mid.p)) (deg Q) r =
      T*convolution F f.mid r+(if r=0 then 0 else convolution F f.mid (r-1)) := by
    rw [dm,raw_S _ _ _ (bounded_mul _ _ _ _ hF sp.2.1)]
    simp_rw [raw_mul _ _ _ _ _ hF sp.2.1]
    rfl
  have corr : rawLayer (U^F.a*V^F.b*O.p) (deg Q) r =
      if F.a+F.b≤r then U^F.a*V^F.b*layer O (r-(F.a+F.b)) else 0 := by
    rw [dc,raw_shift _ _ _ _ _ _ hO]
    rfl
  change rawLayer Q.p (deg Q) r = _
  rw [qp,raw_sub,main,corr]

theorem convolution_low (F M : Label) :
    convolution F M 0=layer F 0*layer M 0 ∧
    convolution F M 1=layer F 1*layer M 0+layer F 0*layer M 1 ∧
    convolution F M 2=layer F 2*layer M 0+layer F 1*layer M 1+
      layer F 0*layer M 2 := by
  have a0 : Finset.HasAntidiagonal.antidiagonal (0 : ℕ) = {(0,0)} := by decide
  have a1 : Finset.HasAntidiagonal.antidiagonal (1 : ℕ) = {(0,1),(1,0)} := by decide
  have a2 : Finset.HasAntidiagonal.antidiagonal (2 : ℕ) = {(0,2),(1,1),(2,0)} := by decide
  constructor
  · simp [convolution,a0]
  constructor <;> norm_num [convolution,a1,a2] <;> ring

theorem low_recurrence (path : List Bool) (branch : Bool) :
    let f := frame path
    let F := if branch then f.hi else f.lo
    let O := if branch then f.lo else f.hi
    let Q := (advance f branch).mid
    layer Q 0=T*layer F 0*layer f.mid 0 ∧
    layer Q 1=T*(layer F 1*layer f.mid 0+layer F 0*layer f.mid 1)+
      layer F 0*layer f.mid 0-
      (if F.a+F.b=1 then U^F.a*V^F.b*layer O 0 else 0) ∧
    layer Q 2=T*(layer F 2*layer f.mid 0+layer F 1*layer f.mid 1+
      layer F 0*layer f.mid 2)+layer F 1*layer f.mid 0+layer F 0*layer f.mid 1-
      (if F.a+F.b=1 then U^F.a*V^F.b*layer O 1 else
        if F.a+F.b=2 then U^F.a*V^F.b*layer O 0 else 0) := by
  dsimp only
  have h0 := layer_update path branch 0
  have h1 := layer_update path branch 1
  have h2 := layer_update path branch 2
  dsimp only at h0 h1 h2
  generalize hF : (if branch then (frame path).hi else (frame path).lo) = F at h0 h1 h2 ⊢
  generalize hO : (if branch then (frame path).lo else (frame path).hi) = O at h0 h1 h2 ⊢
  have ar := Accepted0d2b83c94b4594d717e36331.obligation path
  dsimp only at ar
  have hs : 0<F.a+F.b := by
    rw [← hF]
    cases branch <;> simp only [Bool.false_eq_true,↓reduceIte] <;> omega
  have hc := convolution_low F (frame path).mid
  simp only [Nat.reduceSub] at h0 h1 h2
  rw [hc.1] at h0 h1
  rw [hc.2.1] at h1 h2
  rw [hc.2.2] at h2
  have hz : ¬F.a+F.b≤0 := by omega
  have hz0 : (if (0 : ℕ)=0 then (0 : BiPoly) else convolution F (frame path).mid 0)=0 := if_pos rfl
  simp only [if_neg hz,if_true,add_zero,sub_zero] at h0
  refine ⟨by simpa only [mul_assoc] using h0,?_,?_⟩
  · by_cases he : F.a+F.b=1
    · simpa only [he,le_refl,if_true,Nat.reduceSub,one_ne_zero,if_false] using h1
    · have hn : ¬F.a+F.b≤1 := by omega
      simpa only [he,hn,if_false,one_ne_zero,sub_zero] using h1
  · by_cases he : F.a+F.b=1
    · norm_num only [he,Nat.reduceLeDiff,Nat.reduceSub,Nat.reduceEqDiff,if_true,if_false] at h2 ⊢
      simpa only [add_assoc] using h2
    · by_cases he2 : F.a+F.b=2
      · norm_num only [he,he2,Nat.reduceLeDiff,Nat.reduceSub,Nat.reduceEqDiff,if_true,if_false] at h2 ⊢
        simpa only [add_assoc] using h2
      · have hn : ¬F.a+F.b≤2 := by omega
        norm_num only [he,he2,hn,Nat.reduceEqDiff,if_false,sub_zero] at h2 ⊢
        simpa only [add_assoc] using h2

end RawDeficitR24
