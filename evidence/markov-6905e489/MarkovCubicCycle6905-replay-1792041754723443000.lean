import MarkovCubicClusters6905
/-! Machine-authored request 6905e489. Exact cyclic cubic expansion, including
the wrap terms. No large-cycle formula is asserted for lengths two or three. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]

theorem lastC_append6905 (ms : List (Mat16 R[X])) (n : Mat16 R[X]) :
 lastC6905 (ms++[n])=n.c.coeff 1 := by
 induction ms with
 | nil => rfl
 | cons m ms ih =>
   cases ms <;> simpa [lastC6905] using ih

theorem sumD_append6905 (ms ns : List (Mat16 R[X])) :
 sumD6905 (ms++ns)=sumD6905 ms+sumD6905 ns := by
 induction ms with
 | nil => simp [sumD6905]
 | cons m ms ih => simp [sumD6905,ih,add_assoc]

def cyclicCubic6905 (m n : Mat16 R[X]) (ms : List (Mat16 R[X])) (p q : Mat16 R[X]) : R :=
 let w := m::n::(ms++[p,q])
 single36905 w+mixed126905 w+elementary36905 w+
 pair36905 w+pairFar6905 w+triple36905 w+
 q.c.coeff 1*m.b.coeff 2+q.c.coeff 2*m.b.coeff 1+
 q.c.coeff 1*m.b.coeff 1*sumD6905 (n::(ms++[p]))+
 p.c.coeff 1*q.a.coeff 1*m.b.coeff 1+
 q.c.coeff 1*m.a.coeff 1*n.b.coeff 1

theorem projection_trace3_cyclic6905 (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::(ms++[p,q]), Projection6905 z) :
 (tr16 (projProduct6905 (m::n::(ms++[p,q])))).coeff 3=
 cyclicCubic6905 m n ms p q := by
 have hn : ∀ z∈(n::(ms++[p]))++[q], Projection6905 z := by
   intro z hz; apply h z
   simp only [List.mem_cons,List.mem_append,List.mem_singleton] at hz ⊢
   simp_all only [List.mem_cons,List.mem_nil_iff,or_false]
   tauto
 have hc2 := projProduct_c2_append6905 n q (ms++[p]) hn
 have he : (n::(ms++[p]))++[q]=n::(ms++[p,q]) := by simp
 rw [he] at hc2
 have hl : lastC6905 (n::(ms++[p]))=p.c.coeff 1 :=
   lastC_append6905 (n::ms) p
 rw [hl] at hc2
 have hlong : (tr16 (projProduct6905 (m::n::(ms++[p,q])))).coeff 3=
   score36905 (m::n::(ms++[p,q]))+
   m.a.coeff 1*n.b.coeff 1*q.c.coeff 1+
   m.b.coeff 1*(projProduct6905 (n::(ms++[p,q]))).c.coeff 2+
   m.b.coeff 2*q.c.coeff 1 := by
   have hc : lastC6905 (ms++[p,q])=q.c.coeff 1 := by
     simpa only [List.append_assoc,List.cons_append,List.nil_append] using
       lastC_append6905 (ms++[p]) q
   cases ms with
   | nil => simpa only [List.nil_append,lastC6905] using projection_trace3_long6905 m n p q [] h
   | cons k ks =>
     cases ks with
     | nil => simpa only [List.cons_append,List.nil_append,lastC6905] using
         projection_trace3_long6905 m n k p [q] h
     | cons l ls =>
       have hc1 : lastC6905 (k::l::(ls++[p,q]))=q.c.coeff 1 := hc
       simpa only [List.cons_append,hc1] using
         projection_trace3_long6905 m n k l (ls++[p,q]) h
 rw [hlong,hc2,score3_clusters6905]
 unfold cyclicCubic6905
 ring

#print axioms projection_trace3_cyclic6905
end
end MathGKM.Markov
