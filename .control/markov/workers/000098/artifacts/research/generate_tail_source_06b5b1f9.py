"""Machine-authored exact source adapters for stable tail certificates."""
from pathlib import Path
import json,re
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-06b5b1f9'
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
mods=[]
for ch,((p,q),(s,t)) in enumerate(zip(bounds,bounds[1:])):
 old=(R/f'research/MarkovFullSourceChamber{ch}M06.lean').read_text()
 arithmetic=old[old.index(' have hi0'):old.index(' rw [fourthNumerator_fullFA]')]
 # Save the natural-count algebra as a top coefficient adapter.
 txt=f'''import MarkovTailChamber{ch}M06
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
theorem tail_top_source_split{ch}M06 {{A : Type*}} [CommRing A]
 (N x : A) (c r : ℕ) (hl : {p}*c<{q}*r) (hu : {t}*r<{s}*c) :
 fullH4FA N c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) x+
 96*(1-x)^8*fourthCountCorrectionFA x c r=
 (1-x)^8*tailPoly{ch}M06 (c:A) r x+tailRem{ch}M06 (c:A) r x := by
'''+arithmetic+f''' rw [h0,h1,h2,hc]
 have ht := tail_top_split{ch}M06 N (c:A) (r:A) x
 convert ht using 1 <;> congr 2 <;> ring

attribute [local irreducible] tailPoly{ch}M06 tailRem{ch}M06 coeff frame
theorem source_fourth_tail_coeff{ch}M06 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hl : {p}*(frame rest).mid.b<{q}*(frame rest).mid.a)
 (hu : {t}*(frame rest).mid.a<{s}*(frame rest).mid.b)
 (i k : ℕ) (hk : k≤7)
 (hs : i+(4*n+k)=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k)=
 tailSeq{ch}M06 (frame rest).mid.b (frame rest).mid.a k := by
 have he := source_fourth_tail_of_splitM06 n rest hn hc
   (tailPoly{ch}M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tailRem{ch}M06 ((frame rest).mid.b:ℤ[X]) (frame rest).mid.a X)
   (tail_top_source_split{ch}M06 (n:ℤ[X]) X _ _ hl hu)
   (tail_remainder_degree{ch}M06 _ _) i k hs
 have ht := tail_poly_coeff{ch}M06 ((frame rest).mid.b:ℤ) ((frame rest).mid.a:ℤ) k hk
 simpa only [Int.cast_natCast] using he.trans (by simpa only [Int.cast_natCast] using ht)

theorem source_fourth_tail_chamber{ch}M06 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b)
 (hl : {p}*(frame rest).mid.b<{q}*(frame rest).mid.a)
 (hu : {t}*(frame rest).mid.a<{s}*(frame rest).mid.b)
 (i k : ℕ) (hk : k≤5)
 (hs : i+(4*n+k)+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (4*n+k+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) (4*n+k)≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (4*n+k+1)^2 := by
 let x : ℤ := {s}*((frame rest).mid.b:ℤ)-{t}*((frame rest).mid.a:ℤ)-1
 let y : ℤ := {q}*((frame rest).mid.a:ℤ)-{p}*((frame rest).mid.b:ℤ)-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : {q+t}+{t}*y+{q}*x=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr : {p+s}+{s}*y+{p}*x=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 have h := tail_seq_lc{ch}M06 x y hx hy k hk
 have hcc' : {q}*(x+1)+{t}*(y+1)=((frame rest).mid.b:ℤ) := by dsimp [x,y]; ring
 have hrr' : {p}*(x+1)+{s}*(y+1)=((frame rest).mid.a:ℤ) := by dsimp [x,y]; ring
 try simp only [zero_mul,zero_add,add_zero,one_mul] at h hcc hrr
 rw [hcc,hrr] at h
 have htarget := h
 rw [←source_fourth_tail_coeff{ch}M06 n rest hn hc hl hu (i+2) k (by omega) (by omega),
   ←source_fourth_tail_coeff{ch}M06 n rest hn hc hl hu i (k+2) (by omega) (by omega),
   ←source_fourth_tail_coeff{ch}M06 n rest hn hc hl hu (i+1) (k+1) (by omega) (by omega)] at htarget
 simp only [←Nat.add_assoc] at htarget
 nlinarith only [htarget]
end
end MathGKM.Markov
'''
 mod=f'MarkovTailSource{ch}M06';mods.append(mod);(R/f'research/{mod}.lean').write_text(txt)
(O/'tail-source-modules.json').write_text(json.dumps(mods))
