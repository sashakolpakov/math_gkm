import MarkovLocalMomentsM13D
import MarkovBooleanCyclicADB2
import MarkovHorizontalTraceM13D
/-! Machine-authored request 13d40bd7. Exact source moments for any common
projection matrix alphabet; no guessed horizontal coefficient formula. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000
variable {R : Type*} [CommRing R]

def hsourceMomentM13D (f : Bool → Bool → Bool → R) (path : List Bool) : R :=
 boolMomentADB2 f (frame path).mid.b (frame path).mid.a
  (2*(frame path).mid.a-(frame path).mid.b:ℕ)
  (min ((frame path).mid.b-(frame path).mid.a)
    (3*(frame path).mid.a-(frame path).mid.b):ℕ)
  (3*(frame path).mid.a-2*(frame path).mid.b:ℕ)

theorem hscan_singleM13D (g : Bool → Mat16 R[X]) (p q s t : Bool) (w : List Bool) :
 tripleScanADB2 (fun p _ _ => (g p).d.coeff 1) p q (w++[s,t])=
 sumD6905 ((p::q::w).map g) := by
 induction w generalizing p q with
 | nil => simp [tripleScanADB2,sumD6905]
 | cons r rs ih => simp [tripleScanADB2,sumD6905,ih,add_assoc]

theorem htrace_rotateM13D (g : Bool → Mat16 R[X]) (w : List Bool) :
 tr16 (projProduct6905 ((false::(w++[true])).map g))=
 tr16 (projProduct6905 ((true::false::w).map g)) := by
 have hc (m n : Mat16 R[X]) : tr16 (mm16 m n)=tr16 (mm16 n m) := by
   simp [tr16,mm16]; ring
 have he : false::(w++[true])=(false::w)++[true] := rfl
 rw [he,List.map_append,projProduct_append6905]
 simp only [List.map_cons,List.map_nil,projProduct_single6905]
 rw [hc]
 rfl

theorem hsource_momentsM13D (g : Bool → Mat16 R[X])
 (hg : ∀ r, Projection6905 (g r)) (path : List Bool) (hb : 4 ≤ (frame path).mid.b) :
 let T := tr16 (projProduct6905 ((sourceWord28 path).map g))
 let D := hsourceMomentM13D (fun p _ _ => (g p).d.coeff 1) path
 let K := hsourceMomentM13D (fun p q r => hlocalKM13D (g p) (g q) (g r)) path
 let L := hsourceMomentM13D (fun p q r => hlocalLM13D (g p) (g q) (g r)) path
 T.coeff 0=1 ∧ T.coeff 1=D ∧ 2*T.coeff 2=D^2+K ∧
 6*T.coeff 3=D^3+3*D*K+L := by
 dsimp only
 have hl := (source_word_counts28 path).2
 rw [sourceWord_central28] at hl
 have hlen : 2 ≤ (central28 path).length := by simp at hl; omega
 rcases List.eq_nil_or_concat (central28 path) with he | ⟨cs,q,he⟩
 · simp [he] at hlen
 rcases List.eq_nil_or_concat cs with hc | ⟨ms,p,hc⟩
 · simp [he,hc] at hlen
 have hw : central28 path=ms++[p,q] := by simpa [List.concat_eq_append,hc,List.append_assoc] using he
 have hshape : ∀ z ∈ g true::g false::((ms.map g)++[g p,g q]), Projection6905 z := by
   intro z hz
   simp only [List.mem_cons,List.mem_append,List.mem_map,List.mem_singleton,List.not_mem_nil,or_false] at hz
   rcases hz with rfl|rfl|⟨r,_,rfl⟩|rfl|rfl <;> exact hg _
 have h0 := projProduct_shape6905 (g true) (g false::((ms.map g)++[g p,g q])) hshape
 have h1 := projection_trace1ADB2 (g true) (g false) ((ms.map g)++[g p,g q]) hshape
 have h2 := projection_trace2ADB2 (g true) (g false) (g p) (g q) (ms.map g) hshape
 have h3 := projection_trace3_moments6905 (g true) (g false) (g p) (g q) (ms.map g) hshape
 have hd : sumD6905 (g true::g false::((ms.map g)++[g p,g q]))=
   hsourceMomentM13D (fun p _ _ => (g p).d.coeff 1) path := by
   unfold hsourceMomentM13D
   rw [←source_tripleScanADB2]
   rw [hscan_singleM13D,hw]
   simp
 have hk : cyclicK6905 (g true) (g false) (ms.map g) (g p) (g q)=
   hsourceMomentM13D (fun p q r => hlocalKM13D (g p) (g q) (g r)) path := by
   rw [cyclicK_scanM13D]
   rw [show ms.map g++[g p,g q,g true,g false]=(ms++[p,q,true,false]).map g by simp]
   rw [hscan_mapM13D]
   unfold hsourceMomentM13D
   rw [←source_tripleScanADB2,hw]
   simp
 have hl' : cyclicL6905 (g true) (g false) (ms.map g) (g p) (g q)=
   hsourceMomentM13D (fun p q r => hlocalLM13D (g p) (g q) (g r)) path := by
   rw [cyclicL_scanM13D]
   rw [show ms.map g++[g p,g q,g true,g false]=(ms++[p,q,true,false]).map g by simp]
   rw [hscan_mapM13D]
   unfold hsourceMomentM13D
   rw [←source_tripleScanADB2,hw]
   simp
 rw [hd] at h1 h2 h3
 rw [hk] at h2 h3
 rw [hl'] at h3
 rw [sourceWord_central28,htrace_rotateM13D,hw]
 simp only [List.map_cons,List.map_append,List.map_nil]
 refine ⟨?_,h1,h2,h3⟩
 simpa [tr16,Polynomial.coeff_add,Projection6905] using congrArg₂ (·+·) h0.1 h0.2.2.2

end
end MathGKM.Markov
