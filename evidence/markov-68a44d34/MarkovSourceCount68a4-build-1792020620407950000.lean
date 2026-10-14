import MarkovCountCoeff68a4
import MarkovRunRecurrenceBF
/-! Machine-authored 68a44d34. The auxiliary horizontal failure belongs
to an exact mechanical source word. The full raw triple satisfies LC. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset
set_option maxHeartbeats 4000000
set_option maxRecDepth 10000

def oneAPath68 (n : ℕ) : List Bool := List.replicate n true++[false]

theorem oneA_word68 (n : ℕ) :
 central28 (oneAPath68 n)++[true]=
   List.replicate n true++false::List.replicate (n+1) true := by
 have h := source_run_substitutionBF n []
 rw [sourceWord_central28] at h
 simpa [oneAPath68,sourceWord28,lowerSub487,lowerRun487,List.append_assoc] using h

theorem oneA_labels68 (n : ℕ) :
 (frame (oneAPath68 n)).mid.a=2*n+1 ∧
 (frame (oneAPath68 n)).mid.b=2*n+3 := by
 have h := source_run_indicesBF n []
 simpa [oneAPath68,frame,initial,Nat.mul_add] using h

theorem oneA_layer_count68 (n s d : ℕ) :
 (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) s d).coeff 0=
   singleACount68 n (n+1) s d := by
 rw [oneA_word68,singleA_layer_count68]

theorem source_layer_counts68 :
 let w := central28 (oneAPath68 33)++[true]
 (degreeLayer07a7 (X:ℤ[X]) w 4 39).coeff 0=18513 ∧
 (degreeLayer07a7 (X:ℤ[X]) w 5 39).coeff 0=185504 ∧
 (degreeLayer07a7 (X:ℤ[X]) w 6 39).coeff 0=1862728 := by
 dsimp only
 simp only [oneA_layer_count68]
 decide

theorem source_fixed_degree_horizontal_failure68 :
 let w := central28 (oneAPath68 33)++[true]
 (degreeLayer07a7 (X:ℤ[X]) w 5 39).coeff 0^2-
   (degreeLayer07a7 (X:ℤ[X]) w 4 39).coeff 0*
   (degreeLayer07a7 (X:ℤ[X]) w 6 39).coeff 0 = -72949448 := by
 obtain ⟨h0,h1,h2⟩ := source_layer_counts68
 dsimp only at *
 rw [h0,h1,h2]
 norm_num

theorem source_boundary_choose68 (path : List Bool) (s : ℕ) :
 coeff (frame path).mid.p ((frame path).mid.a+s) 0=
   (((frame path).mid.b-1).choose s:ℤ) := by
 have h := congrArg (fun p : ℝ[X] => p.coeff ((frame path).mid.a+s))
   (boundary_formula path)
 rw [edgeEval_coeff] at h
 rw [Nat.add_comm,Polynomial.coeff_X_pow_mul,Polynomial.coeff_X_add_one_pow] at h
 exact_mod_cast h

theorem source_full_raw_triple68 :
 let m := (frame (oneAPath68 33)).mid
 m.a=67 ∧ m.b=69 ∧
 InPolygon m.a m.b 71 0 ∧ InPolygon m.a m.b 72 0 ∧ InPolygon m.a m.b 73 0 ∧
 coeff m.p 71 0=814385 ∧ coeff m.p 72 0=10424128 ∧
 coeff m.p 73 0=109453344 ∧
 coeff m.p 72 0^2-coeff m.p 71 0*coeff m.p 73 0=19525283006944 := by
 obtain ⟨ha,hb⟩ := oneA_labels68 33
 norm_num at ha hb
 have h (s : ℕ) : coeff (frame (oneAPath68 33)).mid.p (67+s) 0=(68.choose s:ℤ) := by
   simpa only [ha,hb] using source_boundary_choose68 (oneAPath68 33) s
 dsimp only
 rw [ha,hb,h 4,h 5,h 6]
 norm_num [InPolygon,Nat.choose]

#print axioms oneA_layer_count68
#print axioms source_fixed_degree_horizontal_failure68
#print axioms source_full_raw_triple68
end
end MathGKM.Markov
