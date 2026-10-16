"""Machine-authored generator. All generated identities require Lean checking."""
from pathlib import Path
import json
data=json.loads(Path('evidence/markov-2b34268b/scalar-regions-v2.json').read_text())
s='''import MathGKM.Markov
/-! Machine-authored 2b34268b. Nonnegative upper-core scalar certificates.
These signs alone do not assert the global summand inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 5000000
set_option maxRecDepth 10000
set_option linter.unusedSimpArgs false
def upperHN M2B3_PLACEHOLDER := 0
'''.replace('def upperHN M2B3_PLACEHOLDER := 0','''def upperHNumM2B3 (N i h : ℤ) : ℤ := (N+i-h+1)*(N-i+2)*(2*i-1-h)
def upperHDenM2B3 (i h : ℤ) : ℤ := (i-h+1)*(i-1)*(2*i+1-h)
def upperDNumM2B3 (N i h : ℤ) : ℤ := (N-i+2)*(2*i-1-h)*(2*N+2-h)
def upperDDenM2B3 (N i h : ℤ) : ℤ := (i-1)*(2*i-h)*(2*N+3-h)
def upperHGapM2B3 (N i h k : ℤ) : ℤ :=
 upperHNumM2B3 N i h*upperHDenM2B3 (i+1) k-upperHNumM2B3 N (i+1) k*upperHDenM2B3 i h
def upperDGapM2B3 (N i h k : ℤ) : ℤ :=
 upperDNumM2B3 N i h*upperDDenM2B3 N (i+1) k-upperDNumM2B3 N (i+1) k*upperDDenM2B3 N i h
def upperLGapM2B3 (N i h : ℤ) : ℤ :=
 upperHNumM2B3 N i h*upperHDenM2B3 (i+1) (h+1)-upperHNumM2B3 N (i+1) (h+1)*upperHDenM2B3 i h''')
defs='upperHNumM2B3,upperHDenM2B3,upperDNumM2B3,upperDDenM2B3,upperHGapM2B3,upperDGapM2B3,upperLGapM2B3'
regions=[('k+2','p','r'),('1','p+1','r'),('1','0','r+1'),('0','p+2','r'),('0','1','r+1'),('0','0','r+2')]
for key,v in data.items():
 assert v['positive']
 idx=int(key[-1]);kind=key[:-1]
 if kind=='local':
  a,c=[('k+2','r'),('1','r+1'),('0','r+2')][idx]
  expr=f'upperLGapM2B3 (({a})+({c})+t) (({a})+({c})) ({a})'
 else:
  a,b,c=regions[idx];name='upperHGapM2B3' if kind=='horizontal' else 'upperDGapM2B3'
  last=f'(({a})+({b})) ({a})' if kind=='horizontal' else f'({a}) (({a})+({b})+1)'
  expr=f'{name} (({a})+({b})+({c})+t) (({a})+({b})+({c})) {last}'
 s+=f'''\ntheorem upper_{key}M2B3 (k p r t : ℤ)
 (hk : 0 ≤ k) (hp : 0 ≤ p) (hr : 0 ≤ r) (ht : 0 ≤ t) :
 0 ≤ {expr} := by
 have he : {expr}={v['lean']} := by
   simp only [{defs}]
   ring
 rw [he]
 positivity
'''
s+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovUpperScalarM2B3.lean').write_text(s)
