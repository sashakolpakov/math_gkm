import MarkovTailSource2M06
import MarkovFullTailSourceM94
/-! Machine-authored 94b1de05: weakened stable-tail threshold. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
attribute [local irreducible] tailPoly2M06 tailRem2M06 coeff frame
theorem source_fourth_tail_coeff2M94 (n k : ℕ) (rest : List Bool)
 (hn : 7≤n+k) (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hk : k≤7)
 (hs : i+(4*n+k)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k)=
 tailSeq2M06 (frame rest).mid.b (frame rest).mid.a k := by
 have he := source_fourth_tail_of_splitM94 n k rest hn hc
   (tailPoly2M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tailRem2M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tail_top_source_split2M06 (n:ℤ[X]) X _ _ hl hu)
   (tail_remainder_degree2M06 _ _) i hs
 have ht := tail_poly_coeff2M06 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ) k hk
 simpa only [Int.cast_natCast] using he.trans (by simpa only [Int.cast_natCast] using ht)

theorem source_fourth_tail_chamber2M94 (n k : ℕ) (rest : List Bool)
 (hn : 7≤n+k) (hc : 5≤(frame rest).mid.b)
 (hl : 1*(frame rest).mid.b<3*(frame rest).mid.a)
 (hu : 2*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hk : k≤5)
 (hs : i+(4*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (4*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (4*n+k+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-2*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 3*((frame rest).mid.a:ℤ)-1*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+2*y+3*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 2+1*y+1*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := tail_seq_lc2M06 x y hx hy k hk
 have hcc' : 3*(x+1)+2*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr' : 1*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr] at h
 have htarget := h
 rw [←source_fourth_tail_coeff2M94 n k rest (by omega) hc hl hu (i+2) (by omega) (by omega),
   ←source_fourth_tail_coeff2M94 n (k+2) rest (by omega) hc hl hu i (by omega) (by omega),
   ←source_fourth_tail_coeff2M94 n (k+1) rest (by omega) hc hl hu (i+1) (by omega) (by omega)] at htarget
 simp only [←Nat.add_assoc] at htarget
 nlinarith only [htarget]
end
end MathGKM.Markov
