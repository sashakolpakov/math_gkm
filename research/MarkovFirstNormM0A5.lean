import MarkovFirstNormBC
/-! Machine-authored 0a5fcabe: sharpen normalization domain for small cycles. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 32768
theorem first_normalizeM0A5 (n c r : ℕ) :
 (1-runXBDEE)^2*closedFirstBDEE n c r=
 firstNumBC (n:RunFieldBDEE) (runXBDEE^n) c r (2*r-c:ℕ) runXBDEE := by
 unfold closedFirstBDEE closedHBDEE 
 
 simp only [jet_normalize_00BC,jet_normalize_01BC,jet_normalize_02BC,jet_normalize_03BC,jet_normalize_10BC,jet_normalize_11BC,jet_normalize_12BC,jet_normalize_13BC,jet_normalize_20BC,jet_normalize_21BC,jet_normalize_22BC,jet_normalize_23BC,jet_normalize_30BC,jet_normalize_31BC,jet_normalize_32BC,jet_normalize_33BC]
 simp only [jetNum00BC,jetNum01BC,jetNum02BC,jetNum03BC,jetNum10BC,jetNum11BC,jetNum12BC,jetNum13BC,jetNum20BC,jetNum21BC,jetNum22BC,jetNum23BC,jetNum30BC,jetNum31BC,jetNum32BC,jetNum33BC,firstNumBC]
 simp only [Nat.cast_add,Nat.cast_one,pow_add,pow_one]
 have hx := one_sub_runX_neBDEE
 field_simp [hx]
 ring
end
end MathGKM.Markov
