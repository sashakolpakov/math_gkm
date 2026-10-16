"""Machine-authored source transport for a=3,4, all run lengths."""
from generate_ead8a96f import *
def main():
 src=''.join(f'import MarkovSmallLC{aa}{rr}MEA\n' for aa,rr in cases if aa>=3)+header
 src+='attribute [local irreducible] frame\n'
 for aa,rr in cases:
  if aa<3:continue
  name=nm(aa,rr)
  src+=f'''
theorem {name}sourceMEA (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a={aa-rr}) (hb : (frame rest).mid.b={aa}) :
 let path := List.replicate n false++true::rest
 (1-X)^4*(2*((frame path).mid.p).coeff 2)=
 X^((frame path).mid.b-(2*n+4))*({name}J0MEA (n+1:ℤ[X]) X+
   X^(n+1)*{name}J1MEA (n+1:ℤ[X]) X+X^(2*(n+1))*{name}J2MEA (n+1:ℤ[X]) X) := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi : (frame path).mid.a={aa} := by rw [(source_vertical_indicesMDE6 n rest).1,hb]
 have hf := vertical_second_small_clearedM758 n rest (by omega) (by omega)
 dsimp only at hf
 change 2*(1+X)^(5-(frame path).mid.a)*((frame path).mid.p).coeff 2=
   X^((frame path).mid.b-(2*n+4))*vNseedMDE6 n (frame path).mid.a
     ((frame rest).mid.b-(frame rest).mid.a)
     (2*((frame rest).mid.b-(frame rest).mid.a)-(frame path).mid.a) at hf
 rw [hi,ha,hb] at hf
 norm_num only at hf
 have hs := vN_sparseM758 n {aa} {rr} {max(2*rr-aa,0)}
 norm_num only [Nat.cast_ofNat,Nat.cast_one,Nat.cast_zero] at hs
 rw [←{name}block0MEA (n+1:ℤ[X]) X,←{name}block1MEA (n+1:ℤ[X]) X,
   ←{name}block2MEA (n+1:ℤ[X]) X] at hs
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero {5-aa} hn)
 linear_combination (1-X)^4*hf+X^((frame path).mid.b-(2*n+4))*hs

theorem {name}rawMEA (n : ℕ) (hn : 1 ≤ n) (rest : List Bool)
 (ha : (frame rest).mid.a={aa-rr}) (hb : (frame rest).mid.b={aa}) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m := (frame path).mid.b-(2*n+4)
 have hc (k : ℕ) : 12*coeff (frame path).mid.p 2 k=
   {name}EMEA (n+1) ((k:ℤ)-m) := by
   have h := {name}coeffMEA (2*((frame path).mid.p).coeff 2) m (n+1) k
     (by simpa only [Nat.cast_add,Nat.cast_one] using {name}sourceMEA n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one,Polynomial.coeff_ofNat_mul] at h
   change 6*(2*coeff (frame path).mid.p 2 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : {name}EMEA (n+1) ((j:ℤ)-m)*{name}EMEA (n+1) (j+2-m) ≤
   {name}EMEA (n+1) (j+1-m)^2 := by
   convert {name}adjacentMEA (n+1) (j+1-m) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]
'''
 src+='''
theorem vertical_second_three_fourMEA (path : List Bool)
 (ha : 3 ≤ (frame path).mid.a) (hb : (frame path).mid.a ≤ 4) (j : ℕ) :
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 rcases split_first_true025 path with ⟨n,rfl⟩ | ⟨n,rest,rfl⟩
 · have h := (source_left_spine_indicesMDE6 n).1
   omega
 · by_cases hn : n=0
   · subst n
     simpa using vertical_second_right_allMDE6 rest j
   have hi := (source_vertical_indicesMDE6 n rest).1
   obtain ⟨ha0,hab,hc⟩ := frame_reduced rest
   have hcases : ((frame rest).mid.a=1 ∧ (frame rest).mid.b=3) ∨
     ((frame rest).mid.a=2 ∧ (frame rest).mid.b=3) ∨
     ((frame rest).mid.a=1 ∧ (frame rest).mid.b=4) ∨
     ((frame rest).mid.a=3 ∧ (frame rest).mid.b=4) := by
     have hbad : ¬((frame rest).mid.a=2 ∧ (frame rest).mid.b=4) := by
       rintro ⟨h1,h2⟩
       rw [h1,h2] at hc
       norm_num at hc
     omega
   rcases hcases with ⟨h1,h2⟩|⟨h1,h2⟩|⟨h1,h2⟩|⟨h1,h2⟩
   · exact s32rawMEA n (by omega) rest h1 h2 j
   · exact s31rawMEA n (by omega) rest h1 h2 j
   · exact s43rawMEA n (by omega) rest h1 h2 j
   · exact s41rawMEA n (by omega) rest h1 h2 j
end
end MathGKM.Markov
'''
 (R/'research/MarkovSmallSourceMEA.lean').write_text(src)
if __name__=='__main__':main()
