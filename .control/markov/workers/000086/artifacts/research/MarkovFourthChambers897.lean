import MarkovFourthMoment897
import MarkovFourthConditional01F
/-! Machine-authored 897eabb3. The six previously conditional fourth-slice
inequalities are now transported using a proved source moment. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem fourth_chamber_moment_0897 (c r : ℕ)
 (hc : 0<r) (hr : r<c) (hl : 0*r<1*c) (hu : 4*r<1*c) :
 fullFourthMoment897 (X:ℤ[X]) c r=fourthLowMoment001F c r := by
 have hqi : ((2*r-c:ℕ):ℤ)=0 := by omega
 have hq : ((2*r-c:ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi
 have hti : ((min (c-r) (3*r-c):ℕ):ℤ)=0 := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hti
 have hui : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 have hu : ((3*r-2*c:ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hui
 have hmi : ((min (c-2*r) (4*r-c):ℕ):ℤ)=0 := by omega
 have hm : ((min (c-2*r) (4*r-c):ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hmi
 unfold fullFourthMoment897 fourSourceMoment897
 rw [if_pos (by omega : 2*r≤c)]
 simp only [hq,ht,hu,hm]
 simp [boolMomentADB2,boolJetADB2,fourthTriple897,fourthQuad897,fourthConstant897,bit6905,fourthLowMoment001F] <;> ring

theorem source_fourth_chamber_0897 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hM := source_fourth_moment897 rest hc
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [fourth_chamber_moment_0897 _ _ hr hrc (by omega) (by omega)] at hM
 exact source_fourth_chamber_001F rest hc hl hu hM i j hs

theorem fourth_chamber_moment_1897 (c r : ℕ)
 (hc : 0<r) (hr : r<c) (hl : 1*c<4*r) (hu : 3*r<1*c) :
 fullFourthMoment897 (X:ℤ[X]) c r=fourthLowMoment101F c r := by
 have hqi : ((2*r-c:ℕ):ℤ)=0 := by omega
 have hq : ((2*r-c:ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi
 have hti : ((min (c-r) (3*r-c):ℕ):ℤ)=0 := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hti
 have hui : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 have hu : ((3*r-2*c:ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hui
 have hmi : ((min (c-2*r) (4*r-c):ℕ):ℤ)=4*(r:ℤ)-(c:ℤ) := by omega
 have hm : ((min (c-2*r) (4*r-c):ℕ):ℤ[X])=C (4*(r:ℤ)-(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hmi
 unfold fullFourthMoment897 fourSourceMoment897
 rw [if_pos (by omega : 2*r≤c)]
 simp only [hq,ht,hu,hm]
 simp [boolMomentADB2,boolJetADB2,fourthTriple897,fourthQuad897,fourthConstant897,bit6905,fourthLowMoment101F] <;> ring

theorem source_fourth_chamber_1897 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hM := source_fourth_moment897 rest hc
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [fourth_chamber_moment_1897 _ _ hr hrc (by omega) (by omega)] at hM
 exact source_fourth_chamber_101F rest hc hl hu hM i j hs

theorem fourth_chamber_moment_2897 (c r : ℕ)
 (hc : 0<r) (hr : r<c) (hl : 1*c<3*r) (hu : 2*r<1*c) :
 fullFourthMoment897 (X:ℤ[X]) c r=fourthLowMoment201F c r := by
 have hqi : ((2*r-c:ℕ):ℤ)=0 := by omega
 have hq : ((2*r-c:ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi
 have hti : ((min (c-r) (3*r-c):ℕ):ℤ)=3*(r:ℤ)-(c:ℤ) := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ[X])=C (3*(r:ℤ)-(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hti
 have hui : ((3*r-2*c:ℕ):ℤ)=0 := by omega
 have hu : ((3*r-2*c:ℕ):ℤ[X])=C (0) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hui
 have hmi : ((min (c-2*r) (4*r-c):ℕ):ℤ)=(c:ℤ)-2*(r:ℤ) := by omega
 have hm : ((min (c-2*r) (4*r-c):ℕ):ℤ[X])=C ((c:ℤ)-2*(r:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hmi
 unfold fullFourthMoment897 fourSourceMoment897
 rw [if_pos (by omega : 2*r≤c)]
 simp only [hq,ht,hu,hm]
 simp [boolMomentADB2,boolJetADB2,fourthTriple897,fourthQuad897,fourthConstant897,bit6905,fourthLowMoment201F] <;> ring

theorem source_fourth_chamber_2897 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hM := source_fourth_moment897 rest hc
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [fourth_chamber_moment_2897 _ _ hr hrc (by omega) (by omega)] at hM
 exact source_fourth_chamber_201F rest hc hl hu hM i j hs

theorem fourth_chamber_moment_3897 (c r : ℕ)
 (hc : 0<r) (hr : r<c) (hl : 1*c<2*r) (hu : 3*r<2*c) :
 fullFourthMoment897 (X:ℤ[X]) c r=fourthLowMoment301F c r := by
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
 unfold fullFourthMoment897 fourSourceMoment897
 rw [if_neg (by omega : ¬2*r≤c),if_pos (by omega : 3*r≤2*c)]
 simp only [hq,ht,hu,hm]
 simp [boolMomentADB2,boolJetADB2,fourthTriple897,fourthQuad897,fourthConstant897,bit6905,fourthLowMoment301F] <;> ring

theorem source_fourth_chamber_3897 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hM := source_fourth_moment897 rest hc
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [fourth_chamber_moment_3897 _ _ hr hrc (by omega) (by omega)] at hM
 exact source_fourth_chamber_301F rest hc hl hu hM i j hs

theorem fourth_chamber_moment_4897 (c r : ℕ)
 (hc : 0<r) (hr : r<c) (hl : 2*c<3*r) (hu : 4*r<3*c) :
 fullFourthMoment897 (X:ℤ[X]) c r=fourthLowMoment401F c r := by
 have hqi : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have hq : ((2*r-c:ℕ):ℤ[X])=C (2*(r:ℤ)-(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi
 have hti : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ[X])=C ((c:ℤ)-(r:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hti
 have hui : ((3*r-2*c:ℕ):ℤ)=3*(r:ℤ)-2*(c:ℤ) := by omega
 have hu : ((3*r-2*c:ℕ):ℤ[X])=C (3*(r:ℤ)-2*(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hui
 have hmi : ((c-r:ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have hm : ((c-r:ℕ):ℤ[X])=C ((c:ℤ)-(r:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hmi
 unfold fullFourthMoment897 fourSourceMoment897
 rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_pos (by omega : 4*r≤3*c)]
 simp only [hq,ht,hu,hm]
 simp [boolMomentADB2,boolJetADB2,fourthTriple897,fourthQuad897,fourthConstant897,bit6905,fourthLowMoment401F] <;> ring

theorem source_fourth_chamber_4897 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hM := source_fourth_moment897 rest hc
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [fourth_chamber_moment_4897 _ _ hr hrc (by omega) (by omega)] at hM
 exact source_fourth_chamber_401F rest hc hl hu hM i j hs

theorem fourth_chamber_moment_5897 (c r : ℕ)
 (hc : 0<r) (hr : r<c) (hl : 3*c<4*r) (hu : 1*r<1*c) :
 fullFourthMoment897 (X:ℤ[X]) c r=fourthLowMoment501F c r := by
 have hqi : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have hq : ((2*r-c:ℕ):ℤ[X])=C (2*(r:ℤ)-(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hqi
 have hti : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have ht : ((min (c-r) (3*r-c):ℕ):ℤ[X])=C ((c:ℤ)-(r:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hti
 have hui : ((3*r-2*c:ℕ):ℤ)=3*(r:ℤ)-2*(c:ℤ) := by omega
 have hu : ((3*r-2*c:ℕ):ℤ[X])=C (3*(r:ℤ)-2*(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hui
 have hmi : ((c-r:ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have hm : ((c-r:ℕ):ℤ[X])=C ((c:ℤ)-(r:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hmi
 have hvi : ((4*r-3*c:ℕ):ℤ)=4*(r:ℤ)-3*(c:ℤ) := by omega
 have hv : ((4*r-3*c:ℕ):ℤ[X])=C (4*(r:ℤ)-3*(c:ℤ)) := by
   simpa only [map_natCast] using congrArg (C : ℤ → ℤ[X]) hvi
 unfold fullFourthMoment897 fourSourceMoment897
 rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_neg (by omega : ¬4*r≤3*c)]
 simp only [hq,ht,hu,hm,hv]
 simp [boolMomentADB2,boolJetADB2,fourthTriple897,fourthQuad897,fourthConstant897,bit6905,fourthLowMoment501F] <;> ring

theorem source_fourth_chamber_5897 (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hM := source_fourth_moment897 rest hc
 obtain ⟨hr,hrc,_⟩ := frame_reduced rest
 rw [fourth_chamber_moment_5897 _ _ hr hrc (by omega) (by omega)] at hM
 exact source_fourth_chamber_501F rest hc hl hu hM i j hs

end
end MathGKM.Markov
