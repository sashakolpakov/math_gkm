import MathGKM.Acceptedb6d2ec5febf447178088c884
import MathGKM.Accepted3c265afc977f227a9f6535e7
/- Machine-authored round87: retained original triple, no new case. -/
namespace OriginalR87
open Polynomial MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
theorem raw_sums :
    (Finset.sum (Finset.range 6) (fun s => MidpointR36.W 5 5 1 s))=14 ∧
    (Finset.sum (Finset.range 6) (fun s => MidpointR36.W 5 5 2 s))=117 ∧
    (Finset.sum (Finset.range 6) (fun s => MidpointR36.W 5 5 3 s))=416 := by
  norm_num [Finset.sum_range_succ,MidpointR36.W,RenewalR28.mc,Nat.choose]
theorem original_positive :
    let E := (frame (List.replicate 4 true)).mid
    E.a=5 ∧ E.b=6 ∧
    InPolygon E.a E.b 5 1 ∧ InPolygon E.a E.b 5 2 ∧ InPolygon E.a E.b 5 3 ∧
    coeff E.p 5 1=14 ∧ coeff E.p 5 2=117 ∧ coeff E.p 5 3=416 ∧
    coeff E.p 5 2^2-coeff E.p 5 1*coeff E.p 5 3=7865 ∧
    coeff E.p 5 1*coeff E.p 5 3<coeff E.p 5 2^2 := by
  have labs := Accepted3c265afc977f227a9f6535e7.obligation.1.1 4
  have h0 := Acceptedb6d2ec5febf447178088c884.obligation 5 (by norm_num) 5 1
  have h1 := Acceptedb6d2ec5febf447178088c884.obligation 5 (by norm_num) 5 2
  have h2 := Acceptedb6d2ec5febf447178088c884.obligation 5 (by norm_num) 5 3
  rw [raw_sums.1] at h0
  rw [raw_sums.2.1] at h1
  rw [raw_sums.2.2] at h2
  dsimp only
  change coeff (frame (List.replicate 4 true)).mid.p 5 1=14 at h0
  change coeff (frame (List.replicate 4 true)).mid.p 5 2=117 at h1
  change coeff (frame (List.replicate 4 true)).mid.p 5 3=416 at h2
  rw [labs.2.1,labs.2.2,h0,h1,h2]
  norm_num [InPolygon]
end
end OriginalR87
#print axioms OriginalR87.original_positive
