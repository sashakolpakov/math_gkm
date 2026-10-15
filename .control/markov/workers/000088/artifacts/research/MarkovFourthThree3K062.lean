import MarkovFourthThreeCert3K062
import MarkovFourthThreeLocalK062
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem fourth_three_moment_3K062 (c r : ℕ) (hr : 0<r) (hrc : r<c)
 (hl : 1*c<2*r) (hu : 3*r<2*c) :
 fourMomentBE (runLocalFourBE 3) c r=fourthThreeMoment3K062 c r := by
 have hqi : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have hq : ((2*r-c:ℕ):ℤ[X])=C (2*(r:ℤ)-(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi
 have hti : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ[X])=C ((c:ℤ)-(r:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hti
 have hui : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 have hu : ((3*r-2*c:ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hui
 have hmi : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have hm : ((2*r-c:ℕ):ℤ[X])=C (2*(r:ℤ)-(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hmi
 unfold fourMomentBE fourSourceMoment897
 rw [if_neg (by omega : ¬2*r≤c),if_pos (by omega : 3*r≤2*c)]
 simp only [hq,ht,hu,hm]
 simp only [boolMomentADB2,boolJetADB2,fourTripleBE,fourQuadBE,fourCanonicalBE,fourPotentialBE,runLocalFour_threeK062,threeLocalFourK062,fourthThreeMoment3K062,map_add,map_sub,map_mul,map_ofNat,map_neg,map_zero,map_one,map_natCast,map_intCast]
 ring
theorem fourth_three_expand_3K062 (c r : ℕ) (hc : 5≤c) (hr : 0<r) (hrc : r<c)
 (hl : 1*c<2*r) (hu : 3*r<2*c) :
 fourthExplicitRunBE 3 c r=fourthThreePoly3K062 c r := by
 have hc2 : c≠2 := by omega
 have hc3 : c≠3 := by omega
 have hqi : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have hti : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have hui : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 have hqp : ((2*r-c:ℕ):ℤ[X])=C (2*(r:ℤ)-(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi
 unfold fourthExplicitRunBE
 rw [fourth_three_moment_3K062 c r hr hrc hl hu]
 simp only [correctedThirdRun8BBB,if_neg hc2,if_neg hc3,add_zero]
 rw [small_poly3FD c r hc2]
 simp only [firstRunPolyADB2,lowerH487,smallPoly3FD,small3_0FD,small3_1FD,small3_2FD,small3_3FD,small3_4FD,small3_5FD,small3_6FD,small3_7FD,small3_8FD,small3_9FD,small3_10FD,small3_11FD,small3_12FD,small3_13FD,small3_14FD,
   secondCompressed446,runK_scalarBF,runDTwoBF,runCOneBF,runB446,runD446,
   if_neg hc2,hqp,hqi,hti,hui,fourthThreeMoment3K062,fourthThreePoly3K062,fourthThreeSeq3K062]
 norm_num [runSumA27,Finset.sum_range_succ,map_ofNat]
 push_cast
 ring

end
end MathGKM.Markov
