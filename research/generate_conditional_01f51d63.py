"""Machine-authored conditional raw source transport; missing moment premise is explicit."""
from fourth_probe_01f51d63 import *
data=json.loads((OUT/'fourth-low-probe.json').read_text())
s='\n'.join(f'import MarkovFourthLow{i}01F' for i in range(6))+'''
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
'''
for z,ch in enumerate(data['chambers']):
 p,q=ch['left'];a,b=ch['right'];cn='(frame rest).mid.b';rn='(frame rest).mid.a'
 c=f'({cn}:ℤ)';r=f'({rn}:ℤ)';Q=f'2*{r}-{c}' if 2*ch['samples'][0][1]>ch['samples'][0][0] else '0'
 cc,rr=ch['samples'][0];T=(f'{c}-{r}' if cc-rr<3*rr-cc else f'3*{r}-{c}') if 3*rr>cc else '0';U=f'3*{r}-2*{c}' if 3*rr>2*cc else '0'
 s+=f'''theorem source_fourth_chamber_{z}01F (rest : List Bool)
 (hc : 5≤{cn}) (hl : {p}*{cn}<{q}*{rn}) (hu : {b}*{rn}<{a}*{cn})
 (hM : logFour01F (tr16 (ambientWord5c U V (sourceWord28 (false::rest))))=
   fourthLowMoment{z}01F {cn} {rn}) (i j : ℕ)
 (hs : i+j+2=(frame (false::rest)).mid.a+4) :
 coeff (frame (false::rest)).mid.p i (j+2)*coeff (frame (false::rest)).mid.p (i+2) j≤
 coeff (frame (false::rest)).mid.p (i+1) (j+1)^2 := by
 have hf := source_low_fourth_moment01F rest (by omega) _ hM
 have hq : ((2*{rn}-{cn}:ℕ):ℤ)={Q} := by omega
 have ht : ((min ({cn}-{rn}) (3*{rn}-{cn}):ℕ):ℤ)={T} := by omega
 have hh : ((3*{rn}-2*{cn}:ℕ):ℤ)={U} := by omega
 rw [hq,ht,hh] at hf
 have hf' (k : ℕ) : 24*(cutCoeffA27 (X:ℤ[X]) X 1 (central28 (false::rest)++[true]) 4).coeff k=
   fourthLowSeq{z}01F {cn} {rn} k := by
   have he := congrArg (fun p : ℤ[X] => p.coeff k) hf
   simpa only [Polynomial.coeff_ofNat_mul,fourth_low_coeff_{z}01F] using he
 apply fourth_raw_from_sequence01F (false::rest) _ hf' ?_ i j hs
 intro k
 let x : ℤ := {a}*{c}-{b}*{r}-1
 let y : ℤ := {q}*{r}-{p}*{c}-1
 have hx : 0≤x := by dsimp [x]; omega
 have hy : 0≤y := by dsimp [y]; omega
 have hcc : {q}*(x+1)+{b}*(y+1)={c} := by dsimp [x,y]; ring
 have hrr : {p}*(x+1)+{a}*(y+1)={r} := by dsimp [x,y]; ring
 have hg := fourth_low_lc_{z}01F x y hx hy k
 rwa [hcc,hrr] at hg
'''
s+='end\nend MathGKM.Markov\n'
(ROOT/'research/MarkovFourthConditional01F.lean').write_text(s)
print('Generated explicit conditional source transport.')
