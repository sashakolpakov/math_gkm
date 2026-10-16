import MarkovVerticalTraceMDE6
/-! Machine-authored request de6168c6. Normalized vertical blocks for every
run length. Keeps the exact predecessor source word in the product. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

def vRunMDE6 (x : ℝ) (n : ℕ) : Mat16 ℝ[X] :=
 vKwordM9E1 x (runBlock025 n)

theorem vRun_zeroMDE6 (x : ℝ) (n : ℕ) :
 (vRunMDE6 x n).a.coeff 0=x^(n+1) ∧
 (vRunMDE6 x n).b.coeff 0=0 ∧
 (vRunMDE6 x n).c.coeff 0=0 ∧
 (vRunMDE6 x n).d.coeff 0=0 := by
 induction n with
 | zero =>
   simp [vRunMDE6,runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
     vKaM9E1,vKcM9E1,mm16,Polynomial.mul_coeff_zero,Polynomial.coeff_one]
 | succ n ih =>
   have he : vRunMDE6 x (n+1)=mm16 (vKaM9E1 x) (vRunMDE6 x n) := by
     simp only [vRunMDE6,runBlock025,List.replicate_succ,List.cons_append,
       vKwordM9E1,List.map_cons,projProduct6905,vKletterM9E1,Bool.false_eq_true,if_false]
   rw [he]
   simp [mm16,vKaM9E1,Polynomial.mul_coeff_zero,Polynomial.coeff_add,
     Polynomial.coeff_one,ih.1,ih.2.1,ih.2.2.1,ih.2.2.2,pow_succ,mul_comm]

def vGeneralProjMDE6 (x : ℝ) (n : ℕ) (r : Bool) : Mat16 ℝ[X] :=
 hscaleM13D (C (x^(n+1+if !r then 1 else 0))⁻¹)
   (vswapMDE6 (vRunMDE6 x (n+if !r then 1 else 0)))

theorem vGeneral_shapeMDE6 (x : ℝ) (hx : x≠0) (n : ℕ) (r : Bool) :
 Projection6905 (vGeneralProjMDE6 x n r) := by
 have h := vRun_zeroMDE6 x (n+if !r then 1 else 0)
 have he : n+(if !r then 1 else 0)+1=n+1+(if !r then 1 else 0) := by omega
 simp only [Projection6905,vGeneralProjMDE6,hscaleM13D,vswapMDE6,
   Polynomial.coeff_C_mul,h.1,h.2.1,h.2.2.1,h.2.2.2,he,mul_zero]
 simp [hx]

theorem vGeneral_letterMDE6 (x : ℝ) (hx : x≠0) (n : ℕ) (r : Bool) :
 vswapMDE6 (vRunMDE6 x (n+if !r then 1 else 0))=
 hscaleM13D (C (x^(n+1+if !r then 1 else 0))) (vGeneralProjMDE6 x n r) := by
 rw [vGeneralProjMDE6,vscale_scaleM9E1,←map_mul]
 simp [hx,hscaleM13D]

theorem vGeneral_wordMDE6 (x : ℝ) (hx : x≠0) (n : ℕ) (w : List Bool) :
 vswapMDE6 (vKwordM9E1 x (blockSub025 n (w.map Bool.not)))=
 hscaleM13D (C (x^(w.length*(n+1)+(w.map Bool.not).count true)))
   (projProduct6905 (w.map (vGeneralProjMDE6 x n))) := by
 induction w with
 | nil => ext <;> simp [blockSub025,vKwordM9E1,projProduct6905,vswapMDE6,hscaleM13D]
 | cons r rs ih =>
   change vswapMDE6 (vKwordM9E1 x (runBlock025 (n+if !r then 1 else 0)++
     blockSub025 n (rs.map Bool.not)))=_
   rw [vKword_appendMDE6,vswap_mulMDE6,ih]
   change mm16 (vswapMDE6 (vRunMDE6 x (n+if !r then 1 else 0))) _=_
   rw [vGeneral_letterMDE6 x hx,hscale_mmM13D]
   have he : C (x^(n+1+if !r then 1 else 0))*C (x^(rs.length*(n+1)+(rs.map Bool.not).count true))=
     (C (x^((r::rs).length*(n+1)+((r::rs).map Bool.not).count true)):ℝ[X]) := by
     rw [←map_mul,←pow_add]
     congr 2
     cases r <;> simp [List.count_cons,Nat.add_mul] <;> omega
   rw [he]
   rfl

theorem vGeneral_source_traceMDE6 (x : ℝ) (hx : x≠0) (n : ℕ) (rest : List Bool) :
 let path := List.replicate n false++true::rest
 C (x^(frame path).mid.b)*
   tr16 (projProduct6905 ((sourceWord28 rest).map (vGeneralProjMDE6 x n)))=
 (1+C (x+1)*X)*vEvalMDE6 x (vdiffM9E1
   (vKwordM9E1 (X:ℤ[X]) (sourceWord28 path))) := by
 dsimp only
 have h := congrArg tr16 (vGeneral_wordMDE6 x hx n (sourceWord28 rest))
 rw [vswap_traceMDE6,←source_vertical_blocksMDE6] at h
 have hb := (source_word_counts28 (List.replicate n false++true::rest)).2
 rw [source_vertical_blocksMDE6,block_length274,List.length_map] at hb
 rw [hb] at h
 have ht := vsource_trace_evalMDE6 x (List.replicate n false++true::rest)
 rw [h] at ht
 simpa only [tr16,hscaleM13D,mul_add] using ht

end
end MathGKM.Markov
