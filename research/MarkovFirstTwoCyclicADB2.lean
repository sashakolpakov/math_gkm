import MarkovCyclicMoments6905
/-! Machine-authored request adb2c7b0. First/second trace moments for the
same ordered projection blocks used by the cubic theorem. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]

theorem projection_trace1ADB2 (m n : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::ms, Projection6905 z) :
 (tr16 (projProduct6905 (m::n::ms))).coeff 1=sumD6905 (m::n::ms) := by
 simp only [tr16,Polynomial.coeff_add,projProduct_a16905 m n ms h,
   (projProduct_summary6905 m (n::ms) h).2.2.1,zero_add]

theorem projection_trace2ADB2 (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::(ms++[p,q]), Projection6905 z) :
 2*(tr16 (projProduct6905 (m::n::(ms++[p,q])))).coeff 2=
 (sumD6905 (m::n::(ms++[p,q])))^2+cyclicK6905 m n ms p q := by
 have hn : ∀ z∈n::(ms++[p,q]),Projection6905 z := by
   intro z hz; exact h z (List.mem_cons_of_mem m hz)
 have ha : (projProduct6905 (n::(ms++[p,q]))).a.coeff 1=0 := by
   cases ms with
   | nil => exact projProduct_a16905 n p [q] hn
   | cons k ks => exact projProduct_a16905 n k (ks++[p,q]) hn
 have hc : (projProduct6905 (n::(ms++[p,q]))).c.coeff 1=q.c.coeff 1 := by
   rw [projProduct_c16905 n _ hn]
   simpa only [List.cons_append,List.append_assoc,List.nil_append] using
     lastC_append6905 (n::(ms++[p])) q
 have hj := (projection_mul_jets6905 m (projProduct6905 (n::(ms++[p,q])))
   (h m (by simp)) (projProduct_shape6905 n _ hn)).a2
 rw [ha,hc] at hj
 have hd := (projProduct_summary6905 m (n::(ms++[p,q])) h).2.2.2.1
 have he := elementary2_newton6905 (m::n::(ms++[p,q]))
 simp only [tr16,Polynomial.coeff_add]
 rw [hd]
 change 2*((mm16 m _).a.coeff 2+_)=_
 rw [hj,score2_clusters6905]
 unfold cyclicK6905
 linear_combination he

#print axioms projection_trace1ADB2
#print axioms projection_trace2ADB2
end
end MathGKM.Markov
