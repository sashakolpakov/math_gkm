import MarkovResidualSupport725
import MarkovHorizontalResidualPositiveM511

/-! Machine-authored ea4238fc. Uniform horizontal residual support.
No log-concavity assertion is made by these support invariants. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def HFilledMEA423 (a : ℕ) (p : BiPoly) : Prop :=
 ∀ r i, 0 < coeff p r i → ∀ k, i ≤ k → k ≤ r+a → 0 < coeff p r k
def HBoundMEA423 (a : ℕ) (p : BiPoly) : Prop :=
 ∀ r i, r+a < i → coeff p r i = 0
def HGoodMEA423 (a : ℕ) (p : BiPoly) : Prop :=
 PolyNonneg16 p ∧ HFilledMEA423 a p ∧ HBoundMEA423 a p

theorem hgood_zeroMEA423 (a : ℕ) : HGoodMEA423 a 0 := by
 refine ⟨?_,?_,?_⟩ <;> simp [PolyNonneg16,HFilledMEA423,HBoundMEA423,coeff]

theorem hgood_oneMEA423 : HGoodMEA423 0 1 := by
 refine ⟨poly_one_nonneg16,?_,?_⟩
 · intro r i hi k hik hkr
   by_cases hr : r=0
   · subst r
     have hk : k=0 := by omega
     subst k
     norm_num [coeff]
   · simp [coeff,Polynomial.coeff_one,hr] at hi
 · intro r i hr
   by_cases hz : r=0
   · subst r
     simp [coeff,Polynomial.coeff_one,show i≠0 by omega]
   · simp [coeff,Polynomial.coeff_one,hz]

theorem hgood_addMEA423 {a : ℕ} {p q : BiPoly}
 (hp : HGoodMEA423 a p) (hq : HGoodMEA423 a q) : HGoodMEA423 a (p+q) := by
 obtain ⟨np,fp,bp⟩ := hp
 obtain ⟨nq,fq,bq⟩ := hq
 refine ⟨poly_add_nonneg16 np nq,?_,?_⟩
 · intro r i hi k hik hkr
   change 0<coeff p r i+coeff q r i at hi
   change 0<coeff p r k+coeff q r k
   by_cases hh : 0<coeff p r i
   · exact add_pos_of_pos_of_nonneg (fp r i hh k hik hkr) (nq r k)
   · exact add_pos_of_nonneg_of_pos (np r k) (fq r i (by omega) k hik hkr)
 · intro r i hr
   change coeff p r i+coeff q r i=0
   rw [bp r i hr,bq r i hr]; rfl

theorem hgood_VMEA423 {a : ℕ} {p : BiPoly}
 (hp : HGoodMEA423 a p) : HGoodMEA423 (a+1) (V*p) := by
 obtain ⟨np,fp,bp⟩ := hp
 refine ⟨poly_mul_nonneg16 poly_V_nonneg16 np,?_,?_⟩
 · intro r i hi k hik hkr
   cases i with
   | zero => simp at hi
   | succ i =>
     cases k with
     | zero => omega
     | succ k =>
       simp only [coeff_V_succ725] at hi ⊢
       exact fp r i hi k (by omega) (by omega)
 · intro r i hr
   cases i with
   | zero => simp
   | succ i => rw [coeff_V_succ725]; exact bp r i (by omega)

theorem hgood_UMEA423 {a : ℕ} {p : BiPoly}
 (hp : HGoodMEA423 (a+1) p) : HGoodMEA423 a (U*p) := by
 obtain ⟨np,fp,bp⟩ := hp
 refine ⟨poly_mul_nonneg16 poly_U_nonneg16 np,?_,?_⟩
 · intro r i hi k hik hkr
   cases r with
   | zero => simp at hi
   | succ r =>
     simp only [coeff_U_succ725] at hi ⊢
     exact fp r i hi k hik (by omega)
 · intro r i hr
   cases r with
   | zero => simp
   | succ r => rw [coeff_U_succ725]; exact bp r i (by omega)

theorem hgood_smoothMEA423 {a : ℕ} {p : BiPoly}
 (hp : HGoodMEA423 a p) : HGoodMEA423 (a+1) ((V+1)*p) := by
 obtain ⟨np,fp,bp⟩ := hp
 have nv := poly_mul_nonneg16 poly_V_nonneg16 np
 have he : (V+1)*p=p+V*p := by ring
 rw [he]
 refine ⟨poly_add_nonneg16 np nv,?_,?_⟩
 · intro r i hi k hik hkr
   change 0<coeff p r i+coeff (V*p) r i at hi
   change 0<coeff p r k+coeff (V*p) r k
   by_cases hik' : i=k
   · simpa [hik'] using hi
   cases k with
   | zero => omega
   | succ k =>
     rw [coeff_V_succ725]
     by_cases hpi : 0<coeff p r i
     · have hir : i≤r+a := by
         by_contra hn
         rw [bp r i (by omega)] at hpi
         omega
       exact add_pos_of_nonneg_of_pos (np r (k+1))
         (fp r i hpi k (by omega) (by omega))
     · have hvi : 0<coeff (V*p) r i := by omega
       cases i with
       | zero => simp at hvi
       | succ i =>
         rw [coeff_V_succ725] at hvi
         exact add_pos_of_nonneg_of_pos (np r (k+1))
           (fp r i hvi k (by omega) (by omega))
 · intro r i hr
   change coeff p r i+coeff (V*p) r i=0
   rw [bp r i (by omega)]
   cases i with
   | zero => simp
   | succ i => rw [coeff_V_succ725,bp r i (by omega)]; rfl

theorem hgood_smooth_twoMEA423 {a : ℕ} {p : BiPoly}
 (hp : HGoodMEA423 a p) : HGoodMEA423 (a+1) ((V+2)*p) := by
 have hs := hgood_smoothMEA423 hp
 obtain ⟨np,fp,bp⟩ := hp
 obtain ⟨ns,fs,bs⟩ := hs
 have he : (V+2)*p=(V+1)*p+p := by ring
 rw [he]
 refine ⟨poly_add_nonneg16 ns np,?_,?_⟩
 · intro r i hi k hik hkr
   change 0<coeff ((V+1)*p) r i+coeff p r i at hi
   change 0<coeff ((V+1)*p) r k+coeff p r k
   have hs : 0<coeff ((V+1)*p) r i := by
     have he' : (V+1)*p=p+V*p := by ring
     rw [he'] at hi ⊢
     change 0<coeff p r i+coeff (V*p) r i
     change 0<(coeff p r i+coeff (V*p) r i)+coeff p r i at hi
     have hv := poly_mul_nonneg16 poly_V_nonneg16 np r i
     omega
   exact add_pos_of_pos_of_nonneg (fs r i hs k hik hkr) (np r k)
 · intro r i hr
   change coeff ((V+1)*p) r i+coeff p r i=0
   rw [bs r i hr,bp r i (by omega)]; rfl

end
end MathGKM.Markov
