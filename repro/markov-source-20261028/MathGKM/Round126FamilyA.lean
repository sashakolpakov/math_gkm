import MathGKM.Round125MetricA
import MathGKM.Round125InterfaceA

/- Machine-authored round126. The committed symbolic family; no new cases. -/
namespace UniformDistanceR126
open PacketsR120 PacketStructureR121 LocalRetilingR76
open MathGKM.Markov (frame InPolygon)
open PacketsR120.Tile
def highWord (h : ℕ) : List Tile :=
  V::(List.replicate 5 (List.replicate (2*h) D++[V])).flatten
def lowWord (h : ℕ) : List Tile :=
  [V]++List.replicate (6*h+4) D++[V]++List.replicate (4*h-2) D
def high (h : ℕ) : Obj := decode (highWord h)
def low (h : ℕ) : Obj := decode (lowWord h)

theorem width_ds (k : ℕ) : width (List.replicate k D)=2*k := by
  induction k with
  | zero => rfl
  | succ k ih => simp [List.replicate_succ,width,ih]; omega
theorem dimers_ds (k : ℕ) : dimers (List.replicate k D)=k := by
  induction k with
  | zero => rfl
  | succ k ih => simp [List.replicate_succ,dimers,ih,Nat.add_comm]
theorem score_ds (k v : ℕ) :
    uscore 0 v (List.replicate k D)=if v%2=0 then k else 0 := by
  induction k generalizing v with
  | zero => simp [uscore]
  | succ k ih =>
    simp only [List.replicate_succ,uscore,ih,Nat.add_zero]
    have hh : (v+2)%2=v%2 := by omega
    rw [hh]; split <;> omega

theorem decode_bounds (xs : List Tile) (v e : ℕ)
    (he : e ∈ (decodeFrom v xs).1) : v≤e ∧ e+1<v+width xs := by
  induction xs generalizing v with
  | nil => simpa [decodeFrom] using he
  | cons x xs ih =>
    cases x with
    | D =>
      simp only [decodeFrom,Finset.mem_insert] at he
      rcases he with rfl|he
      · simp only [width]; omega
      · have := ih (v+2) he; simp only [width]; omega
    | U => have := ih (v+1) he; simp only [width]; omega
    | V => have := ih (v+1) he; simp only [width]; omega

theorem decode_separated (xs : List Tile) (v e : ℕ)
    (he : e ∈ (decodeFrom v xs).1) : e+1 ∉ (decodeFrom v xs).1 := by
  induction xs generalizing v with
  | nil => simpa [decodeFrom] using he
  | cons x xs ih =>
    cases x with
    | D =>
      simp only [decodeFrom,Finset.mem_insert,not_or] at he ⊢
      rcases he with rfl|he
      · constructor
        · omega
        · intro ht; have := decode_lower xs (e+2) (e+1) ht; omega
      · have hl := decode_lower xs (v+2) e he
        exact ⟨by omega,ih (v+2) he⟩
    | U => exact ih (v+1) he
    | V => exact ih (v+1) he

theorem decode_match (xs : List Tile) (v : ℕ) :
    FiniteMatchingR61.Match (v+width xs) (decodeFrom v xs).1 :=
  ⟨fun e he => (decode_bounds xs v e he).2,fun e he => decode_separated xs v e he⟩

theorem no_U (xs : List Tile) (v : ℕ) (hu : U ∉ xs) : (decodeFrom v xs).2=∅ := by
  induction xs generalizing v with
  | nil => rfl
  | cons x xs ih =>
    have ht : U ∉ xs := fun h => hu (List.mem_cons_of_mem _ h)
    cases x with
    | D => exact ih (v+2) ht
    | U => exact (hu (by simp)).elim
    | V => exact ih (v+1) ht

theorem family_width (h : ℕ) (hh : 1≤h) :
    width (highWord h)=20*h+6 ∧ width (lowWord h)=20*h+6 := by
  simp [highWord,lowWord,List.replicate_succ,width,width_append,width_ds]
  omega

theorem family_cards (h : ℕ) (hh : 1≤h) :
    (high h).1.card=10*h ∧ (low h).1.card=10*h+2 := by
  simp only [high,low,decode,decode_dimers]
  simp [highWord,lowWord,List.replicate_succ,dimers,dimers_append,dimers_ds]
  omega

theorem family_valid (h : ℕ) (hh : 1≤h) :
    valid (20*h+6) (low h) ∧ valid (20*h+6) (high h) := by
  have hf := family_width h hh
  have hl := decode_match (lowWord h) 0
  have hu := decode_match (highWord h) 0
  simp only [Nat.zero_add] at hl hu
  rw [hf.1] at hu
  rw [hf.2] at hl
  have sl : (low h).2=∅ := no_U _ 0 (by simp [lowWord])
  have sh : (high h).2=∅ := no_U _ 0 (by simp [highWord])
  exact ⟨⟨hl,by rw [sl]; exact Finset.empty_subset _⟩,
    ⟨hu,by rw [sh]; exact Finset.empty_subset _⟩⟩

theorem family_du (h : ℕ) (hh : 1≤h) :
    du 0 (low h)=4*h-2 ∧ du 0 (high h)=4*h := by
  simp only [low,high,decode,decode_uscore]
  simp [lowWord,highWord,List.replicate_succ,uscore,uscore_append,width_append,
    width_ds,score_ds,Nat.add_mod,Nat.mul_mod]
  omega

theorem family_degrees (h : ℕ) (hh : 1≤h) :
    valid (20*h+6) (low h) ∧ valid (20*h+6) (high h) ∧
    du 0 (low h)=4*h-2 ∧ du 0 (high h)=4*h ∧
    dv (20*h+6) 0 (low h)=6*h+6 ∧ dv (20*h+6) 0 (high h)=6*h+6 := by
  have hv := family_valid h hh
  have hd := family_du h hh
  have hc := family_cards h hh
  have hl := total_degree (20*h+6) 0 (low h) hv.1
  have hu := total_degree (20*h+6) 0 (high h) hv.2
  exact ⟨hv.1,hv.2,hd.1,hd.2,by omega,by omega⟩

theorem family_member (h : ℕ) (hh : 1≤h) :
    (low h,high h) ∈ ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-2) := by
  have hd := family_degrees h hh
  have hf : 2*(4*h-2)+2=(4*h-2)+4*h := by omega
  rw [hf,ColorForgettingR108.rank_product]
  simp only [ColorForgettingR108.single,Finset.mem_product,Finset.mem_filter,
    PairConvolutionR78.mem_U]
  exact ⟨⟨hd.1,hd.2.2.1,hd.2.2.2.2.1⟩,hd.2.1,hd.2.2.2.1,hd.2.2.2.2.2⟩

theorem original_scope (h : ℕ) (hh : 1≤h) :
    let E := (frame (List.replicate (10*h+2) true)).mid
    E.a=10*h+3 ∧ E.b=10*h+4 ∧
    InPolygon E.a E.b (4*h-2) (6*h+6) ∧
    InPolygon E.a E.b (4*h-1) (6*h+6) ∧
    InPolygon E.a E.b (4*h) (6*h+6) := by
  dsimp only
  rw [(RightR30.right_labels (10*h+2)).2.1,(RightR30.right_labels (10*h+2)).2.2]
  have hs : 4*h-2+2=4*h := by omega
  have hs' : 4*h-1+1=4*h := by omega
  refine ⟨by omega,by omega,?_,?_,?_⟩
  all_goals constructor <;> first | omega | nlinarith

end UniformDistanceR126
#print axioms UniformDistanceR126.family_degrees
#print axioms UniformDistanceR126.family_member
#print axioms UniformDistanceR126.original_scope
