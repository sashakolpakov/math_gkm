import MarkovPairTransport89ce
import MarkovDegreeTail7d90
/-! Machine-authored 89ce11ad. Exact degree-array and literal source bridge
for the transport certificate. Universal certificate existence is not proved. -/
namespace MathGKM.Markov
noncomputable section
open Finset Polynomial
set_option maxHeartbeats 2000000

def pairGap89 (A B C : ℕ → ℝ) (x : ℕ × ℕ) : ℝ :=
 2*B x.1*B x.2-A x.1*C x.2-A x.2*C x.1

theorem pairGap_sum89 (D : Finset ℕ) (A B C w : ℕ → ℝ) :
 (∑ x∈D.product D,pairGap89 A B C x*(w x.1*w x.2))=
 2*((∑ d∈D,B d*w d)^2-(∑ d∈D,A d*w d)*(∑ d∈D,C d*w d)) := by
 rw [←Finset.sum_product']
 simp only [pairGap89]
 have he (d e : ℕ) :
   (2*B d*B e-A d*C e-A e*C d)*(w d*w e)=
   2*(B d*w d)*(B e*w e)-(A d*w d)*(C e*w e)-(C d*w d)*(A e*w e) := by ring
 simp_rw [he]
 simp only [Finset.sum_sub_distrib,←Finset.mul_sum,←Finset.sum_mul]
 ring

theorem weighted_array_lc_of_transport89 (D : Finset ℕ) (A B C : ℕ → ℝ)
 (R : ℕ × ℕ → ℝ) (M : (ℕ × ℕ) → (ℕ × ℕ) → ℝ)
 (hnR : ∀ x∈D.product D,0≤R x)
 (hnM : ∀ x∈D.product D,∀ y∈D.product D,0≤M x y)
 (ho : ∀ x∈D.product D,∀ y∈D.product D,M x y≠0 → DegreePairLE89 x y)
 (hid : ∀ x∈D.product D,pairGap89 A B C x=
   R x+(∑ y∈D.product D,M y x)-(∑ y∈D.product D,M x y))
 (w : ℕ → ℝ) (hn : ∀ i,0≤w i) (hm : Monotone w)
 (ha : ∀ i,w i*w (i+2)≤w (i+1)^2) :
 (∑ d∈D,A d*w d)*(∑ d∈D,C d*w d)≤(∑ d∈D,B d*w d)^2 := by
 have h := degree_transport_nonneg89 (D.product D) (pairGap89 A B C) R M
   hnR hnM ho hid w hn hm ha
 rw [pairGap_sum89] at h
 linarith

def HasDegreeTransport89 (D : Finset ℕ) (A B C : ℕ → ℝ) : Prop :=
 ∃ (R : ℕ × ℕ → ℝ) (M : (ℕ × ℕ) → (ℕ × ℕ) → ℝ),
 (∀ x∈D.product D,0≤R x) ∧
 (∀ x∈D.product D,∀ y∈D.product D,0≤M x y) ∧
 (∀ x∈D.product D,∀ y∈D.product D,M x y≠0 → DegreePairLE89 x y) ∧
 (∀ x∈D.product D,pairGap89 A B C x=
   R x+(∑ y∈D.product D,M y x)-(∑ y∈D.product D,M x y))

theorem marked_diagonal_of_transport89 (word : List Bool) (s j N : ℕ)
 (hN : ∀ t≤2,(markedCoeff7d word s (j+t)).natDegree<N)
 (hT : HasDegreeTransport89 (range N)
   (fun d => (markedCoeff7d word s j).coeff d)
   (fun d => (markedCoeff7d word s (j+1)).coeff d)
   (fun d => (markedCoeff7d word s (j+2)).coeff d)) :
 (markedCoeff7d word s j).eval 1*(markedCoeff7d word s (j+2)).eval 1≤
   ((markedCoeff7d word s (j+1)).eval 1)^2 := by
 obtain ⟨R,M,hnR,hnM,ho,hid⟩ := hT
 have h := weighted_array_lc_of_transport89 (range N) _ _ _ R M hnR hnM ho hid
   (fun _ => 1) (by intro i;norm_num) (by intro i k hik;rfl)
   (by intro i;norm_num)
 have he (t : ℕ) (ht : t≤2) :
   (markedCoeff7d word s (j+t)).eval 1=
     ∑ d∈range N,(markedCoeff7d word s (j+t)).coeff d := by
  rw [Polynomial.eval_eq_sum_range' (show (markedCoeff7d word s (j+t)).natDegree<N from hN t ht)]
  simp
 have he0 := he 0 (by omega)
 simp only [Nat.add_zero] at he0
 simpa only [mul_one,←he0,←he 1 (by omega),←he 2 (by omega)] using h

theorem source_diagonal_of_transport89 (path : List Bool) (i j s N : ℕ)
 (hs : i+j+2=(frame path).mid.a+s)
 (hN : ∀ t≤2,(markedCoeff7d (central28 path++[true]) s (j+t)).natDegree<N)
 (hT : HasDegreeTransport89 (range N)
   (fun d => (degreeLayer07a7 (X:ℝ[X]) (central28 path++[true]) s d).coeff j)
   (fun d => (degreeLayer07a7 (X:ℝ[X]) (central28 path++[true]) s d).coeff (j+1))
   (fun d => (degreeLayer07a7 (X:ℝ[X]) (central28 path++[true]) s d).coeff (j+2))) :
 coeff (frame path).mid.p i (j+2)*coeff (frame path).mid.p (i+2) j≤
   coeff (frame path).mid.p (i+1) (j+1)^2 := by
 have hT' : HasDegreeTransport89 (range N)
   (fun d => (markedCoeff7d (central28 path++[true]) s j).coeff d)
   (fun d => (markedCoeff7d (central28 path++[true]) s (j+1)).coeff d)
   (fun d => (markedCoeff7d (central28 path++[true]) s (j+2)).coeff d) := by
  simpa only [markedCoeff_layer7d] using hT
 have h := marked_diagonal_of_transport89 _ s j N hN hT'
 rw [source_markedCoeff_at_one7d path (i+2) j s (by omega),
   source_markedCoeff_at_one7d path i (j+2) s (by omega),
   source_markedCoeff_at_one7d path (i+1) (j+1) s (by omega)] at h
 have h' : (coeff (frame path).mid.p i (j+2):ℝ)*
     (coeff (frame path).mid.p (i+2) j:ℝ)≤
     (coeff (frame path).mid.p (i+1) (j+1):ℝ)^2 := by simpa [mul_comm] using h
 exact_mod_cast h'

#print axioms pairGap_sum89
#print axioms weighted_array_lc_of_transport89
#print axioms source_diagonal_of_transport89
end
end MathGKM.Markov
