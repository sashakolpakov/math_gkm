import MarkovThirdOneJets8BBB
import MarkovThirdChambersADB2
/-! Machine-authored request 8bbb934e. Parameter polynomial to source bridge. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem thirdRun_one_expand8BBB (c r : ℕ) (hc : c≠2) :
 thirdRunPolyADB2 1 c r=thirdOnePoly8BBB c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 obtain ⟨a00,b00,c00,d00,bb00,cc00,dd00,ddd00⟩ := oneGauge_008BBB
 obtain ⟨a01,b01,c01,d01,bb01,cc01,dd01,ddd01⟩ := oneGauge_018BBB
 obtain ⟨a10,b10,c10,d10,bb10,cc10,dd10,ddd10⟩ := oneGauge_108BBB
 obtain ⟨a11,b11,c11,d11,bb11,cc11,dd11,ddd11⟩ := oneGauge_118BBB
 simp only [thirdRunPolyADB2,firstRunPolyADB2,secondCompressed446,
   boolMomentADB2,boolJetADB2,runLocalLADB2,edgeLADB2,singleLADB2,
   a00,b00,c00,d00,bb00,cc00,dd00,ddd00,
   a01,b01,c01,d01,bb01,cc01,dd01,ddd01,
   a10,b10,c10,d10,bb10,cc10,dd10,ddd10,
   a11,b11,c11,d11,bb11,cc11,dd11,ddd11,
   runK_scalarBF,runDTwoBF,runCOneBF,lowerH487,runB446,runD446,hc,if_false,
   thirdOnePoly8BBB,thirdOneSeq8BBB]
 norm_num [runSumA27,Finset.sum_range_succ,map_ofNat]
 simp only [←Nat.cast_min]
 ring

theorem thirdRun_one_two8BBB :
 thirdRunPolyADB2 1 2 1=thirdOnePoly8BBB 2 1 0 1 0+
   6*firstRunPolyADB2 1 2 1*X^5 := by
 obtain ⟨a00,b00,c00,d00,bb00,cc00,dd00,ddd00⟩ := oneGauge_008BBB
 obtain ⟨a01,b01,c01,d01,bb01,cc01,dd01,ddd01⟩ := oneGauge_018BBB
 obtain ⟨a10,b10,c10,d10,bb10,cc10,dd10,ddd10⟩ := oneGauge_108BBB
 obtain ⟨a11,b11,c11,d11,bb11,cc11,dd11,ddd11⟩ := oneGauge_118BBB
 simp only [thirdRunPolyADB2,firstRunPolyADB2,secondCompressed446,
   boolMomentADB2,boolJetADB2,runLocalLADB2,edgeLADB2,singleLADB2,
   a00,b00,c00,d00,bb00,cc00,dd00,ddd00,
   a01,b01,c01,d01,bb01,cc01,dd01,ddd01,
   a10,b10,c10,d10,bb10,cc10,dd10,ddd10,
   a11,b11,c11,d11,bb11,cc11,dd11,ddd11,
   runK_scalarBF,runDTwoBF,runCOneBF,lowerH487,runB446,runD446,if_false,
   thirdOnePoly8BBB,thirdOneSeq8BBB]
 norm_num [runSumA27,Finset.sum_range_succ,map_ofNat]
 simp only [←Nat.cast_min]
 ring

theorem source_third_one_raw8BBB (rest : List Bool) (hc : 4≤(frame rest).mid.b)
 (i j : ℕ) (hs : i+j=(frame (true::false::rest)).mid.a+3) :
 6*coeff (frame (true::false::rest)).mid.p i j=
 thirdOneSeq8BBB (frame rest).mid.b (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a)
     (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) j := by
 have h := source_third_run_rawADB2 1 rest hc i j hs
 rw [thirdRun_one_expand8BBB _ _ (by omega),thirdOnePoly_coeff8BBB] at h
 exact h

#print axioms thirdRun_one_expand8BBB
#print axioms source_third_one_raw8BBB
end
end MathGKM.Markov
