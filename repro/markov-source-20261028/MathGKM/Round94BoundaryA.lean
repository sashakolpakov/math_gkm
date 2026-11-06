import MathGKM.Round91AllocationsA
import MathGKM.Acceptedaed79cbb5bb7e8c70290df83

/- Machine-authored round94. Exact boundary cases of the fixed compensation
premise. No sign is assumed for either separate boundary class. -/
namespace CompensationR94
open BoundaryPolarisationR92 SparseCentralR91
noncomputable section
set_option maxHeartbeats 2000000

def W (n j i b : ℕ) : ℤ :=
  (n : ℤ)*(bulk (n-3) j (2*i+2) b (i+1)-bulk (n-3) j (2*i+2) b i)+
    2*(endpoint (n-3) j (2*i+2) b (i+1)-endpoint (n-3) j (2*i+2) b i)

theorem compensation_iff (n j i b : ℕ) (hn : 3 ≤ n) :
    0 ≤ W n j i b ↔
    (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card  ≤ 
      (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b (i+1)).card := by
  have he := Acceptedaed79cbb5bb7e8c70290df83.obligation.2.2 (n-3) j i b
  have hnat : n-3+3=n := by omega
  have hint : ((n-3 : ℕ):ℤ)+3=(n:ℤ) := by omega
  rw [hnat,hint] at he
  exact he

theorem zero_endpoint (n j i b : ℕ) (hn : 3 ≤ n)
    (hz : (PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card=0) :
    0 ≤ W n j i b := by
  apply (compensation_iff n j i b hn).2
  rw [hz]
  exact Nat.zero_le _

theorem mismatch (n j i b : ℕ) (hn : 3 ≤ n)
    (hout : 2*i+2+2*j+b+1 ≠ 4*n) : W n j i b=0 := by
  have hz := central_zero n 0 j i b (by omega) hout
  have he := BoundaryCompensationR93.card_increment (n-3) j (2*i+2) b i
  have hnat : n-3+3=n := by omega
  rw [hnat,hz.1,hz.2] at he
  have hint : ((n-3 : ℕ):ℤ)+3=(n:ℤ) := by omega
  simpa [W,BoundaryCompensationR93.increment,hint] using he.symm

theorem boundary_bundle (n j i b : ℕ) (hn : 3 ≤ n) :
    ((PairConvolutionR78.P (2*n) 0 j (2*i+2) 1 b i).card=0 → 0 ≤ W n j i b) ∧
    (2*i+2+2*j+b+1 ≠ 4*n → W n j i b=0) :=
  ⟨zero_endpoint n j i b hn,mismatch n j i b hn⟩
end
end CompensationR94
#print axioms CompensationR94.boundary_bundle
