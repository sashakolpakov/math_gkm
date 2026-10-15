import MarkovDegreeTransfer07a7
import MarkovSingleLayerInteger9c20
/-! Machine-authored request 7d905904. Exact degree refinement for the
Fibonacci source words. This is not the full Markov conjecture. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 2000000

theorem fibonacci_degree_change7d {R : Type*} [CommRing R]
    (x y z p : R) (d n : ℕ) :
 degreeEval07a7 x y z p 1 d (List.replicate n false++[true]) =
 cutEvalA27 x (z*(1+y)-1) (z^d*(p+1)-1) 1
   (List.replicate n false++[true]) := by
 induction n generalizing p d with
 | zero =>
   simp [degreeEval07a7,cutEvalA27,cutChargeA27,cutFactorA27,pow_succ]
   ring
 | succ n ih =>
   simp only [List.replicate_succ,List.cons_append,degreeEval07a7,
     cutEvalA27,cutChargeA27,cutFactorA27,Bool.false_eq_true,if_false,
     Nat.add_zero,one_mul,mul_one]
   rw [ih,ih]
   simp only [pow_zero,pow_one,zero_add,one_mul,sub_add_cancel,sub_self]

theorem fibonacci_mask_power7d {R : Type*} [CommRing R]
 (y p : R) (d n : ℕ) (m : List (Bool × Bool))
 (hm : m.map Prod.fst=List.replicate n false++[true])
 (hp : p+1=(1+y)^d) :
 maskWeight340 y p 1 m=(1+y)^(maskDegree07a7 d m) := by
 induction n generalizing p d m with
 | zero =>
   cases m with
   | nil => simp at hm
   | cons rb rs =>
     obtain ⟨r,b⟩ := rb
     simp only [List.replicate_zero,List.nil_append,List.map_cons,
       List.cons.injEq] at hm
     obtain ⟨rfl,hrs⟩ := hm
     have hr : rs=[] := List.map_eq_nil_iff.mp hrs
     subst rs
     cases b <;> simp [maskWeight340,maskDegree07a7,cutFactorA27,hp,pow_succ]
     ring
 | succ n ih =>
   cases m with
   | nil => simp at hm
   | cons rb rs =>
     obtain ⟨r,b⟩ := rb
     simp only [List.replicate_succ,List.cons_append,List.map_cons,
       List.cons.injEq] at hm
     obtain ⟨rfl,hrs⟩ := hm
     cases b with
     | false =>
       simpa [maskWeight340,maskDegree07a7,cutChargeA27] using
         ih 0 0 rs hrs (by simp)
     | true =>
       simp only [maskWeight340,maskDegree07a7,cutFactorA27,
         if_true,Bool.false_eq_true,if_false,one_mul,Nat.add_zero]
       rw [ih y 1 rs hrs (by simp [add_comm]),hp,pow_add]

def fibonacciLayerCount7d (n s d : ℕ) : ℕ :=
 ((cutMasksFe01 (List.replicate n false++[true]) s).filter
   (fun m => maskDegree07a7 1 m=d)).length

theorem fibonacci_layer_power7d {R : Type*} [CommRing R]
 (y : R) (n s d : ℕ) :
 degreeLayer07a7 y (List.replicate n false++[true]) s d=
 (fibonacciLayerCount7d n s d:R)*(1+y)^d := by
 unfold degreeLayer07a7 fibonacciLayerCount7d
 have he : (((cutMasksFe01 (List.replicate n false++[true]) s).filter
     (fun m => maskDegree07a7 1 m=d)).map (maskWeight340 y y 1))=
     (((cutMasksFe01 (List.replicate n false++[true]) s).filter
     (fun m => maskDegree07a7 1 m=d)).map (fun _ => (1+y)^d)) := by
   apply List.map_congr_left
   intro m hm
   obtain ⟨hmem,hd⟩ := List.mem_filter.mp hm
   have hw := (cutMasks_specFe01 _ _ _ hmem).1
   have hd' : maskDegree07a7 1 m=d := by simpa using hd
   rw [fibonacci_mask_power7d y y 1 n m hw (by simp [add_comm]),hd']
 rw [he,List.sum_map_const]
 simp [nsmul_eq_mul]

#print axioms fibonacci_degree_change7d
#print axioms fibonacci_mask_power7d
#print axioms fibonacci_layer_power7d
end
end MathGKM.Markov
