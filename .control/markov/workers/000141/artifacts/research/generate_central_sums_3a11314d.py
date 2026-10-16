"""Machine-authored exact polynomial antidifferences; generated identities checked by Lean ring."""
from fractions import Fraction as F
from math import comb
from pathlib import Path
class P(dict):
 def __add__(a,b):
  if not isinstance(b,P):b=P({(0,0):F(b)})
  d=P(a)
  for k,v in b.items():d[k]=d.get(k,0)+v
  return P({k:v for k,v in d.items() if v})
 __radd__=__add__
 def __neg__(a):return P({k:-v for k,v in a.items()})
 def __sub__(a,b):return a+-b
 def __rsub__(a,b):return -a+b
 def __mul__(a,b):
  if not isinstance(b,P):b=P({(0,0):F(b)})
  d=P()
  for (i,j),v in a.items():
   for (k,l),w in b.items():d[(i+k,j+l)]=d.get((i+k,j+l),0)+v*w
  return P({k:v for k,v in d.items() if v})
 __rmul__=__mul__
 def __pow__(a,n):
  d=P({(0,0):F(1)})
  for _ in range(n):d=d*a
  return d
 def shift(a):
  d=P()
  for (i,j),v in a.items():
   for k in range(j+1):d=d+P({(i,k):v*comb(j,k)})
  return d
 def text(a):
  s=[]
  for (i,j),v in sorted(a.items()):
   assert v.denominator==1
   term=str(v.numerator)
   if i:term+='*N'+(f'^{i}' if i>1 else '')
   if j:term+='*t'+(f'^{j}' if j>1 else '')
   s.append(term)
  return ' + '.join(s).replace('+ -','- ')
N=P({(1,0):F(1)});t=P({(0,1):F(1)})
s2=(t+1)*(N-t)
s3=(N-t-1)*(t+1)*(t+2)*(N-t)+(t+1)*t*(N-t)*(N-t+1)
s4=(t+1)*t*(t-1)*(N-t)*(N-t+1)*(N-t+2)+(N-t)*(N-t-1)*(N-t-2)*(t+1)*(t+2)*(t+3)+3*(N-t-1)*(t+1)*(t+2)*t*(N-t)*(N-t+1)
out='import MathGKM.Markov\n/-! Machine-authored 3a11314d. Exact polynomial telescoping, no fitted identities. -/\nnamespace MathGKM.Markov\nnoncomputable section\nset_option maxHeartbeats 3000000\n'
for i,s,scale,rhs in [(2,s2,6,'(n+1)*(n+2)*(n+3)'),(3,s3,15,'n*(n+1)*(n+2)*(n+3)*(n+4)'),(4,s4,28,'n*(n-1)*(n+1)*(n+2)*(n+3)*(n+4)*(n+5)')]:
 residual=scale*s; anti=P()
 while residual:
  j=max(k[1] for k in residual)
  top=P({(a,j+1):v/F(j+1) for (a,b),v in residual.items() if b==j})
  anti=anti+top;residual=residual-(top.shift()-top)
 assert anti.shift()-anti==scale*s
 out+=f'\ndef centralTerm{i}M3A1 (N t : ℤ) : ℤ :=\n {s.text()}\n'
 out+=f'\ndef centralAnti{i}M3A1 (N t : ℤ) : ℤ :=\n {anti.text()}\n'
 out+=f'''\ntheorem central_delta{i}M3A1 (N t : ℤ) :
 centralAnti{i}M3A1 N (t+1)-centralAnti{i}M3A1 N t={scale}*centralTerm{i}M3A1 N t := by
 unfold centralAnti{i}M3A1 centralTerm{i}M3A1
 ring

theorem central_sum{i}M3A1 (n : ℕ) :
 {scale}*(∑ t∈Finset.range (n+1), centralTerm{i}M3A1 (n+1) t)=
 {rhs.replace('n','(n:ℤ)')} := by
 rw [Finset.mul_sum]
 have he (t : ℕ) : {scale}*centralTerm{i}M3A1 (n+1) t =
   centralAnti{i}M3A1 (n+1) (t+1)-centralAnti{i}M3A1 (n+1) t :=
   (central_delta{i}M3A1 _ _).symm
 simp_rw [he]
 have hh := Finset.sum_range_sub (fun t : ℕ => centralAnti{i}M3A1 (n+1) t) (n+1)
 push_cast at hh
 rw [hh]
 unfold centralAnti{i}M3A1
 push_cast
 ring
'''
out+='\nend\nend MathGKM.Markov\n'
Path('research/MarkovCentralSumsM3A1.lean').write_text(out)
print('Generated exact antidifferences for three central-square sums.')
