import MathGKM.Round121StructureA

/- Machine-authored round124. Retains round123 objects and edit relation.
Generic local dimer bounds replace the interrupted two-step decision proof. -/
namespace PacketObstructionR124
open PacketsR120 PacketStructureR121 LocalRetilingR76
open PacketsR120.Tile

theorem lower_M (xs : List Tile) (v : ℕ) : v ∉ (decodeFrom (v+1) xs).1 := by
  intro h
  have := decode_lower xs (v+1) v h
  omega
theorem lower_S (xs : List Tile) (v : ℕ) : v ∉ (decodeFrom (v+1) xs).2 := by
  intro h
  have := decode_lower_U xs (v+1) v h
  omega

theorem decode_injective (xs ys : List Tile) (v : ℕ)
    (hw : width xs=width ys) (he : decodeFrom v xs=decodeFrom v ys) : xs=ys := by
  induction xs generalizing ys v with
  | nil =>
    cases ys with
    | nil => rfl
    | cons y ys => cases y <;> simp only [width] at hw <;> omega
  | cons x xs ih =>
    cases ys with
    | nil => cases x <;> simp [width] at hw
    | cons y ys =>
      have hm := congrArg Prod.fst he
      have hs := congrArg Prod.snd he
      cases x <;> cases y
      · have hx : v ∉ (decodeFrom (v+2) xs).1 := by
          intro h; have := decode_lower xs (v+2) v h; omega
        have hy : v ∉ (decodeFrom (v+2) ys).1 := by
          intro h; have := decode_lower ys (v+2) v h; omega
        simp only [decodeFrom] at hm hs
        have ht : decodeFrom (v+2) xs=decodeFrom (v+2) ys :=
          Prod.ext (by simpa [hx,hy] using congrArg (fun s : Finset ℕ => s.erase v) hm) hs
        have hh := ih ys (v+2) (by simpa [width] using hw) ht
        simpa [hh]
      · have hn := lower_M ys v
        simp only [decodeFrom] at hm
        have : v ∈ (decodeFrom (v+1) ys).1 := hm ▸ Finset.mem_insert_self _ _
        exact (hn this).elim
      · have hn := lower_M ys v
        simp only [decodeFrom] at hm
        have : v ∈ (decodeFrom (v+1) ys).1 := hm ▸ Finset.mem_insert_self _ _
        exact (hn this).elim
      · have hn := lower_M xs v
        simp only [decodeFrom] at hm
        have : v ∈ (decodeFrom (v+1) xs).1 := hm.symm ▸ Finset.mem_insert_self _ _
        exact (hn this).elim
      · simp only [decodeFrom] at hm hs
        have ht : decodeFrom (v+1) xs=decodeFrom (v+1) ys :=
          Prod.ext hm (by simpa [lower_S] using congrArg (fun s : Finset ℕ => s.erase v) hs)
        have hh := ih ys (v+1) (by simpa [width] using hw) ht
        simpa [hh]
      · have hn := lower_S ys v
        simp only [decodeFrom] at hs
        have : v ∈ (decodeFrom (v+1) ys).2 := hs ▸ Finset.mem_insert_self _ _
        exact (hn this).elim
      · have hn := lower_M xs v
        simp only [decodeFrom] at hm
        have : v ∈ (decodeFrom (v+1) xs).1 := hm.symm ▸ Finset.mem_insert_self _ _
        exact (hn this).elim
      · have hn := lower_S xs v
        simp only [decodeFrom] at hs
        have : v ∈ (decodeFrom (v+1) xs).2 := hs.symm ▸ Finset.mem_insert_self _ _
        exact (hn this).elim
      · simp only [decodeFrom] at hm hs
        have hh := ih ys (v+1) (by simpa [width] using hw) (Prod.ext hm hs)
        simpa [hh]

def headMoves : List Tile → Finset (List Tile)
  | [] => ∅
  | D::xs => {[U,U]++xs,[U,V]++xs,[V,U]++xs,[V,V]++xs} ∪
      (match xs with
       | U::ys => {[U,D]++ys}
       | V::ys => {[V,D]++ys}
       | _ => ∅)
  | U::xs => {V::xs} ∪
      (match xs with
       | D::ys => {[D,U]++ys}
       | U::ys => {D::ys}
       | V::ys => {D::ys}
       | [] => ∅)
  | V::xs => {U::xs} ∪
      (match xs with
       | D::ys => {[D,V]++ys}
       | U::ys => {D::ys}
       | V::ys => {D::ys}
       | [] => ∅)

def moves : List Tile → Finset (List Tile)
  | [] => ∅
  | a::xs => headMoves (a::xs) ∪ (moves xs).image (List.cons a)

theorem rule_mem (a b post : List Tile) (h : Rule a b) :
    b++post ∈ moves (a++post) := by
  cases h with
  | uv => simp [moves,headMoves]
  | vu => simp [moves,headMoves]
  | split a b ha hb =>
    rcases ha with rfl|rfl <;> rcases hb with rfl|rfl <;> simp [moves,headMoves]
  | join a b ha hb =>
    rcases ha with rfl|rfl <;> rcases hb with rfl|rfl <;> simp [moves,headMoves]
  | slideR a ha => rcases ha with rfl|rfl <;> simp [moves,headMoves]
  | slideL a ha => rcases ha with rfl|rfl <;> simp [moves,headMoves]

theorem context_mem (pre post a b : List Tile) (h : Rule a b) :
    pre++b++post ∈ moves (pre++a++post) := by
  induction pre with
  | nil => simpa using rule_mem a b post h
  | cons c cs ih =>
    simp only [List.cons_append,moves,Finset.mem_union]
    exact Or.inr (Finset.mem_image.mpr ⟨cs++b++post,ih,rfl⟩)

theorem edit_mem (N : ℕ) (xs : List Tile) (y : Obj)
    (hw : width xs=N) (h : edit N (decode xs) y) :
    ∃ ys ∈ moves xs, decode ys=y ∧ width ys=N := by
  rcases h with ⟨_,_,pre,post,a,b,hr,ha,hb,hx,hy⟩
  have he : pre++a++post=xs := decode_injective _ _ 0 (ha.trans hw.symm) hx
  exact ⟨pre++b++post,he ▸ context_mem pre post a b hr,hy,hb⟩

def highWord : List Tile :=
  [V,D,D,V,D,D,V,D,D,V,D,D,V,D,D,V]
def lowWord : List Tile :=
  [V,D,D,D,D,D,D,D,D,D,D,V,D,D]
def high : Obj := decode highWord
def low : Obj := decode lowWord


def monomerB : Tile → Bool
  | D => false
  | U => true
  | V => true

def adjacent : List Tile → Bool
  | [] => false
  | [_] => false
  | a::b::xs => (monomerB a && monomerB b) || adjacent (b::xs)

theorem head_bound (xs ys : List Tile) (h : ys ∈ headMoves xs) :
    dimers ys ≤ dimers xs+1 := by
  cases xs with
  | nil => simp [headMoves] at h
  | cons a xs =>
    cases xs with
    | nil => cases a <;> simp_all [headMoves,dimers] <;> aesop (add simp dimers)
    | cons b xs =>
      cases a <;> cases b <;> simp_all [headMoves,dimers] <;>
        aesop (add simp dimers) (add safe (by omega))

theorem head_no_join (xs ys : List Tile) (hj : adjacent xs=false)
    (h : ys ∈ headMoves xs) : dimers ys ≤ dimers xs := by
  cases xs with
  | nil => simp [headMoves] at h
  | cons a xs =>
    cases xs with
    | nil => cases a <;> simp_all [headMoves,dimers] <;> aesop (add simp dimers)
    | cons b xs =>
      cases a <;> cases b <;> simp_all [headMoves,dimers,adjacent,monomerB] <;>
        aesop (add simp dimers) (add safe (by omega))

theorem move_bound (xs ys : List Tile) (h : ys ∈ moves xs) :
    dimers ys ≤ dimers xs+1 := by
  induction xs generalizing ys with
  | nil => simp [moves] at h
  | cons a xs ih =>
    rcases Finset.mem_union.mp h with h|h
    · exact head_bound _ _ h
    · obtain ⟨zs,hz,rfl⟩ := Finset.mem_image.mp h
      have hb := ih zs hz
      cases a <;> simp only [dimers] <;> omega

theorem move_no_join (xs ys : List Tile) (hj : adjacent xs=false)
    (h : ys ∈ moves xs) : dimers ys ≤ dimers xs := by
  induction xs generalizing ys with
  | nil => simp [moves] at h
  | cons a xs ih =>
    rcases Finset.mem_union.mp h with h|h
    · exact head_no_join _ _ hj h
    · obtain ⟨zs,hz,rfl⟩ := Finset.mem_image.mp h
      have ht : adjacent xs=false := by
        cases xs with
        | nil => rfl
        | cons b xs => exact (Bool.or_eq_false_iff.mp hj).2
      have hb := ih zs ht hz
      cases a <;> simp only [dimers] <;> omega

set_option maxRecDepth 100000 in
set_option maxHeartbeats 1000000 in
theorem first_moves : ∀ ys ∈ moves highWord,
    dimers ys ≤ 9 ∨ (dimers ys ≤ 10 ∧ adjacent ys=false) := by
  decide

theorem word_no_gain :
    (∀ ys ∈ moves highWord, dimers ys≤10) ∧
    (∀ ys ∈ moves highWord, ∀ zs ∈ moves ys, dimers zs≤10) := by
  constructor
  · intro ys hy
    rcases first_moves ys hy with h|⟨h,_⟩ <;> omega
  · intro ys hy zs hz
    rcases first_moves ys hy with h|⟨h,hj⟩
    · have := move_bound ys zs hz; omega
    · have := move_no_join ys zs hj hz; omega

theorem two_no_gain (y : Obj) (h : two 26 high y) : y.1.card≤10 := by
  rcases h with he|he|⟨a,h1,h2⟩
  · rw [← he]; decide
  · obtain ⟨ys,hys,hy,_⟩ := edit_mem 26 highWord y (by decide) he
    rw [← hy]
    exact (decode_dimers ys 0).trans_le (word_no_gain.1 ys hys)
  · obtain ⟨ys,hys,hy,hw⟩ := edit_mem 26 highWord a (by decide) h1
    rw [← hy] at h2
    obtain ⟨zs,hzs,hz,_⟩ := edit_mem 26 ys y hw h2
    rw [← hz]
    exact (decode_dimers zs 0).trans_le (word_no_gain.2 ys hys zs hzs)

theorem source_degrees :
    valid 26 low ∧ valid 26 high ∧
    du 0 low=2 ∧ du 0 high=4 ∧ dv 26 0 low=12 ∧ dv 26 0 high=12 := by
  decide

theorem balanced_dimer_barrier (N sigma r t : ℕ) (z w : Pair)
    (hz : valid N z.1 ∧ valid N z.2)
    (hw : valid N w.1 ∧ valid N w.2)
    (hd : du sigma z.1=r ∧ du sigma z.2=r+2 ∧
      du sigma w.1=r+1 ∧ du sigma w.2=r+1 ∧
      dv N sigma z.1=t ∧ dv N sigma z.2=t ∧
      dv N sigma w.1=t ∧ dv N sigma w.2=t)
    (hb : ∀ y, two N z.2 y → y.1.card ≤ z.2.1.card) :
    ¬ packet N z w := by
  intro hp
  have hc := endpoint_matching_changes N sigma r t z w hz hw hd
  have ht : two N z.2 w.2 := by
    rcases balanced_packet N sigma r t z w hz hw hd hp with ⟨_,h⟩|⟨_,h⟩
    · exact h
    · exact Or.inr (Or.inl (join_edit h))
  have := hb w.2 ht
  omega

theorem no_central_packet (w : Pair)
    (hw : valid 26 w.1 ∧ valid 26 w.2)
    (hd : du 0 w.1=3 ∧ du 0 w.2=3 ∧ dv 26 0 w.1=12 ∧ dv 26 0 w.2=12) :
    ¬ packet 26 (low,high) w := by
  have hs := source_degrees
  have hh : du 0 low=2 ∧ du 0 high=2+2 ∧
      du 0 w.1=2+1 ∧ du 0 w.2=2+1 ∧
      dv 26 0 low=12 ∧ dv 26 0 high=12 ∧
      dv 26 0 w.1=12 ∧ dv 26 0 w.2=12 :=
    ⟨hs.2.2.1,hs.2.2.2.1,hd.1,hd.2.1,hs.2.2.2.2.1,hs.2.2.2.2.2,hd.2.2.1,hd.2.2.2⟩
  apply balanced_dimer_barrier 26 0 2 12 (low,high) w ⟨hs.1,hs.2.1⟩ hw hh
  intro y ht
  have hb := two_no_gain y ht
  have hn : high.1.card=10 := by decide
  change y.1.card ≤ high.1.card
  omega

end PacketObstructionR124
#print axioms PacketObstructionR124.decode_injective
#print axioms PacketObstructionR124.edit_mem
#print axioms PacketObstructionR124.word_no_gain
#print axioms PacketObstructionR124.no_central_packet
#print axioms PacketObstructionR124.balanced_dimer_barrier
