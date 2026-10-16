import MarkovThreeTransferM9E2
/-! Machine-authored 96ada19b. Division-free addition and tripling identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem fib_pair_addM96A {R : Type*} [CommRing R] (u v : R) (m n : ℕ) :
 u*(fibPairM9E2 u v (m+n)).1=
   u*(fibPairM9E2 u v m).1*(fibPairM9E2 u v n).1+
   (fibPairM9E2 u v m).2*(fibPairM9E2 u v n).2 ∧
 u*(fibPairM9E2 u v (m+n)).2=
   u*(fibPairM9E2 u v m).2*(fibPairM9E2 u v n).1+
   u*(fibPairM9E2 u v m).1*(fibPairM9E2 u v n).2+
   (1-u-v)*(fibPairM9E2 u v m).2*(fibPairM9E2 u v n).2 := by
 induction n with
 | zero => simp [fibPairM9E2]
 | succ n ih =>
   simp only [Nat.add_succ,fibPairM9E2]
   constructor
   · linear_combination (u+v)*ih.1+ih.2
   · linear_combination u*ih.1+ih.2

theorem fib_pair_detM96A {R : Type*} [CommRing R] (u v : R) (n : ℕ) :
 u*(fibPairM9E2 u v n).1^2+
 (1-u-v)*(fibPairM9E2 u v n).1*(fibPairM9E2 u v n).2-
 (fibPairM9E2 u v n).2^2=u*v^n := by
 induction n with
 | zero => simp [fibPairM9E2]
 | succ n ih =>
   simp only [fibPairM9E2,pow_succ]
   linear_combination v*ih

theorem fib_pair_tripleM96A {R : Type*} [CommRing R] (u v : R) (n : ℕ) :
 u^2*(fibPairM9E2 u v (3*n)).1=
   u^2*(fibPairM9E2 u v n).1^3+
   3*u*(fibPairM9E2 u v n).1*(fibPairM9E2 u v n).2^2+
   (1-u-v)*(fibPairM9E2 u v n).2^3 ∧
 u^2*(fibPairM9E2 u v (3*n)).2=
   3*u^2*(fibPairM9E2 u v n).1^2*(fibPairM9E2 u v n).2+
   3*u*(1-u-v)*(fibPairM9E2 u v n).1*(fibPairM9E2 u v n).2^2+
   ((1-u-v)^2+u)*(fibPairM9E2 u v n).2^3 := by
 have h2 := fib_pair_addM96A u v n n
 have h3 := fib_pair_addM96A u v (n+n) n
 rw [show n+n+n=3*n by omega] at h3
 constructor
 · linear_combination u*h3.1+u*(fibPairM9E2 u v n).1*h2.1+
     (fibPairM9E2 u v n).2*h2.2
 · linear_combination u*h3.2+u*(fibPairM9E2 u v n).2*h2.1+
     (u*(fibPairM9E2 u v n).1+(1-u-v)*(fibPairM9E2 u v n).2)*h2.2

end
end MathGKM.Markov
