import MarkovKernelProofMDB9
/-! Machine-authored db972d62. Failure of a summand certificate, not of the root. -/
namespace MathGKM.Markov
noncomputable section
open Finset

def kernelTermMDB9 (i j m k : ℕ) : ℤ :=
 if k ≤ min j m then (if k=0 then 1 else 2)*
   ((j-k+i).choose i:ℤ)*((m-k).choose (i-2):ℤ) else 0

theorem kernel_diagonal_shift_failureMDB9 (s : ℕ) :
 kernelTermMDB9 3 2 2 1*kernelTermMDB9 5 0 4 0 >
 kernelTermMDB9 4 1 3 (min 1 (0+s))*kernelTermMDB9 4 1 3 (max (1-s) 0) := by
 cases s with
 | zero => norm_num [kernelTermMDB9]
 | succ s =>
   rw [show min 1 (0+(s+1))=1 by omega,show max (1-(s+1)) 0=0 by omega]
   norm_num [kernelTermMDB9]

theorem kernel_obstruction_source_valuesMDB9 :
 let p := (frame (twoPath3af 1)).mid.p
 coeff p 3 2=28 ∧ coeff p 4 1=17 ∧ coeff p 5 0=4 := by
 dsimp only
 obtain ⟨ha,hb⟩ := two_path_labels3af 1
 have hb' : (frame (twoPath3af 1)).mid.b=2*2+1 := by simpa using hb
 rw [source_two_kernelM4F4 _ 2 3 2 ha hb' (by omega) (by omega),
   source_two_kernelM4F4 _ 2 4 1 ha hb' (by omega) (by omega),
   source_two_kernelM4F4 _ 2 5 0 ha hb' (by omega) (by omega)]
 norm_num [twoKernelM4F4,Finset.sum_range_succ]

theorem kernel_obstruction_source_polygonMDB9 :
 let m := (frame (twoPath3af 1)).mid
 m.a=2 ∧ m.b=5 ∧ InPolygon m.a m.b 3 2 ∧
 InPolygon m.a m.b 4 1 ∧ InPolygon m.a m.b 5 0 := by
 dsimp only
 obtain ⟨ha,hb⟩ := two_path_labels3af 1
 rw [ha,hb]
 norm_num [InPolygon]

theorem kernel_obstruction_source_lcMDB9 :
 let p := (frame (twoPath3af 1)).mid.p
 coeff p 3 2*coeff p 5 0 ≤ coeff p 4 1^2 := by
 obtain ⟨h0,h1,h2⟩ := kernel_obstruction_source_valuesMDB9
 dsimp only at *
 rw [h0,h1,h2]
 norm_num
end
end MathGKM.Markov
