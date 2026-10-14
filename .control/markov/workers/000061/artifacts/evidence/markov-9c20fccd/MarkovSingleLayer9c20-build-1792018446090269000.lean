import MarkovGapMixture9c20
/-! Machine-authored 9c20fccd. Every one-cut degree layer, for arbitrary
words and all indices, has raw log-concave coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 4000000

theorem mask_noCuts9c20 {R : Type*} [CommRing R] (m : List (Bool × Bool))
 (y p q : R) (h : (m.map Prod.snd).count true=0) : maskWeight340 y p q m=q := by
 induction m generalizing p with
 | nil => rfl
 | cons rb ms ih =>
   obtain ⟨r,b⟩ := rb
   cases b with
   | false => simpa [maskWeight340] using ih (cutChargeA27 y p q r) (by simpa using h)
   | true => simp at h

theorem mask_one_gap9c20 (m : List (Bool × Bool)) (g : List Bool)
 (h : (m.map Prod.snd).count true=1) : ∃ w r,
 maskWeight340 (X:ℝ[X]) (gapChargeA27 X X 1 g) 1 m=
 cutFactorA27 X r*gapWeightA27 X w := by
 induction m generalizing g with
 | nil => simp at h
 | cons rb ms ih =>
   obtain ⟨r,b⟩ := rb
   cases b with
   | false =>
     obtain ⟨w,r',hr⟩ := ih (g++[r]) (by simpa using h)
     refine ⟨w,r',?_⟩
     simpa [maskWeight340,gapCharge_appendA27,gapChargeA27] using hr
   | true =>
     have hm : (ms.map Prod.snd).count true=0 := by simpa using h
     refine ⟨g,r,?_⟩
     simp [maskWeight340,mask_noCuts9c20 ms X X 1 hm,gapWeightA27]

theorem reset_degree9c20 (n : ℕ) : (resetPolyFe01 n).natDegree=n := by
 apply natDegree_eq_of_le_of_coeff_ne_zero
 · apply natDegree_le_iff_coeff_eq_zero.mpr
   intro k hk
   simp [reset_coeff9c20,show k≠0 by omega,show ¬k≤n by omega]
 · rw [reset_coeff9c20]; split_ifs <;> norm_num

theorem pure_degree9c20 (n : ℕ) : (purePolyFe01 n).natDegree=n+1 := by
 apply natDegree_eq_of_le_of_coeff_ne_zero
 · apply natDegree_le_iff_coeff_eq_zero.mpr
   intro k hk
   simp [pure_coeff9c20,show k≠0 by omega,show k≠n+1 by omega,show ¬k≤n by omega]
 · simp [pure_coeff9c20]

theorem smooth_degree9c20 (p : ℝ[X]) (hp : p≠0) :
 ((1+X)*p).natDegree=p.natDegree+1 := by
 rw [natDegree_mul (by intro h; have := congrArg (fun f : ℝ[X] => f.coeff 0) h; norm_num at this) hp]
 have h : (1+(X:ℝ[X])).natDegree=1 := by
   rw [add_comm]; exact natDegree_X_add_C 1
 omega

theorem mask_one_shape9c20 (m : List (Bool × Bool)) (d : ℕ) (hd : 2≤d)
 (h : (m.map Prod.snd).count true=1) (hm : maskDegree07a7 1 m=d) :
 let p := maskWeight340 (X:ℝ[X]) X 1 m
 p=resetPolyFe01 d ∨ p=purePolyFe01 (d-1) ∨
 p=(1+X)*resetPolyFe01 (d-1) ∨ p=(1+X)*purePolyFe01 (d-2) := by
 obtain ⟨w,r,hw⟩ := mask_one_gap9c20 m [] h
 simp only [gapChargeA27] at hw
 have hdeg := mask_natDegree07a7 m
 rw [hm,hw] at hdeg
 obtain ⟨n,hn|hn⟩ := gap_classFe01 w
 · have hn0 : resetPolyFe01 n≠0 := by
     intro hz; have := congrArg (fun f : ℝ[X] => f.coeff 0) hz
     simp [reset_coeff9c20] at this
   rw [hn] at hw hdeg
   cases r with
   | false =>
     simp only [cutFactorA27,Bool.false_eq_true,if_false,one_mul] at hw hdeg
     rw [reset_degree9c20] at hdeg
     exact Or.inl (by simpa [hdeg] using hw)
   | true =>
     simp only [cutFactorA27,if_true] at hw hdeg
     rw [smooth_degree9c20 _ hn0,reset_degree9c20] at hdeg
     exact Or.inr (Or.inr (Or.inl (by simpa [show n=d-1 by omega] using hw)))
 · have hn0 : purePolyFe01 n≠0 := by
     intro hz; have := congrArg (fun f : ℝ[X] => f.coeff 0) hz
     simp [pure_coeff9c20] at this
   rw [hn] at hw hdeg
   cases r with
   | false =>
     simp only [cutFactorA27,Bool.false_eq_true,if_false,one_mul] at hw hdeg
     rw [pure_degree9c20] at hdeg
     exact Or.inr (Or.inl (by simpa [show n=d-1 by omega] using hw))
   | true =>
     simp only [cutFactorA27,if_true] at hw hdeg
     rw [smooth_degree9c20 _ hn0,pure_degree9c20] at hdeg
     exact Or.inr (Or.inr (Or.inr (by simpa [show n=d-2 by omega] using hw)))

theorem singleMaskSum_shape9c20 (ms : List (List (Bool × Bool))) (d : ℕ) (hd : 2≤d)
 (h : ∀ m∈ms, (m.map Prod.snd).count true=1 ∧ maskDegree07a7 1 m=d) :
 ∃ a b c e : ℝ, 0≤a ∧ 0≤b ∧ 0≤c ∧ 0≤e ∧
 (ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum=gapMixture9c20 d a b c e := by
 induction ms with
 | nil => exact ⟨0,0,0,0,by norm_num [gapMixture9c20]⟩
 | cons m ms ih =>
   obtain ⟨a,b,c,e,ha,hb,hc,he,hs⟩ := ih (fun t ht => h t (by simp [ht]))
   have hm := h m (by simp)
   have hp := mask_one_shape9c20 m d hd hm.1 hm.2
   dsimp only at hp
   rcases hp with hp|hp|hp|hp
   · refine ⟨a+1,b,c,e,by positivity,hb,hc,he,?_⟩
     simp only [List.map_cons,List.sum_cons,hs,hp,gapMixture9c20,map_add,map_one]; ring
   · refine ⟨a,b+1,c,e,ha,by positivity,hc,he,?_⟩
     simp only [List.map_cons,List.sum_cons,hs,hp,gapMixture9c20,map_add,map_one]; ring
   · refine ⟨a,b,c+1,e,ha,hb,by positivity,he,?_⟩
     simp only [List.map_cons,List.sum_cons,hs,hp,gapMixture9c20,map_add,map_one]; ring
   · refine ⟨a,b,c,e+1,ha,hb,hc,by positivity,?_⟩
     simp only [List.map_cons,List.sum_cons,hs,hp,gapMixture9c20,map_add,map_one]; ring

theorem single_degree_layer_lc9c20 (w : List Bool) (d k : ℕ) :
 (degreeLayer07a7 (X:ℝ[X]) w 1 d).coeff k*
 (degreeLayer07a7 (X:ℝ[X]) w 1 d).coeff (k+2)≤
 ((degreeLayer07a7 (X:ℝ[X]) w 1 d).coeff (k+1))^2 := by
 let ms := (cutMasksFe01 w 1).filter (fun m => maskDegree07a7 1 m=d)
 have h (m) (hm : m∈ms) : (m.map Prod.snd).count true=1 ∧ maskDegree07a7 1 m=d := by
   obtain ⟨hm,hd⟩ := List.mem_filter.mp hm
   exact ⟨(cutMasks_specFe01 w 1 m hm).2,by simpa using hd⟩
 by_cases hd : 2≤d
 · obtain ⟨a,b,c,e,ha,hb,hc,he,hs⟩ := singleMaskSum_shape9c20 ms d hd h
   change ((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff k*
     ((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff (k+2)
     ≤ ((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff (k+1)^2
   rw [hs]
   exact mixture_logConcave_all9c20 d k hd a b c e ha hb hc he
 · have hz : (degreeLayer07a7 (X:ℝ[X]) w 1 d).coeff (k+2)=0 := by
     change ((ms.map (maskWeight340 (X:ℝ[X]) X 1)).sum).coeff (k+2)=0
     rw [Polynomial.coeff_list_sum_map]
     apply List.sum_eq_zero
     intro x hx
     obtain ⟨m,hm,rfl⟩ := List.mem_map.mp hx
     apply coeff_eq_zero_of_natDegree_lt
     rw [mask_natDegree07a7,(h m hm).2]
     omega
   rw [hz,mul_zero]
   exact sq_nonneg _

#print axioms single_degree_layer_lc9c20
end
end MathGKM.Markov
