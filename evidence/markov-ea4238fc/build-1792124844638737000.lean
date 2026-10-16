import MarkovHorizontalSupportMEA423

/-! Machine-authored ea4238fc. Positive two-state recurrence with aligned
row-support endpoints, for every word. Log-concavity remains separate. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

def hpairMEA423 (m : Mat16 BiPoly) : BiPoly × BiPoly :=
 (m.a+m.c,hdiffM511 m)

def hstepMEA423 (z : BiPoly × BiPoly) (r : Bool) : BiPoly × BiPoly :=
 if r then
  (U*((V+1)^2*z.1+V*(V+2)*z.2)+U^2*((V+1)^3*z.1+V*(V+1)^2*z.2),
   V*(z.1+z.2)+U*((V+1)^2*z.1+V*(V+1)*z.2))
 else (U*((V+1)*z.1+V*z.2),z.1+z.2)

theorem hpair_mulMEA423 (m : Mat16 BiPoly) (r : Bool) :
 hpairMEA423 (mm16 m (hKletterM511 (X:ℤ[X]) r))=hstepMEA423 (hpairMEA423 m) r := by
 cases r <;> simp only [hpairMEA423,hstepMEA423,hKletterM511,hdiffM511,mm16,
   Bool.false_eq_true,ite_false,ite_true,U,V,map_add,map_mul,map_pow,map_one,map_ofNat]
 all_goals constructor <;> ring

theorem hgood_stepMEA423 {a : ℕ} {z : BiPoly × BiPoly}
 (hf : HGoodMEA423 a z.1) (hh : HGoodMEA423 a z.2) (r : Bool) :
 HGoodMEA423 (a+if r then 1 else 0) (hstepMEA423 z r).1 ∧
 HGoodMEA423 (a+if r then 1 else 0) (hstepMEA423 z r).2 := by
 cases r
 · simp only [hstepMEA423,Bool.false_eq_true,ite_false,Nat.add_zero]
   exact ⟨hgood_UMEA423 (hgood_addMEA423 (hgood_smoothMEA423 hf) (hgood_VMEA423 hh)),
     hgood_addMEA423 hf hh⟩
 · simp only [hstepMEA423,ite_true]
   have hf2 := hgood_smoothMEA423 (hgood_smoothMEA423 hf)
   have hh2 := hgood_VMEA423 (hgood_smooth_twoMEA423 hh)
   have hf3 := hgood_smoothMEA423 hf2
   have hh3 := hgood_VMEA423 (hgood_smoothMEA423 (hgood_smoothMEA423 hh))
   have hfirst := hgood_addMEA423
     (hgood_UMEA423 (hgood_addMEA423 hf2 hh2))
     (hgood_UMEA423 (hgood_UMEA423 (hgood_addMEA423 hf3 hh3)))
   have hsecond := hgood_addMEA423 (hgood_VMEA423 (hgood_addMEA423 hf hh))
     (hgood_UMEA423 (hgood_addMEA423 hf2 (hgood_VMEA423 (hgood_smoothMEA423 hh))))
   constructor
   · convert hfirst using 1 <;> ring
   · convert hsecond using 1 <;> ring

theorem hpair_word_goodMEA423 (w : List Bool) :
 HGoodMEA423 (w.count true) (hpairMEA423 (hKwordM511 (X:ℤ[X]) w)).1 ∧
 HGoodMEA423 (w.count true) (hpairMEA423 (hKwordM511 (X:ℤ[X]) w)).2 := by
 induction w using List.reverseRecOn with
 | nil =>
   simpa [hpairMEA423,hKwordM511,projProduct6905,hdiffM511] using
     And.intro hgood_oneMEA423 (hgood_zeroMEA423 0)
 | append_singleton r w ih =>
   have he : hKwordM511 (X:ℤ[X]) (w++[r])=
       mm16 (hKwordM511 (X:ℤ[X]) w) (hKletterM511 (X:ℤ[X]) r) := by
     simp only [hKwordM511,List.map_append,List.map_cons,List.map_nil,
       projProduct_append6905,projProduct_single6905]
   rw [he,hpair_mulMEA423]
   have hs := hgood_stepMEA423 ih.1 ih.2 r
   cases r <;> simpa using hs

theorem horizontal_residual_goodMEA423 (path : List Bool) :
 HGoodMEA423 (frame path).mid.a
   (hdiffM511 (hKwordM511 (X:ℤ[X]) (sourceWord28 path))) := by
 have h := (hpair_word_goodMEA423 (sourceWord28 path)).2
 rw [(source_word_counts28 path).1] at h
 exact h

theorem horizontal_residual_filledMEA423 (path : List Bool) (r i k : ℕ)
 (hi : 0<(hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff i)
 (hik : i≤k) (hkr : k≤r+(frame path).mid.a) :
 0<(hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff k := by
 rw [hresidual_diffM511] at hi ⊢
 exact (horizontal_residual_goodMEA423 path).2.1 r i hi k hik hkr

theorem horizontal_residual_boundMEA423 (path : List Bool) (r i : ℕ)
 (hi : r+(frame path).mid.a<i) :
 (hresidualM511 (X:ℤ[X]) (sourceWord28 path) r).coeff i=0 := by
 rw [hresidual_diffM511]
 exact (horizontal_residual_goodMEA423 path).2.2 r i hi

end
end MathGKM.Markov
