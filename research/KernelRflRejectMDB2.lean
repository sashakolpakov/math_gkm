import KernelRflMDB2
/-! Machine-authored db238071. Deliberately invalid operational negative test;
this file must be rejected and is never part of mathematical validation. -/
example : (1 : Nat) = 2 := by kernel_rfl_mdb2
