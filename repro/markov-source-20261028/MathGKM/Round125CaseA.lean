import MathGKM.Round125MetricA
import MathGKM.Round108CountingA
import MathGKM.Round30RightA

/- Machine-authored round125. Exact h=2 witnesses and finite dual certificate.
No whole rank fiber is enumerated. Temporary edits remain unrestricted. -/
set_option maxRecDepth 10000
namespace AugmentingCaseR125
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open ColorForgettingR108 MathGKM.Markov
open PacketsR120.Tile
def highWord : List Tile := [V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def lowWord : List Tile := [V,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,V,D,D,D,D,D,D]
def high : Obj := decode highWord
def low : Obj := decode lowWord
def weights : List ℕ := [0, 4, 1, 3, 2, 2, 3, 1, 4, 0, 4, 1, 3, 2, 2, 3, 1, 4, 0, 4, 1, 3, 2, 2, 3, 1, 4, 0, 4, 1, 3, 2, 2, 3, 1, 4, 0, 4, 1, 3, 2, 2, 3, 1, 4, 0]
def W (v : ℕ) : ℕ := weights.getD v 0

theorem dual_edges : ∀ e ∈ Finset.range 45,
    5≤W e+W (e+1)+(if e∈high.1 then 0 else 1) := by decide
theorem dual_total : weightSum W 0 46=100 := by decide
theorem high_card : high.1.card=20 := by decide

theorem high_gain_lower (k : ℕ) (y : Obj)
    (hs : Steps 46 k high y) (hg : high.1.card<y.1.card) : 5≤k := by
  obtain ⟨ys,hw,hy⟩ := steps_word hs highWord (by decide) rfl
  have he : ∀ e, e+1<46 → 5≤W e+W (e+1)+(if e∈high.1 then 0 else 1) := by
    intro e he; exact dual_edges e (Finset.mem_range.mpr (by omega))
  have hb := weighted_word_bound 46 5 high.1 W he ys 0 (by omega)
  have hc := steps_new_edges 46 k high y hs
  have hd : dimers ys=y.1.card := by rw [← hy]; exact (decode_dimers ys 0).symm
  have hn : newCount high.1 0 ys=(y.1 \ high.1).card := by
    rw [newCount_eq]; rw [← hy]; rfl
  rw [hw,dual_total,hd,hn] at hb
  have := high_card
  omega

theorem source_degrees : valid 46 low ∧ valid 46 high ∧
    du 0 low=6 ∧ du 0 high=8 ∧ dv 46 0 low=18 ∧ dv 46 0 high=18 := by decide
theorem source_member : (low,high) ∈ rankFiber 46 0 18 14 6 := by
  classical
  rw [rank_product 46 0 6 8 18]
  simp only [single,Finset.mem_product,Finset.mem_filter,PairConvolutionR78.mem_U]
  have h := source_degrees
  exact ⟨⟨h.1,h.2.2.1,h.2.2.2.2.1⟩,h.2.1,h.2.2.2.1,h.2.2.2.2.2⟩
theorem original_scope :
    let E := (frame (List.replicate 22 true)).mid
    E.a=23 ∧ E.b=24 ∧ InPolygon E.a E.b 6 18 ∧
      InPolygon E.a E.b 7 18 ∧ InPolygon E.a E.b 8 18 := by
  dsimp only
  rw [(RightR30.right_labels 22).2.1,(RightR30.right_labels 22).2.2]
  norm_num [InPolygon]
def gain0 : List Tile := [V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def gain1 : List Tile := [D,V,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def gain2 : List Tile := [D,D,V,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def gain3 : List Tile := [D,D,D,V,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def gain4 : List Tile := [D,D,D,D,V,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def gain5 : List Tile := [D,D,D,D,D,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
theorem gainstep0 : edit 46 (decode gain0) (decode gain1) := by
  refine ⟨by decide,by decide,[],[D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem gainstep1 : edit 46 (decode gain1) (decode gain2) := by
  refine ⟨by decide,by decide,[D],[D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem gainstep2 : edit 46 (decode gain2) (decode gain3) := by
  refine ⟨by decide,by decide,[D,D],[D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem gainstep3 : edit 46 (decode gain3) (decode gain4) := by
  refine ⟨by decide,by decide,[D,D,D],[V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem gainstep4 : edit 46 (decode gain4) (decode gain5) := by
  refine ⟨by decide,by decide,[D,D,D,D],[D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,V],[D],
    Rule.join V V (Or.inr rfl) (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem gainpath : Steps 46 5 (decode gain0) (decode gain5) :=
  (Steps.tail (Steps.tail (Steps.tail (Steps.tail (Steps.tail (Steps.refl (decode gain0)) gainstep0) gainstep1) gainstep2) gainstep3) gainstep4)
def central0 : List Tile := [V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def central1 : List Tile := [V,D,D,D,D,D,V,D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def central2 : List Tile := [V,D,D,D,D,D,D,V,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def central3 : List Tile := [V,D,D,D,D,D,D,D,V,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def central4 : List Tile := [V,D,D,D,D,D,D,D,D,V,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def central5 : List Tile := [V,D,D,D,D,D,D,D,D,D,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def central6 : List Tile := [U,D,D,D,D,D,D,D,D,D,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V]
def central7 : List Tile := [U,D,D,D,D,D,D,D,D,D,D,D,D,D,U,D,D,D,D,V,D,D,D,D,V]
def central8 : List Tile := [U,D,D,D,D,D,D,D,D,D,D,D,D,D,U,D,D,D,D,U,D,D,D,D,V]
theorem centralstep0 : edit 46 (decode central0) (decode central1) := by
  refine ⟨by decide,by decide,[V,D,D,D,D],[D,D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem centralstep1 : edit 46 (decode central1) (decode central2) := by
  refine ⟨by decide,by decide,[V,D,D,D,D,D],[D,D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem centralstep2 : edit 46 (decode central2) (decode central3) := by
  refine ⟨by decide,by decide,[V,D,D,D,D,D,D],[D,V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem centralstep3 : edit 46 (decode central3) (decode central4) := by
  refine ⟨by decide,by decide,[V,D,D,D,D,D,D,D],[V,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem centralstep4 : edit 46 (decode central4) (decode central5) := by
  refine ⟨by decide,by decide,[V,D,D,D,D,D,D,D,D],[D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V,V],[D],
    Rule.join V V (Or.inr rfl) (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem centralstep5 : edit 46 (decode central5) (decode central6) := by
  refine ⟨by decide,by decide,[],[D,D,D,D,D,D,D,D,D,D,D,D,D,V,D,D,D,D,V,D,D,D,D,V],[V],[U],
    Rule.vu,by decide,by decide,by decide,by decide⟩
theorem centralstep6 : edit 46 (decode central6) (decode central7) := by
  refine ⟨by decide,by decide,[U,D,D,D,D,D,D,D,D,D,D,D,D,D],[D,D,D,D,V,D,D,D,D,V],[V],[U],
    Rule.vu,by decide,by decide,by decide,by decide⟩
theorem centralstep7 : edit 46 (decode central7) (decode central8) := by
  refine ⟨by decide,by decide,[U,D,D,D,D,D,D,D,D,D,D,D,D,D,U,D,D,D,D],[D,D,D,D,V],[V],[U],
    Rule.vu,by decide,by decide,by decide,by decide⟩
theorem centralpath : Steps 46 8 (decode central0) (decode central8) :=
  (Steps.tail (Steps.tail (Steps.tail (Steps.tail (Steps.tail (Steps.tail (Steps.tail (Steps.tail (Steps.refl (decode central0)) centralstep0) centralstep1) centralstep2) centralstep3) centralstep4) centralstep5) centralstep6) centralstep7)
def lower0 : List Tile := [V,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,V,D,D,D,D,D,D]
def lower1 : List Tile := [V,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,V,U,U,D,D,D,D,D]
theorem lowerstep0 : edit 46 (decode lower0) (decode lower1) := by
  refine ⟨by decide,by decide,[V,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,D,V],[D,D,D,D,D],[D],[U,U],
    Rule.split U U (Or.inl rfl) (Or.inl rfl),by decide,by decide,by decide,by decide⟩
theorem lowerpath : Steps 46 1 (decode lower0) (decode lower1) :=
  (Steps.tail (Steps.refl (decode lower0)) lowerstep0)

theorem sharp_gain : Steps 46 5 high (decode gain5) ∧
    (decode gain5).1.card=high.1.card+1 ∧
    du 0 (decode gain5)=13 ∧ dv 46 0 (decode gain5)=12 :=
  ⟨gainpath,by decide,by decide,by decide⟩
theorem central_endpoints :
    Steps 46 1 low (decode lower1) ∧ Steps 46 8 high (decode central8) ∧
    valid 46 (decode lower1) ∧ valid 46 (decode central8) ∧
    du 0 (decode lower1)=7 ∧ du 0 (decode central8)=7 ∧
    dv 46 0 (decode lower1)=18 ∧ dv 46 0 (decode central8)=18 :=
  ⟨lowerpath,centralpath,by decide,by decide,by decide,by decide,by decide,by decide⟩
end AugmentingCaseR125
#print axioms AugmentingCaseR125.high_gain_lower
#print axioms AugmentingCaseR125.source_member
#print axioms AugmentingCaseR125.original_scope
#print axioms AugmentingCaseR125.sharp_gain
#print axioms AugmentingCaseR125.central_endpoints
