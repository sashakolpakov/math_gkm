"""Machine-authored fixed-run universal source proof generation.
Lean checks each algebraic certificate and all parameter/index coverage.
"""
from generate_jets_1152282d import *
header='''namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 10000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
'''
def main():
 for q in range(1,5):
  cs=coeffs(z.seed(q));N=len(cs)-1
  nm=f'vR{q}'
  def term(k,args='a b c d e'):return f'{nm}c{k}M115 {args}'
  defs=','.join(f'{nm}c{k}M115' for k in range(1,N+1))
  s='import MarkovThirdClearedM115\nimport MarkovThirdTransportMEA\nimport MarkovCross774\n/-! Machine-authored 1152282d. Explicit fixed-run seed and exact source identity. -/\n'+header
  for k in range(1,N+1):s+=f'\ndef {nm}c{k}M115 {{R : Type*}} [CommRing R] (a b c d e : R) : R :=\n {lean(cs[k])}\n'
  s+=f'\ndef {nm}seedM115 {{R : Type*}} [CommRing R] (a b c d e : R) : R[X] :=\n '+'+\n '.join(f'C ({term(k)})*X^{k}' for k in range(1,N+1))+'\n'
  props=[f'0 ≤ {term(k)}' if k<3 else f'0 < {term(k)}' for k in range(1,N+1)]+[f'{term(k-1)}*{term(k+1)} ≤ ({term(k)})^2' for k in range(2,N)]
  s+=f'\ndef {nm}BoundsM115 (a b c d e : ℝ) : Prop :=\n '+' ∧\n '.join(props)+'\n'
  s+=f'''
theorem {nm}seed_sourceM115 (rest : List Bool) :
 vThirdSeedMEA (X:ℤ[X]) {q-1} rest=
 {nm}seedM115 ((frame rest).mid.b:ℤ) (frame rest).mid.a
   (2*(frame rest).mid.a-(frame rest).mid.b:ℕ)
   (min ((frame rest).mid.b-(frame rest).mid.a) (3*(frame rest).mid.a-(frame rest).mid.b):ℕ)
   (3*(frame rest).mid.a-2*(frame rest).mid.b:ℕ) := by
 have hz : (1-X:ℤ[X])≠0 := by
   intro h
   have hh := congrArg (fun p : ℤ[X] => p.coeff 0) h
   norm_num at hh
 apply mul_left_cancel₀ (pow_ne_zero 6 hz)
 rw [vThirdSeed_sparseM115]
 norm_num only [vThirdSparseM115,vThirdClearedM115,boolMomentADB2,boolJetADB2,
   Bool.false_eq_true,if_false,if_true,vAPMDE6,vBLMDE6,vBPMDE6,
   vCLM115,vCPM115,vGLM115,vGPM115,
   {nm}seedM115,{defs},map_add,map_sub,map_mul,map_pow,map_ofNat,map_natCast,map_neg,map_one,map_zero,
   Nat.cast_add,Nat.cast_one,Nat.cast_ofNat]
 ring
'''
  s+='end\nend MathGKM.Markov\n';(R/f'research/MarkovThirdRun{q}DefsM115.lean').write_text(s)
  s=f'import MarkovThirdRun{q}DefsM115\n/-! Machine-authored 1152282d. Universal nonnegative gap certificates. -/\n'+header
  for name,i,j,vs in charts:
   args=' '.join(f'({lean(sp.poly(p),["x","y","u","v","e","X"])})' for p in vs)
   s+=f'\ntheorem {nm}chart_{name}_{i}_{j}M115 (x y : ℝ) (hx : 0≤x) (hy : 0≤y) :\n {nm}BoundsM115 {args} := by\n unfold {nm}BoundsM115\n refine ⟨'+','.join('?_ ' for _ in props)+'⟩\n'
   for k in range(len(props)):
    s+=' · '+('apply sub_nonneg.mp\n   ' if k>=N else '')+f'simp only [{defs}]\n   ring_nf <;> positivity\n'
  s+='end\nend MathGKM.Markov\n';(R/f'research/MarkovThirdRun{q}ChartsM115.lean').write_text(s)
  # Exact natural source-count chamber coverage, adapted from the audited pattern.
  s=f'import MarkovThirdRun{q}ChartsM115\n/-! Machine-authored 1152282d. Exhaustive source-count coverage. -/\n'+header
  groups={'low':[(0,4),(1,1),(2,0)],'midlow':[(0,4),(1,2),(2,1),(3,0)],'midhigh':[(0,4),(1,2),(2,1),(3,0)],'high':[(1,4),(2,1),(3,0)]}
  expr={'low':'(3*((x:ℝ)+1)+y) ((x:ℝ)+1) 0 0 0','midlow':'(3*(x:ℝ)+2*y) ((x:ℝ)+y) 0 y 0','midhigh':'(3*(x:ℝ)+2*y) (2*(x:ℝ)+y) x ((x:ℝ)+y) 0','high':'(3*(x:ℝ)+y) (2*(x:ℝ)+y) ((x:ℝ)+y) x y'}
  for name,corners in groups.items():
   for i,j in corners:
    s+=f'''
theorem {nm}nat_{name}_{i}_{j}M115 (x y : ℕ) (hx : {i}≤x) (hy : {j}≤y) :
 {nm}BoundsM115 {expr[name]} := by
 have ex : ((x-{i}:ℕ):ℝ)+{i}=x := by exact_mod_cast Nat.sub_add_cancel hx
 have ey : ((y-{j}:ℕ):ℝ)+{j}=y := by exact_mod_cast Nat.sub_add_cancel hy
 convert {nm}chart_{name}_{i}_{j}M115 ((x-{i}:ℕ):ℝ) ((y-{j}:ℕ):ℝ) (by positivity) (by positivity) using 1 <;>
   linear_combination ex <;> linear_combination ey
'''
    # Rewrite chart into canonical unshifted form before convert.
    s=s[:s.rfind(' convert ')] + f''' have h := {nm}chart_{name}_{i}_{j}M115 ((x-{i}:ℕ):ℝ) ((y-{j}:ℕ):ℝ) (by positivity) (by positivity)
 convert h using 1 <;> nlinarith [ex,ey]
'''
   hyp='7≤3*(x+1)+y' if name=='low' else '7≤3*x+y' if name=='high' else '7≤3*x+2*y'
   s+=f'\ntheorem {nm}nat_{name}M115 (x y : ℕ) '+('(hx : 1≤x) ' if name=='high' else '')+f'(hb : {hyp}) :\n {nm}BoundsM115 {expr[name]} := by\n'
   s+=' have h : '+' ∨ '.join(f'({i}≤x ∧ {j}≤y)' for i,j in corners)+' := by omega\n rcases h with '+' | '.join('⟨hx,hy⟩' for _ in corners)+'\n'
   for i,j in corners:s+=f' · exact {nm}nat_{name}_{i}_{j}M115 x y hx hy\n'
  s+=f'''
theorem {nm}boundsM115 (a b : ℕ) (ha : 1≤a) (hb : 7≤b) (hab : a<b) :
 {nm}BoundsM115 b a (2*a-b:ℕ) (min (b-a) (3*a-b):ℕ) (3*a-2*b:ℕ) := by
 by_cases h0 : 3*a≤b
 · let x := a-1
   let y := b-3*a
   have ea : a=x+1 := by dsimp [x]; omega
   have eb : b=3*(x+1)+y := by dsimp [x,y]; omega
   have eq : 2*a-b=0 := by omega
   have et : min (b-a) (3*a-b)=0 := by omega
   have eu : 3*a-2*b=0 := by omega
   have h := {nm}nat_lowM115 x y (by omega)
   rw [eq,et,eu,ea,eb]
   push_cast
   exact h
 · by_cases h1 : 2*a≤b
   · let x := b-2*a
     let y := 3*a-b
     have ea : a=x+y := by dsimp [x,y]; omega
     have eb : b=3*x+2*y := by dsimp [x,y]; omega
     have eq : 2*a-b=0 := by omega
     have et : min (b-a) (3*a-b)=y := by dsimp [y]; omega
     have eu : 3*a-2*b=0 := by omega
     have h := {nm}nat_midlowM115 x y (by omega)
     rw [eq,et,eu,ea,eb]
     push_cast
     exact h
   · by_cases h2 : 3*a≤2*b
     · let x := 2*a-b
       let y := 2*b-3*a
       have ea : a=2*x+y := by dsimp [x,y]; omega
       have eb : b=3*x+2*y := by dsimp [x,y]; omega
       have eq : 2*a-b=x := rfl
       have et : min (b-a) (3*a-b)=x+y := by dsimp [x,y]; omega
       have eu : 3*a-2*b=0 := by omega
       have h := {nm}nat_midhighM115 x y (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
     · let x := b-a
       let y := 3*a-2*b
       have ea : a=2*x+y := by dsimp [x,y]; omega
       have eb : b=3*x+y := by dsimp [x,y]; omega
       have eq : 2*a-b=x+y := by dsimp [x,y]; omega
       have et : min (b-a) (3*a-b)=x := by dsimp [x,y]; omega
       have eu : 3*a-2*b=y := rfl
       have h := {nm}nat_highM115 x y (by dsimp [x]; omega) (by omega)
       rw [eq,et,eu,ea,eb]
       push_cast
       exact h
end
end MathGKM.Markov
'''
  (R/f'research/MarkovThirdRun{q}BoundsM115.lean').write_text(s)
 print('Generated fixed run definitions/charts/coverage')
if __name__=='__main__':main()
