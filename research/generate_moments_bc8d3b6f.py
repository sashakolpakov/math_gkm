"""Machine-authored exact first, second and third local normalizations."""
from generate_jets_bc8d3b6f import *
def main():
 h0=z.jet(3,1)+z.jet(2,0);h1=z.jet(3,1,1)+z.jet(2,0,1)
 k0=z.jet(3,2)+z.jet(2,1);k1=z.jet(3,2,1)+z.jet(2,1,1)
 C=z.C;RR=z.Rr;Q=z.Q;b=z.jet(2,0);d=Rat(2*Z*X)
 f=h0*(C-RR)+h1*RR-(1+X)
 sec=2*(k0*(C-RR)+k1*RR)+(h0*(C-RR)+h1*RR)**2-(h0**2*(C-RR)+h1**2*RR)+2*((b*C+d*RR)*(X-1)+(b**2*C+2*b*d*RR+d**2*Q)*X)-2*(h0*(C-RR)+h1*RR-1-X)*(1+X)
 for key,ans,orig,power in [('First',f,'closedFirstBDEE',2),('Second',sec,'closedSecondBDEE',4)]:
  body,scale,dp=rat_expr(ans);assert scale==1 and dp==power
  text=header.replace('import MarkovFourthClosedN6604','\n'.join(f'import MarkovJetNorm{e}BC' for e in range(4)))
  text+=f'\ndef {key.lower()}NumBC {{A : Type*}} [CommRing A] (N Z C R Q x : A) : A :=\n {body}\n'
  text+=f'''theorem {key.lower()}_normalizeBC (n c r : ℕ) (hc : 5≤c) :
 (1-runXBDEE)^{power}*{orig} n c r=
 {key.lower()}NumBC (n:RunFieldBDEE) (runXBDEE^n) c r (2*r-c:ℕ) runXBDEE := by
 unfold {orig} closedHBDEE {'closedKBDEE' if key=='Second' else ''}
 {'rw [if_neg (by omega : ¬c=2)]' if key=='Second' else ''}
 simp only [{','.join(f'jet_normalize_{e}{k}BC' for e in range(4) for k in range(4))}]
 simp only [{','.join(f'jetNum{e}{k}BC' for e in range(4) for k in range(4))},{key.lower()}NumBC]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
'''
  (R/f'research/Markov{key}NormBC.lean').write_text(text)
 gauges=json.loads((O/'gauge-normalization-candidates.json').read_text())
 for bits in product((0,1),repeat=3):
  key=''.join(map(str,bits));ans=z.local(*bits)
  body,scale,d=rat_expr(ans);assert scale==1 and d==6
  text=header.replace('import MarkovFourthClosedN6604','\n'.join(f'import MarkovGaugeNorm{p}{q}BC' for p,q in product(range(2),repeat=2)))
  text+=f'\ndef localThirdNum{key}BC {{A : Type*}} [CommRing A] (N Z x : A) : A :=\n {body}\n'
  bs=' '.join('true' if b else 'false' for b in bits)
  needed=[r for r in gauges if (r['p'],r['q']) in list(zip(bits,bits[1:])) and r['k']<4]
  text+=f'''theorem localThird_normalize_{key}BC (n : ℕ) :
 (1-runXBDEE)^6*closedLocalBDEE n {bs}=
 localThirdNum{key}BC (n:RunFieldBDEE) (runXBDEE^n) runXBDEE := by
 unfold closedLocalBDEE
 dsimp only
 simp only [{','.join('gauge_normalize_'+r['name'][8:] for r in needed)}]
 simp only [{','.join(r['name'] for r in needed)},localThirdNum{key}BC]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
'''
  (R/f'research/MarkovThirdNorm{key}BC.lean').write_text(text)
 (O/'first-second-normalization-candidates.json').write_text(json.dumps(dict(first=serialize(f.p),second=serialize(sec.p)),indent=2)+'\n')
if __name__=='__main__':main()
