import MarkovTransitionGapsD052
import MarkovSmallRunsD052
/-! Machine-authored 0d052acb. All second-slice coefficient positions. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000

theorem trans0p0D052_explicit_lc (n c r : ℕ) (hn : 5 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r 0*secondExplicitE273 n c r (0+2) ≤ secondExplicitE273 n c r (0+1)^2 := by
 have hj1 : 0+1=1 := by omega
 have hj2 : 0+2=2 := by omega
 rw [hj1,hj2]
 have h0 := trans0p0D052_eq n c r hn
 have h1 := trans0p1D052_eq n c r hn
 have h2 := trans0p2D052_eq n c r hn
 have hl := trans0p0D052_lc n c r (by exact_mod_cast hn) (by exact_mod_cast hr) (by exact_mod_cast hc)
 rw [←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem trans0p1D052_explicit_lc (n c r : ℕ) (hn : 5 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r 1*secondExplicitE273 n c r (1+2) ≤ secondExplicitE273 n c r (1+1)^2 := by
 have hj1 : 1+1=2 := by omega
 have hj2 : 1+2=3 := by omega
 rw [hj1,hj2]
 have h0 := trans0p1D052_eq n c r hn
 have h1 := trans0p2D052_eq n c r hn
 have h2 := trans0p3D052_eq n c r hn
 have hl := trans0p1D052_lc n c r (by exact_mod_cast hn) (by exact_mod_cast hr) (by exact_mod_cast hc)
 rw [←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem trans0p2D052_explicit_lc (n c r : ℕ) (hn : 5 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r 2*secondExplicitE273 n c r (2+2) ≤ secondExplicitE273 n c r (2+1)^2 := by
 have hj1 : 2+1=3 := by omega
 have hj2 : 2+2=4 := by omega
 rw [hj1,hj2]
 have h0 := trans0p2D052_eq n c r hn
 have h1 := trans0p3D052_eq n c r hn
 have h2 := trans0p4D052_eq n c r hn
 have hl := trans0p2D052_lc n c r (by exact_mod_cast hn) (by exact_mod_cast hr) (by exact_mod_cast hc)
 rw [←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem trans1m1D052_explicit_lc (n c r : ℕ) (hn : 5 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r (n-1)*secondExplicitE273 n c r ((n-1)+2) ≤ secondExplicitE273 n c r ((n-1)+1)^2 := by
 have hj1 : (n-1)+1=(n+0) := by omega
 have hj2 : (n-1)+2=(n+1) := by omega
 rw [hj1,hj2]
 have h0 := trans1m1D052_eq n c r hn
 have h1 := trans1p0D052_eq n c r hn
 have h2 := trans1p1D052_eq n c r hn
 have hl := trans1m1D052_lc n c r (by exact_mod_cast hn) (by exact_mod_cast hr) (by exact_mod_cast hc)
 rw [←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem trans1p0D052_explicit_lc (n c r : ℕ) (hn : 5 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r (n+0)*secondExplicitE273 n c r ((n+0)+2) ≤ secondExplicitE273 n c r ((n+0)+1)^2 := by
 have hj1 : (n+0)+1=(n+1) := by omega
 have hj2 : (n+0)+2=(n+2) := by omega
 rw [hj1,hj2]
 have h0 := trans1p0D052_eq n c r hn
 have h1 := trans1p1D052_eq n c r hn
 have h2 := trans1p2D052_eq n c r hn
 have hl := trans1p0D052_lc n c r (by exact_mod_cast hn) (by exact_mod_cast hr) (by exact_mod_cast hc)
 rw [←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem trans1p1D052_explicit_lc (n c r : ℕ) (hn : 5 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r (n+1)*secondExplicitE273 n c r ((n+1)+2) ≤ secondExplicitE273 n c r ((n+1)+1)^2 := by
 have hj1 : (n+1)+1=(n+2) := by omega
 have hj2 : (n+1)+2=(n+3) := by omega
 rw [hj1,hj2]
 have h0 := trans1p1D052_eq n c r hn
 have h1 := trans1p2D052_eq n c r hn
 have h2 := trans1p3D052_eq n c r hn
 have hl := trans1p1D052_lc n c r (by exact_mod_cast hn) (by exact_mod_cast hr) (by exact_mod_cast hc)
 rw [←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem trans1p2D052_explicit_lc (n c r : ℕ) (hn : 5 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r (n+2)*secondExplicitE273 n c r ((n+2)+2) ≤ secondExplicitE273 n c r ((n+2)+1)^2 := by
 have hj1 : (n+2)+1=(n+3) := by omega
 have hj2 : (n+2)+2=(n+4) := by omega
 rw [hj1,hj2]
 have h0 := trans1p2D052_eq n c r hn
 have h1 := trans1p3D052_eq n c r hn
 have h2 := trans1p4D052_eq n c r hn
 have hl := trans1p2D052_lc n c r (by exact_mod_cast hn) (by exact_mod_cast hr) (by exact_mod_cast hc)
 rw [←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem second_explicit_lower_lcD052 (n c r j : ℕ) (hr : 0<r) (hc : r<c)
 (hj : 3 ≤ j) (hn : j+2 ≤ n) :
 secondExplicitE273 n c r j*secondExplicitE273 n c r (j+2) ≤ secondExplicitE273 n c r (j+1)^2 := by
 have h0 := second_lower_shapeE273 n c r j hj (by omega)
 have h1 := second_lower_shapeE273 n c r (j+1) (by omega) (by omega)
 have h2 := second_lower_shapeE273 n c r (j+2) (by omega) hn
 have hl := lowerShape_lc446 (n:ℤ) c r ((j:ℤ)+1)
   (by exact_mod_cast hr) (by exact_mod_cast hc) (by omega) (by exact_mod_cast hn)
 have he : (j:ℤ)+1+1=(j+2:ℕ) := by push_cast; ring
 have he1 : ((j+1:ℕ):ℤ)=(j:ℤ)+1 := by push_cast; rfl
 simp only [add_sub_cancel_right,he] at hl
 rw [←he1,←h0,←h1,←h2] at hl
 nlinarith only [hl]

theorem second_explicit_upper_lcD052 (n c r j : ℕ) (hr : 0<r) (hc : r<c)
 (hj : n+3 ≤ j) (hn : j+2 ≤ 2*n+2) :
 secondExplicitE273 n c r j*secondExplicitE273 n c r (j+2) ≤ secondExplicitE273 n c r (j+1)^2 := by
 have h0 := second_upper_shapeE273 n c r j hj (by omega)
 have h1 := second_upper_shapeE273 n c r (j+1) (by omega) (by omega)
 have h2 := second_upper_shapeE273 n c r (j+2) (by omega) hn
 have hl := upperShape_lc446 (c:ℤ) r (2*(n:ℤ)+2-(j+1))
   (by exact_mod_cast hr) (by exact_mod_cast hc) (by omega)
 have he0 : 2*(n:ℤ)+2-(j+1)-1=2*(n:ℤ)+2-(j+2:ℕ) := by push_cast; ring
 have he1 : 2*(n:ℤ)+2-(j+1)=2*(n:ℤ)+2-(j+1:ℕ) := by push_cast; rfl
 have he2 : 2*(n:ℤ)+2-(j+1)+1=2*(n:ℤ)+2-j := by ring
 rw [he0,he2,he1] at hl
 have hscaled := mul_le_mul_of_nonneg_left hl (show (0:ℤ) ≤ 64 by norm_num)
 have hp0 := congrArg₂ (fun x y : ℤ => x*y) h2 h0
 have hp1 := congrArg (fun z : ℤ => z^2) h1
 nlinarith only [hscaled,hp0,hp1]

theorem second_explicit_tail_lcD052 (n c r j : ℕ) (hn : 2 ≤ n) (hr : 0<r)
 (hc : r<c) (hj : 2*n+1 ≤ j) :
 secondExplicitE273 n c r j*secondExplicitE273 n c r (j+2) ≤ secondExplicitE273 n c r (j+1)^2 := by
 by_cases he : j=2*n+1
 · subst j
   have h0 := tail1D052 n c r hn
   have h1 := tail2D052 n c r hn
   have h2 := tail3D052 n c r hn
   have hl := tail_gapD052 c r hr hc
   have e1 : 2*n+1+1=2*n+2 := by omega
   have e2 : 2*n+1+2=2*n+3 := by omega
   rw [e1,e2]
   have e0 : secondExplicitE273 n c r (2*n+1)=tailFirstD052 c r := by omega
   have e1' : secondExplicitE273 n c r (2*n+2)=16*(r:ℤ)^2 := by omega
   have e2' : secondExplicitE273 n c r (2*n+3)=cubicD446 c r := by omega
   rwa [e0,e1',e2']
 · have hz := tail4D052 n c r (j+2) hn (by omega)
   have hz' : secondExplicitE273 n c r (j+2)=0 := by omega
   simp [hz',sq_nonneg]

theorem second_explicit_lcD052 (n c r j : ℕ) (hn : 2 ≤ n) (hr : 0<r) (hc : r<c) :
 secondExplicitE273 n c r j*secondExplicitE273 n c r (j+2) ≤ secondExplicitE273 n c r (j+1)^2 := by
 by_cases ht : 2*n+1 ≤ j
 · exact second_explicit_tail_lcD052 n c r j hn hr hc ht
 by_cases hs : n ≤ 4
 · have hh : n=2 ∨ n=3 ∨ n=4 := by omega
   rcases hh with rfl | rfl | rfl
   · exact small2_lcD052 c r j hr hc (by omega)
   · exact small3_lcD052 c r j hr hc (by omega)
   · exact small4_lcD052 c r j hr hc (by omega)
 have hn5 : 5 ≤ n := by omega
 by_cases hl : 3 ≤ j ∧ j+2 ≤ n
 · exact second_explicit_lower_lcD052 n c r j hr hc hl.1 hl.2
 by_cases hu : n+3 ≤ j ∧ j+2 ≤ 2*n+2
 · exact second_explicit_upper_lcD052 n c r j hr hc hu.1 hu.2
 have he : j=0 ∨ j=1 ∨ j=2 ∨ j=n-1 ∨ j=n+0 ∨ j=n+1 ∨ j=n+2 := by omega
 rcases he with he | he | he | he | he | he | he <;> rw [he]
 · exact trans0p0D052_explicit_lc n c r hn5 hr hc
 · exact trans0p1D052_explicit_lc n c r hn5 hr hc
 · exact trans0p2D052_explicit_lc n c r hn5 hr hc
 · exact trans1m1D052_explicit_lc n c r hn5 hr hc
 · exact trans1p0D052_explicit_lc n c r hn5 hr hc
 · exact trans1p1D052_explicit_lc n c r hn5 hr hc
 · exact trans1p2D052_explicit_lc n c r hn5 hr hc

#print axioms second_explicit_lcD052
end
end MathGKM.Markov
