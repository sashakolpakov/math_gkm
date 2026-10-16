"""Machine-authored source adapters for checked polynomial gaps."""
from column_certificates_ae9e841e import R,header
def main():
 s=header(['MarkovHorizontalFourAllM9E1','MarkovColumnPolynomialMAE9'])
 s+='''theorem three_small_horizontalMAE9 (q i j : ℕ) (r : Bool)
 (hq : 1 ≤ q) (hj : j ≤ 4) :
 threeRawM9E2 q r i j*threeRawM9E2 q r (i+2) j ≤ threeRawM9E2 q r (i+1) j^2 := by
 obtain ⟨n,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : q≠0)
 have h := horizontal_first_fiveM9E1 (threePathM9E2 n r) i j hj
 rw [three_path_polynomialM9E2] at h
 simpa only [three_raw_formulaM9E2] using h
end
end MathGKM.Markov
''';(R/'research/MarkovSmallHorizontalMAE9.lean').write_text(s)
 for t in range(1,4):
  imports=[f'Markov{d.title()}Gap{t}MAE9' for d in ['horizontal','vertical','diagonal']]+['MarkovSmallHorizontalMAE9']
  s=header(imports)+'attribute [local irreducible] threeRawM9E2\n'
  for direction in ['horizontal','vertical','diagonal']:
   i=t+3
   if direction=='horizontal':
    shift=1 if t<3 else 2
    params=f'(hq : 1 ≤ q) (hj : j ≤ q)'
    expr=f'threeRawM9E2 q r {i} j*threeRawM9E2 q r {i+2} j ≤ threeRawM9E2 q r {i+1} j^2'
    ids=[(t,'j'),(t+2,'j'),(t+1,'j')];offset=1
    pre=f''' by_cases hsmall : j < {shift}
 · exact three_small_horizontalMAE9 q {i} j r hq (by omega)
 have hx : (0:ℚ) ≤ (j:ℚ)-{shift} := by exact_mod_cast (show ({shift}:ℤ) ≤ j by omega) |> sub_nonneg.mpr
'''
    # Avoid tactic parser ambiguity in the generated positivity proof.
    pre=f''' by_cases hsmall : j < {shift}
 · exact three_small_horizontalMAE9 q {i} j r hq (by omega)
 have hx : (0:ℚ) ≤ (j:ℚ)-{shift} := by
   have hjj : ({shift}:ℚ) ≤ j := by exact_mod_cast (show {shift} ≤ j by omega)
   linarith
'''
    xarg=f'((j:ℚ)-{shift})'
   else:
    params='(hj : j+2 ≤ q)';offset=7;pre='';xarg='(j:ℚ)'
    if direction=='vertical':
     i=t+5
     expr=f'threeRawM9E2 q r {i} j*threeRawM9E2 q r {i} (j+2) ≤ threeRawM9E2 q r {i} (j+1)^2'
     ids=[(t+2,'j'),(t+2,'(j+2)'),(t+2,'(j+1)')]
    else:
     expr=f'threeRawM9E2 q r {i} (j+2)*threeRawM9E2 q r {i+2} j ≤ threeRawM9E2 q r {i+1} (j+1)^2'
     ids=[(t,'(j+2)'),(t+2,'j'),(t+1,'(j+1)')]
   s+=f'theorem source_{direction}{t}MAE9 (q j : ℕ) (r : Bool) {params} :\n {expr} := by\n'+pre
   s+=f''' have hn : 3*j+{offset} ≤ sourceNME9C q r := by
   unfold sourceNME9C
   split_ifs <;> omega
 have hd : (0:ℚ) ≤ (sourceNME9C q r:ℚ)-3*(j:ℚ)-{offset} := by
   have hnq : (3:ℚ)*j+{offset} ≤ (sourceNME9C q r:ℚ) := by exact_mod_cast hn
   linarith
'''
   qexpr=expr
   for it,jt in sorted({(k+3,v) for k,v in ids},key=lambda z:len(z[1]),reverse=True):
    term=f'threeRawM9E2 q r {it} {jt}'
    qexpr=qexpr.replace(term,f'({term}:ℚ)')
   s+=f' have hh : {qexpr} := by\n'
   s+='   rw ['+',\n     '.join(f'source_column{k}MAE9 q {v} r (by omega)' for k,v in ids)+']\n'
   if direction!='horizontal':s+='   simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]\n'
   s+=f'   have he := {direction}_identity{t}MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-{offset}) {xarg}\n'
   s+=f'   have hp := {direction}_nonneg{t}MAE9 ((sourceNME9C q r:ℚ)-3*(j:ℚ)-{offset}) {xarg} hd '+('hx' if direction=='horizontal' else '(by positivity)')+'\n'
   if direction=='horizontal':
    s+=f'   rw [show (j:ℚ)-{shift}+{shift}=(j:ℚ) by ring] at he\n'
   s+=f'   rw [show 3*(j:ℚ)+{offset}+((sourceNME9C q r:ℚ)-3*(j:ℚ)-{offset})=(sourceNME9C q r:ℚ) by ring] at he\n'
   s+='   linarith only [he,hp]\n exact_mod_cast hh\n'
  s+='end\nend MathGKM.Markov\n'
  (R/f'research/MarkovSourceStrips{t}MAE9.lean').write_text(s)
if __name__=='__main__':main()
