import MarkovFourthJet01F
import MarkovTwoRunCorrection8BBB
/-! Machine-authored live request 01f51d63. The boundary term and exact
determinant correction in the fourth trace cumulant. Small cycles are retained. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

def transpose01F (m : Mat16 R[X]) : Mat16 R[X] := ⟨m.a,m.c,m.b,m.d⟩
theorem transpose_mul01F (m n : Mat16 R[X]) :
 transpose01F (mm16 m n)=mm16 (transpose01F n) (transpose01F m) := by
 apply Mat16.ext <;> simp [transpose01F,mm16] <;> ring
theorem transpose_product01F (w : List (Mat16 R[X])) :
 projProduct6905 (w.reverse.map transpose01F)=transpose01F (projProduct6905 w) := by
 induction w with
 | nil => rfl
 | cons m ms ih =>
   simp only [List.reverse_cons,List.map_append,List.map_cons,List.map_nil,
     projProduct_append6905,projProduct_single6905,ih,projProduct6905,transpose_mul01F]
theorem transpose_shape01F (m : Mat16 R[X]) (h : Projection6905 m) :
 Projection6905 (transpose01F m) := ⟨h.1,h.2.2.1,h.2.1,h.2.2.2⟩

def boundaryFour01F (r1 r2 r3 l1 l2 l3 : R) : R :=
 24*(r1*l3+r2*l2+r3*l1)-12*(r1*l1)^2
def determinantFour01F (d1 d2 r1 l1 e2 e3 e4 : R) : R :=
 24*(e4-2*d1*e3+(3*d1^2-2*d2)*e2)-24*r1*l1*e2-12*e2^2

theorem trace_four_boundary01F (m : Mat16 R[X])
 (hm : Projection6905 m) (ha : m.a.coeff 1=0) :
 logFour01F (tr16 m)=logFour01F m.d+
 boundaryFour01F (ratioOne01F m.b m.d) (ratioTwo01F m.b m.d) (ratioThree01F m.b m.d)
   (ratioOne01F m.c m.d) (ratioTwo01F m.c m.d) (ratioThree01F m.c m.d)+
 determinantFour01F (m.d.coeff 1) (m.d.coeff 2) (m.b.coeff 1) (m.c.coeff 1)
   ((det16 m).coeff 2) ((det16 m).coeff 3) ((det16 m).coeff 4) := by
 obtain ⟨ma,mb,mc,md⟩ := hm
 simp only [logFour01F,tr16,boundaryFour01F,determinantFour01F,
   ratioOne01F,ratioTwo01F,ratioThree01F,det16,Polynomial.coeff_add,
   Polynomial.coeff_sub,coeff_mul_two8934,coeff_mul_three6905,coeff_mul_four01F,
   ma,mb,mc,md,ha]
 ring

def cyclicFour01F (w : List (Mat16 R[X])) : R :=
 let v := w.reverse.map transpose01F
 openFour01F w+boundaryFour01F (headRatioOne01F w) (headRatioTwo01F w)
   (headRatioThree01F w) (headRatioOne01F v) (headRatioTwo01F v) (headRatioThree01F v)

theorem product_trace_four01F (m n : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::ms,Projection6905 z) :
 let w := m::n::ms
 let p := projProduct6905 w
 logFour01F (tr16 p)=cyclicFour01F w+
 determinantFour01F (p.d.coeff 1) (p.d.coeff 2)
   (headRatioOne01F w) (headRatioOne01F (w.reverse.map transpose01F))
   ((det16 p).coeff 2) ((det16 p).coeff 3) ((det16 p).coeff 4) := by
 dsimp only
 have ht : ∀ z∈n::ms,Projection6905 z := by intro z hz; exact h z (by simp_all)
 have hp := projProduct_shape6905 m (n::ms) h
 have ha := (projection_mul_jets6905 m (projProduct6905 (n::ms))
   (h m (by simp)) (projProduct_shape6905 n ms ht)).a1
 have hr := product_ratios01F (m::n::ms) h
 have hv : ∀ z∈(m::n::ms).reverse.map transpose01F,Projection6905 z := by
   intro z hz
   obtain ⟨q,hq,rfl⟩ := List.mem_map.mp hz
   exact transpose_shape01F q (h q (List.mem_reverse.mp hq))
 have hl := product_ratios01F ((m::n::ms).reverse.map transpose01F) hv
 rw [transpose_product01F] at hl
 simp only [transpose01F] at hl
 have he := trace_four_boundary01F (projProduct6905 (m::n::ms)) hp ha
 rw [product_openFour01F _ h,hr.1,hr.2.1,hr.2.2,hl.1,hl.2.1,hl.2.2] at he
 change _=_ at he
 simpa only [cyclicFour01F,ratioOne01F] using he

theorem product_det_power01F (w : List (Mat16 R[X]))
 (h : ∀ m∈w,Projection6905 m) : X^w.length ∣ det16 (projProduct6905 w) := by
 induction w with
 | nil => simp
 | cons m ms ih =>
   have hm := h m (by simp)
   have ht : ∀ z∈ms,Projection6905 z := by intro z hz; exact h z (by simp [hz])
   have hd : X ∣ det16 m := Polynomial.X_dvd_iff.mpr (by
     simp [det16,Polynomial.mul_coeff_zero,hm.1,hm.2.1,hm.2.2.1])
   simpa only [List.length_cons,projProduct6905,det_mul16,pow_succ',pow_one] using
     mul_dvd_mul hd (ih ht)

theorem product_trace_four_long01F (m n : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::ms,Projection6905 z) (hlen : 5≤(m::n::ms).length) :
 logFour01F (tr16 (projProduct6905 (m::n::ms)))=cyclicFour01F (m::n::ms) := by
 have hd := Polynomial.X_pow_dvd_iff.mp (product_det_power01F (m::n::ms) h)
 have hh := product_trace_four01F m n ms h
 dsimp only at hh
 rw [hd 2 (by omega),hd 3 (by omega),hd 4 (by omega)] at hh
 simpa [determinantFour01F] using hh

end
end MathGKM.Markov
