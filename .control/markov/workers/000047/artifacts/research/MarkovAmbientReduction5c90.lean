import MarkovShearedTransfer5c90
import MarkovAmbient77c2
/-! Machine-authored 5c90b506. A simpler all-word sufficient condition for
the horizontal clause only. The condition is a definition, not a theorem. -/
namespace MathGKM.Markov
noncomputable section

def AmbientWordHorizontal5c : Prop := ∀ (w : List Bool) (s j : ℕ),
 s+2≤w.length+1 →
 (s+2 : ℤ)*(w.length+1-s)*coeff (ambientScalar5c U V w) s j*
   coeff (ambientScalar5c U V w) (s+2) j ≤
 (s+1 : ℤ)*(w.length-s)*coeff (ambientScalar5c U V w) (s+1) j^2

theorem ambient_word_implies_source5c (h : AmbientWordHorizontal5c) :
 AmbientHorizontal77 := by
 intro path i j
 dsimp only
 intro h0 h2
 let a := (frame path).mid.a
 let b := (frame path).mid.b
 let s := i+j-a
 have hab := frame_reduced path
 have hlow : a ≤ i+j := by
   have hp := h0.1
   have hm : a≤b := by dsimp [a,b]; omega
   change a*b≤b*i+a*j at hp
   nlinarith [Nat.mul_le_mul_right j hm]
 have hs : i+j=a+s := by dsimp [s]; omega
 have hs2 : s+2≤b-1 := by
   have hp := h2.2
   change i+2+j≤a+b-1 at hp
   omega
 have hw : (central28 path).length+2=b := by
   have hc := (source_word_counts28 path).2
   rw [sourceWord_central28] at hc
   simp only [List.length_cons,List.length_append,List.length_singleton] at hc
   dsimp [b]
   omega
 have he := h (central28 path) s j (by omega)
 have e0 := source_ambient_coeff5c path i j s hs
 have e1 := source_ambient_coeff5c path (i+1) j (s+1) (by omega)
 have e2 := source_ambient_coeff5c path (i+2) j (s+2) (by omega)
 change (s+2 : ℤ)*(b-1-s)*coeff (frame path).mid.p i j*
   coeff (frame path).mid.p (i+2) j ≤
   (s+1 : ℤ)*(b-2-s)*coeff (frame path).mid.p (i+1) j^2
 rw [e0,e1,e2]
 have hwz : ((central28 path).length : ℤ)+2=b := by exact_mod_cast hw
 have eL : (b:ℤ)-1-s=(central28 path).length+1-s := by omega
 have eR : (b:ℤ)-2-s=(central28 path).length-s := by omega
 rw [eL,eR]
 exact he

theorem ambient_word_implies_raw_horizontal5c (h : AmbientWordHorizontal5c)
 (path : List Bool) (i j : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i j)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) j) :
 coeff (frame path).mid.p i j*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) j^2 :=
 ambient_implies_horizontal77 (ambient_word_implies_source5c h) path i j h0 h2

/-- The vertical direction becomes (1,1), without rescaling coefficients. -/
theorem source_ambient_vertical5c (path : List Bool) (i j s : ℕ)
 (hs : i+j=(frame path).mid.a+s) :
 (coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2) ↔
 (coeff (ambientScalar5c U V (central28 path)) s j*
    coeff (ambientScalar5c U V (central28 path)) (s+2) (j+2) ≤
   coeff (ambientScalar5c U V (central28 path)) (s+1) (j+1)^2) := by
 rw [source_ambient_coeff5c path i j s hs,
   source_ambient_coeff5c path i (j+2) (s+2) (by omega),
   source_ambient_coeff5c path i (j+1) (s+1) (by omega)]

/-- The constant-total-degree direction becomes vertical in the new variables. -/
theorem source_ambient_diagonal5c (path : List Bool) (i j s : ℕ)
 (hs : i+j+2=(frame path).mid.a+s) :
 (coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j ≤
   coeff (frame path).mid.p (i+1) (j+1)^2) ↔
 (coeff (ambientScalar5c U V (central28 path)) s (j+2)*
    coeff (ambientScalar5c U V (central28 path)) s j ≤
   coeff (ambientScalar5c U V (central28 path)) s (j+1)^2) := by
 rw [source_ambient_coeff5c path i (j+2) s (by omega),
   source_ambient_coeff5c path (i+2) j s (by omega),
   source_ambient_coeff5c path (i+1) (j+1) s (by omega)]

#print axioms ambient_word_implies_source5c
#print axioms ambient_word_implies_raw_horizontal5c
#print axioms source_ambient_vertical5c
#print axioms source_ambient_diagonal5c
end
end MathGKM.Markov
