import MarkovSourceUpperM2B3
import MarkovTwoReductionM679
/-! Machine-authored 0d346fa7. An exact sufficient region split for each
numerator-two vertical column i≥4. No sign hypothesis is silently assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def VerticalRegionsM0D3 (i : ℕ) : Prop :=
 (∀ j d, lowerValM58E j (d+2) i*lowerValM58E (j+2) d i ≤
    lowerValM58E (j+1) (d+1) i^2) ∧
 (∀ N d, i≤N+2 →
    upperValM2B3 (N+2) (d+1) i*upperValM2B3 N (d+3) i ≤
    upperValM2B3 (N+1) (d+2) i^2) ∧
 (∀ q, i≤q+1 → lowerValM58E (q-1) 1 i*upperValM2B3 (q-1) 1 i ≤
    lowerValM58E q 0 i^2) ∧
 (∀ q, i≤q → lowerValM58E q 0 i*upperValM2B3 (q-2) 2 i ≤
    upperValM2B3 (q-1) 1 i^2)

theorem source_two_vertical_regionsM0D3 (i : ℕ) (hi : 4 ≤ i)
 (h : VerticalRegionsM0D3 i) (path : List Bool) (ha : (frame path).mid.a=2)
 (j : ℕ) : coeff (frame path).mid.p i j*coeff (frame path).mid.p i (j+2) ≤
   coeff (frame path).mid.p i (j+1)^2 := by
 obtain ⟨q,hq,hb,_⟩ := source_two_squares3556 path ha
 by_cases hp : InPolygon (frame path).mid.a (frame path).mid.b i (j+2)
 · have ht : i+j≤2*q := by
     have ht := hp.2
     rw [ha,hb] at ht
     omega
   have hl (s d : ℕ) (he : s+d=q) :
     coeff (frame path).mid.p i s=lowerValM58E s d i :=
       source_two_lower_formulaM58E path s d i ha (by rw [he]; exact hb)
   have hu (N d : ℕ) (hN : 1≤N) (hd : 1≤d) (he : N+d=q) :
     coeff (frame path).mid.p i (N+2*d)=upperValM2B3 N d i :=
       source_two_upper_formulaM2B3 path N d i hN hd ha (by rw [he]; exact hb)
   by_cases hj : j+2≤q
   · obtain ⟨d,hd⟩ : ∃ d, q=j+d+2 := ⟨q-j-2,by omega⟩
     rw [hl j (d+2) (by omega),hl (j+2) d (by omega),hl (j+1) (d+1) (by omega)]
     exact h.1 j d
   by_cases he : j+1=q
   · rw [hl j 1 (by omega),hl (j+1) 0 (by omega)]
     have hh := hu (q-1) 1 (by omega) (by omega) (by omega)
     rw [show q-1+2*1=j+2 by omega] at hh
     rw [hh]
     simpa only [show q=j+1 by omega,Nat.add_sub_cancel] using h.2.2.1 q (by omega)
   by_cases he' : j=q
   · subst j
     rw [hl q 0 (by omega)]
     have h1 := hu (q-1) 1 (by omega) (by omega) (by omega)
     have h2 := hu (q-2) 2 (by omega) (by omega) (by omega)
     rw [show q-1+2*1=q+1 by omega] at h1
     rw [show q-2+2*2=q+2 by omega] at h2
     rw [h1,h2]
     exact h.2.2.2 q (by omega)
   · let N := 2*q-j-2
     let d := j-q-1
     have hN : i≤N+2 := by dsimp [N]; omega
     have he0 : N+2+(d+1)=q := by dsimp [N,d]; omega
     have he1 : N+1+(d+2)=q := by dsimp [N,d]; omega
     have he2 : N+(d+3)=q := by dsimp [N,d]; omega
     have h0 := hu (N+2) (d+1) (by omega) (by omega) he0
     have h1 := hu (N+1) (d+2) (by omega) (by omega) he1
     have h2 := hu N (d+3) (by omega) (by omega) he2
     rw [show N+2+2*(d+1)=j by dsimp [N,d]; omega] at h0
     rw [show N+1+2*(d+2)=j+1 by dsimp [N,d]; omega] at h1
     rw [show N+2*(d+3)=j+2 by dsimp [N,d]; omega] at h2
     rw [h0,h1,h2]
     exact h.2.1 N d hN
 · rw [raw_outside_polygon18 path i (j+2) hp,mul_zero]
   exact sq_nonneg _

end
end MathGKM.Markov
