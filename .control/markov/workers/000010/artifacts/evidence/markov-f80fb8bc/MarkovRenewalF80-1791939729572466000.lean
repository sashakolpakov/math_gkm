import MarkovGasF80

/-! Machine-authored worker f80fb8bc. Exact positive renewal expansion by
the first rank-one site. It applies to arbitrary words, with order retained. -/
namespace MathGKM.Markov
noncomputable section

def gasRow80 {R : Type*} [CommRing R] (u v t x y : R) (w : List Bool) : R :=
  let m := gasWord80 u v t w
  x*m.a+u*x*m.b+y*m.c+u*y*m.d

def gap80 {R : Type*} [CommRing R] (u x y : R) (w : List Bool) : R :=
  (if false ∈ w then 0 else x)+(if true ∈ w then 0 else u*y)

theorem gasRow_base80 {R : Type*} [CommRing R] (u v t : R) (w : List Bool) :
    gasRow80 u v t v 1 w=gasScalar80 u v t w := by
  simp [gasRow80,gasScalar80]; ring

theorem gasRow_cons80 {R : Type*} [CommRing R] (u v t x y : R)
    (r : Bool) (w : List Bool) :
    gasRow80 u v t x y (r::w)=
      (x+u*y)*gasScalar80 u v t w+
      gasRow80 u v t (if r then t*x else 0) (if r then 0 else t*y) w := by
  cases r <;> simp [gasRow80,gasScalar80,gasWord80,gasT80,mm16] <;> ring

theorem gap_cons80 {R : Type*} [CommRing R] (u t x y : R)
    (r : Bool) (w : List Bool) :
    gap80 u (if r then t*x else 0) (if r then 0 else t*y) w =
      t*gap80 u x y (r::w) := by
  cases r <;> by_cases hf : false ∈ w <;> by_cases ht : true ∈ w <;>
    simp [gap80,hf,ht] <;> ring

/-- Ordered renewal formula. Each cut is the first non-diagonal site;
the all-diagonal case is the separate first summand. -/
theorem gasRow_renewal80 {R : Type*} [CommRing R] (u v t x y : R)
    (w : List Bool) :
    gasRow80 u v t x y w =
      t^w.length*gap80 u x y w+
      ∑ k ∈ Finset.range w.length,
        t^k*gap80 u x y (w.take k)*gasScalar80 u v t (w.drop (k+1)) := by
  induction w generalizing x y with
  | nil => simp [gasRow80,gasWord80,gap80]
  | cons r rs ih =>
    rw [gasRow_cons80,ih]
    simp_rw [gap_cons80]
    rw [List.length_cons,Finset.sum_range_succ']
    simp only [List.take_zero,List.drop_succ_cons,List.drop_zero,
      List.take_succ_cons,pow_zero,gap80,List.not_mem_nil,if_false,one_mul]
    simp only [pow_succ]
    rw [Finset.mul_sum]
    ring

theorem gasScalar_renewal80 {R : Type*} [CommRing R] (u v t : R)
    (w : List Bool) :
    gasScalar80 u v t w =
      t^w.length*gap80 u v 1 w+
      ∑ k ∈ Finset.range w.length,
        t^k*gap80 u v 1 (w.take k)*gasScalar80 u v t (w.drop (k+1)) := by
  rw [← gasRow_base80]
  exact gasRow_renewal80 u v t v 1 w

#print axioms gasScalar_renewal80
end
end MathGKM.Markov
