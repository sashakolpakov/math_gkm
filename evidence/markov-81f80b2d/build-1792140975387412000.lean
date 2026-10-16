import MarkovHighCone1Cert0M81F
import MarkovHighCone1Cert1M81F
import MarkovHighCone1Cert2M81F
import MarkovHighCone1Cert3M81F
import MarkovHighCone1Cert4M81F
import MarkovHighCone1Cert5M81F
import MarkovHighCone1Cert6M81F
import MarkovHighCone1ExpandM81F
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000
theorem high_coefficient1_0M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c1g0M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high1_0_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_0_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_0_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high1_0_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high1_0_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high1_0_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high1_0_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high1_0_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_0_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_0_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_0_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient1_1M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c1g1M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high1_1_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_1_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_1_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high1_1_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high1_1_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high1_1_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high1_1_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high1_1_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_1_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_1_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_1_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient1_2M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c1g2M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high1_2_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_2_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_2_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high1_2_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high1_2_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high1_2_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high1_2_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high1_2_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_2_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_2_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_2_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient1_3M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c1g3M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high1_3_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_3_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_3_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high1_3_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high1_3_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high1_3_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high1_3_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high1_3_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_3_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_3_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_3_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient1_4M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c1g4M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high1_4_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_4_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_4_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high1_4_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high1_4_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high1_4_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high1_4_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high1_4_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_4_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_4_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_4_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient1_5M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c1g5M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high1_5_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_5_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_5_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high1_5_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high1_5_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high1_5_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high1_5_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high1_5_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_5_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_5_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_5_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient1_6M81F (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c1g6M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high1_6_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_6_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high1_6_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high1_6_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high1_6_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high1_6_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high1_6_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high1_6_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_6_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_6_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high1_6_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_cone1_nonnegM81F (k l : ℕ) (q : ℝ)
 (hl : 2 ≤ l) (hN : 7 ≤ k+l) (hq : 0 ≤ q) : 0 ≤ highCone1M81F k l q := by
 have h0 := high_coefficient1_0M81F k l hl hN
 have h1 := high_coefficient1_1M81F k l hl hN
 have h2 := high_coefficient1_2M81F k l hl hN
 have h3 := high_coefficient1_3M81F k l hl hN
 have h4 := high_coefficient1_4M81F k l hl hN
 have h5 := high_coefficient1_5M81F k l hl hN
 have h6 := high_coefficient1_6M81F k l hl hN
 have hh : 0 ≤ 729*highCone1M81F k l q := by
  rw [high_expand1M81F]
  positivity
 linarith
end
end MathGKM.Markov
