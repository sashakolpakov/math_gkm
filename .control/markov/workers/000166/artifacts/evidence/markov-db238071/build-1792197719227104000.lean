import MarkovDenseCertificateMC9F
import Mathlib.Data.Nat.Digits.Lemmas
/-! Machine-authored db238071. Sound packed certificates for natural
coefficient convolution, with explicit no-carry and length hypotheses.
This does not yet flatten the four-variable Markov candidate. -/
namespace MathGKM.Markov

def natConvolutionMDB2 (a b : List ℕ) : List ℕ :=
 denseMulMC9F 0 Nat.add Nat.mul a b

theorem nat_dense_evalMDB2 (B : ℕ) (a : List ℕ) :
 denseEvalMC9F (fun k : ℕ => (k:ℚ)) B a = ((Nat.ofDigits B a:ℕ):ℚ) := by
 induction a with
 | nil => simp [denseEvalMC9F,Nat.ofDigits]
 | cons a as ih => simp only [denseEvalMC9F,Nat.ofDigits,ih,Nat.cast_add,Nat.cast_mul,Nat.cast_id]

theorem packed_convolution_evalMDB2 (B : ℕ) (a b : List ℕ) :
 Nat.ofDigits B (natConvolutionMDB2 a b)=Nat.ofDigits B a*Nat.ofDigits B b := by
 have h := dense_eval_mulMC9F (0:ℕ) Nat.add Nat.mul (fun k : ℕ => (k:ℚ))
   (by norm_num) (fun a b => by simp) (fun a b => by simp) (B:ℚ) a b
 simp only [nat_dense_evalMDB2] at h
 exact_mod_cast h

theorem convolution_sumMDB2 (a b : List ℕ) :
 (natConvolutionMDB2 a b).sum=a.sum*b.sum := by
 simpa only [Nat.ofDigits_one] using packed_convolution_evalMDB2 1 a b

theorem convolution_digit_boundMDB2 (B : ℕ) (a b : List ℕ)
 (h : a.sum*b.sum < B) : ∀ k ∈ natConvolutionMDB2 a b, k < B := by
 intro k hk
 have hle : k ≤ (natConvolutionMDB2 a b).sum := List.single_le_sum (fun _ _ => Nat.zero_le _) k hk
 rw [convolution_sumMDB2] at hle
 exact hle.trans_lt h

theorem packed_convolution_soundMDB2 (B : ℕ) (hB : 1 < B)
 (a b c : List ℕ) (hlen : (natConvolutionMDB2 a b).length=c.length)
 (hab : a.sum*b.sum < B) (hc : ∀ k ∈ c, k < B)
 (hpack : Nat.ofDigits B a*Nat.ofDigits B b=Nat.ofDigits B c) :
 natConvolutionMDB2 a b=c := by
 apply Nat.ofDigits_inj_of_len_eq hB hlen
 · exact convolution_digit_boundMDB2 B a b hab
 · exact hc
 · rw [packed_convolution_evalMDB2,hpack]

theorem packed_convolution_sum_soundMDB2 (B : ℕ) (hB : 1 < B)
 (a b c : List ℕ) (hlen : (natConvolutionMDB2 a b).length=c.length)
 (hab : a.sum*b.sum < B) (hc : c.sum < B)
 (hpack : Nat.ofDigits B a*Nat.ofDigits B b=Nat.ofDigits B c) :
 natConvolutionMDB2 a b=c := by
 apply packed_convolution_soundMDB2 B hB a b c hlen hab _ hpack
 intro k hk
 exact (List.single_le_sum (fun _ _ => Nat.zero_le _) k hk).trans_lt hc

end MathGKM.Markov
