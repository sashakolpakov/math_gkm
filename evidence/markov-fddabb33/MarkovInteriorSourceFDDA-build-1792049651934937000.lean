import MarkovNormalSourceFDDA
import MarkovExtractFDDA
import MarkovThirdInteriorTransferBDEE
/-! Machine-authored fddabb33. Source coefficient identity for arbitrary run
length; every equality is in the original integer coefficient normalization. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 5000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false
theorem map_normalBand0FDDA (N c r q t u x : ℤ[X]) :
 runEmbedBDEE (normalBand0FDDA N c r q t u x)=
 normalBand0FDDA (runEmbedBDEE N) (runEmbedBDEE c) (runEmbedBDEE r)
 (runEmbedBDEE q) (runEmbedBDEE t) (runEmbedBDEE u) (runEmbedBDEE x) := by
 simp only [normalBand0FDDA,map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
theorem map_normalTail1FDDA (N c r q t u x : ℤ[X]) :
 runEmbedBDEE (normalTail1FDDA N c r q t u x)=
 normalTail1FDDA (runEmbedBDEE N) (runEmbedBDEE c) (runEmbedBDEE r)
 (runEmbedBDEE q) (runEmbedBDEE t) (runEmbedBDEE u) (runEmbedBDEE x) := by
 simp only [normalTail1FDDA,map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
theorem map_normalTail2FDDA (N c r q t u x : ℤ[X]) :
 runEmbedBDEE (normalTail2FDDA N c r q t u x)=
 normalTail2FDDA (runEmbedBDEE N) (runEmbedBDEE c) (runEmbedBDEE r)
 (runEmbedBDEE q) (runEmbedBDEE t) (runEmbedBDEE u) (runEmbedBDEE x) := by
 simp only [normalTail2FDDA,map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
theorem map_normalTail3FDDA (N c r q t u x : ℤ[X]) :
 runEmbedBDEE (normalTail3FDDA N c r q t u x)=
 normalTail3FDDA (runEmbedBDEE N) (runEmbedBDEE c) (runEmbedBDEE r)
 (runEmbedBDEE q) (runEmbedBDEE t) (runEmbedBDEE u) (runEmbedBDEE x) := by
 simp only [normalTail3FDDA,map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,map_zero]
theorem low_band_polyFDDA (n c r q t u : ℤ) :
 normalBand0FDDA (n:ℤ[X]) c r q t u X=lowNumeratorPolyFDDA n c r := by
 unfold normalBand0FDDA lowNumeratorPolyFDDA
   lowNumerator0BDEE lowNumerator1BDEE lowNumerator2BDEE lowNumerator3BDEE lowNumerator4BDEE lowNumerator5BDEE lowNumerator6BDEE lowNumerator7BDEE lowNumerator8BDEE lowNumerator9BDEE
 have hn : (C n:ℤ[X])=n := Polynomial.C_eq_intCast n
 have hc : (C c:ℤ[X])=c := Polynomial.C_eq_intCast c
 have hr : (C r:ℤ[X])=r := Polynomial.C_eq_intCast r
 simp only [map_add,map_sub,map_mul,map_pow,map_neg,map_ofNat,map_one,hn,hc,hr]
 ring

def delayedRFDDA (n c r : ℕ) : ℤ[X] :=
 let q : ℤ[X] := (2*r-c:ℕ)
 let t : ℤ[X] := (min (c-r) (3*r-c):ℕ)
 let u : ℤ[X] := (3*r-2*c:ℕ)
 normalTail1FDDA (n:ℤ[X]) c r q t u X+
 X^(n+1)*normalTail2FDDA (n:ℤ[X]) c r q t u X+
 X^(2*n+2)*normalTail3FDDA (n:ℤ[X]) c r q t u X+
 (if c=2 then 6*(1-X)^6*firstRunPolyADB2 n c r*X^(n+1) else 0)

theorem source_denominatorFDDA (n c r : ℕ) :
 (1-X)^6*thirdRunPolyADB2 n c r=
 lowNumeratorPolyFDDA n c r+X^(n+2)*delayedRFDDA n c r := by
 rw [←low_band_polyFDDA (n:ℤ) c r (2*r-c:ℕ) (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)]
 apply run_embed_injectiveBDEE
 have h := normal_source_thirdFDDA n c r
 rw [normal_band_factor_1FDDA,normal_band_factor_2FDDA,normal_band_factor_3FDDA] at h
 unfold delayedRFDDA
 simp only [map_mul,map_add,map_sub,map_pow,map_one,map_natCast,map_intCast,
   map_thirdBDEE,map_normalBand0FDDA,map_normalTail1FDDA,map_normalTail2FDDA,
   map_normalTail3FDDA,map_firstBDEE,Int.cast_natCast]
 change _ = normalBand0FDDA (n:RunFieldBDEE) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ) runXBDEE+_
 split_ifs with hc
 · simp only [hc,ite_true,map_mul,map_pow,map_sub,map_one,map_ofNat,map_natCast,map_firstBDEE] at h ⊢
   simp only [pow_add,pow_mul,pow_succ,runXBDEE] at h ⊢
   linear_combination h
 · simp only [hc,ite_false,map_zero] at h ⊢
   simp only [pow_add,pow_mul,pow_succ,runXBDEE] at h ⊢
   linear_combination h

theorem third_run_interior_coeffFDDA (n c r j : ℕ) (hj : 4≤j) (hn : j≤n+1) :
 thirdShapeBDEE n c r j=15*(thirdRunPolyADB2 n c r).coeff j := by
 exact (extract_shapeFDDA _ (delayedRFDDA n c r) n c r (n+2) j
   (source_denominatorFDDA n c r) hj (by omega)).symm

theorem third_interior_formulaFDDA (n c r : ℕ) : ThirdInteriorFormulaBDEE n c r := by
 intro j hj hn
 exact third_run_interior_coeffFDDA n c r j hj (by omega)

theorem source_third_interiorFDDA (n : ℕ) (rest : List Bool)
 (i j : ℕ) (hj : 4≤j) (hn : j+2≤n)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+3) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 exact source_third_interior_of_formulaBDEE n rest (third_interior_formulaFDDA _ _ _) i j hj hn hs

#print axioms third_run_interior_coeffFDDA
#print axioms source_third_interiorFDDA
end
end MathGKM.Markov
