import MarkovTailSource5M06
import MarkovFullTailSourceM94
/-! Machine-authored 94b1de05: weakened stable-tail threshold. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
attribute [local irreducible] tailPoly5M06 tailRem5M06 coeff frame
theorem source_fourth_tail_coeff5M94 (n k : ℕ) (rest : List Bool)
 (hn : 7≤n+k) (hc : 5≤(frame rest).mid.b)
 (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hk : k≤7)
 (hs : i+(4*n+k)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k)=
 tailSeq5M06 (frame rest).mid.b (frame rest).mid.a k := by
 have he := source_fourth_tail_of_splitM94 n k rest hn hc
   (tailPoly5M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tailRem5M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tail_top_source_split5M06 (n:ℤ[X]) X _ _ hl hu)
   (tail_remainder_degree5M06 _ _) i hs
 have ht := tail_poly_coeff5M06 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ) k hk
 simpa only [Int.cast_natCast] using he.trans (by simpa only [Int.cast_natCast] using ht)

theorem source_fourth_tail_chamber5M94 (n k : ℕ) (rest : List Bool)
 (hn : 7≤n+k) (hc : 5≤(frame rest).mid.b)
 (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i : ℕ) (hk : k≤5)
 (hs : i+(4*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (4*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (4*n+k+1)^2 := by
 let x : ℤ := 1*((frame rest).mid.b:ℤ)-1*((frame rest).mid.a:ℤ)-1
 let y : ℤ := 4*((frame rest).mid.a:ℤ)-3*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : 5+1*y+4*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : 4+1*y+3*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := tail_seq_lc5M06 x y hx hy k hk
 have hcc' : 4*(x+1)+1*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr' : 3*(x+1)+1*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr] at h
 have htarget := h
 rw [←source_fourth_tail_coeff5M94 n k rest (by omega) hc hl hu (i+2) (by omega) (by omega),
   ←source_fourth_tail_coeff5M94 n (k+2) rest (by omega) hc hl hu i (by omega) (by omega),
   ←source_fourth_tail_coeff5M94 n (k+1) rest (by omega) hc hl hu (i+1) (by omega) (by omega)] at htarget
 simp only [←Nat.add_assoc] at htarget
 nlinarith only [htarget]
end
end MathGKM.Markov
