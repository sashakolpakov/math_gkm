import MarkovSparseKernelE273
import MarkovChooseShapeE273
import MarkovLowerShape446
/-! Machine-authored e27336bc. Universal source coefficient bridges for the
lower and upper polynomial shapes. No experimental equalities are assumed. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem chooseShift_polynomialE273 (j k : ℕ) (hk : k≤j+3) :
 6*chooseShiftE273 j k=((j:ℤ)-k+1)*(j-k+2)*(j-k+3) := by
 by_cases h : k≤j
 · simp only [chooseShiftE273,if_pos h]
   have he := choose_three_productE273 (j-k)
   simpa [Nat.cast_sub h,Nat.add_comm] using he
 · have hz : chooseShiftE273 j k=0 := by simp [chooseShiftE273,h]
   rw [hz,mul_zero]
   have hh : k=j+1 ∨ k=j+2 ∨ k=j+3 := by omega
   rcases hh with rfl | rfl | rfl <;> push_cast <;> ring

theorem chooseShift_zeroE273 (j k : ℕ) (hk : j<k) : chooseShiftE273 j k=0 := by
 simp [chooseShiftE273,show ¬k≤j by omega]

theorem second_lower_shapeE273 (n c r j : ℕ) (hj : 3≤j) (hn : j≤n) :
 3*secondExplicitE273 n c r j=lowerShape446 n c r j := by
 have h00 := chooseShift_polynomialE273 j 0 (by omega)
 have h01 := chooseShift_polynomialE273 j 1 (by omega)
 have h02 := chooseShift_polynomialE273 j 2 (by omega)
 have h03 := chooseShift_polynomialE273 j 3 (by omega)
 have h04 := chooseShift_polynomialE273 j 4 (by omega)
 have h05 := chooseShift_polynomialE273 j 5 (by omega)
 have h06 := chooseShift_polynomialE273 j 6 (by omega)
 have he : 6*secondExplicitE273 n c r j=
   (sparse00E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(0:ℕ)+1)*((j:ℤ)-(0:ℕ)+2)*((j:ℤ)-(0:ℕ)+3)) +
   (sparse01E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(1:ℕ)+1)*((j:ℤ)-(1:ℕ)+2)*((j:ℤ)-(1:ℕ)+3)) +
   (sparse02E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(2:ℕ)+1)*((j:ℤ)-(2:ℕ)+2)*((j:ℤ)-(2:ℕ)+3)) +
   (sparse03E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(3:ℕ)+1)*((j:ℤ)-(3:ℕ)+2)*((j:ℤ)-(3:ℕ)+3)) +
   (sparse04E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(4:ℕ)+1)*((j:ℤ)-(4:ℕ)+2)*((j:ℤ)-(4:ℕ)+3)) +
   (sparse05E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(5:ℕ)+1)*((j:ℤ)-(5:ℕ)+2)*((j:ℤ)-(5:ℕ)+3)) +
   (sparse06E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(6:ℕ)+1)*((j:ℤ)-(6:ℕ)+2)*((j:ℤ)-(6:ℕ)+3)) := by
   unfold secondExplicitE273
   simp only [zero_mul,zero_add,one_mul]
   rw [if_neg (show ¬(c=2 ∧ j=2*n+3) by omega),chooseShift_zeroE273 j (n+1+1) (by omega),chooseShift_zeroE273 j (n+1+2) (by omega),chooseShift_zeroE273 j (n+1+3) (by omega),chooseShift_zeroE273 j (n+1+4) (by omega),chooseShift_zeroE273 j (n+1+5) (by omega),chooseShift_zeroE273 j (2*(n+1)+1) (by omega),chooseShift_zeroE273 j (2*(n+1)+2) (by omega),chooseShift_zeroE273 j (2*(n+1)+3) (by omega),chooseShift_zeroE273 j (2*(n+1)+4) (by omega),chooseShift_zeroE273 j (2*(n+1)+5) (by omega)]
   simp only [mul_zero,add_zero]
   linear_combination (sparse00E273 n c r (2*r-c:ℕ))*h00 + (sparse01E273 n c r (2*r-c:ℕ))*h01 + (sparse02E273 n c r (2*r-c:ℕ))*h02 + (sparse03E273 n c r (2*r-c:ℕ))*h03 + (sparse04E273 n c r (2*r-c:ℕ))*h04 + (sparse05E273 n c r (2*r-c:ℕ))*h05 + (sparse06E273 n c r (2*r-c:ℕ))*h06
 have hp : (sparse00E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(0:ℕ)+1)*((j:ℤ)-(0:ℕ)+2)*((j:ℤ)-(0:ℕ)+3)) +
   (sparse01E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(1:ℕ)+1)*((j:ℤ)-(1:ℕ)+2)*((j:ℤ)-(1:ℕ)+3)) +
   (sparse02E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(2:ℕ)+1)*((j:ℤ)-(2:ℕ)+2)*((j:ℤ)-(2:ℕ)+3)) +
   (sparse03E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(3:ℕ)+1)*((j:ℤ)-(3:ℕ)+2)*((j:ℤ)-(3:ℕ)+3)) +
   (sparse04E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(4:ℕ)+1)*((j:ℤ)-(4:ℕ)+2)*((j:ℤ)-(4:ℕ)+3)) +
   (sparse05E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(5:ℕ)+1)*((j:ℤ)-(5:ℕ)+2)*((j:ℤ)-(5:ℕ)+3)) +
   (sparse06E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(6:ℕ)+1)*((j:ℤ)-(6:ℕ)+2)*((j:ℤ)-(6:ℕ)+3))=
   2*lowerShape446 n c r j := by
   dsimp [sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,lowerShape446,lowerKShape446,lowerHShape446,upperShape446]
   push_cast
   ring
 rw [hp] at he
 omega

theorem second_upper_shapeE273 (n c r j : ℕ) (hj : n+3≤j) (hn : j≤2*n+2) :
 3*secondExplicitE273 n c r j=8*upperShape446 c r (2*(n:ℤ)+2-j) := by
 have h00 := chooseShift_polynomialE273 j 0 (by omega)
 have h01 := chooseShift_polynomialE273 j 1 (by omega)
 have h02 := chooseShift_polynomialE273 j 2 (by omega)
 have h03 := chooseShift_polynomialE273 j 3 (by omega)
 have h04 := chooseShift_polynomialE273 j 4 (by omega)
 have h05 := chooseShift_polynomialE273 j 5 (by omega)
 have h06 := chooseShift_polynomialE273 j 6 (by omega)
 have h11 := chooseShift_polynomialE273 j (n+1+1) (by omega)
 have h12 := chooseShift_polynomialE273 j (n+1+2) (by omega)
 have h13 := chooseShift_polynomialE273 j (n+1+3) (by omega)
 have h14 := chooseShift_polynomialE273 j (n+1+4) (by omega)
 have h15 := chooseShift_polynomialE273 j (n+1+5) (by omega)
 have he : 6*secondExplicitE273 n c r j=
   (sparse00E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(0:ℕ)+1)*((j:ℤ)-(0:ℕ)+2)*((j:ℤ)-(0:ℕ)+3)) +
   (sparse01E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(1:ℕ)+1)*((j:ℤ)-(1:ℕ)+2)*((j:ℤ)-(1:ℕ)+3)) +
   (sparse02E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(2:ℕ)+1)*((j:ℤ)-(2:ℕ)+2)*((j:ℤ)-(2:ℕ)+3)) +
   (sparse03E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(3:ℕ)+1)*((j:ℤ)-(3:ℕ)+2)*((j:ℤ)-(3:ℕ)+3)) +
   (sparse04E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(4:ℕ)+1)*((j:ℤ)-(4:ℕ)+2)*((j:ℤ)-(4:ℕ)+3)) +
   (sparse05E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(5:ℕ)+1)*((j:ℤ)-(5:ℕ)+2)*((j:ℤ)-(5:ℕ)+3)) +
   (sparse06E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(6:ℕ)+1)*((j:ℤ)-(6:ℕ)+2)*((j:ℤ)-(6:ℕ)+3)) +
   (sparse11E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+1):ℕ)+1)*((j:ℤ)-((n+1+1):ℕ)+2)*((j:ℤ)-((n+1+1):ℕ)+3)) +
   (sparse12E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+2):ℕ)+1)*((j:ℤ)-((n+1+2):ℕ)+2)*((j:ℤ)-((n+1+2):ℕ)+3)) +
   (sparse13E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+3):ℕ)+1)*((j:ℤ)-((n+1+3):ℕ)+2)*((j:ℤ)-((n+1+3):ℕ)+3)) +
   (sparse14E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+4):ℕ)+1)*((j:ℤ)-((n+1+4):ℕ)+2)*((j:ℤ)-((n+1+4):ℕ)+3)) +
   (sparse15E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+5):ℕ)+1)*((j:ℤ)-((n+1+5):ℕ)+2)*((j:ℤ)-((n+1+5):ℕ)+3)) := by
   unfold secondExplicitE273
   simp only [zero_mul,zero_add,one_mul]
   rw [if_neg (show ¬(c=2 ∧ j=2*n+3) by omega),chooseShift_zeroE273 j (2*(n+1)+1) (by omega),chooseShift_zeroE273 j (2*(n+1)+2) (by omega),chooseShift_zeroE273 j (2*(n+1)+3) (by omega),chooseShift_zeroE273 j (2*(n+1)+4) (by omega),chooseShift_zeroE273 j (2*(n+1)+5) (by omega)]
   simp only [mul_zero,add_zero]
   linear_combination (sparse00E273 n c r (2*r-c:ℕ))*h00 + (sparse01E273 n c r (2*r-c:ℕ))*h01 + (sparse02E273 n c r (2*r-c:ℕ))*h02 + (sparse03E273 n c r (2*r-c:ℕ))*h03 + (sparse04E273 n c r (2*r-c:ℕ))*h04 + (sparse05E273 n c r (2*r-c:ℕ))*h05 + (sparse06E273 n c r (2*r-c:ℕ))*h06 + (sparse11E273 n c r (2*r-c:ℕ))*h11 + (sparse12E273 n c r (2*r-c:ℕ))*h12 + (sparse13E273 n c r (2*r-c:ℕ))*h13 + (sparse14E273 n c r (2*r-c:ℕ))*h14 + (sparse15E273 n c r (2*r-c:ℕ))*h15
 have hp : (sparse00E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(0:ℕ)+1)*((j:ℤ)-(0:ℕ)+2)*((j:ℤ)-(0:ℕ)+3)) +
   (sparse01E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(1:ℕ)+1)*((j:ℤ)-(1:ℕ)+2)*((j:ℤ)-(1:ℕ)+3)) +
   (sparse02E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(2:ℕ)+1)*((j:ℤ)-(2:ℕ)+2)*((j:ℤ)-(2:ℕ)+3)) +
   (sparse03E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(3:ℕ)+1)*((j:ℤ)-(3:ℕ)+2)*((j:ℤ)-(3:ℕ)+3)) +
   (sparse04E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(4:ℕ)+1)*((j:ℤ)-(4:ℕ)+2)*((j:ℤ)-(4:ℕ)+3)) +
   (sparse05E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(5:ℕ)+1)*((j:ℤ)-(5:ℕ)+2)*((j:ℤ)-(5:ℕ)+3)) +
   (sparse06E273 n c r (2*r-c:ℕ))*(((j:ℤ)-(6:ℕ)+1)*((j:ℤ)-(6:ℕ)+2)*((j:ℤ)-(6:ℕ)+3)) +
   (sparse11E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+1):ℕ)+1)*((j:ℤ)-((n+1+1):ℕ)+2)*((j:ℤ)-((n+1+1):ℕ)+3)) +
   (sparse12E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+2):ℕ)+1)*((j:ℤ)-((n+1+2):ℕ)+2)*((j:ℤ)-((n+1+2):ℕ)+3)) +
   (sparse13E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+3):ℕ)+1)*((j:ℤ)-((n+1+3):ℕ)+2)*((j:ℤ)-((n+1+3):ℕ)+3)) +
   (sparse14E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+4):ℕ)+1)*((j:ℤ)-((n+1+4):ℕ)+2)*((j:ℤ)-((n+1+4):ℕ)+3)) +
   (sparse15E273 n c r (2*r-c:ℕ))*(((j:ℤ)-((n+1+5):ℕ)+1)*((j:ℤ)-((n+1+5):ℕ)+2)*((j:ℤ)-((n+1+5):ℕ)+3))=
   16*upperShape446 c r (2*(n:ℤ)+2-j) := by
   dsimp [sparse00E273,sparse01E273,sparse02E273,sparse03E273,sparse04E273,sparse05E273,sparse06E273,sparse11E273,sparse12E273,sparse13E273,sparse14E273,sparse15E273,lowerShape446,lowerKShape446,lowerHShape446,upperShape446]
   push_cast
   ring
 rw [hp] at he
 omega


theorem source_second_lower_shapeE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2)
 (hj : 3≤j) (hn : j≤n) :
 6*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 lowerShape446 n (frame rest).mid.b (frame rest).mid.a j := by
 have he := source_second_explicitE273 n rest i j hij
 have hs := second_lower_shapeE273 n (frame rest).mid.b (frame rest).mid.a j hj hn
 omega

theorem source_second_upper_shapeE273 (n : ℕ) (rest : List Bool) (i j : ℕ)
 (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+2)
 (hj : n+3≤j) (hn : j≤2*n+2) :
 6*coeff (frame (List.replicate n true++false::rest)).mid.p i j=
 8*upperShape446 (frame rest).mid.b (frame rest).mid.a (2*(n:ℤ)+2-j) := by
 have he := source_second_explicitE273 n rest i j hij
 have hs := second_upper_shapeE273 n (frame rest).mid.b (frame rest).mid.a j hj hn
 omega

#print axioms second_lower_shapeE273
#print axioms second_upper_shapeE273
#print axioms source_second_lower_shapeE273
#print axioms source_second_upper_shapeE273
end
end MathGKM.Markov
