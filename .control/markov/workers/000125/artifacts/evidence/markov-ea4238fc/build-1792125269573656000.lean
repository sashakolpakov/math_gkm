import MarkovHorizontalPairMEA423

/-! Machine-authored ea4238fc. Support lemmas for the expanded A,C alphabet. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option linter.unusedSimpArgs false

theorem hgood_lower_addMEA423 {a : ℕ} {p q : BiPoly}
 (hp : HGoodMEA423 a p) (hq : HGoodMEA423 (a+1) q)
 (ht : ∀ r i, 0<coeff p r i → 0<coeff q r (r+a+1)) :
 HGoodMEA423 (a+1) (p+q) := by
 obtain ⟨np,fp,bp⟩ := hp
 obtain ⟨nq,fq,bq⟩ := hq
 refine ⟨poly_add_nonneg16 np nq,?_,?_⟩
 · intro r i hi k hik hkr
   change 0<coeff p r i+coeff q r i at hi
   change 0<coeff p r k+coeff q r k
   by_cases hh : 0<coeff q r i
   · exact add_pos_of_nonneg_of_pos (np r k) (fq r i hh k hik hkr)
   · have hp' : 0<coeff p r i := by omega
     by_cases hk : k≤r+a
     · exact add_pos_of_pos_of_nonneg (fp r i hp' k hik hk) (nq r k)
     · have he : k=r+a+1 := by omega
       subst k
       exact add_pos_of_nonneg_of_pos (np r _) (ht r i hp')
 · intro r i hr
   change coeff p r i+coeff q r i=0
   rw [bp r i (by omega),bq r i hr]; rfl

theorem outer_VMEA423 {n : ℕ} {p : BiPoly} (hp : OuterBound725 n p) :
 OuterBound725 n (V*p) := by
 intro r i hr
 cases i with
 | zero => simp
 | succ i => rw [coeff_V_succ725]; exact hp r i hr

theorem outer_smoothMEA423 {n : ℕ} {p : BiPoly} (hp : OuterBound725 n p) :
 OuterBound725 n ((V+1)*p) := by
 have he : (V+1)*p=p+V*p := by ring
 rw [he]
 exact outer_add725 hp (outer_VMEA423 hp)

theorem coeff_smooth_posMEA423 {p : BiPoly} (np : PolyNonneg16 p)
 (r i : ℕ) (hi : 0<coeff p r i) : 0<coeff ((V+1)*p) r (i+1) := by
 have he : (V+1)*p=p+V*p := by ring
 rw [he]
 change 0<coeff p r (i+1)+coeff (V*p) r (i+1)
 rw [coeff_V_succ725]
 exact add_pos_of_nonneg_of_pos (np r _) hi

def PairGoodMEA423 (n a : ℕ) (z : BiPoly × BiPoly) : Prop :=
 HGoodMEA423 a z.1 ∧ HGoodMEA423 a z.2 ∧
 OuterBound725 (n+1) z.1 ∧ OuterBound725 n z.2 ∧
 (∀ i, coeff z.1 0 i=0) ∧
 (∀ r, 1≤r → r≤n+1 → 0<coeff z.1 r (r+a)) ∧
 (∀ r, r≤n → 0<coeff z.2 r (r+a))

def hmixMEA423 (z : BiPoly × BiPoly) : BiPoly := (V+1)*z.1+V*z.2
def atomicAMEA423 (z : BiPoly × BiPoly) : BiPoly × BiPoly :=
 (U*hmixMEA423 z,z.1+z.2)
def atomicCMEA423 (z : BiPoly × BiPoly) : BiPoly × BiPoly :=
 (z.1+U*((V+1)*hmixMEA423 z),hmixMEA423 z)

theorem pair_sum_topMEA423 {n a : ℕ} {z : BiPoly × BiPoly}
 (hz : PairGoodMEA423 n a z) (r : ℕ) (hr : r≤n+1) :
 0<coeff (z.1+z.2) r (r+a) := by
 obtain ⟨hf,hh,bf,bh,zf,tf,th⟩ := hz
 change 0<coeff z.1 r (r+a)+coeff z.2 r (r+a)
 by_cases hn : r≤n
 · exact add_pos_of_nonneg_of_pos (hf.1 r _) (th r hn)
 · exact add_pos_of_pos_of_nonneg (tf r (by omega) hr) (hh.1 r _)

theorem pair_mix_goodMEA423 {n a : ℕ} {z : BiPoly × BiPoly}
 (hz : PairGoodMEA423 n a z) :
 HGoodMEA423 (a+1) (hmixMEA423 z) ∧ OuterBound725 (n+1) (hmixMEA423 z) ∧
 (∀ r, r≤n+1 → 0<coeff (hmixMEA423 z) r (r+(a+1))) := by
 obtain ⟨hf,hh,bf,bh,zf,tf,th⟩ := hz
 refine ⟨hgood_addMEA423 (hgood_smoothMEA423 hf) (hgood_VMEA423 hh),?_,?_⟩
 · apply outer_add725 (outer_smoothMEA423 bf)
   exact outer_VMEA423 (fun r i hr => bh r i (by omega))
 · intro r hr
   change 0<coeff ((V+1)*z.1) r (r+(a+1))+coeff (V*z.2) r (r+(a+1))
   have he : r+(a+1)=(r+a)+1 := by omega
   rw [he,coeff_V_succ725]
   by_cases hn : r≤n
   · exact add_pos_of_nonneg_of_pos ((hgood_smoothMEA423 hf).1 r _) (th r hn)
   · exact add_pos_of_pos_of_nonneg
       (coeff_smooth_posMEA423 hf.1 r _ (tf r (by omega) hr)) (hh.1 r _)

theorem pair_initialMEA423 : PairGoodMEA423 0 0 (U*(V+1),1) := by
 have hf : HGoodMEA423 0 (U*(V+1)) := by
   simpa using hgood_UMEA423 (hgood_smoothMEA423 hgood_oneMEA423)
 refine ⟨hf,hgood_oneMEA423,?_,?_,?_,?_,?_⟩
 · have h : OuterBound725 0 (1:BiPoly) := (qgood_one725).2.2.1
   simpa using outer_U725 (outer_smoothMEA423 h)
 · exact (qgood_one725).2.2.1
 · intro i; simp
 · intro r h1 h2
   have hr : r=1 := by omega
   subst r
   norm_num [coeff,U,V]
 · intro r hr
   have he : r=0 := by omega
   subst r
   norm_num [coeff]

theorem pair_step_AMEA423 {n a : ℕ} {z : BiPoly × BiPoly}
 (hz : PairGoodMEA423 n a z) : PairGoodMEA423 (n+1) a (atomicAMEA423 z) := by
 have hm := pair_mix_goodMEA423 hz
 obtain ⟨hf,hh,bf,bh,zf,tf,th⟩ := hz
 refine ⟨hgood_UMEA423 hm.1,hgood_addMEA423 hf hh,
   outer_U725 hm.2.1,outer_add725 bf (fun r i hr => bh r i (by omega)),?_,?_,?_⟩
 · intro i; change coeff (U*hmixMEA423 z) 0 i=0; simp
 · intro r h1 h2
   cases r with
   | zero => omega
   | succ r =>
     change 0<coeff (U*hmixMEA423 z) (r+1) (r+1+a)
     rw [coeff_U_succ725]
     simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using hm.2.2 r (by omega)
 · intro r hr
   exact pair_sum_topMEA423 ⟨hf,hh,bf,bh,zf,tf,th⟩ r hr

theorem pair_step_CMEA423 {n a : ℕ} {z : BiPoly × BiPoly}
 (hz : PairGoodMEA423 n a z) : PairGoodMEA423 (n+1) (a+1) (atomicCMEA423 z) := by
 have hm := pair_mix_goodMEA423 hz
 have hq := hgood_UMEA423 (hgood_smoothMEA423 hm.1)
 obtain ⟨hf,hh,bf,bh,zf,tf,th⟩ := hz
 have tq : ∀ r, 1≤r → r≤n+2 →
     0<coeff (U*((V+1)*hmixMEA423 z)) r (r+(a+1)) := by
   intro r h1 h2
   cases r with
   | zero => omega
   | succ r =>
     rw [coeff_U_succ725]
     have ht := coeff_smooth_posMEA423 hm.1.1 r _ (hm.2.2 r (by omega))
     simpa [Nat.add_assoc,Nat.add_comm,Nat.add_left_comm] using ht
 refine ⟨hgood_lower_addMEA423 hf hq ?_,hm.1,?_,hm.2.1,?_,?_,hm.2.2⟩
 · intro r i hi
   have h1 : 1≤r := by
     by_contra hn
     have hr : r=0 := by omega
     subst r
     rw [zf i] at hi
     omega
   have h2 : r≤n+1 := by
     by_contra hn
     rw [bf r i (by omega)] at hi
     omega
   simpa [Nat.add_assoc] using tq r h1 (by omega)
 · exact outer_add725 (fun r i hr => bf r i (by omega))
     (outer_U725 (outer_smoothMEA423 hm.2.1))
 · intro i
   change coeff z.1 0 i+coeff (U*((V+1)*hmixMEA423 z)) 0 i=0
   rw [zf i]; simp
 · intro r h1 h2
   change 0<coeff z.1 r (r+(a+1))+coeff (U*((V+1)*hmixMEA423 z)) r (r+(a+1))
   exact add_pos_of_nonneg_of_pos (hf.1 r _) (tq r h1 (by omega))

theorem atomic_BMEA423 (z : BiPoly × BiPoly) :
 atomicCMEA423 (atomicAMEA423 z)=hstepMEA423 z true := by
 apply Prod.ext <;> simp [atomicAMEA423,atomicCMEA423,hmixMEA423,hstepMEA423] <;> ring

end
end MathGKM.Markov
