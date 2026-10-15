import MarkovFourthTrace01F
/-! Machine-authored 01f51d63. The fourth cyclic statistic is exactly a sum
of local four-matrix contributions. This identity explains the finite-memory
representation and does not assert source log-concavity. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem logFour_product_boundary01F (m n : Mat16 R[X])
 (hm : Projection6905 m) (hn : Projection6905 n) :
 logFour01F (mm16 m n).d=logFour01F m.d+logFour01F n.d+
 boundaryFour01F (ratioOne01F n.b n.d) (ratioTwo01F n.b n.d) (ratioThree01F n.b n.d)
   (ratioOne01F m.c m.d) (ratioTwo01F m.c m.d) (ratioThree01F m.c m.d) := by
 obtain ⟨ma,mb,mc,md⟩ := hm
 obtain ⟨na,nb,nc,nd⟩ := hn
 simp only [logFour01F,boundaryFour01F,ratioOne01F,ratioTwo01F,ratioThree01F,
   mm16,Polynomial.coeff_add,coeff_mul_one46,coeff_mul_two8934,coeff_mul_three6905,
   coeff_mul_four01F,ma,mb,mc,md,na,nb,nc,nd]
 ring

theorem head_ratio_take_three01F (w : List (Mat16 R[X])) :
 headRatioOne01F (w.take 3)=headRatioOne01F w ∧
 headRatioTwo01F (w.take 3)=headRatioTwo01F w ∧
 headRatioThree01F (w.take 3)=headRatioThree01F w := by
 cases w with
 | nil => simp [headRatioOne01F,headRatioTwo01F,headRatioThree01F]
 | cons m ms =>
   cases ms with
   | nil => simp [headRatioOne01F,headRatioTwo01F,headRatioThree01F]
   | cons n ns =>
     cases ns <;> simp [headRatioOne01F,headRatioTwo01F,headRatioThree01F]

theorem cyclic_four_append01F (m : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::ms,Projection6905 z) :
 cyclicFour01F (m::ms)=
 openFour01F ((m::ms)++(m::ms).take 3)-openFour01F ((m::ms).take 3) := by
 let w := m::ms
 have hw := projProduct_shape6905 m ms h
 have hp : ∀ z∈w.take 3,Projection6905 z := by
   intro z hz; exact h z (List.mem_of_mem_take hz)
 have hps : Projection6905 (projProduct6905 (w.take 3)) := by
   exact projProduct_shape6905 m (ms.take 2) hp
 have ht : ∀ z∈w.reverse.map transpose01F,Projection6905 z := by
   intro z hz
   obtain ⟨q,hq,rfl⟩ := List.mem_map.mp hz
   exact transpose_shape01F q (h q (List.mem_reverse.mp hq))
 have he := logFour_product_boundary01F (projProduct6905 w) (projProduct6905 (w.take 3)) hw hps
 obtain ⟨r1,r2,r3⟩ := product_ratios01F (w.take 3) hp
 obtain ⟨l1,l2,l3⟩ := product_ratios01F (w.reverse.map transpose01F) ht
 rw [transpose_product01F] at l1 l2 l3
 simp only [transpose01F] at l1 l2 l3
 have ha : ∀ z∈w++w.take 3,Projection6905 z := by
   intro z hz; rcases List.mem_append.mp hz with hz|hz
   · exact h z hz
   · exact hp z hz
 rw [←projProduct_append6905,product_openFour01F _ ha,
   product_openFour01F _ h,product_openFour01F _ hp,r1,r2,r3,l1,l2,l3] at he
 obtain ⟨e1,e2,e3⟩ := head_ratio_take_three01F w
 rw [e1,e2,e3] at he
 unfold cyclicFour01F
 change openFour01F w+boundaryFour01F _ _ _ _ _ _=_
 linear_combination -he

def localFourScan01F (tail : List (Mat16 R[X])) : List (Mat16 R[X]) → R
 | [] => 0
 | m::ms => localFour01F m (headRatioOne01F (ms++tail))
   (headRatioTwo01F (ms++tail)) (headRatioThree01F (ms++tail))+localFourScan01F tail ms

theorem localFourScan_append01F (w tail : List (Mat16 R[X])) :
 localFourScan01F tail w=openFour01F (w++tail)-openFour01F tail := by
 induction w with
 | nil => simp [localFourScan01F]
 | cons m ms ih => simp only [localFourScan01F,List.cons_append,openFour01F,ih]; ring

theorem cyclic_four_local01F (m : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::ms,Projection6905 z) :
 cyclicFour01F (m::ms)=localFourScan01F ((m::ms).take 3) (m::ms) := by
 rw [localFourScan_append01F,cyclic_four_append01F m ms h]

end
end MathGKM.Markov
