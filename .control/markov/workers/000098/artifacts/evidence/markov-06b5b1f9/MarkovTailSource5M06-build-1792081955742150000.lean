import MarkovTailChamber5M06
import MarkovFullTailSourceM06
import MarkovFourthLowSource897
/-! Machine-authored 06b5b1f9. Actual-source stable fourth tail. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
attribute [local irreducible] fullH4FA
theorem tail_top_source_split5M06 {A : Type*} [CommRing A]
 (N x : A) (c r : ℕ) (hl : 3*c<4*r) (hu : 1*r<1*c) :
 fullH4FA N c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) x+
 96*(1-x)^8*fourthCountCorrectionFA x c r=
 (1-x)^8*tailPoly5M06 c r x+tailRem5M06 c r x := by
 have hi0 : ((2*r-c:ℕ):ℤ)=2*(r:ℤ)-(c:ℤ) := by omega
 have h0 : ((2*r-c:ℕ):A)=2*(r:A)-(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi0
 have hi1 : ((min (c-r) (3*r-c):ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have h1 : ((min (c-r) (3*r-c):ℕ):A)=(c:A)-(r:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi1
 have hi2 : ((3*r-2*c:ℕ):ℤ)=3*(r:ℤ)-2*(c:ℤ) := by omega
 have h2 : ((3*r-2*c:ℕ):A)=3*(r:A)-2*(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi2
 have hi3 : ((c-r:ℕ):ℤ)=(c:ℤ)-(r:ℤ) := by omega
 have h3 : ((c-r:ℕ):A)=(c:A)-(r:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi3
 have hi4 : ((4*r-3*c:ℕ):ℤ)=4*(r:ℤ)-3*(c:ℤ) := by omega
 have h4 : ((4*r-3*c:ℕ):A)=4*(r:A)-3*(c:A) := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (fun z : ℤ => (z:A)) hi4
 have hc : fourthCountCorrectionFA x c r=2*((c:A)-(r:A))*x^6+(4*(r:A)-3*(c:A))*x^7 := by
   unfold fourthCountCorrectionFA
   rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_neg (by omega : ¬4*r≤3*c),h3,h4]
 rw [h0,h1,h2,hc]
 have ht := tail_top_split5M06 N (c:A) (r:A) x
 convert ht using 1 <;> congr 2 <;> ring

attribute [local irreducible] tailPoly5M06 tailRem5M06 coeff frame
theorem source_fourth_tail_coeff5M06 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i k : ℕ) (hk : k≤7)
 (hs : i+(4*n+k)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k)=
 tailSeq5M06 (frame rest).mid.b (frame rest).mid.a k := by
 have he := source_fourth_tail_of_splitM06 n rest hn hc
   (tailPoly5M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tailRem5M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tail_top_source_split5M06 (n:ℤ[X]) X _ _ hl hu)
   (tail_remainder_degree5M06 _ _) i k hs
 have ht := tail_poly_coeff5M06 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ) k hk
 simpa only [Int.cast_natCast] using he.trans (by simpa only [Int.cast_natCast] using ht)

theorem source_fourth_tail_chamber5M06 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hl : 3*(frame rest).mid.b<4*(frame rest).mid.a)
 (hu : 1*(frame rest).mid.a<1*(frame rest).mid.b)
 (i k : ℕ) (hk : k≤5)
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
 rw [←source_fourth_tail_coeff5M06 n rest hn hc hl hu (i+2) k (by omega) (by omega),
   ←source_fourth_tail_coeff5M06 n rest hn hc hl hu i (k+2) (by omega) (by omega),
   ←source_fourth_tail_coeff5M06 n rest hn hc hl hu (i+1) (k+1) (by omega) (by omega)] at htarget
 simp only [←Nat.add_assoc] at htarget
 nlinarith only [htarget]
end
end MathGKM.Markov
