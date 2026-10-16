import MathGKM.Markov
/-! Machine-authored 3a11314d. Exact polynomial telescoping, no fitted identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

def centralTerm2M3A1 (N t : ℤ) : ℤ :=
 -1*t - 1*t^2 + 1*N + 1*N*t

def centralAnti2M3A1 (N t : ℤ) : ℤ :=
 2*t - 2*t^3 + 3*N*t + 3*N*t^2

theorem central_delta2M3A1 (N t : ℤ) :
 centralAnti2M3A1 N (t+1)-centralAnti2M3A1 N t=6*centralTerm2M3A1 N t := by
 unfold centralAnti2M3A1 centralTerm2M3A1
 ring

theorem central_sum2M3A1 (n : ℕ) :
 6*(∑ t∈Finset.range (n+1), centralTerm2M3A1 (n+1) t)=
 ((n:ℤ)+1)*((n:ℤ)+2)*((n:ℤ)+3) := by
 rw [Finset.mul_sum]
 have he (t : ℕ) : 6*centralTerm2M3A1 (n+1) t =
   centralAnti2M3A1 (n+1) (t+1)-centralAnti2M3A1 (n+1) t :=
   (central_delta2M3A1 _ _).symm
 simp_rw [he]
 have hh := Finset.sum_range_sub (fun t : ℕ => centralAnti2M3A1 (n+1) t) (n+1)
 push_cast at hh
 rw [hh]
 unfold centralAnti2M3A1
 push_cast
 ring

def centralTerm3M3A1 (N t : ℤ) : ℤ :=
 2*t + 4*t^2 + 4*t^3 + 2*t^4 - 2*N - 6*N*t - 8*N*t^2 - 4*N*t^3 + 2*N^2 + 4*N^2*t + 2*N^2*t^2

def centralAnti3M3A1 (N t : ℤ) : ℤ :=
 -6*t + 6*t^5 - 5*N*t - 10*N*t^3 - 15*N*t^4 + 5*N^2*t + 15*N^2*t^2 + 10*N^2*t^3

theorem central_delta3M3A1 (N t : ℤ) :
 centralAnti3M3A1 N (t+1)-centralAnti3M3A1 N t=15*centralTerm3M3A1 N t := by
 unfold centralAnti3M3A1 centralTerm3M3A1
 ring

theorem central_sum3M3A1 (n : ℕ) :
 15*(∑ t∈Finset.range (n+1), centralTerm3M3A1 (n+1) t)=
 (n:ℤ)*((n:ℤ)+1)*((n:ℤ)+2)*((n:ℤ)+3)*((n:ℤ)+4) := by
 rw [Finset.mul_sum]
 have he (t : ℕ) : 15*centralTerm3M3A1 (n+1) t =
   centralAnti3M3A1 (n+1) (t+1)-centralAnti3M3A1 (n+1) t :=
   (central_delta3M3A1 _ _).symm
 simp_rw [he]
 have hh := Finset.sum_range_sub (fun t : ℕ => centralAnti3M3A1 (n+1) t) (n+1)
 push_cast at hh
 rw [hh]
 unfold centralAnti3M3A1
 push_cast
 ring

def centralTerm4M3A1 (N t : ℤ) : ℤ :=
 -12*t - 32*t^2 - 45*t^3 - 35*t^4 - 15*t^5 - 5*t^6 + 12*N + 50*N*t + 93*N*t^2 + 85*N*t^3 + 45*N*t^4 + 15*N*t^5 - 18*N^2 - 54*N^2*t - 66*N^2*t^2 - 45*N^2*t^3 - 15*N^2*t^4 + 6*N^3 + 16*N^3*t + 15*N^3*t^2 + 5*N^3*t^3

def centralAnti4M3A1 (N t : ℤ) : ℤ :=
 48*t + 28*t^3 - 56*t^5 - 20*t^7 + 28*N*t - 42*N*t^2 + 98*N*t^3 + 140*N*t^4 + 42*N*t^5 + 70*N*t^6 - 42*N^2*t - 147*N^2*t^2 - 126*N^2*t^3 - 105*N^2*t^4 - 84*N^2*t^5 + 14*N^3*t + 49*N^3*t^2 + 70*N^3*t^3 + 35*N^3*t^4

theorem central_delta4M3A1 (N t : ℤ) :
 centralAnti4M3A1 N (t+1)-centralAnti4M3A1 N t=28*centralTerm4M3A1 N t := by
 unfold centralAnti4M3A1 centralTerm4M3A1
 ring

theorem central_sum4M3A1 (n : ℕ) :
 28*(∑ t∈Finset.range (n+1), centralTerm4M3A1 (n+1) t)=
 (n:ℤ)*((n:ℤ)-1)*((n:ℤ)+1)*((n:ℤ)+2)*((n:ℤ)+3)*((n:ℤ)+4)*((n:ℤ)+5) := by
 rw [Finset.mul_sum]
 have he (t : ℕ) : 28*centralTerm4M3A1 (n+1) t =
   centralAnti4M3A1 (n+1) (t+1)-centralAnti4M3A1 (n+1) t :=
   (central_delta4M3A1 _ _).symm
 simp_rw [he]
 have hh := Finset.sum_range_sub (fun t : ℕ => centralAnti4M3A1 (n+1) t) (n+1)
 push_cast at hh
 rw [hh]
 unfold centralAnti4M3A1
 push_cast
 ring

end
end MathGKM.Markov
