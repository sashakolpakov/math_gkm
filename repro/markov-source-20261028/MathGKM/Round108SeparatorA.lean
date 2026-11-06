import MathGKM.Round108CoarseA

/- Machine-authored r108. Candidate certification of the first committed
color-forgetting component obstruction. No statement about raw LC is negated. -/
namespace ColorForgettingSeparatorR108
open LocalRetilingR76
open ColorForgettingR108
noncomputable section

def A : Obj := ({0,2,4,6,8},∅)
def B : Obj := ({0,3,5},∅)
def z : Pair := (A,B)
def C : Finset Pair := {z,swap z}

instance validDec (N : ℕ) (o : Obj) : Decidable (valid N o) := by
  unfold valid
  infer_instance
instance fiberDec (N sigma t L : ℕ) (w : Pair) : Decidable (ColorForgettingR108.fiber N sigma t L w) := by
  unfold ColorForgettingR108.fiber
  infer_instance

def window (lo hi : ℕ) : Finset ℕ := (Finset.range hi).filter (lo≤·)
def replacements (lo hi : ℕ) (o : Obj) : Finset Obj :=
  (((window lo hi).powerset) ×ˢ ((window lo hi).powerset)).image fun v =>
    (o.1.filter (fun e => e<lo ∨ hi≤e) ∪ v.1,
     o.2.filter (fun e => e<lo ∨ hi≤e) ∪ v.2)
def candidates (lo hi : ℕ) (w : Pair) : Finset Pair :=
  (replacements lo hi w.1) ×ˢ (replacements lo hi w.2)

theorem mem_replacements (lo hi : ℕ) (o w : Obj)
    (h : outside lo hi o w) : w ∈ replacements lo hi o := by
  let M := w.1.filter (fun e => lo≤e ∧ e<hi)
  let S := w.2.filter (fun e => lo≤e ∧ e<hi)
  apply Finset.mem_image.mpr
  refine ⟨(M,S),Finset.mem_product.mpr ⟨?_,?_⟩,?_⟩
  · apply Finset.mem_powerset.mpr
    intro e he
    simp only [M,Finset.mem_filter] at he
    simpa [window] using And.intro he.2.2 he.2.1
  · apply Finset.mem_powerset.mpr
    intro e he
    simp only [S,Finset.mem_filter] at he
    simpa [window] using And.intro he.2.2 he.2.1
  · apply Prod.ext
    · rw [h.1]
      ext e
      simp only [M,Finset.mem_union,Finset.mem_filter]
      by_cases he : e ∈ w.1 <;> simp_all <;> omega
    · rw [h.2]
      ext e
      simp only [S,Finset.mem_union,Finset.mem_filter]
      by_cases he : e ∈ w.2 <;> simp_all <;> omega

theorem window_cases (lo d : ℕ) (hd : 1≤d) (hd4 : d≤4) (hb : lo+d≤10)
    (hA : clear lo (lo+d) A) (hB : clear lo (lo+d) B) :
    (lo=0 ∧ d=2) ∨ (lo=8 ∧ d=2) := by
  have ha0 := hA 0 (by decide)
  have ha2 := hA 2 (by decide)
  have ha4 := hA 4 (by decide)
  have ha6 := hA 6 (by decide)
  have ha8 := hA 8 (by decide)
  have hb3 := hB 3 (by decide)
  have hb5 := hB 5 (by decide)
  omega

set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem local_zero : ∀ w ∈ candidates 0 2 z,
    ColorForgettingR108.fiber 10 1 5 2 w →
    rank 1 w ≤ 1 → w=z := by
  decide
set_option maxRecDepth 10000 in
set_option maxHeartbeats 2000000 in
theorem local_eight : ∀ w ∈ candidates 8 10 z,
    ColorForgettingR108.fiber 10 1 5 2 w →
    rank 1 w ≤ 1 → w=z := by
  decide

theorem outgoing (w : Pair) (hw : ColorForgettingR108.fiber 10 1 5 2 w)
    (h : retile 10 1 z w) : w=z := by
  obtain ⟨lo,d,hd,hd4,hb,ha,hb',_,_,ho1,ho2,hr1,hr2⟩ := h
  have hr : rank 1 w≤1 := by
    have hz : rank 1 z=0 := by decide
    omega
  have hc := Finset.mem_product.mpr
    ⟨mem_replacements lo (lo+d) A w.1 ho1,mem_replacements lo (lo+d) B w.2 ho2⟩
  rcases window_cases lo d hd hd4 hb ha hb' with ⟨rfl,rfl⟩|⟨rfl,rfl⟩
  · exact local_zero w hc hw hr
  · exact local_eight w hc hw hr

theorem valid_z : ColorForgettingR108.fiber 10 1 5 2 z := by decide

theorem retile_swapped (N sigma t L : ℕ) (x y : Pair)
    (hx : ColorForgettingR108.fiber N sigma t L x)
    (hy : ColorForgettingR108.fiber N sigma t L y)
    (h : retile N sigma x y) : retile N sigma (swap x) (swap y) := by
  obtain ⟨lo,d,hd,hd4,hb,h1,h2,h3,h4,h5,h6,h7,h8⟩ := h
  refine ⟨lo,d,hd,hd4,hb,h2,h1,h4,h3,h6,h5,?_,?_⟩
  · have ha := hx.2.2.2.2
    have hb := hy.2.2.2.2
    simp only [rank,swap] at *
    omega
  · have ha := hx.2.2.2.2
    have hb := hy.2.2.2.2
    simp only [rank,swap] at *
    omega

theorem outgoing_swap (w : Pair) (hw : ColorForgettingR108.fiber 10 1 5 2 w)
    (h : retile 10 1 (swap z) w) : w=swap z := by
  have hs := retile_swapped 10 1 5 2 (swap z) w
    (ColorForgettingR108.swap_fiber 10 1 5 2 z valid_z) hw h
  have hh : retile 10 1 z (swap w) := by simpa [swap] using hs
  have he := outgoing (swap w) (ColorForgettingR108.swap_fiber 10 1 5 2 w hw) hh
  have h := congrArg swap he
  simpa [swap] using h

theorem valid_C : ∀ w ∈ C, ColorForgettingR108.fiber 10 1 5 2 w := by
  intro w hw
  simp only [C,Finset.mem_insert,Finset.mem_singleton] at hw
  rcases hw with rfl|rfl
  · exact valid_z
  · exact ColorForgettingR108.swap_fiber 10 1 5 2 z valid_z

theorem closed_C : ∀ w ∈ C, ∀ v, ColorForgettingR108.edge 10 1 5 2 w v → v∈C := by
  intro w hw v hv
  simp only [C,Finset.mem_insert,Finset.mem_singleton] at hw
  rcases hw with rfl|rfl
  · rcases hv.2.2 with he|he
    · simp [C,he]
    · simp [C,outgoing v hv.2.1 he]
  · rcases hv.2.2 with he|he
    · simp [C,he,swap]
    · simp [C,outgoing_swap v hv.2.1 he]

theorem obstruction :
    (∀ w ∈ C, ColorForgettingR108.fiber 10 1 5 2 w) ∧
    (∀ w ∈ C, ∀ v, ColorForgettingR108.edge 10 1 5 2 w v → v∈C) ∧
    ColorForgettingR108.edge 10 1 5 2 z (swap z) ∧
    (C.filter (fun w => rank 1 w=0)).card=1 ∧
    (C.filter (fun w => rank 1 w=1)).card=0 ∧
    (C.filter (fun w => rank 1 w=2)).card=1 := by
  exact ⟨valid_C,closed_C,ColorForgettingR108.swap_edge 10 1 5 2 z valid_z,
    by decide,by decide,by decide⟩

theorem connected_C : ∀ w ∈ C,
    Relation.ReflTransGen (ColorForgettingR108.edge 10 1 5 2) z w := by
  intro w hw
  simp only [C,Finset.mem_insert,Finset.mem_singleton] at hw
  rcases hw with rfl|rfl
  · exact Relation.ReflTransGen.refl
  · exact Relation.ReflTransGen.single (ColorForgettingR108.swap_edge 10 1 5 2 z valid_z)

theorem component_certificate :
    z ∈ C ∧
    (∀ w ∈ C, ColorForgettingR108.fiber 10 1 5 2 w) ∧
    (∀ w ∈ C, ∀ v, ColorForgettingR108.edge 10 1 5 2 w v → v∈C) ∧
    (∀ w ∈ C, Relation.ReflTransGen (ColorForgettingR108.edge 10 1 5 2) z w) ∧
    (C.filter (fun w => rank 1 w=0)).card=1 ∧
    (C.filter (fun w => rank 1 w=1)).card=0 ∧
    (C.filter (fun w => rank 1 w=2)).card=1 ∧
    ¬((C.filter (fun w => rank 1 w=0)).card ≤
      (C.filter (fun w => rank 1 w=1)).card) := by
  exact ⟨by simp [C],valid_C,closed_C,connected_C,by decide,by decide,by decide,by decide⟩

end
end ColorForgettingSeparatorR108
#print axioms ColorForgettingSeparatorR108.outgoing
#print axioms ColorForgettingSeparatorR108.obstruction
#print axioms ColorForgettingSeparatorR108.component_certificate
