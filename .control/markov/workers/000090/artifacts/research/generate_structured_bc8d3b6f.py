"""Machine-authored unexpanded polynomial normalization, avoiding large denominators."""
from generate_jets_bc8d3b6f import *
def main():
 gauges=json.loads((O/'gauge-normalization-candidates.json').read_text())
 text=header.replace('import MarkovFourthClosedN6604','\n'.join(f'import MarkovGaugeNorm{p}{q}BC' for p,q in product(range(2),repeat=2)))
 for row in gauges[:11]:
  e,k,d,sc=[row[t] for t in ['e','k','d','scale']];nm=f'gauge{e}{k}BC'
  text+=f'\ndef {nm} {{A : Type*}} [CommRing A] (N Z x : A) (p q : Bool) : A :=\n match p,q with\n'
  for p,q in product(range(2),repeat=2):
   bs=','.join('true' if a else 'false' for a in [p,q]);text+=f' | {bs} => gaugeNum{p}{q}{e}{k}BC N Z x\n'
  old=f'(closedGaugeJetBDEE n p q {k}).{e}' if k<4 else 'closedGaugeD4N6604 n p q'
  text+=f'''theorem gauge{e}{k}_normalizeBC (n : ℕ) (p q : Bool) :
 {old}={nm} (n:RunFieldBDEE) (runXBDEE^n) runXBDEE p q/({sc}*(1-runXBDEE)^{d}) := by
 cases p <;> cases q
'''
  for p,q in product(range(2),repeat=2):text+=f' · exact gauge_normalize_{p}{q}{e}{k}BC n\n'
  defs=','.join(f'gaugeNum{p}{q}{e}{k}BC' for p,q in product(range(2),repeat=2))
  text+=f'''theorem {nm}_map {{A B : Type*}} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) (p q : Bool) :
 g ({nm} N Z x p q)={nm} (g N) (g Z) (g x) p q := by
 cases p <;> cases q <;>
 simp only [{nm},{defs},map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,map_zero]
'''
 text+='''
theorem gaugeb1_normalizeBC (n : ℕ) (p q : Bool) :
 (closedGaugeJetBDEE n p q 1).b=1 := by
 unfold closedGaugeJetBDEE closedMatrixJetBDEE gauge75 mm16 shear75 unshear75
 dsimp only
 rw [jet_normalize_11BC]
 simp [jetNum11BC]

def localThirdNumBC {A : Type*} [CommRing A] (N Z x : A) (p q r : Bool) : A :=
 let D := 1-x
 let d := gauged1BC N Z x p q
 let c := gaugec1BC N Z x p q
 2*d^3-3*d*gauged2BC N Z x p q+gauged3BC N Z x p q+
 6*D*c*gaugeb2BC N Z x q r+6*D*gaugec2BC N Z x p q-
 6*D*c*(d+gauged1BC N Z x q r)+6*D^3*c*gaugea1BC N Z x q r

def localFourNumBC {A : Type*} [CommRing A] (N Z x : A) (p q r s : Bool) : A :=
 let D := 1-x
 let d := gauged1BC N Z x p q
 let c := gaugec1BC N Z x p q
 let v₂ := gaugeb2BC N Z x q r+D^2*gaugea1BC N Z x q r-gauged1BC N Z x q r
 let v₃ := gaugeb3BC N Z x q r+
   2*gaugea1BC N Z x q r*D^2*(gaugeb2BC N Z x r s+D^2*gaugea1BC N Z x r s-gauged1BC N Z x r s)+
   2*D*gaugea2BC N Z x q r-
   2*(gaugeb2BC N Z x q r+D^2*gaugea1BC N Z x q r)*gauged1BC N Z x q r+
   2*(gauged1BC N Z x q r)^2-gauged2BC N Z x q r-2*D*gaugec1BC N Z x q r
 let g₂ := gauged2BC N Z x p q+2*D*c
 let g₃ := gauged3BC N Z x p q+6*D*c*v₂+6*D*gaugec2BC N Z x p q
 let g₄ := gauged4BC N Z x p q+12*D*c*v₃+24*D*gaugec2BC N Z x p q*v₂+4*D*gaugec3BC N Z x p q
 g₄-4*d*g₃-3*g₂^2+12*d^2*g₂-6*d^4
'''
 normnames=','.join(f'gauge{r["e"]}{r["k"]}_normalizeBC' for r in gauges[:11])+',gaugeb1_normalizeBC'
 maps=','.join(f'gauge{r["e"]}{r["k"]}BC_map' for r in gauges[:11])
 for kind,ln,power,orig in [('Third',3,6,'closedLocalBDEE'),('Four',4,8,'closedLocalFourN6604')]:
  args='p q r' if ln==3 else 'p q r s'
  text+=f'''theorem local{kind}_normalizeBC (n : ℕ) ({args} : Bool) :
 (1-runXBDEE)^{power}*{orig} n {args}=
 local{kind}NumBC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE {args} := by
 unfold {orig} local{kind}NumBC
 dsimp only
 simp only [{normnames}]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring

theorem local{kind}Num_mapBC {{A B : Type*}} [CommRing A] [CommRing B]
 (g : A →+* B) (N Z x : A) ({args} : Bool) :
 g (local{kind}NumBC N Z x {args})=local{kind}NumBC (g N) (g Z) (g x) {args} := by
 simp only [local{kind}NumBC,map_add,map_sub,map_mul,map_pow,map_ofNat,map_neg,map_one,{maps}]
'''
 text+='end\nend MathGKM.Markov\n'
 (R/'research/MarkovLocalStructuredBC.lean').write_text(text)
 # Preserve the expanded assembly draft; use the structured local polynomial instead.
 old=(R/'research/MarkovFourthBinomialBC.lean').read_text()
 (O/'expanded-composite-draft.lean').write_text(old)
 new=header.replace('import MarkovFourthClosedN6604','\n'.join('import '+x for x in ['MarkovLocalStructuredBC','MarkovFirstNormBC','MarkovSecondNormBC','MarkovMomentScaleBC','MarkovBinomialExtractBC']))
 new+=old[old.index('\ndef fourthNumeratorBC'):]
 (R/'research/MarkovFourthBinomialBC.lean').write_text(new)
if __name__=='__main__':main()
