import MarkovPellSummand9a72
/-! Machine-authored 6a40862b. Exact binomial ratio identities, including
vanishing endpoint terms. Auxiliary to the signed-layer comparison. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
def bc6 (n k : ℕ) : ℝ := n.choose k

theorem bc_lower6 (n k : ℕ) :
 bc6 n (k+1)*((k:ℝ)+1)=bc6 n k*((n:ℝ)-k) := by
 by_cases hk : k≤n
 · have h := Nat.choose_succ_right_eq n k
   dsimp [bc6]
   exact_mod_cast h
 · have h0 : n.choose k=0 := Nat.choose_eq_zero_of_lt (by omega)
   have h1 : n.choose (k+1)=0 := Nat.choose_eq_zero_of_lt (by omega)
   simp [bc6,h0,h1]

theorem bc_upper6 (n k : ℕ) :
 bc6 (n+1) k*((n:ℝ)+1-k)=bc6 n k*((n:ℝ)+1) := by
 by_cases hk : k≤n+1
 · have h := (Nat.choose_mul_succ_eq n k).symm
   dsimp [bc6]
   exact_mod_cast h
 · have h0 : n.choose k=0 := Nat.choose_eq_zero_of_lt (by omega)
   have h1 : (n+1).choose k=0 := Nat.choose_eq_zero_of_lt (by omega)
   simp [bc6,h0,h1]

theorem bc_lower_ratio6 (n k : ℕ) :
 bc6 n (k+1)=bc6 n k*((n:ℝ)-k)/(k+1) := by
 apply (eq_div_iff (by positivity : (k:ℝ)+1≠0)).mpr
 exact bc_lower6 n k

theorem bc_upper_ratio6 (n k : ℕ) (hk : k≤n) :
 bc6 (n+1) k=bc6 n k*((n:ℝ)+1)/((n:ℝ)+1-k) := by
 have hp : (0:ℝ)<(n:ℝ)+1-k := by
   have hkR : (k:ℝ)≤n := by exact_mod_cast hk
   linarith
 apply (eq_div_iff (ne_of_gt hp)).mpr
 exact bc_upper6 n k

theorem bc_upper_back6 (n k : ℕ) :
 bc6 n k=bc6 (n+1) k*((n:ℝ)+1-k)/((n:ℝ)+1) := by
 apply (eq_div_iff (by positivity : (n:ℝ)+1≠0)).mpr
 exact (bc_upper6 n k).symm

theorem bc_lower_back6 (n k : ℕ) (hk : k<n) :
 bc6 n k=bc6 n (k+1)*((k:ℝ)+1)/((n:ℝ)-k) := by
 have hp : (0:ℝ)<(n:ℝ)-k := by
   have hkR : (k:ℝ)<n := by exact_mod_cast hk
   linarith
 apply (eq_div_iff (ne_of_gt hp)).mpr
 exact (bc_lower6 n k).symm

def binTerm6 (n q b s : ℕ) : ℝ :=
 bc6 n (s+1)*bc6 (s+q) q*bc6 (2*s+2) b


#print axioms bc_lower6
#print axioms bc_upper6
#print axioms bc_lower_ratio6
#print axioms bc_upper_back6
end
end MathGKM.Markov
