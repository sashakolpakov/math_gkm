/- Machine-authored f25b03a1: reconciled copy of an excluded interrupted draft. -/
import MarkovHighCone2Cert0M81F
import MarkovHighCone2Cert1M81F
import MarkovHighCone2Cert2M81F
import MarkovHighCone2Cert3M81F
import MarkovHighCone2Cert4M81F
import MarkovHighCone2Cert5M81F
import MarkovHighCone2Cert6M81F
import MarkovHighCone2ExpandM81F
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000
theorem high_coefficient2_0MF25 (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c2g0M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high2_0_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_0_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_0_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high2_0_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high2_0_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high2_0_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high2_0_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high2_0_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_0_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_0_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_0_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient2_1MF25 (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c2g1M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high2_1_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_1_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_1_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high2_1_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high2_1_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high2_1_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high2_1_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high2_1_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_1_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_1_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_1_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient2_2MF25 (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c2g2M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high2_2_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_2_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_2_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high2_2_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high2_2_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high2_2_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high2_2_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high2_2_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_2_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_2_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_2_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient2_3MF25 (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c2g3M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high2_3_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_3_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_3_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high2_3_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high2_3_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high2_3_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high2_3_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high2_3_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_3_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_3_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_3_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient2_4MF25 (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c2g4M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high2_4_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_4_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_4_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high2_4_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high2_4_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high2_4_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high2_4_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high2_4_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_4_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_4_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_4_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient2_5MF25 (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c2g5M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high2_5_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_5_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_5_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high2_5_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high2_5_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high2_5_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high2_5_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high2_5_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_5_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_5_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_5_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_coefficient2_6MF25 (k l : ℕ) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ c2g6M81F k l := by
 by_cases hk : k=0
 · subst k
   by_cases h9 : 9 ≤ l
   · have h := high2_6_zeroM81F 0 ((l:ℝ)-9) (by norm_num) (sub_nonneg.mpr (by exact_mod_cast h9))
     convert h using 1 <;> congr 1 <;> ring
   have hh : 7 ≤ l := by omega
   interval_cases l
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_6_z7M81F 0 0 (by norm_num) (by norm_num)
   · simpa only [Nat.cast_zero,Nat.cast_ofNat] using high2_6_z8M81F 0 0 (by norm_num) (by norm_num)
 have hk1 : 1 ≤ k := by omega
 by_cases h9 : 9 ≤ l
 · have h := high2_6_largeM81F ((k:ℝ)-1) ((l:ℝ)-9)
     (sub_nonneg.mpr (by exact_mod_cast hk1)) (sub_nonneg.mpr (by exact_mod_cast h9))
   convert h using 1 <;> congr 1 <;> ring
 have hl8 : l ≤ 8 := by omega
 interval_cases l
 · have hks : (5:ℝ) ≤ k := by exact_mod_cast (show 5 ≤ k by omega)
   have h := high2_6_s2M81F ((k:ℝ)-5) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (4:ℝ) ≤ k := by exact_mod_cast (show 4 ≤ k by omega)
   have h := high2_6_s3M81F ((k:ℝ)-4) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (3:ℝ) ≤ k := by exact_mod_cast (show 3 ≤ k by omega)
   have h := high2_6_s4M81F ((k:ℝ)-3) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (2:ℝ) ≤ k := by exact_mod_cast (show 2 ≤ k by omega)
   have h := high2_6_s5M81F ((k:ℝ)-2) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_6_s6M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_6_s7M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
 · have hks : (1:ℝ) ≤ k := by exact_mod_cast (show 1 ≤ k by omega)
   have h := high2_6_s8M81F ((k:ℝ)-1) 0 (by linarith) (by norm_num)
   convert h using 1 <;> congr 1 <;> ring
theorem high_cone2_nonnegMF25 (k l : ℕ) (q : ℝ)
 (hl : 2 ≤ l) (hN : 7 ≤ k+l) (hq : 0 ≤ q) : 0 ≤ highCone2M81F k l q := by
 have h0 := high_coefficient2_0MF25 k l hl hN
 have h1 := high_coefficient2_1MF25 k l hl hN
 have h2 := high_coefficient2_2MF25 k l hl hN
 have h3 := high_coefficient2_3MF25 k l hl hN
 have h4 := high_coefficient2_4MF25 k l hl hN
 have h5 := high_coefficient2_5MF25 k l hl hN
 have h6 := high_coefficient2_6MF25 k l hl hN
 have hh : 0 ≤ 4096*highCone2M81F k l q := by
  rw [high_expand2M81F]
  positivity
 linarith
end
end MathGKM.Markov
