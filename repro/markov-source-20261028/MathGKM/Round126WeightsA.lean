import MathGKM.Round126FamilyA

/- Machine-authored round126. Symbolic periodic dual weights. -/
namespace UniformDistanceR126
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open PacketsR120.Tile
def weight (h v : ℕ) : ℕ :=
  let s := v%(4*h+1)
  if s%2=0 then s/2 else 2*h-s/2

theorem residue_next (h e : ℕ) :
    (e+1)%(4*h+1)=if e%(4*h+1)=4*h then 0 else e%(4*h+1)+1 := by
  have hs := Nat.mod_lt e (by omega : 0<4*h+1)
  rw [Nat.add_mod]
  by_cases he : e%(4*h+1)=4*h
  · simp [he]
  · have ht : e%(4*h+1)+1<4*h+1 := by omega
    simp [he,Nat.mod_eq_of_lt ht]

theorem weight_edge (h e : ℕ) :
    weight h e+weight h (e+1)=
      if (e%(4*h+1))%2=1 then 2*h+1 else 2*h := by
  have hs := Nat.mod_lt e (by omega : 0<4*h+1)
  have hm := Nat.mod_lt (e%(4*h+1)) (by decide : 0<2)
  simp only [weight,residue_next]
  by_cases he : e%(4*h+1)=4*h
  · simp [he,Nat.mul_mod]
    omega
  · rw [if_neg he]
    split <;> split <;> split <;> omega

theorem decode_append_mem (xs ys : List Tile) (v e : ℕ) :
    e∈(decodeFrom v (xs++ys)).1 ↔
      e∈(decodeFrom v xs).1 ∨ e∈(decodeFrom (v+width xs) ys).1 := by
  induction xs generalizing v with
  | nil => simp [decodeFrom,width]
  | cons x xs ih =>
    cases x <;> simp [decodeFrom,width,ih,Nat.add_assoc,or_assoc]

theorem ds_member (k v e : ℕ) : e∈(decodeFrom v (List.replicate k D)).1 ↔
    ∃ j<k, e=v+2*j := by
  induction k generalizing v with
  | zero => simp [decodeFrom]
  | succ k ih =>
    simp only [List.replicate_succ,decodeFrom,Finset.mem_insert,ih]
    constructor
    · rintro (rfl|⟨j,hj,he⟩)
      · exact ⟨0,by omega,by omega⟩
      · exact ⟨j+1,by omega,by omega⟩
    · rintro ⟨j,hj,he⟩
      by_cases hz : j=0
      · left; omega
      · right; exact ⟨j-1,by omega,by omega⟩

theorem block_odd (h b e : ℕ)
    (he : e∈(decodeFrom (b*(4*h+1)+1) (List.replicate (2*h) D)).1) :
    (e%(4*h+1))%2=1 := by
  obtain ⟨j,hj,rfl⟩ := (ds_member _ _ _).mp he
  have hb : 1+2*j<4*h+1 := by omega
  have hr : (b*(4*h+1)+1+2*j)%(4*h+1)=1+2*j := by
    rw [show b*(4*h+1)+1+2*j=b*(4*h+1)+(1+2*j) by omega]
    simp [Nat.add_mod,Nat.mod_eq_of_lt hb]
  rw [hr]; omega

theorem high_odd (h e : ℕ) (he : e∈(high h).1) :
    (e%(4*h+1))%2=1 := by
  change e∈(decodeFrom 0 (highWord h)).1 at he
  simp only [highWord,List.replicate_succ,List.replicate_zero,List.flatten_cons,
    List.flatten_nil,List.append_nil,decodeFrom] at he
  simp only [decode_append_mem,width_append,width_ds,width,decodeFrom,
    Finset.notMem_empty,or_false,Nat.add_zero] at he
  rcases he with he|he|he|he|he
  · exact block_odd h 0 e (by simpa using he)
  · exact block_odd h 1 e (by convert he using 1 <;> congr 2 <;> omega)
  · exact block_odd h 2 e (by convert he using 1 <;> congr 2 <;> omega)
  · exact block_odd h 3 e (by convert he using 1 <;> congr 2 <;> omega)
  · exact block_odd h 4 e (by convert he using 1 <;> congr 2 <;> omega)

theorem dual_edges (h e : ℕ) :
    2*h+1≤weight h e+weight h (e+1)+(if e∈(high h).1 then 0 else 1) := by
  rw [weight_edge]
  by_cases he : e∈(high h).1
  · simp [he,high_odd h e he]
  · simp only [if_neg he]; split <;> omega

theorem weight_zero (h b : ℕ) : weight h (b*(4*h+1))=0 := by
  simp [weight]

theorem weightSum_add (W : ℕ → ℕ) (v a b : ℕ) :
    weightSum W v (a+b)=weightSum W v a+weightSum W (v+a) b := by
  induction a generalizing v with
  | zero => simp [weightSum]
  | succ a ih =>
    rw [show a+1+b=(a+b)+1 by omega]
    simp only [weightSum,ih]
    rw [show v+1+a=v+(a+1) by omega]
    omega

theorem ds_weight (h b k : ℕ) (hk : k≤2*h) :
    weightSum (weight h) (b*(4*h+1)+1) (2*k)=k*(2*h+1) := by
  induction k with
  | zero => simp [weightSum]
  | succ k ih =>
    have hi := ih (by omega)
    rw [show 2*(k+1)=2*k+2 by omega,weightSum_add]
    have he : ((b*(4*h+1)+1+2*k)%(4*h+1))%2=1 :=
      block_odd h b _ ((ds_member _ _ _).mpr ⟨k,by omega,rfl⟩)
    have hw := weight_edge h (b*(4*h+1)+1+2*k)
    rw [he,if_pos rfl] at hw
    simp only [weightSum] at *
    nlinarith

theorem period_weight (h b : ℕ) :
    weightSum (weight h) (b*(4*h+1)) (4*h+1)=2*h*(2*h+1) := by
  have ht := ds_weight h b (2*h) (by omega)
  rw [show 4*h+1=4*h+1 by rfl,weightSum,weight_zero]
  simpa only [show 2*(2*h)=4*h by omega,Nat.zero_add] using ht

theorem total_weight (h : ℕ) :
    weightSum (weight h) 0 (20*h+6)=10*h*(2*h+1) := by
  have hp : ∀ m b, weightSum (weight h) (b*(4*h+1)) (m*(4*h+1)+1)=m*(2*h*(2*h+1)) := by
    intro m
    induction m with
    | zero => intro b; simp [weightSum,weight_zero]
    | succ m ih =>
      intro b
      rw [show (m+1)*(4*h+1)+1=(4*h+1)+(m*(4*h+1)+1) by ring,
        weightSum_add,period_weight]
      rw [show b*(4*h+1)+(4*h+1)=(b+1)*(4*h+1) by ring,ih]
      ring
  convert hp 5 0 using 1 <;> ring

end UniformDistanceR126
