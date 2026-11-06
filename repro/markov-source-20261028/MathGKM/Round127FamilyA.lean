import MathGKM.Round127ReachA

/- Machine-authored round127. Endpoints and the explicit uniform route. -/
namespace PropagatingR127
open PacketsR120 PacketStructureR121 LocalRetilingR76 AugmentingR125
open UniformDistanceR126 PacketsR120.Tile

theorem endpoints_width (h : ℕ) (hh : 1≤h) :
    width (lowEndWord h)=20*h+6 ∧ width (highEndWord h)=20*h+6 := by
  simp [lowEndWord,highEndWord,width,width_append,width_ds]
  omega

theorem endpoints_cards (h : ℕ) (hh : 1≤h) :
    (decode (lowEndWord h)).1.card=10*h+1 ∧
      (decode (highEndWord h)).1.card=10*h+1 := by
  simp only [decode,decode_dimers]
  simp [lowEndWord,highEndWord,dimers,dimers_append,dimers_ds]
  omega

theorem endpoints_du (h : ℕ) (hh : 1≤h) :
    du 0 (decode (lowEndWord h))=4*h-1 ∧
      du 0 (decode (highEndWord h))=4*h-1 := by
  simp only [decode,decode_uscore]
  simp [lowEndWord,highEndWord,uscore,uscore_append,width_append,width,width_ds,
    score_ds,Nat.add_mod,Nat.mul_mod]
  omega

theorem endpoints_degrees (h : ℕ) (hh : 1≤h) :
    valid (20*h+6) (endpoint h).1 ∧ valid (20*h+6) (endpoint h).2 ∧
      du 0 (endpoint h).1=4*h-1 ∧ du 0 (endpoint h).2=4*h-1 ∧
      dv (20*h+6) 0 (endpoint h).1=6*h+6 ∧
      dv (20*h+6) 0 (endpoint h).2=6*h+6 := by
  dsimp only [endpoint,Prod.fst,Prod.snd]
  have hw := endpoints_width h hh
  have hv1 : valid (20*h+6) (decode (lowEndWord h)) := by
    simpa only [hw.1] using valid_decode (lowEndWord h)
  have hv2 : valid (20*h+6) (decode (highEndWord h)) := by
    simpa only [hw.2] using valid_decode (highEndWord h)
  have hc := endpoints_cards h hh
  have hd := endpoints_du h hh
  have ht1 := total_degree (20*h+6) 0 (decode (lowEndWord h)) hv1
  have ht2 := total_degree (20*h+6) 0 (decode (highEndWord h)) hv2
  exact ⟨hv1,hv2,hd.1,hd.2,by omega,by omega⟩

theorem endpoint_member (h : ℕ) (hh : 1≤h) :
    endpoint h ∈ ColorForgettingR108.rankFiber (20*h+6) 0 (6*h+6)
      (2*(4*h-2)+2) (4*h-1) := by
  have hd := endpoints_degrees h hh
  have hi : 2*(4*h-2)+2=(4*h-1)+(4*h-1) := by omega
  rw [hi,ColorForgettingR108.rank_product]
  simp only [ColorForgettingR108.single,Finset.mem_product,Finset.mem_filter,
    PairConvolutionR78.mem_U]
  exact ⟨⟨hd.1,hd.2.2.1,hd.2.2.2.2.1⟩,hd.2.1,hd.2.2.2.1,hd.2.2.2.2.2⟩

theorem low_route (h : ℕ) (hh : 1≤h) :
    WordSteps 1 (lowWord h) (lowEndWord h) := by
  have hi : 4*h-2=(4*h-3)+1 := by omega
  convert WordSteps.tail ([V]++List.replicate (6*h+4) D++[V])
    (List.replicate (4*h-3) D) [D] [U,U]
    (WordSteps.refl (([V]++List.replicate (6*h+4) D++[V])++[D]++
      List.replicate (4*h-3) D))
    (Rule.split U U (Or.inl rfl) (Or.inl rfl)) rfl using 1 <;>
    simp [lowWord,lowEndWord,hi,List.replicate_succ,List.append_assoc]

theorem high_route (h : ℕ) (hh : 1≤h) :
    WordSteps (4*h) (highWord h) (highEndWord h) := by
  let A := List.replicate (2*h) D
  let post := A++[V]++A++[V]++A++[V]
  have h0 : highWord h=([V]++A)++[V]++A++([V]++post) := by
    simp [highWord,A,post,List.replicate_succ,List.append_assoc]
  have h1 := slide_many (2*h) ([V]++A) ([V]++post)
  rw [← h0] at h1
  have hi : ([V]++A)++A++[V]++([V]++post)=
      ([V]++List.replicate (4*h) D)++[V,V]++post := by
    have hr : 4*h=2*h+2*h := by omega
    rw [hr,List.replicate_add]
    simp only [A,List.append_assoc,List.cons_append,List.nil_append]
  have h2 := WordSteps.tail ([V]++List.replicate (4*h) D) post [V,V] [D]
    h1 (Rule.join V V (Or.inr rfl) (Or.inr rfl)) hi
  have hj : ([V]++List.replicate (4*h) D)++[D]++post=
      [V]++List.replicate (6*h+1) D++[V]++A++[V]++A++[V] := by
    have hr : 6*h+1=4*h+(2*h+1) := by omega
    rw [hr,List.replicate_add]
    simp only [post,A,List.replicate_succ,List.append_assoc,List.cons_append,List.nil_append]
  rw [hj] at h2
  have h3 := slide_many (2*h-1) []
    (List.replicate (4*h+2) D++[V]++A++[V]++A++[V])
  have hk : (2*h-1)+(4*h+2)=6*h+1 := by omega
  have hs : []++[V]++List.replicate (2*h-1) D++
      (List.replicate (4*h+2) D++[V]++A++[V]++A++[V])=
      [V]++List.replicate (6*h+1) D++[V]++A++[V]++A++[V] := by
    conv_rhs => rw [← hk,List.replicate_add]
    simp only [List.nil_append,List.append_assoc]
  rw [hs] at h3
  have ht := word_trans h2 h3
  have hn : (2*h+1)+(2*h-1)=4*h := by omega
  simpa only [hn,List.nil_append,highEndWord,A,List.append_assoc] using ht

end PropagatingR127
#print axioms PropagatingR127.endpoint_member
#print axioms PropagatingR127.high_route
