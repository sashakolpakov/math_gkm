import MarkovFibonacciAmbient77c2
import MarkovSourceAmbient77c2
/-! Machine-authored 77c26ca3. Exact source/polygon bridges for two
unbounded families of the stronger horizontal inequality. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem source_first_ambient77 (path : List Bool) (i : ℕ)
 (h0 : InPolygon (frame path).mid.a (frame path).mid.b i 1)
 (h2 : InPolygon (frame path).mid.a (frame path).mid.b (i+2) 1) :
 let m := (frame path).mid
 let s := i+1-m.a
 (s+2 : ℤ)*(m.b-1-s)*coeff m.p i 1*coeff m.p (i+2) 1 ≤
 (s+1 : ℤ)*(m.b-2-s)*coeff m.p (i+1) 1^2 := by
 let m := (frame path).mid
 have hi := frame_reduced path
 have hlow := h0.1
 have hupp := h2.2
 have hai : m.a ≤ i := by
   change m.a*m.b ≤ m.b*i+m.a*1 at hlow
   have hab : m.a < m.b := hi.2.1
   by_contra hh
   have := Nat.mul_le_mul_left m.b (show i+1 ≤ m.a by omega)
   nlinarith
 let k := i-m.a
 have hik : i=m.a+k := by dsimp [k]; omega
 have hb : 3 ≤ m.b := by dsimp [m] at *; omega
 have hk : k+3 ≤ m.b-1 := by dsimp [m,k] at *; omega
 have h := source_first_ambient_normalized77 path hb k hk
 have hh := normalized_to_scaled77 (m.b-1) (k+1) (by omega)
   (coeff m.p (m.a+k) 1) (coeff m.p (m.a+(k+1)) 1)
   (coeff m.p (m.a+(k+2)) 1) h
 have hb1 : 1 ≤ m.b := by omega
 have he : i+1-m.a=k+1 := by omega
 have hr : (k+3 : ℝ)*(m.b-k-2)* (coeff m.p i 1 : ℝ)*coeff m.p (i+2) 1 ≤
   (k+2 : ℝ)*(m.b-k-3)*(coeff m.p (i+1) 1 : ℝ)^2 := by
   simp only [Nat.cast_sub hb1,Nat.cast_add,Nat.cast_one] at hh
   rw [show m.a+k=i by omega,show m.a+(k+1)=i+1 by omega,
     show m.a+(k+2)=i+2 by omega] at hh
   nlinarith only [hh]
 dsimp only
 change ((i+1-m.a : ℕ)+2 : ℤ)*(m.b-1-(i+1-m.a : ℕ))*coeff m.p i 1*coeff m.p (i+2) 1 ≤
   ((i+1-m.a : ℕ)+1 : ℤ)*(m.b-2-(i+1-m.a : ℕ))*coeff m.p (i+1) 1^2
 rw [he]
 push_cast
 have hrZ : (k+3 : ℤ)*(m.b-k-2)*coeff m.p i 1*coeff m.p (i+2) 1 ≤
   (k+2 : ℤ)*(m.b-k-3)*coeff m.p (i+1) 1^2 := by exact_mod_cast hr
 nlinarith only [hrZ]

theorem source_one_ambient77 (path : List Bool) (ha : (frame path).mid.a=1)
 (i j : ℕ) (h0 : InPolygon 1 (frame path).mid.b i j)
 (h2 : InPolygon 1 (frame path).mid.b (i+2) j) :
 let m := (frame path).mid
 (i+j+1 : ℤ)*(m.b-i-j)*coeff m.p i j*coeff m.p (i+2) j ≤
 (i+j : ℤ)*(m.b-i-j-1)*coeff m.p (i+1) j^2 := by
 obtain ⟨n,rfl⟩ := source_one_spine274 path ha
 rw [spine_b6] at h0 h2
 have hl := h0.1
 have hu := h2.2
 have hip : 0 < i := by
   by_contra hh
   have : i=0 := by omega
   subst i
   simp only [Nat.mul_zero,Nat.one_mul,zero_add] at hl hu
   omega
 obtain ⟨r,rfl⟩ := Nat.exists_eq_succ_of_ne_zero (by omega : i≠0)
 let k := n+2-(r+3+j)
 have he : r+3+j+k=n+2 := by dsimp [k]; omega
 have h := fib_horizontal_ambient77 r j k
 dsimp only at h ⊢
 rw [source_fib6]
 rw [he] at h
 have hn : (n:ℤ)+2=(r:ℤ)+3+j+k := by exact_mod_cast he.symm
 rw [spine_b6]
 push_cast
 push_cast at h
 nlinarith only [h,hn]

#print axioms source_first_ambient77
#print axioms source_one_ambient77
end
end MathGKM.Markov
