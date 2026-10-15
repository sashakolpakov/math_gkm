"""Machine-authored compact local normalizations using proved gauge entries."""
from generate_jets_bc8d3b6f import *
def main():
 gauges=json.loads((O/'gauge-normalization-candidates.json').read_text())
 for bits in product((0,1),repeat=4):
  key=''.join(map(str,bits));ans=local4(*bits)
  body,scale,d=rat_expr(ans);assert scale==1 and d==8
  text=header.replace('import MarkovFourthClosedN6604','\n'.join(f'import MarkovGaugeNorm{p}{q}BC' for p,q in product(range(2),repeat=2)))
  text+=f'\ndef localFourNum{key}BC {{A : Type*}} [CommRing A] (N Z x : A) : A :=\n {body}\n'
  bs=' '.join('true' if b else 'false' for b in bits)
  needed=[r for r in gauges if (r['p'],r['q']) in list(zip(bits,bits[1:]))]
  text+=f'''theorem localFour_normalize_{key}BC (n : ℕ) :
 (1-runXBDEE)^8*closedLocalFourN6604 n {bs}=
 localFourNum{key}BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalFourN6604
 dsimp only
 simp only [{','.join('gauge_normalize_'+r['name'][8:] for r in needed)}]
 simp only [{','.join(r['name'] for r in needed)},localFourNum{key}BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
'''
  (R/f'research/MarkovFourthNorm{key}BC.lean').write_text(text)
if __name__=='__main__':main()
