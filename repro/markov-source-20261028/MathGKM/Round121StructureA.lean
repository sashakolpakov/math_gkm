import MathGKM.Round120PacketsA
import MathGKM.Round76CountingA

/- Machine-authored round121. Necessary structure of the frozen packet relation.
No rank-raising map or cardinality domination is assumed or concluded. -/
namespace PacketStructureR121
open LocalRetilingR76 PacketsR120 MatchingSeparatorR63
open PacketsR120.Tile

theorem pq_card (sigma : ℕ) (M : Finset ℕ) : p sigma M + q sigma M = M.card := by
  classical
  have hf : M.filter (fun e => (e+sigma)%2=1) =
      M.filter (fun e => ¬ (e+sigma)%2=0) := by
    apply Finset.filter_congr
    intro e _
    have := Nat.mod_lt (e+sigma) (by decide : 0<2)
    omega
  rw [p,q,hf]
  exact Finset.card_filter_add_card_filter_not _

theorem total_degree (N sigma : ℕ) (o : Obj) (ho : valid N o) :
    du sigma o + dv N sigma o + o.1.card = N := by
  have hp := pq_card sigma o.1
  have hb := FiniteMatchingR61.cardinality N o.1 ho.1
  have hs := Finset.card_le_card ho.2
  have hu := ColorFibersR76.uncovered_card N o.1 ho.1
  change (ColorFibersR66.uncovered N o.1).card = N-2*o.1.card at hu
  unfold du dv
  omega

theorem endpoint_matching_changes (N sigma r t : ℕ) (z w : Pair)
    (hz : valid N z.1 ∧ valid N z.2)
    (hw : valid N w.1 ∧ valid N w.2)
    (hd : du sigma z.1=r ∧ du sigma z.2=r+2 ∧
      du sigma w.1=r+1 ∧ du sigma w.2=r+1 ∧
      dv N sigma z.1=t ∧ dv N sigma z.2=t ∧
      dv N sigma w.1=t ∧ dv N sigma w.2=t) :
    w.1.1.card+1=z.1.1.card ∧ w.2.1.card=z.2.1.card+1 := by
  have h1 := total_degree N sigma z.1 hz.1
  have h2 := total_degree N sigma z.2 hz.2
  have h3 := total_degree N sigma w.1 hw.1
  have h4 := total_degree N sigma w.2 hw.2
  omega

def dimers : List Tile → ℕ
  | [] => 0
  | D::xs => 1+dimers xs
  | _::xs => dimers xs

theorem dimers_append (xs ys : List Tile) : dimers (xs++ys)=dimers xs+dimers ys := by
  induction xs with
  | nil => simp [dimers]
  | cons x xs ih => cases x <;> simp [dimers,ih,Nat.add_assoc]

theorem decode_lower (xs : List Tile) (v e : ℕ)
    (he : e ∈ (decodeFrom v xs).1) : v≤e := by
  induction xs generalizing v with
  | nil => simpa [decodeFrom] using he
  | cons x xs ih =>
    cases x with
    | D =>
      simp only [decodeFrom,Finset.mem_insert] at he
      rcases he with rfl|he
      · exact Nat.le_refl _
      · have := ih (v+2) he; omega
    | U => have := ih (v+1) he; omega
    | V => have := ih (v+1) he; omega

theorem decode_dimers (xs : List Tile) (v : ℕ) :
    (decodeFrom v xs).1.card=dimers xs := by
  induction xs generalizing v with
  | nil => rfl
  | cons x xs ih =>
    cases x with
    | D =>
      have hn : v ∉ (decodeFrom (v+2) xs).1 := by
        intro h
        have := decode_lower xs (v+2) v h
        omega
      simp [decodeFrom,dimers,Finset.card_insert_of_notMem hn,ih,Nat.add_comm]
    | U => exact ih (v+1)
    | V => exact ih (v+1)

def uscore (sigma v : ℕ) : List Tile → ℕ
  | [] => 0
  | D::xs => (if (v+sigma)%2=0 then 1 else 0)+uscore sigma (v+2) xs
  | U::xs => 1+uscore sigma (v+1) xs
  | V::xs => uscore sigma (v+1) xs

theorem decode_lower_U (xs : List Tile) (v e : ℕ)
    (he : e ∈ (decodeFrom v xs).2) : v≤e := by
  induction xs generalizing v with
  | nil => simpa [decodeFrom] using he
  | cons x xs ih =>
    cases x with
    | U =>
      simp only [decodeFrom,Finset.mem_insert] at he
      rcases he with rfl|he
      · exact Nat.le_refl _
      · have := ih (v+1) he; omega
    | D => have := ih (v+2) he; omega
    | V => have := ih (v+1) he; omega

theorem decode_uscore (xs : List Tile) (sigma v : ℕ) :
    du sigma (decodeFrom v xs)=uscore sigma v xs := by
  classical
  induction xs generalizing v with
  | nil => simp [decodeFrom,du,p,uscore]
  | cons x xs ih =>
    cases x with
    | D =>
      have hn : v ∉ (decodeFrom (v+2) xs).1 := by
        intro h; have := decode_lower xs (v+2) v h; omega
      have hf : v ∉ ((decodeFrom (v+2) xs).1.filter (fun e => (e+sigma)%2=0)) :=
        fun h => hn (Finset.mem_filter.mp h).1
      by_cases hv : (v+sigma)%2=0
      · simp only [decodeFrom,du,p,uscore,Finset.filter_insert,if_pos hv,
          Finset.card_insert_of_notMem hf]
        have hi := ih (v+2)
        unfold du p at hi
        omega
      · simpa only [decodeFrom,du,p,uscore,Finset.filter_insert,if_neg hv,
          Nat.zero_add] using ih (v+2)
    | U =>
      have hn : v ∉ (decodeFrom (v+1) xs).2 := by
        intro h; have := decode_lower_U xs (v+1) v h; omega
      simpa [decodeFrom,du,uscore,Finset.card_insert_of_notMem hn,
        Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using ih (v+1)
    | V => exact ih (v+1)

theorem uscore_append (xs ys : List Tile) (sigma v : ℕ) :
    uscore sigma v (xs++ys)=uscore sigma v xs+uscore sigma (v+width xs) ys := by
  induction xs generalizing v with
  | nil => simp [uscore,width]
  | cons x xs ih =>
    cases x <;> simp [uscore,width,ih,Nat.add_assoc,Nat.add_comm,Nat.add_left_comm]

theorem width_append (xs ys : List Tile) : width (xs++ys)=width xs+width ys := by
  induction xs with
  | nil => simp [width]
  | cons x xs ih => cases x <;> simp [width,ih,Nat.add_assoc]

/- Exact signed du increments in any prefix/suffix context. For valid endpoints,
total_degree supplies dv increments, retaining natural-number boundary guards. -/
theorem contextual_delta (pre post a b : List Tile) (sigma : ℕ)
    (hw : width a=width b) :
    (du sigma (decode (pre++b++post)) : ℤ)-du sigma (decode (pre++a++post)) =
      (uscore sigma (width pre) b : ℤ)-uscore sigma (width pre) a := by
  simp only [decode,decode_uscore,uscore_append,width_append,Nat.zero_add,hw,Nat.cast_add]
  omega

theorem local_deltas (sigma v : ℕ) :
    ((uscore sigma v [V] : ℤ)-uscore sigma v [U] = -1) ∧
    ((uscore sigma v [U] : ℤ)-uscore sigma v [V] = 1) ∧
    (∀ a b, PacketsR120.monomer a → PacketsR120.monomer b →
      (uscore sigma v [a,b] : ℤ)-uscore sigma v [D] =
        (if a=U then 1 else 0)+(if b=U then 1 else 0)-
          (if (v+sigma)%2=0 then 1 else 0)) ∧
    (∀ a, PacketsR120.monomer a →
      (uscore sigma v [a,D] : ℤ)-uscore sigma v [D,a] =
        (if (v+1+sigma)%2=0 then 1 else 0)-
          (if (v+sigma)%2=0 then 1 else 0)) := by
  refine ⟨by simp [uscore],by simp [uscore],?_,?_⟩
  · intro a b ha hb
    rcases ha with rfl|rfl <;> rcases hb with rfl|rfl <;>
      simp [uscore] <;> split <;> norm_num
  · intro a ha
    rcases ha with rfl|rfl <;> simp [uscore] <;>
      split <;> split <;> norm_num

def splitEdit (N : ℕ) (x y : Obj) : Prop :=
  valid N x ∧ valid N y ∧ ∃ pre post : List Tile, ∃ a b : Tile,
    PacketsR120.monomer a ∧ PacketsR120.monomer b ∧
    width (pre++[D]++post)=N ∧ width (pre++[a,b]++post)=N ∧
    decode (pre++[D]++post)=x ∧ decode (pre++[a,b]++post)=y

def joinEdit (N : ℕ) (x y : Obj) : Prop := splitEdit N y x

theorem split_forced (N : ℕ) (x y : Obj) (he : edit N x y)
    (hc : y.1.card+1=x.1.card) : splitEdit N x y := by
  rcases he with ⟨hx,hy,pre,post,a,b,hr,haN,hbN,hax,hby⟩
  have ha : x.1.card=dimers pre+dimers a+dimers post := by
    rw [← hax]; simp [decode,decode_dimers,dimers_append,Nat.add_assoc]
  have hb : y.1.card=dimers pre+dimers b+dimers post := by
    rw [← hby]; simp [decode,decode_dimers,dimers_append,Nat.add_assoc]
  cases hr with
  | uv => simp [dimers] at ha hb; omega
  | vu => simp [dimers] at ha hb; omega
  | split a b hma hmb =>
    exact ⟨hx,hy,pre,post,a,b,hma,hmb,haN,hbN,hax,hby⟩
  | join a b hma hmb =>
    rcases hma with rfl|rfl <;> rcases hmb with rfl|rfl <;>
      simp [dimers] at ha hb <;> omega
  | slideR a hma =>
    rcases hma with rfl|rfl <;> simp [dimers] at ha hb <;> omega
  | slideL a hma =>
    rcases hma with rfl|rfl <;> simp [dimers] at ha hb <;> omega

theorem rule_symm {a b : List Tile} (h : Rule a b) : Rule b a := by
  cases h with
  | uv => exact Rule.vu
  | vu => exact Rule.uv
  | split a b ha hb => exact Rule.join a b ha hb
  | join a b ha hb => exact Rule.split a b ha hb
  | slideR a ha => exact Rule.slideL a ha
  | slideL a ha => exact Rule.slideR a ha

theorem edit_symm {N : ℕ} {x y : Obj} (h : edit N x y) : edit N y x := by
  rcases h with ⟨hx,hy,pre,post,a,b,hr,ha,hb,hx',hy'⟩
  exact ⟨hy,hx,pre,post,b,a,rule_symm hr,hb,ha,hy',hx'⟩

theorem join_forced (N : ℕ) (x y : Obj) (he : edit N x y)
    (hc : y.1.card=x.1.card+1) : joinEdit N x y :=
  split_forced N y x (edit_symm he) hc.symm

theorem edit_card_bounds (N : ℕ) (x y : Obj) (he : edit N x y) :
    y.1.card≤x.1.card+1 ∧ x.1.card≤y.1.card+1 := by
  rcases he with ⟨_,_,pre,post,a,b,hr,_,_,hax,hby⟩
  have ha : x.1.card=dimers pre+dimers a+dimers post := by
    rw [← hax]; simp [decode,decode_dimers,dimers_append,Nat.add_assoc]
  have hb : y.1.card=dimers pre+dimers b+dimers post := by
    rw [← hby]; simp [decode,decode_dimers,dimers_append,Nat.add_assoc]
  cases hr with
  | uv => simp [dimers] at ha hb; omega
  | vu => simp [dimers] at ha hb; omega
  | split a b hma hmb =>
    rcases hma with rfl|rfl <;> rcases hmb with rfl|rfl <;>
      simp [dimers] at ha hb <;> omega
  | join a b hma hmb =>
    rcases hma with rfl|rfl <;> rcases hmb with rfl|rfl <;>
      simp [dimers] at ha hb <;> omega
  | slideR a hma =>
    rcases hma with rfl|rfl <;> simp [dimers] at ha hb <;> omega
  | slideL a hma =>
    rcases hma with rfl|rfl <;> simp [dimers] at ha hb <;> omega

def two (N : ℕ) (x y : Obj) : Prop :=
  x=y ∨ edit N x y ∨ ∃ a, edit N x a ∧ edit N a y

def neutralEdit (N : ℕ) (x y : Obj) : Prop := edit N x y ∧ x.1.card=y.1.card
def splitRepair (N : ℕ) (x y : Obj) : Prop :=
  splitEdit N x y ∨
    (∃ a, splitEdit N x a ∧ neutralEdit N a y) ∨
    (∃ a, neutralEdit N x a ∧ splitEdit N a y)
def joinRepair (N : ℕ) (x y : Obj) : Prop := splitRepair N y x

theorem two_symm {N : ℕ} {x y : Obj} (h : two N x y) : two N y x := by
  rcases h with h|h|⟨a,h1,h2⟩
  · exact Or.inl h.symm
  · exact Or.inr (Or.inl (edit_symm h))
  · exact Or.inr (Or.inr ⟨a,edit_symm h2,edit_symm h1⟩)

theorem two_split_forced (N : ℕ) (x y : Obj) (ht : two N x y)
    (hc : y.1.card+1=x.1.card) : splitRepair N x y := by
  rcases ht with rfl|he|⟨a,hxa,hay⟩
  · omega
  · exact Or.inl (split_forced N x y he hc)
  · have h1 := edit_card_bounds N x a hxa
    have h2 := edit_card_bounds N a y hay
    have hm : (a.1.card+1=x.1.card ∧ a.1.card=y.1.card) ∨
        (x.1.card=a.1.card ∧ y.1.card+1=a.1.card) := by omega
    rcases hm with ⟨ha,hb⟩|⟨ha,hb⟩
    · exact Or.inr (Or.inl ⟨a,split_forced N x a hxa ha,hay,hb⟩)
    · exact Or.inr (Or.inr ⟨a,⟨hxa,ha⟩,split_forced N a y hay hb⟩)

theorem two_join_forced (N : ℕ) (x y : Obj) (ht : two N x y)
    (hc : y.1.card=x.1.card+1) : joinRepair N x y :=
  two_split_forced N y x (two_symm ht) hc.symm

theorem packet_factor (N : ℕ) (z w : Pair) (h : packet N z w)
    (h1 : z.1≠w.1) (h2 : z.2≠w.2) :
    (edit N z.1 w.1 ∧ two N z.2 w.2) ∨
    (two N z.1 w.1 ∧ edit N z.2 w.2) := by
  rcases h with ⟨rfl,_,_⟩|h|⟨a,hza,haw⟩|⟨a,b,hza,hab,hbw⟩
  · exact (h1 rfl).elim
  · rcases h.2.2.2.2 with ⟨_,h⟩|⟨h,_⟩
    · exact (h2 h).elim
    · exact (h1 h).elim
  · rcases hza.2.2.2.2 with ⟨za,ea⟩|⟨ea,za⟩ <;>
      rcases haw.2.2.2.2 with ⟨aw,ew⟩|⟨ew,aw⟩
    · exact (h2 (ea.trans ew)).elim
    · exact Or.inl ⟨ew ▸ za, Or.inr (Or.inl (ea ▸ aw))⟩
    · exact Or.inl ⟨ea.symm ▸ aw, Or.inr (Or.inl (ew ▸ za))⟩
    · exact (h1 (ea.trans ew)).elim
  · rcases hza.2.2.2.2 with ⟨za,ea⟩|⟨ea,za⟩ <;>
      rcases hab.2.2.2.2 with ⟨ab,eb⟩|⟨eb,ab⟩ <;>
      rcases hbw.2.2.2.2 with ⟨bw,ew⟩|⟨ew,bw⟩
    · exact (h2 (ea.trans (eb.trans ew))).elim
    · exact Or.inr ⟨Or.inr (Or.inr ⟨a.1,za,ew ▸ ab⟩), ea.symm ▸ (eb.symm ▸ bw)⟩
    · exact Or.inr ⟨Or.inr (Or.inr ⟨a.1,za,eb.symm ▸ bw⟩), ea.symm ▸ (ew ▸ ab)⟩
    · exact Or.inl ⟨ew ▸ (eb ▸ za), Or.inr (Or.inr ⟨b.2,ea.symm ▸ ab,bw⟩)⟩
    · exact Or.inr ⟨Or.inr (Or.inr ⟨b.1,ea.symm ▸ ab,bw⟩), ew ▸ (eb ▸ za)⟩
    · exact Or.inl ⟨ea.symm ▸ (ew ▸ ab), Or.inr (Or.inr ⟨a.2,za,eb.symm ▸ bw⟩)⟩
    · exact Or.inl ⟨ea.symm ▸ (eb.symm ▸ bw), Or.inr (Or.inr ⟨a.2,za,ew ▸ ab⟩)⟩
    · exact (h1 (ea.trans (eb.trans ew))).elim

theorem balanced_packet (N sigma r t : ℕ) (z w : Pair)
    (hz : valid N z.1 ∧ valid N z.2)
    (hw : valid N w.1 ∧ valid N w.2)
    (hd : du sigma z.1=r ∧ du sigma z.2=r+2 ∧
      du sigma w.1=r+1 ∧ du sigma w.2=r+1 ∧
      dv N sigma z.1=t ∧ dv N sigma z.2=t ∧
      dv N sigma w.1=t ∧ dv N sigma w.2=t)
    (h : packet N z w) :
    (splitEdit N z.1 w.1 ∧ two N z.2 w.2) ∨
    (two N z.1 w.1 ∧ joinEdit N z.2 w.2) := by
  have hm := endpoint_matching_changes N sigma r t z w hz hw hd
  have h1 : z.1≠w.1 := by intro he; rw [he] at hm; omega
  have h2 : z.2≠w.2 := by intro he; rw [he] at hm; omega
  rcases packet_factor N z w h h1 h2 with ⟨he,ht⟩|⟨ht,he⟩
  · exact Or.inl ⟨split_forced N z.1 w.1 he hm.1,ht⟩
  · exact Or.inr ⟨ht,join_forced N z.2 w.2 he hm.2⟩

/- Normal forms of every balanced <=3-edit endpoint pair. splitRepair and
joinRepair allow only the indicated split/join and one matching-neutral edit.
The neutral edit may change either degree temporarily. -/
theorem balanced_normal_form (N sigma r t : ℕ) (z w : Pair)
    (hz : valid N z.1 ∧ valid N z.2)
    (hw : valid N w.1 ∧ valid N w.2)
    (hd : du sigma z.1=r ∧ du sigma z.2=r+2 ∧
      du sigma w.1=r+1 ∧ du sigma w.2=r+1 ∧
      dv N sigma z.1=t ∧ dv N sigma z.2=t ∧
      dv N sigma w.1=t ∧ dv N sigma w.2=t)
    (h : packet N z w) :
    (splitEdit N z.1 w.1 ∧ joinRepair N z.2 w.2) ∨
    (splitRepair N z.1 w.1 ∧ joinEdit N z.2 w.2) := by
  have hm := endpoint_matching_changes N sigma r t z w hz hw hd
  rcases balanced_packet N sigma r t z w hz hw hd h with ⟨hs,ht⟩|⟨ht,hj⟩
  · exact Or.inl ⟨hs,two_join_forced N z.2 w.2 ht hm.2⟩
  · exact Or.inr ⟨two_split_forced N z.1 w.1 ht hm.1,hj⟩

theorem split_edit {N : ℕ} {x y : Obj} (h : splitEdit N x y) : edit N x y := by
  rcases h with ⟨hx,hy,pre,post,a,b,ha,hb,hw1,hw2,hx',hy'⟩
  exact ⟨hx,hy,pre,post,[D],[a,b],Rule.split a b ha hb,hw1,hw2,hx',hy'⟩

theorem join_edit {N : ℕ} {x y : Obj} (h : joinEdit N x y) : edit N x y :=
  edit_symm (split_edit h)

theorem splitRepair_two {N : ℕ} {x y : Obj} (h : splitRepair N x y) : two N x y := by
  rcases h with h|⟨a,hs,hn⟩|⟨a,hn,hs⟩
  · exact Or.inr (Or.inl (split_edit h))
  · exact Or.inr (Or.inr ⟨a,split_edit hs,hn.1⟩)
  · exact Or.inr (Or.inr ⟨a,hn.1,split_edit hs⟩)

theorem joinRepair_two {N : ℕ} {x y : Obj} (h : joinRepair N x y) : two N x y :=
  two_symm (splitRepair_two h)

theorem pair_left {N : ℕ} {x y t : Obj} (h : edit N x y) (ht : valid N t) :
    pairEdit N (x,t) (y,t) := ⟨h.1,ht,h.2.1,ht,Or.inl ⟨h,rfl⟩⟩
theorem pair_right {N : ℕ} {x y t : Obj} (h : edit N x y) (ht : valid N t) :
    pairEdit N (t,x) (t,y) := ⟨ht,h.1,ht,h.2.1,Or.inr ⟨rfl,h⟩⟩

theorem parallel_packet (N : ℕ) (z w : Pair)
    (hz : valid N z.1 ∧ valid N z.2) (hw : valid N w.1 ∧ valid N w.2)
    (h : (edit N z.1 w.1 ∧ two N z.2 w.2) ∨
      (two N z.1 w.1 ∧ edit N z.2 w.2)) : packet N z w := by
  rcases z with ⟨x1,x2⟩; rcases w with ⟨y1,y2⟩
  rcases h with ⟨he,ht⟩|⟨ht,he⟩
  · rcases ht with heq|ht|⟨a,ha,hb⟩
    · change x2=y2 at heq
      subst y2
      exact Or.inr (Or.inl (pair_left he hz.2))
    · exact Or.inr (Or.inr (Or.inl ⟨(y1,x2),pair_left he hz.2,pair_right ht hw.1⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨(y1,x2),(y1,a),pair_left he hz.2,
        pair_right ha hw.1,pair_right hb hw.1⟩))
  · rcases ht with heq|ht|⟨a,ha,hb⟩
    · change x1=y1 at heq
      subst y1
      exact Or.inr (Or.inl (pair_right he hz.1))
    · exact Or.inr (Or.inr (Or.inl ⟨(y1,x2),pair_left ht hz.2,pair_right he hw.1⟩))
    · exact Or.inr (Or.inr (Or.inr ⟨(a,x2),(y1,x2),pair_left ha hz.2,
        pair_left hb hz.2,pair_right he hw.1⟩))

theorem balanced_iff_normal_form (N sigma r t : ℕ) (z w : Pair)
    (hz : valid N z.1 ∧ valid N z.2)
    (hw : valid N w.1 ∧ valid N w.2)
    (hd : du sigma z.1=r ∧ du sigma z.2=r+2 ∧
      du sigma w.1=r+1 ∧ du sigma w.2=r+1 ∧
      dv N sigma z.1=t ∧ dv N sigma z.2=t ∧
      dv N sigma w.1=t ∧ dv N sigma w.2=t) :
    packet N z w ↔
      (splitEdit N z.1 w.1 ∧ joinRepair N z.2 w.2) ∨
      (splitRepair N z.1 w.1 ∧ joinEdit N z.2 w.2) := by
  constructor
  · exact balanced_normal_form N sigma r t z w hz hw hd
  · intro h
    apply parallel_packet N z w hz hw
    rcases h with ⟨hs,hj⟩|⟨hs,hj⟩
    · exact Or.inl ⟨split_edit hs,joinRepair_two hj⟩
    · exact Or.inr ⟨splitRepair_two hs,join_edit hj⟩

end PacketStructureR121
#print axioms PacketStructureR121.total_degree
#print axioms PacketStructureR121.balanced_packet
#print axioms PacketStructureR121.contextual_delta
#print axioms PacketStructureR121.local_deltas
#print axioms PacketStructureR121.balanced_normal_form
#print axioms PacketStructureR121.balanced_iff_normal_form
