import MarkovBandRegionM657
/-! Machine-authored 6576ccc5. A new positive kernel for the exact band
output. Its tail-cut shape is an explicit unproved sufficient condition. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 6000000

def correctionTermM657 (k t m : ℕ) (r : Bool) : ℤ :=
 4*((t+m+1).choose m:ℤ)*
   ((if r then 2 else 1)*((k+t+3).choose (t+m+3):ℤ)+
    (if r then 1 else 2)*((k+t+2).choose (t+m+3):ℤ))

theorem correction_lift_reversedM657 (d k t : ℕ) (r : Bool) :
 correctionLiftM657 d k t r=
 ∑ h ∈ range (t+1), (d.choose h:ℤ)*correctionTermM657 k t (t-h) r := by
 unfold correctionLiftM657
 rw [mul_sum]
 have he : (∑ m ∈ range (t+1), 4*((d.choose (t-m):ℤ)*((t+m+1).choose m:ℤ)*
   ((if r then 2 else 1)*((k+t+3).choose (t+m+3):ℤ)+
    (if r then 1 else 2)*((k+t+2).choose (t+m+3):ℤ))))=
   ∑ m ∈ range (t+1), (d.choose (t-m):ℤ)*correctionTermM657 k t m r := by
   apply sum_congr rfl
   intro m hm
   unfold correctionTermM657
   ring
 rw [he,←sum_range_reflect (fun m => (d.choose (t-m):ℤ)*correctionTermM657 k t m r) (t+1)]
 apply sum_congr rfl
 intro h hh
 have ht := mem_range.mp hh
 simp only [show t+1-1=t by omega,show t-(t-h)=h by omega]

def bandKernelM657 (d k s : ℕ) (r : Bool) : ℝ[X] :=
 liftPolyM7E2 (d+3*k+(if r then 3 else 2)) s+
 C (absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r))*X^s+
 ∑ h ∈ range (s+1), C (correctionTermM657 k (s+1) (s-h+1) r:ℝ)*X^h

def bandOutputM657 (d k s : ℕ) (r : Bool) : ℤ :=
 liftOutputMAE9 d (d+3*k+(if r then 3 else 2)) s+correctionLiftM657 d k (s+1) r

theorem band_kernel_coeffM657 (d k s h : ℕ) (r : Bool) :
 (bandKernelM657 d k s r).coeff h=
 (reverseLiftMAE9 (d+3*k+(if r then 3 else 2)) s h:ℝ)+
 (if h=s then absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r) else 0)+
 (if h ≤ s then (correctionTermM657 k (s+1) (s-h+1) r:ℝ) else 0) := by
 simp only [bandKernelM657,coeff_add,lift_poly_coeffM7E2,coeff_C_mul,coeff_X_pow,finsetSum_coeff]
 simp only [mul_ite,mul_one,mul_zero]
 simp [sum_ite_eq,mem_range,Nat.lt_succ_iff]

theorem band_kernel_nonnegM657 (d k s h : ℕ) (r : Bool) :
 0 ≤ (bandKernelM657 d k s r).coeff h := by
 rw [band_kernel_coeffM657]
 have hn (t m : ℕ) : 0 ≤ (correctionTermM657 k t m r:ℝ) := by
   unfold correctionTermM657
   cases r <;> simp only [Bool.false_eq_true,if_false,if_true] <;> positivity
 have hl : 0 ≤ (reverseLiftMAE9 (d+3*k+(if r then 3 else 2)) s h:ℝ) := by
   unfold reverseLiftMAE9 liftTermMAE9
   split_ifs <;> positivity
 have hx : 0 ≤ absorbedExtraM418 d s (correctionTermM657 k (s+1) 0 r) := by
   unfold absorbedExtraM418
   exact div_nonneg (mul_nonneg (hn _ _) (by positivity)) (by positivity)
 apply add_nonneg (add_nonneg hl ?_) ?_
 · split_ifs <;> first | exact hx | exact le_rfl
 · split_ifs <;> first | exact hn _ _ | exact le_rfl

theorem band_kernel_weightM657 (d k s : ℕ) (r : Bool) :
 (weightPolyMFEE (fun h => zchooseM37B d h) (bandKernelM657 d k s r)).eval 1=
 (bandOutputM657 d k s r:ℝ) := by
 rw [bandKernelM657,weight_addM418,weight_addM418,eval_add,eval_add,
   weighted_lift_outputMFEE,weight_monomialM418,weight_sumM964,eval_finsetSum]
 simp only [weight_monomialM418,eval_mul,eval_C,eval_pow,eval_X,one_pow,mul_one,zchoose_natM37B]
 rw [absorbed_chooseM418]
 unfold bandOutputM657
 rw [Int.cast_add,correction_lift_reversedM657]
 push_cast
 conv_rhs => rw [sum_range_succ]
 simp only [Nat.sub_self]
 have hs : (∑ h ∈ range (s+1), (d.choose h:ℝ)*(correctionTermM657 k (s+1) (s-h+1) r:ℝ))=
     ∑ h ∈ range (s+1), (d.choose h:ℝ)*(correctionTermM657 k (s+1) (s+1-h) r:ℝ) := by
   apply sum_congr rfl
   intro h hh
   rw [show s-h+1=s+1-h by have := mem_range.mp hh; omega]
 rw [hs]
 ring

theorem source_band_outputM657 (d k s : ℕ) (r : Bool)
 (hq : 2 ≤ d+2*k+(if r then 2 else 1)) :
 threeRawM9E2 (d+2*k+(if r then 2 else 1)) r (s+3)
   ((d+2*k+(if r then 2 else 1))+k+1)=bandOutputM657 d k s r := by
 have hn : 2*((d+2*k+(if r then 2 else 1))+k+1)+1 ≤
     sourceNME9C (d+2*k+(if r then 2 else 1)) r := by
   cases r <;> simp [sourceNME9C] <;> omega
 have he : bandExponentM139 (d+2*k+(if r then 2 else 1)) k r=d := by
   cases r <;> simp [band_exponent_falseM139,band_exponent_trueM139] <;> omega
 rw [source_band_liftM657 _ k s r hq hn,he]
 unfold bandOutputM657
 congr 2
 cases r <;> simp <;> omega

def TransposedCutsM657 : Prop := ∀ d k s : ℕ, ∀ r, 3 ≤ s → ∀ h n,
 0 ≤ ((cutPolyMFEE h (bandKernelM657 d k (s+1) r))^2-
   cutPolyMFEE h (bandKernelM657 d k s r)*cutPolyMFEE h (bandKernelM657 d k (s+2) r)).coeff n

theorem band_output_lc_of_cutsM657 (H : TransposedCutsM657) (d k s : ℕ) (r : Bool)
 (hs : 3 ≤ s) :
 bandOutputM657 d k s r*bandOutputM657 d k (s+2) r ≤ bandOutputM657 d k (s+1) r^2 := by
 have hf : CrossLC (zchooseM37B d) := by
   have he : zchooseM37B d=CoeffSeq ((1+X)^d) := by ext h; exact zchoose_coeffM37B d h
   rw [he]; exact crossLC_binomial d
 have hp (h : ℤ) : 0 ≤ zchooseM37B d h := by unfold zchooseM37B; split_ifs <;> positivity
 have h := weighted_value_lcMFEE _ _ _ (H d k s r hs) (zchooseM37B d) hf hp
 simp only [band_kernel_weightM657] at h
 exact_mod_cast h

theorem band_middle_of_transposed_cutsM657 (H : TransposedCutsM657) : BandMiddleM657 := by
 intro q k r hq hn i hi htop
 by_cases hp : i ≤ 5
 · exact source_band_prefixM657 q k i r hq hn hp
 have he : bandExponentM139 q k r+2*k+(if r then 2 else 1)=q := by
   cases r <;> simp only [band_exponent_falseM139,band_exponent_trueM139,
     Bool.false_eq_true,if_false,if_true,sourceNME9C] at * <;> omega
 let s := i-3
 have hs : 3 ≤ s := by dsimp [s]; omega
 have h := band_output_lc_of_cutsM657 H (bandExponentM139 q k r) k s r hs
 have hval (t : ℕ) := source_band_outputM657 (bandExponentM139 q k r) k t r (by omega)
 rw [he] at hval
 rw [←hval s,←hval (s+1),←hval (s+2)] at h
 have h0 : s+3=i := by dsimp [s]; omega
 simpa only [h0,show s+1+3=i+1 by omega,show s+2+3=i+2 by omega] using h

end
end MathGKM.Markov
