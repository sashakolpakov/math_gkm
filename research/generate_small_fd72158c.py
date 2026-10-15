"""Machine-authored Lean certificate generator. Does not run inherited side effects."""
from pathlib import Path
from small_runs_fd72158c import polys,coeffs,fmt,subst,chs,serialize
R=Path('/Users/sasha/math_gkm');O=R/'evidence/markov-fd72158c'
head='namespace MathGKM.Markov\nnoncomputable section\nopen Polynomial\nset_option maxHeartbeats 8000000\nset_option maxRecDepth 16384\nset_option linter.unusedVariables false\n'
tail='end\nend MathGKM.Markov\n'
for n,p in polys.items():
 cs=coeffs(p);deg=len(cs)-1
 text='import MarkovInteriorSourceFDDA\n/-! Machine-authored fd72158c: exact small-run coefficient identity. -/\n'+head
 for j,v in enumerate(cs):
  text+=f'def small{n}_{j}FD (c r q t u : ℤ) : ℤ :=\n {fmt(v)}\n'
 text+=f'def smallCoeff{n}FD (c r q t u : ℤ) : ℕ → ℤ\n'
 for j in range(len(cs)):text+=f' | {j} => small{n}_{j}FD c r q t u\n'
 text+=' | _ => 0\n'
 text+=f'def smallPoly{n}FD (c r q t u : ℤ) : ℤ[X] :=\n '+ '+'.join(f'C (small{n}_{j}FD c r q t u)*X^{j}' for j in range(len(cs)))+'\n'
 text+=f'''theorem small_factor{n}FD (c r q t u : ℤ) :
 (1-X)^6*smallPoly{n}FD c r q t u=
 normalBand0FDDA ({n}:ℤ[X]) c r q t u X+
 X^{n+2}*(normalTail1FDDA ({n}:ℤ[X]) c r q t u X+
 X^{n+1}*normalTail2FDDA ({n}:ℤ[X]) c r q t u X+
 X^{2*n+2}*normalTail3FDDA ({n}:ℤ[X]) c r q t u X) := by
 simp only [smallPoly{n}FD,normalBand0FDDA,normalTail1FDDA,normalTail2FDDA,normalTail3FDDA,
 '''+','.join(f'small{n}_{j}FD' for j in range(len(cs)))+''',map_add,map_mul,map_pow,map_neg,map_ofNat,map_one]
 rw [show (C c:ℤ[X])=c from Polynomial.C_eq_intCast c,
   show (C r:ℤ[X])=r from Polynomial.C_eq_intCast r,
   show (C q:ℤ[X])=q from Polynomial.C_eq_intCast q,
   show (C t:ℤ[X])=t from Polynomial.C_eq_intCast t,
   show (C u:ℤ[X])=u from Polynomial.C_eq_intCast u]
 ring
'''
 text+=f'''theorem small_poly{n}FD (c r : ℕ) (hc : c ≠ 2) :
 thirdRunPolyADB2 {n} c r=smallPoly{n}FD c r (2*r-c:ℕ)
 (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) := by
 have hx : (1-X:ℤ[X]) ≠ 0 := by
  intro h
  have h0 := congrArg (fun p : ℤ[X] => p.coeff 0) h
  norm_num at h0
 apply mul_left_cancel₀ (pow_ne_zero 6 hx)
 rw [source_denominatorFDDA,small_factor{n}FD]
 norm_num only [Nat.cast_ofNat]
 rw [←low_band_polyFDDA ({n}:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 simp only [delayedRFDDA,hc,ite_false,add_zero,Int.cast_natCast,Nat.reduceAdd,Nat.reduceMul]
 norm_num only [Int.cast_ofNat]
theorem small_coeff{n}FD (c r : ℕ) (hc : c ≠ 2) (j : ℕ) (hj : j ≤ {deg}) :
 (thirdRunPolyADB2 {n} c r).coeff j=
 smallCoeff{n}FD c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) j := by
 rw [small_poly{n}FD c r hc]
 interval_cases j <;> simp only [smallPoly{n}FD,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow,smallCoeff{n}FD] <;> norm_num
'''
 text+=tail;(R/f'research/MarkovSmallPoly{n}FD.lean').write_text(text)
 for name,c,r,q,t,u in chs:
  text=f'import MarkovSmallPoly{n}FD\n/-! Machine-authored fd72158c: exact chamber gap certificates. -/\n'+head
  args=' '.join('('+fmt(z,['v','w','c','r','q','t','u','x'])+')' for z in [c,r,q,t,u])
  arr=[subst(z,[0,0,c,r,q,t,u,0]) for z in cs]
  for j in range(deg-1):
   gap=arr[j+1]**2-arr[j]*arr[j+2]
   assert all(v>=0 for v in gap.values())
   expr=fmt(gap,['v','w','c','r','q','t','u','x'])
   left=f'smallCoeff{n}FD {args} {j}';mid=f'smallCoeff{n}FD {args} {j+1}';right=f'smallCoeff{n}FD {args} {j+2}'
   text+=f'''theorem small_gap{n}_{name}_{j}FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w) :
 {left}*{right} ≤ ({mid})^2 := by
 have he : ({mid})^2-{left}*{right}={expr} := by
  simp only [smallCoeff{n}FD,small{n}_{j}FD,small{n}_{j+1}FD,small{n}_{j+2}FD]
  ring
 have hp : 0 ≤ {expr} := by positivity
 omega
'''
  text+=f'''theorem small_chamber{n}_{name}FD (v w : ℤ) (hv : 0 ≤ v) (hw : 0 ≤ w)
 (j : ℕ) (hj : j ≤ {deg-2}) :
 smallCoeff{n}FD {args} j*smallCoeff{n}FD {args} (j+2) ≤
 (smallCoeff{n}FD {args} (j+1))^2 := by
 interval_cases j
'''
  for j in range(deg-1):text+=f' · exact small_gap{n}_{name}_{j}FD v w hv hw\n'
  text+=tail;(R/f'research/MarkovSmall{n}{name}FD.lean').write_text(text)
print('Generated exact polynomial identities and chamber certificates.')
