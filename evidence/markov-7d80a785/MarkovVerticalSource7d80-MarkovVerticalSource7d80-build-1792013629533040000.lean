import MarkovNextSource7955
import MarkovVerticalSourceB5
import MarkovVerticalCertificate7d80
/-! Machine-authored 7d80a785. Literal raw vertical coefficient identities. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem vertical_choose_up7d80 (i j : ℕ) :
 ((j:ℝ)+1)*((i+j+1).choose i : ℝ)=
 ((i:ℝ)+j+1)*((i+j).choose i : ℝ) := by
 have h := next_choose_up7955 j i
 rw [Nat.choose_symm_of_eq_add (n:=j+1+i) (a:=j+1) (b:=i) (by omega),
   Nat.choose_symm_add] at h
 simpa [Nat.add_comm,Nat.add_left_comm,Nat.add_assoc,add_comm,add_left_comm,add_assoc] using h

theorem source_vertical_middle7d80 (path : List Bool) (i j : ℕ) (hij : 3 ≤ i+j)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 2*((i:ℝ)+j)*(j+1)*(coeff (frame path).mid.p i (j+1) : ℝ)=
 ((i+j).choose i : ℝ)*verticalQ7d80 i j ((frame path).mid.a-1) ((frame path).mid.b-1) := by
 have h := source_top_low58 path i (j+1) (by omega) (by omega)
 have hc := vertical_choose_up7d80 i j
 have hi : 0 < (i:ℝ)+j+1 := by positivity
 apply (mul_left_cancel₀ (ne_of_gt hi))
 unfold verticalQ7d80
 push_cast at h
 have he : i+(j+1)=i+j+1 := by omega
 rw [he] at h
 linear_combination ((j:ℝ)+1)*h +
   (((frame path).mid.b-1 : ℝ)*((frame path).mid.b-2)*i*(i-1)+
   2*((frame path).mid.a*(frame path).mid.b-4*(frame path).mid.a+2 : ℝ)*i*(j+1)+
   ((frame path).mid.a-1 : ℝ)*((frame path).mid.a-2)*(j+1)*j)*hc

theorem source_vertical_last7d80 (path : List Bool) (i j : ℕ)
 (hd : i+j+3=(frame path).mid.a+(frame path).mid.b-1) :
 ((j:ℝ)+1)*(j+2)*(coeff (frame path).mid.p i (j+2) : ℝ)=
 ((i:ℝ)+j+1)*((i+j).choose i : ℝ)*
   (((frame path).mid.a-1 : ℝ)*(j+2)+((frame path).mid.b-1 : ℝ)*i) := by
 have h := source_top_vertical_middleB5 path i (j+1) (by omega)
 have hc := vertical_choose_up7d80 i j
 have he : i+(j+1)=i+j+1 := by omega
 have he' : j+1+1=j+2 := by omega
 rw [he,he'] at h
 push_cast at h
 linear_combination ((j:ℝ)+1)*h +
   (((frame path).mid.a-1 : ℝ)*(j+2)+((frame path).mid.b-1 : ℝ)*i)*hc

#print axioms source_vertical_middle7d80
#print axioms source_vertical_last7d80
end
end MathGKM.Markov
