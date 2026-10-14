import MarkovCutTermFe01
/-! Machine-authored fe01d46b. Universal source decomposition into genuinely
log-concave cut terms; the remaining aggregation is not assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem maskWeight_mapFe01 {R S : Type*} [CommRing R] [CommRing S]
 (f : R →+* S) (y p q : R) (m : List (Bool × Bool)) :
 f (maskWeight340 y p q m)=maskWeight340 (f y) (f p) (f q) m := by
 induction m generalizing p q with
 | nil => rfl
 | cons rb rs ih =>
   obtain ⟨r,b⟩ := rb
   cases b <;> cases r <;>
     simp [maskWeight340,cutFactorA27,cutChargeA27,ih,map_mul,map_add,map_ofNat]

def sourceTermsFe01 (path : List Bool) (s : ℕ) : List ℝ[X] :=
 (cutMasksFe01 (central28 path++[true]) s).map (maskWeight340 X X 1)

theorem sourceTerms_lengthFe01 (path : List Bool) (s : ℕ) :
 (sourceTermsFe01 path s).length=((frame path).mid.b-1).choose s := by
 have hc := (source_word_counts28 path).2
 rw [sourceWord_central28] at hc
 simp only [List.length_cons,List.length_append,List.length_nil] at hc
 simp only [sourceTermsFe01,List.length_map,cutMasks_lengthFe01,
   List.length_append,List.length_singleton]
 congr 1
 omega

theorem sourceTerms_pf2Fe01 (path : List Bool) (s : ℕ) :
 ∀ p ∈ sourceTermsFe01 path s, PolyPF2Fe01 p := by
 intro p hp
 obtain ⟨m,hm,rfl⟩ := List.mem_map.mp hp
 exact mask_pf2Fe01 m

theorem sourceTerms_coeffFe01 (path : List Bool) (i j s : ℕ)
 (hs : i+j=(frame path).mid.a+s) :
 (coeff (frame path).mid.p i j : ℝ)=(sourceTermsFe01 path s).sum.coeff j := by
 let f : ℤ[X] →+* ℝ[X] := Polynomial.mapRingHom (Int.castRingHom ℝ)
 have he : f (((cutMasksFe01 (central28 path++[true]) s).map
     (maskWeight340 (X:ℤ[X]) X 1)).sum)=(sourceTermsFe01 path s).sum := by
   rw [map_list_sum]
   simp only [List.map_map,Function.comp_def,maskWeight_mapFe01,sourceTermsFe01]
   simp [f]
 rw [source_masks_coeffFe01 path i j s hs,←he]
 simp [f]

theorem sourceTerms_term_lcFe01 (path : List Bool) (s : ℕ)
 (p : ℝ[X]) (hp : p ∈ sourceTermsFe01 path s) (k : ℕ) :
 p.coeff k*p.coeff (k+2)≤p.coeff (k+1)^2 :=
 polyPF2_adjacentFe01 (sourceTerms_pf2Fe01 path s p hp) k

#print axioms sourceTerms_lengthFe01
#print axioms sourceTerms_coeffFe01
#print axioms sourceTerms_term_lcFe01
end
end MathGKM.Markov
