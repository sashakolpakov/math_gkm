import MarkovTemplateDefectM50C
/-! Machine-authored 50c262c5. Diagonal summation beginning at the leading
coefficient, rather than extrapolating across invalid natural subtractions. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 7000000

def diagonalSeedM50C (c d s : ℕ) : ℤ :=
 ((c+s).choose c:ℤ)*((c+d+s+3).choose (c+3):ℤ)
def diagonalMassM50C (c d k : ℕ) : ℤ :=
 topLinearM55C k (diagonalSeedM50C c d)

theorem top_delta_diagonalM50C (c d k : ℕ) :
 (topDiagonalDeltaMB3E (c+d+2*k+1) (c+k+3)).coeff (c+3)=diagonalSeedM50C c d k := by
 rw [top_delta_highMB3E _ _ _ (by omega),if_pos (by omega : 3 ≤ c+k+3)]
 simp only [diagonalSeedM50C,show c+k+3-3=c+k by omega,
   show c+d+2*k+1+5-(c+k+3)+c=c+d+k+3 by omega]

theorem top_template_diagonalM50C (c d k : ℕ) :
 (topTemplateMB3E (c+d+2*k+1) (c+k+3)).coeff (c+3)=diagonalMassM50C c d k := by
 induction k using Nat.twoStepInduction with
 | zero =>
   simp only [Nat.mul_zero,Nat.add_zero]
   rw [(top_template_boundaryM50C (c+d+1) (c+3) (by omega)).2]
   simp [diagonalMassM50C,topLinearM55C,diagonalSeedM50C,Nat.add_assoc]
 | one =>
   simp only [Nat.mul_one,show c+d+2+1=c+d+3 by omega,show c+1+3=c+4 by omega]
   rw [top_template_penultimateM50C _ c (by omega)]
   simp [diagonalMassM50C,topLinearM55C,diagonalSeedM50C,sum_range_succ,
     Nat.choose_succ_self_right,Nat.add_assoc]
 | more k h0 h1 =>
   have he := congrArg (fun p : Polynomial ℤ => p.coeff (c+3))
     (top_diagonal_equationME10 (c+d+2*k+1) (c+k+3) (by omega))
   simp only [coeff_sub,coeff_add,coeff_ofNat_mul] at he
   rw [show c+d+2*k+1+4=c+d+2*(k+2)+1 by omega,
     show c+d+2*k+1+2=c+d+2*(k+1)+1 by omega,
     show c+k+3+2=c+(k+2)+3 by omega,
     show c+k+3+1=c+(k+1)+3 by omega,
     h0,h1,top_delta_diagonalM50C,top_delta_diagonalM50C,top_delta_diagonalM50C] at he
   have hs := top_linear_secondME10 (diagonalSeedM50C c d) k
   change diagonalMassM50C c d (k+2)-2*diagonalMassM50C c d (k+1)+
     diagonalMassM50C c d k=_ at hs
   linear_combination he-hs

theorem diagonal_mass_modelM50C (c d k : ℕ) :
 (diagonalMassM50C c d k:ℝ)=lowerDiagMF88 c (k+d) k := by
 rw [lower_diag_kernelM9F23]
 unfold kernelM9F23
 rw [diagSum_extendMDB9 _ _ _ (nbSeq_zeroMDB9 _) (nbSeq_zeroMDB9 _)
   (k+d) k (k+1) (by omega),sum_range_succ']
 have hz : rampWeightMF88 (0:ℤ)=1 := by norm_num [rampWeightMF88]
 simp only [Nat.cast_zero,sub_zero,hz,one_mul,nbSeq_natMDB9]
 unfold diagonalMassM50C topLinearM55C
 rw [←sum_range_reflect (fun s => ((k:ℤ)-s)*diagonalSeedM50C c d s) k]
 unfold diagonalSeedM50C
 push_cast
 rw [mul_sum]
 have hs : (∑ s ∈ range k,
     4*((k:ℝ)-(k-1-s:ℕ))*((c+(k-1-s)).choose c:ℝ)*
       ((c+d+(k-1-s)+3).choose (c+3):ℝ))=
   ∑ s ∈ range k,rampWeightMF88 ((s+1:ℕ):ℤ)*
     nbSeqMDB9 (c+3) ((k+d:ℕ)-(s+1))*nbSeqMDB9 c ((k:ℤ)-(s+1)) := by
   apply sum_congr rfl
   intro s hs
   have hsk : s<k := mem_range.mp hs
   have he0 : ((k+d:ℕ):ℤ)-(s+1)=((k+d-1-s:ℕ):ℤ) := by omega
   have he1 : (k:ℤ)-(s+1)=((k-1-s:ℕ):ℤ) := by omega
   rw [he0,he1,nbSeq_natMDB9,nbSeq_natMDB9]
   have hw : rampWeightMF88 ((s+1:ℕ):ℤ)=4*(s+1:ℝ) := by
     simp [rampWeightMF88]; norm_cast
   rw [hw]
   have he : (k:ℝ)-(k-1-s:ℕ)=s+1 := by
     exact_mod_cast (show (k:ℤ)-(k-1-s:ℕ)=(s:ℤ)+1 by omega)
   rw [he,show c+(k-1-s)=k-1-s+c by omega,
     show c+d+(k-1-s)+3=k+d-1-s+(c+3) by omega]
   ring
 simp only [Nat.cast_add,Nat.cast_one,mul_assoc] at hs ⊢
 rw [hs,show c+d+k+3=k+d+(c+3) by omega,show c+k=k+c by omega]
 ring

theorem top_template_modelM50C (n i j : ℕ) (hi : 3 ≤ i)
 (hd : i+j ≤ n+2) (hj : n+2 ≤ i+2*j) :
 ((topTemplateMB3E n (n+2-j)).coeff i:ℝ)=lowerDiagMF88 (i-3) j (n+2-i-j) := by
 let c := i-3
 let k := n+2-i-j
 let d := j-k
 have hjk : k ≤ j := by dsimp [k]; omega
 have heN : c+d+2*k+1=n := by dsimp [c,d,k]; omega
 have heT : c+k+3=n+2-j := by dsimp [c,k]; omega
 have heI : c+3=i := by dsimp [c]; omega
 have heJ : k+d=j := by dsimp [d]; omega
 have h := top_template_diagonalM50C c d k
 rw [heN,heT,heI] at h
 rw [h,diagonal_mass_modelM50C,heJ]

end
end MathGKM.Markov
