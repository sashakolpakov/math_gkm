"""Machine-authored source-statistic and raw-coefficient assembly candidates."""
from pathlib import Path
head='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 16000
set_option linter.unusedSimpArgs false
attribute [local irreducible] frame coeff
'''
a='(frame path).mid.a';b='(frame path).mid.b'
stats=[f'(2*{a}-{b}:ℕ)',f'(min ({b}-{a}) (3*{a}-{b}):ℕ)',f'(3*{a}-2*{b}:ℕ)',f'(h4vM511 {a} {b})',f'(h4wM511 {a} {b})',f'(h4zM511 {a} {b})']
def fall(x,n):return '*'.join(f'({x}-{j})' if j else f'({x})' for j in range(n)) or '1'
src='import MarkovHighSourceM81F\nimport MarkovHighScalingM81F\n'+head
for row,d in [(2,3),(3,5),(4,7)]:
 shift=row-2;num=[2,6,24][row-2];name=['highJM81F','highHM81F','highIM81F'][row-2]
 argstats=stats[:[1,3,6][row-2]]
 scale=''.join(f'*(k+{s})' for s in range(1,shift+1));lc=''.join('*l' if s==0 else f'*(l-{s})' for s in range(shift))
 src+=f'''theorem source_high{row}_scaledM81F (path : List Bool) (k l : ℕ)
 (ha : 3 ≤ {a}) (hb : 9 ≤ {b}) (hbl : {b}=k+l+2) (hl : 2 ≤ l) :
 {num}*{fall('(k:ℝ)+l',d)}{scale}*(coeff (frame path).mid.p ({a}-1+k) {row}:ℝ)=
 ((k+l).choose k:ℝ){lc}*{name} {a} k l {' '.join(argstats)} := by
 have hc := high_{['second','third','fourth'][row-2]}_coeffM81F path {('(by omega) ' if row>=3 else '')}(by omega) k
'''
 if row==4:src+=' unfold h4sourceSeedM511 at hc\n'
 src+=f''' rw [hbl,show k+l+2-{d+2}=k+l-{d} by omega] at hc
 push_cast only [Nat.cast_add,Nat.cast_ofNat] at hc
 have h := high_seed{row}_scaledM81F k l hl (by omega) {a} {' '.join(argstats)}
 rw [hbl] at h
 rw [←hc] at h
 rw [hbl]
 linear_combination h
'''
src+='end\nend MathGKM.Markov\n'
Path('research/MarkovHighCoefficientsM81F.lean').write_text(src)
src='\n'.join(f'import MarkovHighCone{c}GapM81F' for c in range(3))+'\n'+head
src+='''theorem high_source_gapM81F (a b k l : ℕ) (hab : a ≤ b) (hs : b ≤ 2*a)
 (hbl : b=k+l+2) (hl : 2 ≤ l) (hN : 7 ≤ k+l) :
 0 ≤ highGapM81F a k l (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ)
   (h4vM511 a b) (h4wM511 a b) (h4zM511 a b) := by
 have ht : min (b-a) (3*a-b)=b-a := by omega
 have hv : h4vM511 a b=0 := by unfold h4vM511; split_ifs <;> omega
 rw [ht,hv]
 by_cases h0 : 3*a ≤ 2*b
 · have hu : 3*a-2*b=0 := by omega
   have hw : h4wM511 a b=2*a-b := by unfold h4wM511; split_ifs <;> omega
   have hz : h4zM511 a b=0 := by unfold h4zM511; omega
   rw [hu,hw,hz]
   have h := high_cone0_nonnegM81F k l (2*a-b:ℕ) hl hN (by positivity)
   unfold highCone0M81F at h
   have he : ((k:ℝ)+l+2+(2*a-b:ℕ))/2=a := by
     rw [Nat.cast_sub hs]
     push_cast
     have hbR : (b:ℝ)=k+l+2 := by exact_mod_cast hbl
     linarith
   rw [he] at h
   have htR : ((b-a:ℕ):ℝ)=(k:ℝ)+l+2-a := by
     rw [Nat.cast_sub hab,hbl]; push_cast; ring
   simpa only [htR,Nat.cast_zero] using h
 have hw : h4wM511 a b=b-a := by unfold h4wM511; split_ifs <;> omega
 have hu : 2*b ≤ 3*a := by omega
 rw [hw]
 by_cases h1 : 4*a ≤ 3*b
 · have hz : h4zM511 a b=0 := by unfold h4zM511; omega
   rw [hz]
   have h := high_cone1_nonnegM81F k l (3*a-2*b:ℕ) hl hN (by positivity)
   unfold highCone1M81F at h
   have he : (2*((k:ℝ)+l+2)+(3*a-2*b:ℕ))/3=a := by
     rw [Nat.cast_sub hu]
     push_cast
     have hbR : (b:ℝ)=k+l+2 := by exact_mod_cast hbl
     linarith
   rw [he] at h
   have hqR : ((2*a-b:ℕ):ℝ)=2*a-((k:ℝ)+l+2) := by
     rw [Nat.cast_sub hs,hbl]; push_cast; ring
   have htR : ((b-a:ℕ):ℝ)=(k:ℝ)+l+2-a := by
     rw [Nat.cast_sub hab,hbl]; push_cast; ring
   simpa only [hqR,htR,Nat.cast_zero] using h
 · have hz : 3*b ≤ 4*a := by omega
   have h := high_cone2_nonnegM81F k l (4*a-3*b:ℕ) hl hN (by positivity)
   unfold highCone2M81F at h
   have he : (3*((k:ℝ)+l+2)+(4*a-3*b:ℕ))/4=a := by
     rw [Nat.cast_sub hz]
     push_cast
     have hbR : (b:ℝ)=k+l+2 := by exact_mod_cast hbl
     linarith
   rw [he] at h
   have hqR : ((2*a-b:ℕ):ℝ)=2*a-((k:ℝ)+l+2) := by
     rw [Nat.cast_sub hs,hbl]; push_cast; ring
   have htR : ((b-a:ℕ):ℝ)=(k:ℝ)+l+2-a := by
     rw [Nat.cast_sub hab,hbl]; push_cast; ring
   have huR : ((3*a-2*b:ℕ):ℝ)=3*a-2*((k:ℝ)+l+2) := by
     rw [Nat.cast_sub hu,hbl]; push_cast; ring
   simpa only [hqR,htR,huR,h4zM511,Nat.cast_zero] using h
end
end MathGKM.Markov
'''
Path('research/MarkovHighGapM81F.lean').write_text(src)
print('Generated source coefficient and statistic adapters')
