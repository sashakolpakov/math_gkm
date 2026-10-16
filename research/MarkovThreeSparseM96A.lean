import MarkovFibAdditionM96A
/-! Machine-authored 96ada19b. Sparse exact numerator-three identities.
The discriminant has signed coefficients; no inequality follows by cancellation. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

def threeSparseM96A (q : ℕ) (r : Bool) : BiPoly :=
 if r then
 S^2*((U+V)^2-V)*fib6 (3*q+1)-S^2*V*(U+V-1)*fib6 (3*q)+
 4*U*V^(q+1)*(S*fib6 q+fib6 (q+1))
 else
 S^2*(U+V)*((U+V)^2+(U+V)-2*V)*fib6 (3*q+1)-
 S^2*V*((U+V)^2-V)*fib6 (3*q)+
 4*U*V^(q+1)*(V*fib6 q+S*fib6 (q+1))

theorem three_sparse_identityM96A (q : ℕ) (r : Bool) :
 (S^2-4*V)*threePolyM9E2 q r=threeSparseM96A q r := by
 apply mul_left_cancel₀ (pow_ne_zero 2 (show (U:BiPoly)≠0 from Polynomial.X_ne_zero))
 rw [three_positive_transferM9E2,cube_state_pairM9E2]
 have h3 := fib_pair_tripleM96A U V q
 have hd := fib_pair_detM96A U V q
 have hp (n : ℕ) : fib6 n=(fibPairM9E2 U V n).1 := (fib_pair_firstM9E2 n).symm
 simp only [threeSparseM96A,hp]
 have hf (n : ℕ) : (fibPairM9E2 U V (n+1)).1=
   (U+V)*(fibPairM9E2 U V n).1+(fibPairM9E2 U V n).2 := rfl
 rw [hf (3*q),hf q]
 cases r
 · simp only [Bool.false_eq_true,if_false,threeOutputM9E2,cubeVecM9E2,S,pow_succ]
   linear_combination
     -(U+V+1)^2*((U+V)^2*((U+V)^2+(U+V)-2*V)-V*((U+V)^2-V))*h3.1
     -(U+V+1)^2*(U+V)*((U+V)^2+(U+V)-2*V)*h3.2
     +4*U^2*V*(V*(fibPairM9E2 U V q).1+
       (U+V+1)*((U+V)*(fibPairM9E2 U V q).1+(fibPairM9E2 U V q).2))*hd
 · simp only [if_true,threeOutputM9E2,cubeVecM9E2,S,pow_succ]
   linear_combination
     -(U+V+1)^2*((U+V)*((U+V)^2-V)-V*(U+V-1))*h3.1
     -(U+V+1)^2*((U+V)^2-V)*h3.2
     +4*U^2*V*((U+V+1)*(fibPairM9E2 U V q).1+
       (U+V)*(fibPairM9E2 U V q).1+(fibPairM9E2 U V q).2)*hd

theorem three_sparse_differenceM96A (q : ℕ) (r : Bool) :
 threeSparseM96A q r=
 if r then
 S^2*(fib6 (3*q+3)-2*fib6 (3*q+2)+fib6 (3*q+1))+
 4*U*V^(q+1)*(S*fib6 q+fib6 (q+1))
 else
 S^2*(fib6 (3*q+4)-2*fib6 (3*q+3)+fib6 (3*q+2))+
 4*U*V^(q+1)*(V*fib6 q+S*fib6 (q+1)) := by
 have h2 := fib_rec6 (3*q)
 have h3 := fib_rec6 (3*q+1)
 have h4 := fib_rec6 (3*q+2)
 simp only [Nat.add_assoc] at h3 h4
 cases r <;> simp only [threeSparseM96A,Bool.false_eq_true,if_false,if_true]
 · rw [h4,h3,h2]; unfold S; ring
 · rw [h3,h2]; unfold S; ring

theorem source_three_sparseM96A (path : List Bool) (ha : (frame path).mid.a=3) :
 ∃ q r, 1≤q ∧ (frame path).mid.b=3*q+(if r then 1 else 2) ∧
   (S^2-4*V)*(frame path).mid.p=threeSparseM96A q r := by
 obtain ⟨q,r,hq,hb,hp⟩ := source_three_cubicM9E2 path ha
 exact ⟨q,r,hq,hb,by rw [hp,three_sparse_identityM96A]⟩

end
end MathGKM.Markov
