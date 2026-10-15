"""Machine-authored natural pattern-count adapters to six full candidate numerators."""
from pathlib import Path
import json
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fa9eb434'
header='''/-! Machine-authored fa9eb434. Exact chamber/source identity. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
open Polynomial
''';end='end\nend MathGKM.Markov\n'
bounds=[(0,1),(1,4),(1,3),(1,2),(2,3),(3,4),(1,1)]
rows=[['0','0','0','0'],['0','0','0','4*r-c'],['0','3*r-c','0','c-2*r'],['2*r-c','c-r','0','2*r-c'],['2*r-c','c-r','3*r-2*c','c-r'],['2*r-c','c-r','3*r-2*c','c-r']]
nat=['(2*r-c:ℕ)','(min (c-r) (3*r-c):ℕ)','(3*r-2*c:ℕ)']
mods=[]
for ch,((p,q),(s,t)) in enumerate(zip(bounds,bounds[1:])):
 text=f'import MarkovFullSourceFA\nimport MarkovFullChamber{ch}FA\n'+header
 text+=f'''theorem fourthNumerator_chamber{ch}FA {{A : Type*}} [CommRing A]
 (N Z x : A) (c r : ℕ) (hl : {p}*c<{q}*r) (hu : {t}*r<{s}*c) :
 fourthNumeratorBC N Z x c r=chamberNumerator{ch}FA N Z c r x := by
'''
 ns=nat+[ '(min (c-2*r) (4*r-c):ℕ)' if ch<3 else '(2*r-c:ℕ)' if ch==3 else '(c-r:ℕ)']
 vs=rows[ch]
 if ch==5:ns=ns+['(4*r-3*c:ℕ)'];vs=vs+['4*r-3*c']
 for i,(n,v) in enumerate(zip(ns,vs)):
  iv=v.replace('c','(c:ℤ)').replace('r','(r:ℤ)');av=v.replace('c','(c:A)').replace('r','(r:A)')
  text+=f''' have hi{i} : ({n}:ℤ)={iv} := by omega
 have h{i} : ({n}:A)={av} := by
   simpa only [Int.cast_natCast,Int.cast_sub,Int.cast_add,Int.cast_mul,Int.cast_ofNat,
     Int.cast_zero,Int.cast_one] using congrArg (Int.castRingHom A) hi{i}
'''
 corr= '0' if ch==0 else ('(4*(r:A)-(c:A))*x^5' if ch==1 else '((c:A)-2*(r:A))*x^5' if ch==2 else '2*(2*(r:A)-(c:A))*x^6' if ch==3 else '2*((c:A)-(r:A))*x^6' if ch==4 else '2*((c:A)-(r:A))*x^6+(4*(r:A)-3*(c:A))*x^7')
 text+=f' have hc : fourthCountCorrectionFA x c r={corr} := by\n   unfold fourthCountCorrectionFA\n'
 if ch<3:text+='   rw [if_pos (by omega : 2*r≤c),h3]\n'+('   ring\n' if ch==0 else '')
 elif ch==3:text+='   rw [if_neg (by omega : ¬2*r≤c),if_pos (by omega : 3*r≤2*c),h3]\n'
 elif ch==4:text+='   rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_pos (by omega : 4*r≤3*c),h3]\n'
 else:text+='   rw [if_neg (by omega : ¬2*r≤c),if_neg (by omega : ¬3*r≤2*c),if_neg (by omega : ¬4*r≤3*c),h3,h4]\n'
 text+=f''' rw [fourthNumerator_fullFA]
 unfold fullNumeratorFA chamberNumerator{ch}FA
 dsimp only
 rw [h0,h1,h2,hc,chamberH{ch}2FA_eq,chamberH{ch}3FA_eq,chamberH{ch}4FA_eq]
 rfl

theorem source_fourth_chamber{ch}_clearedFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : {p}*(frame rest).mid.b<{q}*(frame rest).mid.a)
 (hu : {t}*(frame rest).mid.a<{s}*(frame rest).mid.b) :
 (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 4)=
 chamberNumerator{ch}FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X := by
 rw [source_fourth_clearedBC n rest hc,fourthNumerator_chamber{ch}FA _ _ _ _ _ hl hu]

theorem source_fourth_chamber{ch}_coeffFA (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b)
 (hl : {p}*(frame rest).mid.b<{q}*(frame rest).mid.a)
 (hu : {t}*(frame rest).mid.a<{s}*(frame rest).mid.b)
 (i j : ℕ) (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :
 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 ∑ k ∈ Finset.range (j+1),
   (chamberNumerator{ch}FA (n:ℤ[X]) (X^n) (frame rest).mid.b (frame rest).mid.a X).coeff k *
   ((7+(j-k)).choose 7 : ℤ) := by
 rw [source_fourth_binomialBC n rest hc i j hs,fourthNumerator_chamber{ch}FA _ _ _ _ _ hl hu]
'''
 module=f'MarkovFullSourceChamber{ch}FA';mods.append(module);(R/f'research/{module}.lean').write_text(text+end)
(O/'source-chamber-modules.json').write_text(json.dumps(mods,indent=2)+'\n')
print(mods)
