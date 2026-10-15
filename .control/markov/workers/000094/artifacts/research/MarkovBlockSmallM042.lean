import MarkovBlockAChartM042
import MarkovBlockBChartM042
import MarkovBlockDChartM042
import MarkovBlockSourceExtendedCC
/-! Machine-authored 04290504. Complete interior of first shifted block for numerator-three predecessors. -/
namespace MathGKM.Markov
noncomputable section
theorem blockThree_logConcaveM042 (n c k : ℤ) (hc : 5≤c) (hk : 5≤k) (hkn : k≤n) :
 (fourthShapeK0B c (n*c+3) (n+k)+shiftShapeCC n c 3 k)*
 (fourthShapeK0B c (n*c+3) (n+(k+2))+shiftShapeCC n c 3 (k+2))≤
 (fourthShapeK0B c (n*c+3) (n+(k+1))+shiftShapeCC n c 3 (k+1))^2 := by
 have h := blockAChartM042 (c-5) 0 (k-5) (n-k)
   (by omega) (by omega) (by omega) (by omega)
 have ec : c-5+5=c := by ring
 have en : k-5+(n-k)+5=n := by ring
 have ek : k-5+5=k := by ring
 have ek1 : k-5+6=k+1 := by ring
 have ek2 : k-5+7=k+2 := by ring
 have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
 have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
 have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
 rw [en,ek,ek1,ek2,ec,e0,e1,e2] at h
 exact sub_nonneg.mp h

theorem source_fourth_block_threeM042 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=3)
 (i k : ℕ) (hk : 5≤k) (hkn : k≤n)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have h0 := source_fourth_block_shape_extendedCC n rest hc (i+2) k (by omega) hk (by omega)
 have h1 := source_fourth_block_shape_extendedCC n rest hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_block_shape_extendedCC n rest hc i (k+2) (by omega) (by omega) (by omega)
 simp only [←Nat.add_assoc,hr] at h0 h1 h2
 push_cast at h0 h1 h2
 have hg := blockThree_logConcaveM042 (n:ℤ) (frame rest).mid.b k (by exact_mod_cast hc)
   (by exact_mod_cast hk) (by exact_mod_cast hkn)
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]
theorem blockTwo_logConcaveM042 (n c k : ℤ) (hc : 5≤c) (hk : 5≤k) (hkn : k≤n) :
 (fourthShapeK0B c (n*c+2) (n+k)+shiftShapeCC n c 2 k)*
 (fourthShapeK0B c (n*c+2) (n+(k+2))+shiftShapeCC n c 2 (k+2))≤
 (fourthShapeK0B c (n*c+2) (n+(k+1))+shiftShapeCC n c 2 (k+1))^2 := by
 have h := blockBChartM042 (c-5) 0 (k-5) (n-k)
   (by omega) (by omega) (by omega) (by omega)
 have ec : c-5+5=c := by ring
 have en : k-5+(n-k)+5=n := by ring
 have ek : k-5+5=k := by ring
 have ek1 : k-5+6=k+1 := by ring
 have ek2 : k-5+7=k+2 := by ring
 have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
 have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
 have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
 rw [en,ek,ek1,ek2,ec,e0,e1,e2] at h
 exact sub_nonneg.mp h

theorem source_fourth_block_twoM042 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=2)
 (i k : ℕ) (hk : 5≤k) (hkn : k≤n)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have h0 := source_fourth_block_shape_extendedCC n rest hc (i+2) k (by omega) hk (by omega)
 have h1 := source_fourth_block_shape_extendedCC n rest hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_block_shape_extendedCC n rest hc i (k+2) (by omega) (by omega) (by omega)
 simp only [←Nat.add_assoc,hr] at h0 h1 h2
 push_cast at h0 h1 h2
 have hg := blockTwo_logConcaveM042 (n:ℤ) (frame rest).mid.b k (by exact_mod_cast hc)
   (by exact_mod_cast hk) (by exact_mod_cast hkn)
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]
theorem blockOne_logConcaveM042 (n c k : ℤ) (hc : 5≤c) (hk : 5≤k) (hkn : k≤n) :
 (fourthShapeK0B c (n*c+1) (n+k)+shiftShapeCC n c 1 k)*
 (fourthShapeK0B c (n*c+1) (n+(k+2))+shiftShapeCC n c 1 (k+2))≤
 (fourthShapeK0B c (n*c+1) (n+(k+1))+shiftShapeCC n c 1 (k+1))^2 := by
 have h := blockDChartM042 (c-5) 0 (k-5) (n-k)
   (by omega) (by omega) (by omega) (by omega)
 have ec : c-5+5=c := by ring
 have en : k-5+(n-k)+5=n := by ring
 have ek : k-5+5=k := by ring
 have ek1 : k-5+6=k+1 := by ring
 have ek2 : k-5+7=k+2 := by ring
 have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
 have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
 have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
 rw [en,ek,ek1,ek2,ec,e0,e1,e2] at h
 exact sub_nonneg.mp h

theorem source_fourth_block_oneM042 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=1)
 (i k : ℕ) (hk : 5≤k) (hkn : k≤n)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have h0 := source_fourth_block_shape_extendedCC n rest hc (i+2) k (by omega) hk (by omega)
 have h1 := source_fourth_block_shape_extendedCC n rest hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_block_shape_extendedCC n rest hc i (k+2) (by omega) (by omega) (by omega)
 simp only [←Nat.add_assoc,hr] at h0 h1 h2
 push_cast at h0 h1 h2
 have hg := blockOne_logConcaveM042 (n:ℤ) (frame rest).mid.b k (by exact_mod_cast hc)
   (by exact_mod_cast hk) (by exact_mod_cast hkn)
 rw [←h0,←h1,←h2] at hg
 nlinarith only [hg]
theorem source_fourth_block_smallM042 (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a≤3)
 (i k : ℕ) (hk : 5≤k) (hkn : k≤n)
 (hs : i+(n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (n+k) ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+k+1)^2 := by
 have hp := (frame_reduced rest).1
 have hh : (frame rest).mid.a=3 ∨ (frame rest).mid.a=2 ∨ (frame rest).mid.a=1 := by omega
 rcases hh with h|h|h
 · exact source_fourth_block_threeM042 n rest hc h i k hk hkn hs
 · exact source_fourth_block_twoM042 n rest hc h i k hk hkn hs
 · exact source_fourth_block_oneM042 n rest hc h i k hk hkn hs
end
end MathGKM.Markov
