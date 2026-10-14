import MarkovQuinticExprE582

/-! Machine-authored request e5822cfc. Coarse universal quintic bounds. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 8000
set_option maxHeartbeats 3000000

def qaE582 (m : ℝ) := m*(m-1)*(m-2)*(m-3)*(m-4)
def qbE582 (n m s t h e : ℝ) :=
 -360+750*m-605*m^2+270*m^3-55*m^4+120*n-170*n*m+55*n*m^2-10*n*m^3+5*n*m^4-
 120*(m^2-3*m+3)*s+240*(m-1)*t+240*h+120*e
def qcE582 (n m s t k e f : ℝ) :=
 -1440+2040*m-1140*m^2+660*m^3+720*n-940*n*m-30*n*m^2-170*n*m^3+
 140*n^2*m+30*n^2*m^2+10*n^2*m^3-120*(2*m*(n-6)+9)*s+
 240*(n-5)*t-240*k-120*e+240*f
def qdE582 (n m s : ℝ) :=
 -720+420*m-1500*m^2+1320*n+670*n*m+950*n*m^2-720*n^2-420*n^2*m-
 180*n^2*m^2+120*n^3+50*n^3*m+10*n^3*m^2-120*(n-3)*(n-4)*s
def qeE582 (n m : ℝ) :=
 240*m-120*n-470*n*m+220*n^2+295*n^2*m-120*n^3-70*n^3*m+20*n^4+5*n^4*m
def qfE582 (n : ℝ) := (n+1)*n*(n-1)*(n-2)*(n-3)

theorem quintic_certificateE582 (x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 let m := x+9
 let n := m+y
 0 ≤ qbE582 n m (2*y) 0 0 0 ∧
 0 ≤ qcE582 n m (2*y) 0 (2*y) 2 0 ∧
 0 ≤ qdE582 n m (2*y) ∧
 0 ≤ qeE582 n m ∧
 0 ≤ qfE582 n ∧
 0 ≤ qbE582 n m (2*y) 0 0 0^2-qaE582 m*qcE582 n m 0 y 0 0 2 ∧
 0 ≤ qcE582 n m (2*y) 0 (2*y) 2 0^2-qbE582 n m 0 y y 2*qdE582 n m 0 ∧
 0 ≤ qdE582 n m (2*y)^2-qcE582 n m 0 y 0 0 2*qeE582 n m ∧
 0 ≤ qeE582 n m^2-qdE582 n m 0*qfE582 n := by
 dsimp
 unfold qaE582 qbE582 qcE582 qdE582 qeE582 qfE582
 repeat' constructor
 all_goals ring_nf; positivity

theorem quintic_inequalitiesE582 (n m s t h k e f : ℝ)
 (hm : 9 ≤ m) (hn : m ≤ n)
 (hs : 0 ≤ s) (hsu : s ≤ 2*(n-m))
 (ht : 0 ≤ t) (htu : t ≤ n-m)
 (hh : 0 ≤ h) (hhu : h ≤ n-m)
 (hk : 0 ≤ k) (hku : k ≤ 2*(n-m))
 (he : 0 ≤ e) (heu : e ≤ 2) (hf : 0 ≤ f) (hfu : f ≤ 2) :
 qaE582 m*qcE582 n m s t k e f ≤ qbE582 n m s t h e^2 ∧
 qbE582 n m s t h e*qdE582 n m s ≤ qcE582 n m s t k e f^2 ∧
 qcE582 n m s t k e f*qeE582 n m ≤ qdE582 n m s^2 ∧
 qdE582 n m s*qfE582 n ≤ qeE582 n m^2 := by
 have cert := quintic_certificateE582 (m-9) (n-m) (by linarith) (by linarith)
 dsimp at cert
 rw [show m-9+9=m by ring,show m+(n-m)=n by ring] at cert
 obtain ⟨bl,cl,dl,ep,fp,g1,g2,g3,g4⟩ := cert
 have mb : 0 ≤ m^2-3*m+3 := by nlinarith [sq_nonneg (m-2)]
 have mc : 0 ≤ 2*m*(n-6)+9 := by
   have hm0 : 0 ≤ m := by linarith
   have hn6 : 0 ≤ n-6 := by linarith
   positivity
 have md : 0 ≤ (n-3)*(n-4) := mul_nonneg (by linarith) (by linarith)
 have blo : qbE582 n m (2*(n-m)) 0 0 0 ≤ qbE582 n m s t h e := by
   unfold qbE582
   nlinarith [mul_nonneg mb (show 0 ≤ 2*(n-m)-s by linarith),
     mul_nonneg (show 0 ≤ m-1 by linarith) ht]
 have bup : qbE582 n m s t h e ≤ qbE582 n m 0 (n-m) (n-m) 2 := by
   unfold qbE582
   nlinarith [mul_nonneg mb hs,mul_nonneg (show 0 ≤ m-1 by linarith) (show 0 ≤ n-m-t by linarith)]
 have clo : qcE582 n m (2*(n-m)) 0 (2*(n-m)) 2 0 ≤ qcE582 n m s t k e f := by
   unfold qcE582
   nlinarith [mul_nonneg mc (show 0 ≤ 2*(n-m)-s by linarith),
     mul_nonneg (show 0 ≤ n-5 by linarith) ht]
 have cup : qcE582 n m s t k e f ≤ qcE582 n m 0 (n-m) 0 0 2 := by
   unfold qcE582
   nlinarith [mul_nonneg mc hs,mul_nonneg (show 0 ≤ n-5 by linarith) (show 0 ≤ n-m-t by linarith)]
 have dlo : qdE582 n m (2*(n-m)) ≤ qdE582 n m s := by
   unfold qdE582
   nlinarith [mul_nonneg md (show 0 ≤ 2*(n-m)-s by linarith)]
 have dup : qdE582 n m s ≤ qdE582 n m 0 := by
   unfold qdE582
   nlinarith [mul_nonneg md hs]
 have ap : 0 ≤ qaE582 m := by
   unfold qaE582
   have : 0 ≤ m-1 := by linarith
   have : 0 ≤ m-2 := by linarith
   have : 0 ≤ m-3 := by linarith
   have : 0 ≤ m-4 := by linarith
   positivity
 have bsq := (sq_le_sq₀ bl (le_trans bl blo)).mpr blo
 have csq := (sq_le_sq₀ cl (le_trans cl clo)).mpr clo
 have dsq := (sq_le_sq₀ dl (le_trans dl dlo)).mpr dlo
 have bd := mul_le_mul bup dup (le_trans dl dlo) (le_trans (le_trans bl blo) bup)
 exact ⟨by linarith [mul_le_mul_of_nonneg_left cup ap],
   by linarith,by linarith [mul_le_mul_of_nonneg_right cup ep],
   by linarith [mul_le_mul_of_nonneg_right dup fp]⟩

#print axioms quintic_inequalitiesE582
end
end MathGKM.Markov
