import MarkovVerticalTraceMDE6
/-! Machine-authored request de6168c6. Exact normalized adjacent blocks for
the first vertical run interval. Positive evaluation is only an algebraic tool. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

def vshortMDE6 (x : ℝ) := mm16 (vKaM9E1 x) (vKcM9E1 x)
def vlongMDE6 (x : ℝ) := mm16 (vKaM9E1 x) (vshortMDE6 x)
def vprojMDE6 (x : ℝ) (r : Bool) : Mat16 ℝ[X] :=
 if r then hscaleM13D (C x⁻¹) (vswapMDE6 (vshortMDE6 x))
 else hscaleM13D (C (x^2)⁻¹) (vswapMDE6 (vlongMDE6 x))

theorem vproj_shapeMDE6 (x : ℝ) (hx : x≠0) (r : Bool) :
 Projection6905 (vprojMDE6 x r) := by
 cases r <;>
   simp [Projection6905,vprojMDE6,vshortMDE6,vlongMDE6,hscaleM13D,
     vswapMDE6,vKaM9E1,vKcM9E1,mm16,Polynomial.mul_coeff_zero,
     Polynomial.coeff_one,hx]
 <;> field_simp <;> ring

theorem vproj_letterMDE6 (x : ℝ) (hx : x≠0) (r : Bool) :
 vswapMDE6 (vKwordM9E1 x (runBlock025 (if !r then 1 else 0)))=
 hscaleM13D (C (x^(1+if !r then 1 else 0))) (vprojMDE6 x r) := by
 cases r <;> apply Mat16.ext <;>
   simp [runBlock025,vKwordM9E1,projProduct6905,vKletterM9E1,
     vprojMDE6,vshortMDE6,vlongMDE6,vswapMDE6,hscaleM13D,
     mm_one_right774,mm16,←mul_assoc,←map_pow,←map_mul,hx]

theorem vproj_wordMDE6 (x : ℝ) (hx : x≠0) (w : List Bool) :
 vswapMDE6 (vKwordM9E1 x (blockSub025 0 (w.map Bool.not)))=
 hscaleM13D (C (x^(w.length+(w.map Bool.not).count true)))
   (projProduct6905 (w.map (vprojMDE6 x))) := by
 induction w with
 | nil => ext <;> simp [blockSub025,vKwordM9E1,projProduct6905,vswapMDE6,hscaleM13D]
 | cons r rs ih =>
   change vswapMDE6 (vKwordM9E1 x (runBlock025 (0+if !r then 1 else 0)++
     blockSub025 0 (rs.map Bool.not)))=_
   rw [vKword_appendMDE6,vswap_mulMDE6,ih]
   simp only [Nat.zero_add]
   rw [vproj_letterMDE6 x hx,hscale_mmM13D]
   have he : C (x^(1+if !r then 1 else 0))*C (x^(rs.length+(rs.map Bool.not).count true))=
     (C (x^((r::rs).length+((r::rs).map Bool.not).count true)):ℝ[X]) := by
     rw [←map_mul,←pow_add]
     congr 2
     cases r <;> simp [List.count_cons] <;> omega
   rw [he]
   rfl

theorem vproj_source_traceMDE6 (x : ℝ) (hx : x≠0) (rest : List Bool) :
 let p := true::rest
 C (x^(frame p).mid.b)*tr16 (projProduct6905 ((sourceWord28 rest).map (vprojMDE6 x)))=
 (1+C (x+1)*X)*vEvalMDE6 x (vdiffM9E1
   (vKwordM9E1 (X:ℤ[X]) (sourceWord28 p))) := by
 dsimp only
 have h := congrArg tr16 (vproj_wordMDE6 x hx (sourceWord28 rest))
 rw [vswap_traceMDE6,←source_vertical_blocksMDE6] at h
 simp only [List.replicate_zero,List.nil_append] at h
 have hb := (source_word_counts28 (true::rest)).2
 rw [show true::rest=List.replicate 0 false++true::rest by simp,
   source_vertical_blocksMDE6,block_length274,List.length_map,Nat.zero_add,mul_one] at hb
 rw [hb] at h
 have ht := vsource_trace_evalMDE6 x (true::rest)
 rw [h] at ht
 simpa only [tr16,hscaleM13D,mul_add,List.replicate_zero,List.nil_append] using ht

end
end MathGKM.Markov
