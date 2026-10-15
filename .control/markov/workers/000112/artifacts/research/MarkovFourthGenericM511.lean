import MarkovFourMomentBE
import MarkovFourthLocal01F
import MarkovHorizontalTraceM13D
/-! Machine-authored request 5110b3fa. Fourth moment for any common-projection
alphabet on the actual source word. No coefficient inequality is assumed. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 5000000
set_option linter.unusedSimpArgs false

def hlocalFourM511 (g : Bool → Mat16 R[X]) (p q r s : Bool) : R :=
 localFour01F (g p) (headRatioOne01F [g q,g r,g s])
   (headRatioTwo01F [g q,g r,g s]) (headRatioThree01F [g q,g r,g s])

theorem hopenFour_scanM511 (g : Bool → Mat16 R[X]) (p q r : Bool)
 (w : List Bool) (s t u : Bool) :
 openFour01F ((p::q::r::(w++[s,t,u])).map g)=
 fourScan897 (hlocalFourM511 g) p q r (w++[s,t,u])+
 openFour01F [g s,g t,g u] := by
 induction w generalizing p q r with
 | nil =>
   simp only [List.nil_append,List.map_cons,List.map_nil,openFour01F,
     fourScan897,hlocalFourM511,headRatioOne01F,headRatioTwo01F,headRatioThree01F]
   ring
 | cons v vs ih =>
   have he : openFour01F ((p::q::r::v::(vs++[s,t,u])).map g)=
     hlocalFourM511 g p q r v+openFour01F ((q::r::v::(vs++[s,t,u])).map g) := by
     simp only [List.map_cons,openFour01F,hlocalFourM511,
       headRatioOne01F,headRatioTwo01F,headRatioThree01F]
   rw [List.cons_append,he,ih]
   simp only [fourScan897]
   ring

theorem hfour_cyclicM511 (g : Bool → Mat16 R[X])
 (hg : ∀ r, Projection6905 (g r)) (r s t : Bool) (w : List Bool) :
 cyclicFour01F ((false::r::s::(w++[t,true])).map g)=
 fourScan897 (hlocalFourM511 g) false r s (w++[t,true,false,r,s]) := by
 have hs : ∀ z ∈ (false::r::s::(w++[t,true])).map g, Projection6905 z := by
   intro z hz
   obtain ⟨q,_,rfl⟩ := List.mem_map.mp hz
   exact hg q
 have h := cyclic_four_append01F (g false) ((r::s::(w++[t,true])).map g) hs
 have he : ((false::r::s::(w++[t,true])).map g)++[g false,g r,g s]=
   (false::r::s::(w++[t,true,false,r,s])).map g := by simp
 change cyclicFour01F (g false::((r::s::(w++[t,true])).map g))=_
 rw [h]
 change openFour01F (((false::r::s::(w++[t,true])).map g)++[g false,g r,g s])-
   openFour01F [g false,g r,g s]=_
 rw [he]
 have he' : w++[t,true,false,r,s]=(w++[t,true])++[false,r,s] := by simp
 rw [he',hopenFour_scanM511]
 ring

theorem hsource_fourth_momentM511 (g : Bool → Mat16 R[X])
 (hg : ∀ r, Projection6905 (g r)) (path : List Bool)
 (hb : 5 ≤ (frame path).mid.b) :
 logFour01F (tr16 (projProduct6905 ((sourceWord28 path).map g)))=
 fourMomentBE (hlocalFourM511 g) (frame path).mid.b (frame path).mid.a := by
 have hl := (source_word_counts28 path).2
 rw [sourceWord_central28] at hl
 have hcl : 3 ≤ (central28 path).length := by simp at hl; omega
 obtain ⟨r,rs,hr⟩ := List.exists_cons_of_length_pos (by omega : 0 < (central28 path).length)
 have hrs : 2 ≤ rs.length := by rw [hr] at hcl; simp only [List.length_cons] at hcl; omega
 obtain ⟨s,ss,hs⟩ := List.exists_cons_of_length_pos (by omega : 0 < rs.length)
 have hss : 0 < ss.length := by rw [hs] at hrs; simp only [List.length_cons] at hrs; omega
 obtain he|⟨w,t,ht⟩ := List.eq_nil_or_concat ss
 · simp [he] at hss
 have hc : central28 path=r::s::(w++[t]) := by simpa [hs,ht,List.concat_eq_append] using hr
 have hw : sourceWord28 path=false::r::s::(w++[t,true]) := by
   rw [sourceWord_central28,hc]; simp [List.append_assoc]
 have hshape : ∀ z ∈ (sourceWord28 path).map g, Projection6905 z := by
   intro z hz
   obtain ⟨q,_,rfl⟩ := List.mem_map.mp hz
   exact hg q
 have hlen : 5 ≤ ((sourceWord28 path).map g).length := by
   rw [List.length_map,(source_word_counts28 path).2]; exact hb
 rw [hw] at hshape hlen ⊢
 rw [show (false::r::s::(w++[t,true])).map g=g false::g r::((s::(w++[t,true])).map g) by rfl]
 rw [product_trace_four_long01F _ _ _ hshape hlen]
 rw [show g false::g r::((s::(w++[t,true])).map g)=(false::r::s::(w++[t,true])).map g by rfl,
   hfour_cyclicM511 g hg]
 exact source_four_rotatedBE (hlocalFourM511 g) r s t w path hw

end
end MathGKM.Markov
