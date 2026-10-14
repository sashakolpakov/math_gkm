import MarkovSingleLayer9c20
import MarkovDegreeBridge07a7
/-! Machine-authored 9c20fccd. Ordinary integer coefficients and exact
degree-marker extraction for the universal one-cut layer result. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem degreeLayer_map9c20 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (y : R) (w : List Bool) (s d : ℕ) :
 f (degreeLayer07a7 y w s d)=degreeLayer07a7 (f y) w s d := by
 simp only [degreeLayer07a7,map_list_sum,List.map_map,Function.comp_def,
   maskWeight_mapFe01,map_one]

theorem degreeLayer_cast_coeff9c20 (w : List Bool) (s d k : ℕ) :
 ((degreeLayer07a7 (X:ℤ[X]) w s d).coeff k : ℝ)=
 (degreeLayer07a7 (X:ℝ[X]) w s d).coeff k := by
 have h := degreeLayer_map9c20 (Polynomial.mapRingHom (Int.castRingHom ℝ))
   (X:ℤ[X]) w s d
 have hc := congrArg (fun p : ℝ[X] => p.coeff k) h
 simpa using hc

theorem single_degree_layer_integer_lc9c20 (w : List Bool) (d k : ℕ) :
 (degreeLayer07a7 (X:ℤ[X]) w 1 d).coeff k*
 (degreeLayer07a7 (X:ℤ[X]) w 1 d).coeff (k+2)≤
 ((degreeLayer07a7 (X:ℤ[X]) w 1 d).coeff (k+1))^2 := by
 have h := single_degree_layer_lc9c20 w d k
 rw [←degreeLayer_cast_coeff9c20,←degreeLayer_cast_coeff9c20,
   ←degreeLayer_cast_coeff9c20] at h
 exact_mod_cast h

/-- The degree marker is auxiliary. This result is about one layer of the
actual source's one-cut decomposition; summing the layers is not inferred. -/
theorem source_single_marked_layer_lc9c20 (path : List Bool) (d k : ℕ) :
 let p := (degreeCoeff07a7 (C (X:ℤ[X])) (X:(ℤ[X])[X]) (C X) 1 1
   (central28 path++[true]) 1).coeff d
 p.coeff k*p.coeff (k+2)≤p.coeff (k+1)^2 := by
 dsimp only
 rw [degreeCoeff_layer07a7]
 exact single_degree_layer_integer_lc9c20 _ d k

#print axioms single_degree_layer_integer_lc9c20
#print axioms source_single_marked_layer_lc9c20
end
end MathGKM.Markov
