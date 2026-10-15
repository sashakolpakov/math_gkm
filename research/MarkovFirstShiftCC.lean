import MarkovFirstShiftSourceF2
/-! Machine-authored cc599cf1. Missing run-four first-shift case. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384

def runFourGapCC (C R : ℤ) : ℤ :=
 482402562048 + 3199438225152*R + 9277213422144*R^2 + 15386800084992*R^3 + 15986111628048*R^4 + 10663331434848*R^5 + 4461986420352*R^6 + 1071093396384*R^7 + 112939561008*R^8 + 2567676314112*C + 14854972831104*C*R + 36867139600064*C*R^2 + 50949966786240*C*R^3 + 42381243659776*C*R^4 + 21225704848032*C*R^5 + 5925413507904*C*R^6 + 710981047584*C*R^7 + 5945283758080*C^2 + 29438413156992*C^2*R + 60880451275904*C^2*R^2 + 67362658740704*C^2*R^3 + 42063587518592*C^2*R^4 + 14047338014880*C^2*R^5 + 1958353369344*C^2*R^6 + 7833796518912*C^3 + 32324373656192*C^3*R + 53522830867648*C^3*R^2 + 44450013242944*C^3*R^3 + 18499615876160*C^3*R^4 + 3082784092992*C^3*R^5 + 6434483000320*C^4 + 21258512265856*C^4*R + 26417025240768*C^4*R^2 + 14616851665792*C^4*R^3 + 3033522841408*C^4*R^4 + 3376682368512*C^5 + 8371820915200*C^5*R + 6929042689536*C^5*R^2 + 1910819119616*C^5*R^3 + 1105277906944*C^6 + 1824750204416*C^6*R + 752449303552*C^6*R^2 + 205942920192*C^7 + 169363756032*C^7*R + 16683408384*C^8

theorem runFourGap_identityCC (C R : ℤ) :
 lowCoeff5F2 (R+C+2) (4*(R+C+2)+(R+1))^2-
 lowCoeff4F2 (R+C+2) (4*(R+C+2)+(R+1))*
 (lowCoeff6F2 (R+C+2) (4*(R+C+2)+(R+1))+
 shiftCorrectionF2 4 (R+C+2) (R+1))=runFourGapCC C R := by
 unfold lowCoeff4F2 lowCoeff5F2 lowCoeff6F2 shiftCorrectionF2 runFourGapCC
 ring

theorem runFourGap_nonnegCC (C R : ℤ) (hC : 0≤C) (hR : 0≤R) :
 0≤runFourGapCC C R := by unfold runFourGapCC; positivity

theorem firstShift_four_lcCC (c r : ℤ) (hr : 1≤r) (hrc : r<c) :
 lowCoeff4F2 c (4*c+r)*(lowCoeff6F2 c (4*c+r)+shiftCorrectionF2 4 c r)≤
 lowCoeff5F2 c (4*c+r)^2 := by
 have he := runFourGap_identityCC (c-r-1) (r-1)
 have hp := runFourGap_nonnegCC (c-r-1) (r-1) (by omega) (by omega)
 have ec : r-1+(c-r-1)+2=c := by ring
 have er : r-1+1=r := by ring
 rw [ec,er] at he
 linarith only [he,hp]

theorem source_fourth_first_shift_fourCC (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i : ℕ)
 (hs : i+4+2=(frame (List.replicate 4 true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate 4 true++false::rest)).mid.p i 6*
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+2) 4 ≤
 coeff (frame (List.replicate 4 true++false::rest)).mid.p (i+1) 5^2 := by
 have h0 := source_fourth_convF2 4 rest hc (i+2) 4 (by omega) (by omega)
 have h1 := source_fourth_convF2 4 rest hc (i+1) 5 (by omega) (by omega)
 have h2 := source_fourth_next_convF2 4 rest hc i (by omega)
 rw [convLow_at4F2] at h0
 rw [convLow_at5F2] at h1
 norm_num only [Nat.reduceAdd,Nat.cast_ofNat] at h0 h1 h2
 rw [convLow_at6F2] at h2
 have hg := firstShift_four_lcCC (frame rest).mid.b (frame rest).mid.a
   (by exact_mod_cast (frame_reduced rest).1)
   (by exact_mod_cast (frame_reduced rest).2.1)
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]

theorem source_fourth_first_shiftCC (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hn : 4≤n) (i : ℕ)
 (hs : i+n+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) n ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+1)^2 := by
 by_cases h : 5≤n
 · exact source_fourth_first_shiftF2 n rest hc h i hs
 · have he : n=4 := by omega
   subst n
   exact source_fourth_first_shift_fourCC rest hc i hs
end
end MathGKM.Markov
