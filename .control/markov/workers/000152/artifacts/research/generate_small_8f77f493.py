"""Machine-authored candidate rational identities. Lean, not Python, proves them."""
from poly_probe_0d346fa7 import *
from generate_four_cert_0d346fa7 import expr
_inherited_U=U
def U(n,d,i):
 # The inherited generator was used only for i>=2. Its negative-upper skip
 # does not model truncated Nat subtraction at i=1,h=1, where choose(0,0)=1.
 return scale(d,4) if i==1 else _inherited_U(n,d,i)
def main():
 specs=[
 ('upper',gap(U(add(X,one),add(Y,const(3)),1),U(add(X,const(2)),add(Y,const(2)),2),U(add(X,const(3)),add(Y,one),3)),
  'upperPolynomialM0D3 2 (x+2) (y+2)^2 - upperPolynomialM0D3 1 (x+1) (y+3)*upperPolynomialM0D3 3 (x+3) (y+1)',True),
 ('cross0',gap(U(add(X,one),const(2),1),U(add(X,const(2)),one,2),L(add(X,const(3)),{},3)),
  'upperPolynomialM0D3 2 (x+2) 1^2 - upperPolynomialM0D3 1 (x+1) 2*lowerPolynomialM0D3 3 (x+3) 0',False),
 ('cross1',gap(U(add(X,one),one,1),L(add(X,const(2)),{},2),L(add(X,one),one,3)),
  'lowerPolynomialM0D3 2 (x+2) 0^2 - upperPolynomialM0D3 1 (x+1) 1*lowerPolynomialM0D3 3 (x+1) 1',False)]
 s='''import MarkovVerticalPolyM0D3
/-! Machine-authored 8f77f493. Raw small-column diagonal certificates. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 5000000
'''
 out={}
 for name,p,lhs,two in specs:
  out[name]={'terms':len(p),'negative_terms':[[*k,str(v)] for k,v in p.items() if v<0]}
  assert not out[name]['negative_terms'],out[name]
  args='(x y : ℚ)' if two else '(x : ℚ)';app='x y' if two else 'x'
  s+=f'\ndef smallGap{name}M8F7 {args} : ℚ := {expr(p)}\n'
  s+=f'\ntheorem small_gap_{name}M8F7 {args} :\n {lhs}=smallGap{name}M8F7 {app} := by\n'
  s+=f''' unfold smallGap{name}M8F7
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring
'''
  s+=f'\ntheorem small_gap_{name}_nonnegM8F7 {args} (hx : 0 ≤ x)'+(' (hy : 0 ≤ y)' if two else '')+f' :\n 0 ≤ {lhs} := by\n rw [small_gap_{name}M8F7]\n unfold smallGap{name}M8F7\n positivity\n'
 s+='\nend\nend MathGKM.Markov\n'
 Path('research/MarkovSmallCertificateM8F7.lean').write_text(s)
 Path('evidence/markov-8f77f493/small-certificate-generation.json').write_text(json.dumps(out,indent=2)+'\n')
 print(json.dumps(out))
if __name__=='__main__':main()
