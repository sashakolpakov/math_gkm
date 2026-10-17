import MarkovPackedConvolutionMDB2
/-! Machine-authored db238071. A semantic transport and a no-carry
counterexample. These are auxiliary arithmetic facts, not source witnesses. -/
namespace MathGKM.Markov

theorem packed_polynomial_transportMDB2 (B : ℕ) (hB : 1 < B)
 (a b c : List ℕ) (hlen : (natConvolutionMDB2 a b).length=c.length)
 (hab : a.sum*b.sum < B) (hc : ∀ k ∈ c, k < B)
 (hpack : Nat.ofDigits B a*Nat.ofDigits B b=Nat.ofDigits B c) (x : ℚ) :
 denseEvalMC9F (fun k : ℕ => (k:ℚ)) x c=
 denseEvalMC9F (fun k : ℕ => (k:ℚ)) x a *
 denseEvalMC9F (fun k : ℕ => (k:ℚ)) x b := by
 rw [←packed_convolution_soundMDB2 B hB a b c hlen hab hc hpack]
 exact dense_eval_mulMC9F 0 Nat.add Nat.mul _ (by norm_num)
   (fun a b => by simp) (fun a b => by simp) x a b

theorem packed_small_certificateMDB2 :
 natConvolutionMDB2 [3,2] [5,1]=[15,13,2] := by
 apply packed_convolution_sum_soundMDB2 64 (by decide)
   [3,2] [5,1] [15,13,2] <;> decide +kernel

/-- Equal lengths and bounded input/proposal digits do not suffice if the
actual convolution carries. The product coefficient bound cannot be omitted. -/
theorem packed_carry_obstructionMDB2 :
 (natConvolutionMDB2 [9,0] [9]).length=([1,8]:List ℕ).length ∧
 (∀ k ∈ ([9,0]:List ℕ), k<10) ∧ (∀ k ∈ ([9]:List ℕ), k<10) ∧
 (∀ k ∈ ([1,8]:List ℕ), k<10) ∧
 Nat.ofDigits (10:ℕ) [9,0]*Nat.ofDigits (10:ℕ) [9]=Nat.ofDigits (10:ℕ) [1,8] ∧
 natConvolutionMDB2 [9,0] [9]≠[1,8] := by decide +kernel

end MathGKM.Markov
