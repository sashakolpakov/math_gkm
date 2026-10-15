import MarkovFourthLow001F
import MarkovFourthLow101F
import MarkovFourthLow201F
import MarkovFourthLow301F
import MarkovFourthLow401F
import MarkovFourthLow501F
/-! Machine-authored 01f51d63. Each theorem retains the unproved fourth
source-moment identity as an explicit hypothesis, never as an axiom. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false
theorem fourth_raw_from_sequence01F (path : List Bool) (f : ℕ → ℤ)
 (hf : ∀ j,24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 path++[true]) 4).coeff j=f j)
 (hlc : ∀ j,f j*f (j+2)≤f (j+1)^2) (i j : ℕ)
 (hs : i+j+2=(frame path).mid.a+4) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
 coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have h := hlc j
 rw [←hf j,←hf (j+1),←hf (j+2)] at h
 rw [source_cut_coeffA27 path i (j+2) 4 (by omega),
   source_cut_coeffA27 path (i+2) j 4 (by omega),
   source_cut_coeffA27 path (i+1) (j+1) 4 (by omega)]
 nlinarith only [h]
theorem source_fourth_chamber_001F (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 0*(frame rest).mid.b<1*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<1*(frame rest).mid.b)
 (hM : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
   fourthLowMoment001F (frame rest).mid.b (frame rest).mid.a) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hf := source_low_fourth_moment01F rest (by omega) _ hM
 have hq : ((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)=0 := by omega
 have ht : ((min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ):ℤ)=0 := by omega
 have hh : ((3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ):ℤ)=0 := by omega
 rw [hq,ht,hh] at hf
 have hf' (k : ℕ) : 24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4).coeff k=
   fourthLowSeq001F (frame rest).mid.b (frame rest).mid.a k := by
   have he := congrArg (fun p : ℤ[X] => p.coeff k) hf
   simpa only [Polynomial.coeff_ofNat_mul,fourth_low_coeff_001F] using he
 apply fourth_raw_from_sequence01F (false::rest) _ hf' ?_ i j hs
 intro k
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 1*((frame rest).mid.a:ℤ)-0*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 1*(x+1)+4*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 0*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hg := fourth_low_lc_001F x y hx hy k
 rwa [hcc,hrr] at hg
theorem source_fourth_chamber_101F (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<1*(frame rest).mid.b)
 (hM : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
   fourthLowMoment101F (frame rest).mid.b (frame rest).mid.a) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hf := source_low_fourth_moment01F rest (by omega) _ hM
 have hq : ((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)=0 := by omega
 have ht : ((min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ):ℤ)=0 := by omega
 have hh : ((3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ):ℤ)=0 := by omega
 rw [hq,ht,hh] at hf
 have hf' (k : ℕ) : 24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4).coeff k=
   fourthLowSeq101F (frame rest).mid.b (frame rest).mid.a k := by
   have he := congrArg (fun p : ℤ[X] => p.coeff k) hf
   simpa only [Polynomial.coeff_ofNat_mul,fourth_low_coeff_101F] using he
 apply fourth_raw_from_sequence01F (false::rest) _ hf' ?_ i j hs
 intro k
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 4*(x+1)+3*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hg := fourth_low_lc_101F x y hx hy k
 rwa [hcc,hrr] at hg
theorem source_fourth_chamber_201F (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (hM : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
   fourthLowMoment201F (frame rest).mid.b (frame rest).mid.a) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hf := source_low_fourth_moment01F rest (by omega) _ hM
 have hq : ((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)=0 := by omega
 have ht : ((min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ):ℤ)=3*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ) := by omega
 have hh : ((3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ):ℤ)=0 := by omega
 rw [hq,ht,hh] at hf
 have hf' (k : ℕ) : 24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4).coeff k=
   fourthLowSeq201F (frame rest).mid.b (frame rest).mid.a k := by
   have he := congrArg (fun p : ℤ[X] => p.coeff k) hf
   simpa only [Polynomial.coeff_ofNat_mul,fourth_low_coeff_201F] using he
 apply fourth_raw_from_sequence01F (false::rest) _ hf' ?_ i j hs
 intro k
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-2*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 3*(x+1)+2*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hg := fourth_low_lc_201F x y hx hy k
 rwa [hcc,hrr] at hg
theorem source_fourth_chamber_301F (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 1*(frame rest).mid.b<2*(frame rest).mid.a) (hu : 3*(frame rest).mid.a<2*(frame rest).mid.b)
 (hM : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
   fourthLowMoment301F (frame rest).mid.b (frame rest).mid.a) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hf := source_low_fourth_moment01F rest (by omega) _ hM
 have hq : ((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)=2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ) := by omega
 have ht : ((min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ):ℤ)=((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ) := by omega
 have hh : ((3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ):ℤ)=0 := by omega
 rw [hq,ht,hh] at hf
 have hf' (k : ℕ) : 24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4).coeff k=
   fourthLowSeq301F (frame rest).mid.b (frame rest).mid.a k := by
   have he := congrArg (fun p : ℤ[X] => p.coeff k) hf
   simpa only [Polynomial.coeff_ofNat_mul,fourth_low_coeff_301F] using he
 apply fourth_raw_from_sequence01F (false::rest) _ hf' ?_ i j hs
 intro k
 let x : ℤ := 2*((frame rest).mid.b:ℤ)-3*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 2*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 2*(x+1)+3*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 1*(x+1)+2*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hg := fourth_low_lc_301F x y hx hy k
 rwa [hcc,hrr] at hg
theorem source_fourth_chamber_401F (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 2*(frame rest).mid.b<3*(frame rest).mid.a) (hu : 4*(frame rest).mid.a<3*(frame rest).mid.b)
 (hM : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
   fourthLowMoment401F (frame rest).mid.b (frame rest).mid.a) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hf := source_low_fourth_moment01F rest (by omega) _ hM
 have hq : ((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)=2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ) := by omega
 have ht : ((min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ):ℤ)=((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ) := by omega
 have hh : ((3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ):ℤ)=3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ) := by omega
 rw [hq,ht,hh] at hf
 have hf' (k : ℕ) : 24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4).coeff k=
   fourthLowSeq401F (frame rest).mid.b (frame rest).mid.a k := by
   have he := congrArg (fun p : ℤ[X] => p.coeff k) hf
   simpa only [Polynomial.coeff_ofNat_mul,fourth_low_coeff_401F] using he
 apply fourth_raw_from_sequence01F (false::rest) _ hf' ?_ i j hs
 intro k
 let x : ℤ := 3*((frame rest).mid.b:ℤ)-4*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 3*(x+1)+4*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 2*(x+1)+3*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hg := fourth_low_lc_401F x y hx hy k
 rwa [hcc,hrr] at hg
theorem source_fourth_chamber_501F (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a) (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (hM : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
   fourthLowMoment501F (frame rest).mid.b (frame rest).mid.a) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hf := source_low_fourth_moment01F rest (by omega) _ hM
 have hq : ((2*(frame rest).mid.a-(frame rest).mid.b:ℕ):ℤ)=2*((frame rest).mid.a:ℤ)-((frame rest).mid.b:ℤ) := by omega
 have ht : ((min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ):ℤ)=((frame rest).mid.b:ℤ)-((frame rest).mid.a:ℤ) := by omega
 have hh : ((3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ):ℤ)=3*((frame rest).mid.a:ℤ)-2*((frame rest).mid.b:ℤ) := by omega
 rw [hq,ht,hh] at hf
 have hf' (k : ℕ) : 24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4).coeff k=
   fourthLowSeq501F (frame rest).mid.b (frame rest).mid.a k := by
   have he := congrArg (fun p : ℤ[X] => p.coeff k) hf
   simpa only [Polynomial.coeff_ofNat_mul,fourth_low_coeff_501F] using he
 apply fourth_raw_from_sequence01F (false::rest) _ hf' ?_ i j hs
 intro k
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 4*(x+1)+1*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 3*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have hg := fourth_low_lc_501F x y hx hy k
 rwa [hcc,hrr] at hg
end
end MathGKM.Markov
