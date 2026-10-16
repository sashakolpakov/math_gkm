import MarkovParameterShapeM8F7
/-! Machine-authored 8f77f493. Extend the exact source kernel through column two. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem reduced_parameter_allM8F7 (n j r : ℕ) :
 reducedKernelMDB9 n j r*reducedKernelMDB9 (n+2) j r≤reducedKernelMDB9 (n+1) j r^2 := by
 have h := kernel_parameter_lcM8F7 (n+2) n j r
 simp only [kernelM8F7,show n+2+1=n+1+2 by omega,←reduced_kernel_sumMDB9] at h
 exact_mod_cast h

theorem reduced_minor_allM8F7 (n j r : ℕ) :
 reducedKernelMDB9 (n+1) j r*reducedKernelMDB9 n (j+1) r≤
 reducedKernelMDB9 n j r*reducedKernelMDB9 (n+1) (j+1) r := by
 have h := kernel_shift_minorM8F7 (n+2) n j r
 simp only [kernelM8F7,show n+2+1=n+1+2 by omega,←reduced_kernel_sumMDB9] at h
 exact_mod_cast h

theorem reduced_diagonal_allM8F7 (n j r : ℕ) :
 reducedKernelMDB9 n (j+2) r*reducedKernelMDB9 (n+2) j r≤
 reducedKernelMDB9 (n+1) (j+1) r^2 := by
 apply minor_diagonal_glueM4F4
   (reducedKernelMDB9 n (j+2) r) (reducedKernelMDB9 (n+1) (j+2) r)
   (reducedKernelMDB9 (n+2) (j+2) r) (reducedKernelMDB9 (n+1) (j+1) r)
   (reducedKernelMDB9 (n+2) (j+1) r) (reducedKernelMDB9 (n+2) j r)
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact reduced_kernel_posMDB9 _ _ _
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact (reduced_kernel_posMDB9 _ _ _).le
 · exact reduced_parameter_allM8F7 n (j+2) r
 · exact reduced_kernel_rowMDB9 (n+2) j r
 · simpa [Nat.add_assoc,mul_comm] using reduced_minor_allM8F7 (n+1) (j+1) r

theorem source_two_kernel_secondM8F7 (path : List Bool) (q j : ℕ)
 (ha : (frame path).mid.a=2) (hb : (frame path).mid.b=2*q+1) (hj : j≤2*q) :
 coeff (frame path).mid.p 2 j=twoKernelM4F4 2 j (2*q-j) := by
 by_cases hl : j≤q
 · have he : q=j+(q-j) := by omega
   rw [source_two_lower_formulaM58E path j (q-j) 2 ha (by rw [←he]; exact hb),
     lower_kernelM4F4 2 j (q-j) (by omega)]
   congr 1; omega
 · by_cases hN : 1≤2*q-j
   · have h := source_two_upper_formulaM2B3 path (2*q-j) (j-q) 2 hN (by omega) ha
       (by convert hb using 2 <;> omega)
     rw [show 2*q-j+2*(j-q)=j by omega] at h
     rw [h,upper_kernelM4F4 2 (2*q-j) (j-q) (by omega) (by omega)]
     congr 1; omega
   · have he : j=2*q := by omega
     rw [top_raw_coeff1998 path 2 j (by rw [ha,hb]; omega)]
     simp [twoKernelM4F4,ha,hb,he,show 2+(2*q+1)-1=2*q+2 by omega]

theorem source_two_diagonal_secondM8F7 (path : List Bool)
 (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p 2 (j+2)*coeff (frame path).mid.p 4 j≤
 coeff (frame path).mid.p 3 (j+1)^2 := by
 obtain ⟨q,hq,hb,_⟩ := source_two_squares3556 path ha
 by_cases hj : j+2≤2*q
 · rw [source_two_kernel_secondM8F7 path q (j+2) ha hb hj,
     source_two_kernelM4F4 path q 4 j ha hb (by omega) (by omega),
     source_two_kernelM4F4 path q 3 (j+1) ha hb (by omega) (by omega)]
   have h := reduced_diagonal_allM8F7 0 j (2*q-j-2)
   unfold reducedKernelMDB9 at h
   convert h using 1 <;> congr 2 <;> omega
 · rw [raw_outside_polygon18 path 2 (j+2) (by rw [ha,hb]; unfold InPolygon; omega),zero_mul]
   exact sq_nonneg _

end
end MathGKM.Markov
