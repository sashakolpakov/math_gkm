"""Machine-authored exact gauge normalizations."""
from generate_jets_bc8d3b6f import *
def main():
 jetnames=[f'jet_normalize_{e}{k}BC' for e in range(4) for k in range(5 if e in [1,3] else 4)]
 num_names=[f'jetNum{e}{k}BC' for e in range(4) for k in range(5 if e in [1,3] else 4)]
 used=[('a',1),('a',2),('b',2),('b',3),('c',1),('c',2),('c',3),('d',1),('d',2),('d',3),('d',4)]
 records=[]
 for p,q in product(range(2),repeat=2):
  text=header.replace('import MarkovFourthClosedN6604','\n'.join(f'import MarkovJetNorm{e}BC' for e in range(4)))
  for e,k in used:
   a=z.gauge(p,q,k)['abcd'.index(e)] if k<4 else d4(p,q)
   body,scale,d=rat_expr(a);name=f'gaugeNum{p}{q}{e}{k}BC';bs=' '.join('true' if b else 'false' for b in [p,q])
   records.append(dict(p=p,q=q,e=e,k=k,name=name,scale=scale,d=d,numerator=serialize(a.p)))
   text+=f'\ndef {name} {{A : Type*}} [CommRing A] (N Z x : A) : A :=\n {body}\n'
   old=f'(closedGaugeJetBDEE n {bs} {k}).{e}' if k<4 else f'closedGaugeD4N6604 n {bs}'
   text+=f'''theorem gauge_normalize_{p}{q}{e}{k}BC (n : ℕ) :
 {old}={name} (n:RunFieldBDEE) (runXBDEE^n) runXBDEE /
   ({scale}*(1-runXBDEE)^{d}) := by
 unfold {'closedGaugeJetBDEE' if k<4 else 'closedGaugeD4N6604'}
 simp only [Bool.false_eq_true, if_false, if_true, Nat.add_zero]
 {'unfold closedMatrixJetBDEE gauge75 mm16 shear75 unshear75' if k<4 else ''}
 try dsimp only
 simp only [{','.join(jetnames)}]
 simp only [{','.join(num_names)},{name},runXBDEE]
 try simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx : (1-runEmbedBDEE X)≠0 := one_sub_runX_neBDEE
 field_simp [hx]
 ring
'''
  text+='end\nend MathGKM.Markov\n'
  (R/f'research/MarkovGaugeNorm{p}{q}BC.lean').write_text(text)
 (O/'gauge-normalization-candidates.json').write_text(json.dumps(records,indent=2)+'\n')
if __name__=='__main__':main()
