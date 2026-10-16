import MarkovVerticalCandidateBridgeMDE6
import MarkovUnique098
/-! Machine-authored 7584c5d0. Second source moments need only three letters. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 6000000
set_option linter.unusedSimpArgs false

theorem hsource_moments_twoM758 {R : Type*} [CommRing R]
 (g : Bool → Mat16 R[X]) (hg : ∀ r, Projection6905 (g r))
 (path : List Bool) (hb : 3 ≤ (frame path).mid.b) :
 let T := tr16 (projProduct6905 ((sourceWord28 path).map g))
 let D := hsourceMomentM13D (fun p _ _ => (g p).d.coeff 1) path
 let K := hsourceMomentM13D (fun p q r => hlocalKM13D (g p) (g q) (g r)) path
 T.coeff 0=1 ∧ T.coeff 1=D ∧ 2*T.coeff 2=D^2+K := by
 by_cases hb4 : 4 ≤ (frame path).mid.b
 · obtain ⟨h0,h1,h2,_⟩ := hsource_momentsM13D g hg path hb4
   exact ⟨h0,h1,h2⟩
 have hb3 : (frame path).mid.b=3 := by omega
 obtain ⟨ha0,hab,_⟩ := frame_reduced path
 have ha : (frame path).mid.a=1 ∨ (frame path).mid.a=2 := by omega
 have hpath : path=[false] ∨ path=[true] := by
   rcases ha with ha|ha
   · left; exact frame_path_injective_098 (ha.trans (by decide)) (hb3.trans (by decide))
   · right; exact frame_path_injective_098 (ha.trans (by decide)) (hb3.trans (by decide))
 obtain ⟨ha,hb,hc,hd⟩ := hg false
 obtain ⟨ha',hb',hc',hd'⟩ := hg true
 rcases hpath with rfl|rfl
 all_goals
   dsimp only
   refine ⟨?_,?_,?_⟩
   all_goals
     norm_num [sourceWord28,wordPairStep774,projProduct6905,tr16,mm16,
       hsourceMomentM13D,boolMomentADB2,boolJetADB2,hlocalKM13D,hsingleKM13D,
       frame,initial,advance,Polynomial.coeff_add,Polynomial.mul_coeff_zero,
       coeff_mul_one46,coeff_mul_two8934,ha,hb,hc,hd,ha',hb',hc',hd']
     <;> ring
end
end MathGKM.Markov
