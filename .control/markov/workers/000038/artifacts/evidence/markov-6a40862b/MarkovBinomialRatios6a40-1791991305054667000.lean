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
   exact_mod_cast h
 · have h0 : n.choose k=0 := Nat.choose_eq_zero_of_lt (by omega)
   have h1 : n.choose (k+1)=0 := Nat.choose_eq_zero_of_lt (by omega)
   simp [bc6,h0,h1]

theorem bc_upper6 (n k : ℕ) :
 bc6 (n+1) k*((n:ℝ)+1-k)=bc6 n k*((n:ℝ)+1) := by
 by_cases hk : k≤n+1
 · have h := (Nat.choose_mul_succ_eq n k).symm
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
 have hp : (0:ℝ)<(n:ℝ)+1-k := by exact_mod_cast (show 0<n+1-k by omega)
 apply (eq_div_iff (ne_of_gt hp)).mpr
 exact bc_upper6 n k

theorem bc_upper_back6 (n k : ℕ) :
 bc6 n k=bc6 (n+1) k*((n:ℝ)+1-k)/((n:ℝ)+1) := by
 apply (eq_div_iff (by positivity : (n:ℝ)+1≠0)).mpr
 exact (bc_upper6 n k).symm

theorem bc_lower_back6 (n k : ℕ) (hk : k<n) :
 bc6 n k=bc6 n (k+1)*((k:ℝ)+1)/((n:ℝ)-k) := by
 have hp : (0:ℝ)<(n:ℝ)-k := by exact_mod_cast (show 0<n-k by omega)
 apply (eq_div_iff (ne_of_gt hp)).mpr
 exact (bc_lower6 n k).symm

def binTerm6 (n q b s : ℕ) : ℝ :=
 bc6 n (s+1)*bc6 (s+q) q*bc6 (2*s+2) b

theorem binTerm_plus6 (n q b s : ℕ) (hb : b≤2*s+4) :
 binTerm6 n q b (s+2) = binTerm6 n q b (s+1) *
 (2*(2*(s:ℝ)+5)*((n:ℝ)-s-2)*((s:ℝ)+q+2) /
 (((s:ℝ)+2)*(2*(s:ℝ)+6-b)*(2*(s:ℝ)+5-b))) := by
 have h1 := bc_lower_ratio6 n (s+2)
 have h2 := bc_upper_ratio6 (s+q+1) q (by omega)
 have h3 := bc_upper_ratio6 (2*s+4) b hb
 have h4 := bc_upper_ratio6 (2*s+5) b (by omega)
 have hp : (0:ℝ)<2*(s:ℝ)+5-b := by exact_mod_cast (show 0<2*s+5-b by omega)
 have hp' : (0:ℝ)<2*(s:ℝ)+6-b := by exact_mod_cast (show 0<2*s+6-b by omega)
 have hs : (0:ℝ)<(s:ℝ)+2 := by positivity
 have hs' : (0:ℝ)<(s:ℝ)+3 := by positivity
 have he0 : binTerm6 n q b (s+2)=bc6 n (s+3)*bc6 (s+q+2) q*bc6 (2*s+6) b := by
   simp [binTerm6]; congr 2 <;> omega
 have he1 : binTerm6 n q b (s+1)=bc6 n (s+2)*bc6 (s+q+1) q*bc6 (2*s+4) b := by
   simp [binTerm6]; congr 2 <;> omega
 rw [he0,he1]
 norm_num only [Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat] at h1 h2 h3 h4
 rw [show s+3=(s+2)+1 by omega,h1,show s+q+2=(s+q+1)+1 by omega,h2,
     show 2*s+6=(2*s+5)+1 by omega,h4,show 2*s+5=(2*s+4)+1 by omega,h3]
 field_simp
 <;> ring

#print axioms bc_lower6
#print axioms bc_upper6
#print axioms binTerm_plus6
end
end MathGKM.Markov
