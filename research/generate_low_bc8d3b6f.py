"""Machine-authored constant-Z numerator candidate from preserved experimental data."""
from generate_bc8d3b6f import *
def main():
 data=json.loads((R/'evidence/markov-6604cff8/fourth-rational-normalization.json').read_text())['rows']
 assert all(d['low_numerator']==data[0]['low_numerator'] for d in data)
 p=z.P({tuple(k):F(v) for k,v in data[0]['low_numerator']})
 body=expr(p,['N','Z','C','R','Q','T','U','x'])
 gauges=json.loads((O/'gauge-normalization-candidates.json').read_text())
 defs=['firstNumBC','secondNumBC','boolMomentADB2','boolJetADB2','fourTripleBE','fourQuadBE','fourCanonicalBE','fourPotentialBE','localThirdNumBC','localFourNumBC']
 defs += [f'gauge{r["e"]}{r["k"]}BC' for r in gauges[:11]]+[r['name'] for r in gauges]
 text=header.replace('import MarkovFourthClosedN6604','import MarkovFourthBinomialBC')
 text+=f'\ndef lowFourthNumBC {{A : Type*}} [CommRing A] (N C R x : A) : A :=\n {body}\n'
 text+=f'''theorem fourthNumerator_zeroBC {{A : Type*}} [CommRing A] (N x : A) (c r : ℕ) :
 fourthNumeratorBC N 0 x c r=lowFourthNumBC N c r x := by
 unfold fourthNumeratorBC fourMomentBE fourSourceMoment897
 dsimp only
 split_ifs <;>
 simp only [{','.join(defs)},lowFourthNumBC,zero_pow,pow_zero,mul_zero,zero_mul,add_zero,zero_add,sub_zero] <;>
 ring
end
end MathGKM.Markov
'''
 (R/'research/MarkovFourthLowBC.lean').write_text(text)
if __name__=='__main__':main()
