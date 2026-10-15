"""Machine-authored Lean candidates from exact symbolic small-cycle numerators."""
from small_cycle_cfcbaf30 import *
head='''/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false
'''
end='end\nend MathGKM.Markov\n'
def grouped(p):
 d={}
 for (a,b,k),v in p.items():d.setdefault((b,k),P())[(a,0,0)]=v
 return d
def generate(c,r):
 p=numerator(c,r);tag=f'{c}{r}MCFC';m=f'MarkovSmallNumerator{tag}'
 base=f'smallNumerator{tag}';terms=grouped(p)
 s='import MarkovCorrectedNumeratorM0A5\nimport MarkovConvK0B\n'+head
 for (b,k),v in sorted(terms.items()):
  s+=f'\ndef smallTerm{c}{r}_{b}_{k}MCFC {{A : Type*}} [CommRing A] (N : A) : A := {horner(v)}\n'
 tn=lambda b,k:f'smallTerm{c}{r}_{b}_{k}MCFC'
 s+=f'\ndef {base} {{A : Type*}} [CommRing A] (N Z x : A) : A :=\n '+' + '.join(f'{tn(b,k)} N*Z^{b}*x^{k}' for b,k in sorted(terms))+'\n'
 f=f'firstNumBC N Z {c} {r} {max(2*r-c,0)} x';ss=f'secondNumBC N Z {c} {r} {max(2*r-c,0)} x'
 corr=f'12*(Z^{c}*x^{c+r})*(1-x)^4*(2*({f})^2+4*({f})*(1+x)*(1-x)^2+6*(1+x)^2*(1-x)^4-({ss}))' if c==2 else f'-24*(Z^{c}*x^{c+r})*(1-x)^6*({f}+2*(1+x)*(1-x)^2)' if c==3 else f'24*(Z^{c}*x^{c+r})*(1-x)^8'
 defs=['fullH0FA','fullH1FA','fullH2FA','fullH3FA','fullH4FA']+[f'runH0n{k}FA' for k in range(5)]+[f'runH1n{k}FA' for k in range(4)]
 s+=f'\ntheorem small_numerator_identity{tag} {{A : Type*}} [CommRing A] (N Z x : A) :\n fourthNumeratorBC N Z x {c} {r}+({corr})={base} N Z x := by\n rw [fourthNumerator_fullFA]\n unfold fullNumeratorFA fourthCountCorrectionFA\n norm_num only [show (2*{r}-{c}:ℕ)={max(2*r-c,0)} by decide,show (min ({c}-{r}) (3*{r}-{c}):ℕ)={min(c-r,max(3*r-c,0))} by decide,show (3*{r}-2*{c}:ℕ)={max(3*r-2*c,0)} by decide]\n norm_num [firstNumBC,secondNumBC,'+','.join(defs+[base]+[tn(b,k) for b,k in sorted(terms)])+']\n <;> ring\n'
 s+=f'\ntheorem source_small_numerator{tag} (n : ℕ) (rest : List Bool)\n (hc : (frame rest).mid.b={c}) (hr : (frame rest).mid.a={r}) :\n (1-X)^8*(24*cutCoeffA27 (X:ℤ[X]) X 1\n   (central28 (List.replicate n true++false::rest)++[true]) 4)=\n {base} (n:ℤ[X]) (X^n) X := by\n rw [source_corrected_numeratorM0A5,hc,hr]\n unfold correctedFourthNumeratorM0A5 cycleNumeratorCorrectionM0A5\n norm_num only\n have hp : (X:ℤ[X])^({c}*(n+1)+{r})=(X^n)^{c}*X^{c+r} := by\n  rw [←pow_mul,←pow_add]\n  congr 1\n  omega\n rw [hp]\n exact small_numerator_identity{tag} _ _ _\n'
 s+=f'\ndef smallValue{tag} (n j : ℕ) : ℤ :=\n '+' + '.join(f'{tn(b,k)} (n:ℤ)*chooseShiftSevenK0B j ({b}*n+{k})' for b,k in sorted(terms))+'\n'
 s+=f'\ntheorem small_numerator_expand{tag} (n : ℕ) :\n {base} (n:ℤ[X]) (X^n) X=\n '+' + '.join(f'C ({tn(b,k)} (n:ℤ))*X^({b}*n+{k})' for b,k in sorted(terms))+' := by\n unfold '+base+' '+' '.join(tn(b,k) for b,k in sorted(terms))+'\n simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_natCast,pow_add,pow_mul]\n ring\n'
 s+=f'\ntheorem source_small_value{tag} (n : ℕ) (rest : List Bool)\n (hc : (frame rest).mid.b={c}) (hr : (frame rest).mid.a={r}) (i j : ℕ)\n (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4) :\n 24*coeff (frame (List.replicate n true++false::rest)).mid.p i j=smallValue{tag} n j := by\n have h := coeff_of_one_sub_mul_rangeBC _ _ 7 j (source_small_numerator{tag} n rest hc hr)\n simp only [Polynomial.coeff_ofNat_mul,source_cut_coeffA27 _ i j 4 hs] at h\n change _=convSevenK0B ({base} (n:ℤ[X]) (X^n) X) j at h\n rw [small_numerator_expand{tag}] at h\n simpa only [convSeven_addK0B,convSeven_monomialK0B,smallValue{tag},source_cut_coeffA27 _ i j 4 hs] using h\n'
 (R/f'research/{m}.lean').write_text(s+end)
 return m
if __name__=='__main__':
 import sys
 print(generate(int(sys.argv[1]),int(sys.argv[2])))
