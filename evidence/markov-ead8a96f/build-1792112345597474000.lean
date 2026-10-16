import MarkovSmallLC31MEA
import MarkovSmallLC32MEA
import MarkovSmallLC41MEA
import MarkovSmallLC43MEA
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false
attribute [local irreducible] frame coeff

theorem s31sourceMEA (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a=2) (hb : (frame rest).mid.b=3) :
 let path := List.replicate n false++true::rest
 (1-X)^4*(2*((frame path).mid.p).coeff 2)=
 X^((frame path).mid.b-(2*n+4))*(s31J0MEA (n+1:ℤ[X]) X+
   X^(n+1)*s31J1MEA (n+1:ℤ[X]) X+X^(2*(n+1))*s31J2MEA (n+1:ℤ[X]) X) := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi : (frame path).mid.a=3 := by rw [(source_vertical_indicesMDE6 n rest).1,hb]
 have hf := vertical_second_small_clearedM758 n rest (by omega) (by omega)
 dsimp only at hf
 change 2*(1+X)^(5-(frame path).mid.a)*((frame path).mid.p).coeff 2=
   X^((frame path).mid.b-(2*n+4))*vNseedMDE6 n (frame path).mid.a
     ((frame rest).mid.b-(frame rest).mid.a)
     (2*((frame rest).mid.b-(frame rest).mid.a)-(frame path).mid.a) at hf
 rw [hi,ha,hb] at hf
 norm_num only at hf
 have hs := vN_sparseM758 n 3 1 0
 rw [←s31block0MEA,←s31block1MEA,←s31block2MEA] at hs
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 2 hn)
 linear_combination (1-X)^4*hf+X^((frame path).mid.b-(2*n+4))*hs

theorem s31rawMEA (n : ℕ) (hn : 1 ≤ n) (rest : List Bool)
 (ha : (frame rest).mid.a=2) (hb : (frame rest).mid.b=3) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m := (frame path).mid.b-(2*n+4)
 have hc (k : ℕ) : 12*coeff (frame path).mid.p 2 k=
   s31EMEA (n+1) ((k:ℤ)-m) := by
   have h := s31coeffMEA (2*((frame path).mid.p).coeff 2) m (n+1) k (s31sourceMEA n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one] at h
   change 6*(2*coeff (frame path).mid.p 2 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : s31EMEA (n+1) ((j:ℤ)-m)*s31EMEA (n+1) (j+2-m) ≤
   s31EMEA (n+1) (j+1-m)^2 := by
   convert s31adjacentMEA (n+1) (j+1-m) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem s32sourceMEA (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a=1) (hb : (frame rest).mid.b=3) :
 let path := List.replicate n false++true::rest
 (1-X)^4*(2*((frame path).mid.p).coeff 2)=
 X^((frame path).mid.b-(2*n+4))*(s32J0MEA (n+1:ℤ[X]) X+
   X^(n+1)*s32J1MEA (n+1:ℤ[X]) X+X^(2*(n+1))*s32J2MEA (n+1:ℤ[X]) X) := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi : (frame path).mid.a=3 := by rw [(source_vertical_indicesMDE6 n rest).1,hb]
 have hf := vertical_second_small_clearedM758 n rest (by omega) (by omega)
 dsimp only at hf
 change 2*(1+X)^(5-(frame path).mid.a)*((frame path).mid.p).coeff 2=
   X^((frame path).mid.b-(2*n+4))*vNseedMDE6 n (frame path).mid.a
     ((frame rest).mid.b-(frame rest).mid.a)
     (2*((frame rest).mid.b-(frame rest).mid.a)-(frame path).mid.a) at hf
 rw [hi,ha,hb] at hf
 norm_num only at hf
 have hs := vN_sparseM758 n 3 2 1
 rw [←s32block0MEA,←s32block1MEA,←s32block2MEA] at hs
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 2 hn)
 linear_combination (1-X)^4*hf+X^((frame path).mid.b-(2*n+4))*hs

theorem s32rawMEA (n : ℕ) (hn : 1 ≤ n) (rest : List Bool)
 (ha : (frame rest).mid.a=1) (hb : (frame rest).mid.b=3) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m := (frame path).mid.b-(2*n+4)
 have hc (k : ℕ) : 12*coeff (frame path).mid.p 2 k=
   s32EMEA (n+1) ((k:ℤ)-m) := by
   have h := s32coeffMEA (2*((frame path).mid.p).coeff 2) m (n+1) k (s32sourceMEA n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one] at h
   change 6*(2*coeff (frame path).mid.p 2 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : s32EMEA (n+1) ((j:ℤ)-m)*s32EMEA (n+1) (j+2-m) ≤
   s32EMEA (n+1) (j+1-m)^2 := by
   convert s32adjacentMEA (n+1) (j+1-m) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem s41sourceMEA (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a=3) (hb : (frame rest).mid.b=4) :
 let path := List.replicate n false++true::rest
 (1-X)^4*(2*((frame path).mid.p).coeff 2)=
 X^((frame path).mid.b-(2*n+4))*(s41J0MEA (n+1:ℤ[X]) X+
   X^(n+1)*s41J1MEA (n+1:ℤ[X]) X+X^(2*(n+1))*s41J2MEA (n+1:ℤ[X]) X) := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi : (frame path).mid.a=4 := by rw [(source_vertical_indicesMDE6 n rest).1,hb]
 have hf := vertical_second_small_clearedM758 n rest (by omega) (by omega)
 dsimp only at hf
 change 2*(1+X)^(5-(frame path).mid.a)*((frame path).mid.p).coeff 2=
   X^((frame path).mid.b-(2*n+4))*vNseedMDE6 n (frame path).mid.a
     ((frame rest).mid.b-(frame rest).mid.a)
     (2*((frame rest).mid.b-(frame rest).mid.a)-(frame path).mid.a) at hf
 rw [hi,ha,hb] at hf
 norm_num only at hf
 have hs := vN_sparseM758 n 4 1 0
 rw [←s41block0MEA,←s41block1MEA,←s41block2MEA] at hs
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 1 hn)
 linear_combination (1-X)^4*hf+X^((frame path).mid.b-(2*n+4))*hs

theorem s41rawMEA (n : ℕ) (hn : 1 ≤ n) (rest : List Bool)
 (ha : (frame rest).mid.a=3) (hb : (frame rest).mid.b=4) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m := (frame path).mid.b-(2*n+4)
 have hc (k : ℕ) : 12*coeff (frame path).mid.p 2 k=
   s41EMEA (n+1) ((k:ℤ)-m) := by
   have h := s41coeffMEA (2*((frame path).mid.p).coeff 2) m (n+1) k (s41sourceMEA n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one] at h
   change 6*(2*coeff (frame path).mid.p 2 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : s41EMEA (n+1) ((j:ℤ)-m)*s41EMEA (n+1) (j+2-m) ≤
   s41EMEA (n+1) (j+1-m)^2 := by
   convert s41adjacentMEA (n+1) (j+1-m) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

theorem s43sourceMEA (n : ℕ) (rest : List Bool)
 (ha : (frame rest).mid.a=1) (hb : (frame rest).mid.b=4) :
 let path := List.replicate n false++true::rest
 (1-X)^4*(2*((frame path).mid.p).coeff 2)=
 X^((frame path).mid.b-(2*n+4))*(s43J0MEA (n+1:ℤ[X]) X+
   X^(n+1)*s43J1MEA (n+1:ℤ[X]) X+X^(2*(n+1))*s43J2MEA (n+1:ℤ[X]) X) := by
 dsimp only
 let path := List.replicate n false++true::rest
 have hi : (frame path).mid.a=4 := by rw [(source_vertical_indicesMDE6 n rest).1,hb]
 have hf := vertical_second_small_clearedM758 n rest (by omega) (by omega)
 dsimp only at hf
 change 2*(1+X)^(5-(frame path).mid.a)*((frame path).mid.p).coeff 2=
   X^((frame path).mid.b-(2*n+4))*vNseedMDE6 n (frame path).mid.a
     ((frame rest).mid.b-(frame rest).mid.a)
     (2*((frame rest).mid.b-(frame rest).mid.a)-(frame path).mid.a) at hf
 rw [hi,ha,hb] at hf
 norm_num only at hf
 have hs := vN_sparseM758 n 4 3 2
 rw [←s43block0MEA,←s43block1MEA,←s43block2MEA] at hs
 have hn : (1+X:ℤ[X])≠0 := by simpa [add_comm] using X_add_C_ne_zero (1:ℤ)
 apply mul_left_cancel₀ (pow_ne_zero 1 hn)
 linear_combination (1-X)^4*hf+X^((frame path).mid.b-(2*n+4))*hs

theorem s43rawMEA (n : ℕ) (hn : 1 ≤ n) (rest : List Bool)
 (ha : (frame rest).mid.a=1) (hb : (frame rest).mid.b=4) (j : ℕ) :
 let path := List.replicate n false++true::rest
 coeff (frame path).mid.p 2 j*coeff (frame path).mid.p 2 (j+2) ≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 dsimp only
 let path := List.replicate n false++true::rest
 let m := (frame path).mid.b-(2*n+4)
 have hc (k : ℕ) : 12*coeff (frame path).mid.p 2 k=
   s43EMEA (n+1) ((k:ℤ)-m) := by
   have h := s43coeffMEA (2*((frame path).mid.p).coeff 2) m (n+1) k (s43sourceMEA n rest ha hb)
   simp only [Nat.cast_add,Nat.cast_one] at h
   change 6*(2*coeff (frame path).mid.p 2 k)=_ at h
   linear_combination h
 have h0 := hc j
 have h1 := hc (j+1)
 have h2 := hc (j+2)
 simp only [Nat.cast_add,Nat.cast_one,Nat.cast_ofNat] at h1 h2
 have hh : s43EMEA (n+1) ((j:ℤ)-m)*s43EMEA (n+1) (j+2-m) ≤
   s43EMEA (n+1) (j+1-m)^2 := by
   convert s43adjacentMEA (n+1) (j+1-m) (by omega) using 1 <;> congr 1 <;> congr 1 <;> ring
 rw [←h0,←h1,←h2] at hh
 nlinarith only [hh]

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
