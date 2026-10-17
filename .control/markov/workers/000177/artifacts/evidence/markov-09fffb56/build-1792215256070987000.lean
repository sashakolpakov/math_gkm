import MarkovChooseGrowthM09F
/-! Machine-authored 09fffb56. Include the exceptional zero band index. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000

theorem zero_band_chooseM09F (d s c : ℕ) (hs : 3 ≤ s) (hc : 2 ≤ c) (hc3 : c ≤ 3)
 (hd : s ≤ d) :
 ((d-s:ℕ):ℝ)*((s+9).choose 4:ℝ) ≤ ((d+c+s+4).choose (s+5):ℝ) := by
 have h0 : (s+9).choose 4 ≤ (2*s+c+4).choose 4 :=
   Nat.choose_le_choose 4 (by omega)
 have h1 : (2*s+c+4).choose 4 ≤ (2*s+c+4).choose (s+c) :=
   choose_small_monoM09F _ _ _ (by omega) (by omega)
 have hs1 : (2*s+c+4).choose (s+c)=(2*s+c+4).choose (s+4) := by
   rw [←Nat.choose_symm (by omega : s+c ≤ 2*s+c+4),show 2*s+c+4-(s+c)=s+4 by omega]
 rw [hs1] at h1
 have h2 : ((s+9).choose 4:ℝ) ≤ ((2*s+c+4).choose (s+4):ℝ) := by exact_mod_cast h0.trans h1
 have h3 := choose_linear_lowerM09F (2*s+c+4) (d-s) (s+4)
 rw [show 2*s+c+4+(d-s)=d+c+s+4 by omega,show s+4+1=s+5 by omega] at h3
 exact (mul_le_mul_of_nonneg_left h2 (by positivity)).trans h3

theorem zero_band_budgetM09F (d s : ℕ) (r : Bool) (hs : 3 ≤ s) :
 ((s+9).choose 4:ℝ)*transposedBudgetMBE3 d 0 s r ≤ (s+3)*bandBaseMBE3 d 0 s r := by
 by_cases hd : d ≤ s
 · exact band_budget_clampedM09F d 0 s r hs hd
 let a : ℕ := if r then 2 else 1
 let c : ℕ := if r then 3 else 2
 have hc : 2 ≤ c := by dsimp [c]; split_ifs <;> omega
 have hc3 : c ≤ 3 := by dsimp [c]; split_ifs <;> omega
 have ha2 : (a:ℝ) ≤ 2 := by dsimp [a]; split_ifs <;> norm_num
 have hch := zero_band_chooseM09F d s c hs hc hc3 (by omega)
 have he0 : (correctionTermM657 0 (s+1) 0 r:ℝ)=4*a := by
   unfold correctionTermM657
   simp only [Nat.add_zero,Nat.choose_zero_right,Nat.cast_one,mul_one,Nat.zero_add,
     Nat.choose_self,Nat.choose_eq_zero_of_lt (show s+1+2 < s+1+3 by omega),
     Nat.cast_zero,mul_zero,add_zero]
   cases r <;> norm_num [a]
 have he1 : (correctionTermM657 0 (s+1) 1 r:ℝ)=0 := by
   unfold correctionTermM657
   simp only [Nat.zero_add,show s+1+1+3=s+5 by omega,
     show s+1+3=s+4 by omega,show s+1+2=s+3 by omega,
     Nat.choose_eq_zero_of_lt (show s+4 < s+5 by omega),
     Nat.choose_eq_zero_of_lt (show s+3 < s+5 by omega),Nat.cast_zero,mul_zero,add_zero,Int.cast_zero]
 have hb : 4*((d+c+s+4).choose (s+5):ℝ) ≤ bandBaseMBE3 d 0 s r := by
   unfold bandBaseMBE3 bandJMBE3 liftTermMAE9
   simp only [Nat.mul_zero,Nat.add_zero,Nat.choose_zero_right,Nat.cast_one,one_mul]
   change _ ≤ _
   rw [show s+(d+(if r then 3 else 2))+4=d+c+s+4 by dsimp [c]; omega]
   push_cast
   have hn : (0:ℝ) ≤ (s+(d+(if r then 3 else 2))+3).choose (s+3) := by positivity
   linarith
 have ht : transposedBudgetMBE3 d 0 s r=4*a*(d-s:ℕ)/(s+1) := by
   unfold transposedBudgetMBE3 absorbedExtraM418
   rw [he1,add_zero]
   have h := he0
   push_cast at *
   rw [h]
 have hsR : (3:ℝ) ≤ s := by exact_mod_cast hs
 have hu : 0 ≤ ((d-s:ℕ):ℝ)*((s+9).choose 4:ℝ) := by positivity
 have hsmall : (a:ℝ) ≤ (s+3)*(s+1) := by nlinarith
 have hmul := mul_le_mul_of_nonneg_right hsmall hu
 have hlow := mul_le_mul_of_nonneg_left hch (show (0:ℝ) ≤ 4*(s+3)*(s+1) by positivity)
 have hbase := mul_le_mul_of_nonneg_left hb (show (0:ℝ) ≤ (s+3)*(s+1) by positivity)
 rw [ht]
 apply (mul_le_mul_iff_of_pos_right (by positivity : (0:ℝ)<s+1)).mp
 have hn : (s:ℝ)+1≠0 := by positivity
 field_simp [hn]
 nlinarith only [hmul,hlow,hbase]

end
end MathGKM.Markov
