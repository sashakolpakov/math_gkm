import MarkovPellSeries00b3
/-! Machine-authored 00b360ee. Complete lower-excess regrading, including
zero excess and a literal equivalent target for the entire Pell subfamily. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

def excessSeries00b3 (s : ℕ) : BiSeries00b3 :=
 (seriesX00b3+seriesY00b3)^(2*s)*geomX00b3^(s+1)*geomY00b3^s
def excessCoeff00b3 (s i j : ℕ) : ℤ :=
 PowerSeries.coeff j (PowerSeries.coeff i (excessSeries00b3 s))

theorem excess_succ00b3 (s : ℕ) : excessSeries00b3 (s+1)=lowerSeries00b3 s := by
 rw [lower_series_geometric00b3]
 simp only [excessSeries00b3,show 2*(s+1)=2*s+2 by omega,
   show s+1+1=s+2 by omega]

theorem excess_zero00b3 (i j : ℕ) :
 excessCoeff00b3 0 i j=if j=0 then 1 else 0 := by
 simp [excessCoeff00b3,excessSeries00b3,geomX00b3,PowerSeries.coeff_one]

theorem right_bottom00b3 (n i j : ℕ) (hij : i+j=n+1) :
 coeff (frame (List.replicate n true)).mid.p i j=if j=0 then 1 else 0 := by
 by_cases hj : j=0
 · subst j
   have hi : i=n+1 := by omega
   subst i
   rw [if_pos rfl]
   have h := edgeEval_coeff (frame (List.replicate n true)).mid.p (n+1)
   rw [boundary_formula,(right_labels650 n).1,(right_labels650 n).2] at h
   have he : (coeff (frame (List.replicate n true)).mid.p (n+1) 0 : ℝ)=1 := by
     rw [← h]
     simp [Polynomial.coeff_X_pow_mul',Polynomial.coeff_zero_eq_eval_zero]
   exact_mod_cast he
 · rw [if_neg hj]
   apply raw_outside_polygon18
   rw [(right_labels650 n).1,(right_labels650 n).2]
   intro hp
   have h := hp.1
   have hm := congrArg (fun x => (n+2)*x) hij
   nlinarith

theorem right_excess_coeff00b3 (n i j s : ℕ) (hij : i+j=n+1+s) :
 coeff (frame (List.replicate n true)).mid.p i j=excessCoeff00b3 s i j := by
 cases s with
 | zero => rw [excess_zero00b3]; exact right_bottom00b3 n i j (by omega)
 | succ s =>
   rw [excessCoeff00b3,excess_succ00b3,lower_series_coeff00b3]
   exact right_lower_unbounded00b3 n i j s (by omega)

theorem source_excess_coeff00b3 (path : List Bool)
 (hb : (frame path).mid.b=(frame path).mid.a+1) (i j s : ℕ)
 (hij : i+j=(frame path).mid.a+s) :
 coeff (frame path).mid.p i j=excessCoeff00b3 s i j := by
 obtain ⟨n,rfl⟩ := source_near_one_path650 path hb
 rw [(right_labels650 n).1] at hij
 exact right_excess_coeff00b3 n i j s hij

theorem excess_transfer00b3 (s : ℕ) :
 excessSeries00b3 (s+1)=lowerKernel00b3*excessSeries00b3 s := by
 unfold excessSeries00b3 lowerKernel00b3
 rw [show 2*(s+1)=2*s+2 by omega]
 simp only [pow_add,pow_one]
 ring

def ExcessHorizontal00b3 : Prop := ∀ n i j s : ℕ, i+j=n+1+s →
 excessCoeff00b3 s i j*excessCoeff00b3 (s+2) (i+2) j ≤
 excessCoeff00b3 (s+1) (i+1) j^2
def ExcessVertical00b3 : Prop := ∀ n i j s : ℕ, i+j=n+1+s →
 excessCoeff00b3 s i j*excessCoeff00b3 (s+2) i (j+2) ≤
 excessCoeff00b3 (s+1) i (j+1)^2

theorem right_below_excess00b3 (n i j : ℕ) (hij : i+j<n+1) :
 coeff (frame (List.replicate n true)).mid.p i j=0 := by
 apply raw_outside_polygon18
 rw [(right_labels650 n).1,(right_labels650 n).2]
 intro hp
 have h := hp.1
 have hm := Nat.mul_le_mul_left (n+2) (show i+j ≤ n by omega)
 nlinarith

theorem pell_iff_excess00b3 :
 (∀ n, WeakLC (n+1) (n+2) (frame (List.replicate n true)).mid.p) ↔
 ExcessHorizontal00b3 ∧ ExcessVertical00b3 := by
 rw [pell_weak_iff_two_sums9a72]
 constructor
 · rintro ⟨hh,hv⟩
   constructor
   · intro n i j s he
     have h := hh n i j
     simp only [← right_coeff_sum9a72] at h
     rwa [right_excess_coeff00b3 n i j s he,
       right_excess_coeff00b3 n (i+2) j (s+2) (by omega),
       right_excess_coeff00b3 n (i+1) j (s+1) (by omega)] at h
   · intro n i j s he
     have h := hv n i j
     simp only [← right_coeff_sum9a72] at h
     rwa [right_excess_coeff00b3 n i j s he,
       right_excess_coeff00b3 n i (j+2) (s+2) (by omega),
       right_excess_coeff00b3 n i (j+1) (s+1) (by omega)] at h
 · rintro ⟨hh,hv⟩
   constructor
   · intro n i j
     simp only [← right_coeff_sum9a72]
     by_cases he : n+1 ≤ i+j
     · obtain ⟨s,hs⟩ := Nat.exists_eq_add_of_le he
       rw [right_excess_coeff00b3 n i j s hs,
         right_excess_coeff00b3 n (i+2) j (s+2) (by omega),
         right_excess_coeff00b3 n (i+1) j (s+1) (by omega)]
       exact hh n i j s hs
     · rw [right_below_excess00b3 n i j (by omega),zero_mul]
       exact sq_nonneg _
   · intro n i j
     simp only [← right_coeff_sum9a72]
     by_cases he : n+1 ≤ i+j
     · obtain ⟨s,hs⟩ := Nat.exists_eq_add_of_le he
       rw [right_excess_coeff00b3 n i j s hs,
         right_excess_coeff00b3 n i (j+2) (s+2) (by omega),
         right_excess_coeff00b3 n i (j+1) (s+1) (by omega)]
       exact hv n i j s hs
     · rw [right_below_excess00b3 n i j (by omega),zero_mul]
       exact sq_nonneg _

#print axioms source_excess_coeff00b3
#print axioms excess_transfer00b3
#print axioms pell_iff_excess00b3
end
end MathGKM.Markov
