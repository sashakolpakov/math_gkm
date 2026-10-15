import MarkovFourScan897
/-! Machine-authored 897eabb3. Source-connected cyclic four-letter statistics.
All source words, including length two, are retained. -/
namespace MathGKM.Markov
noncomputable section
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 4000000
set_option linter.unusedSimpArgs false

theorem triple_wrap897 (g : Bool → Bool → Bool → R)
 (hg : ∀ p,g p true false=g false true false) (p q : Bool) (w : List Bool) :
 tripleScanADB2 g p q (w++[true,false])=
 tripleScanADB2 g p q (w++[true])+g false true false := by
 induction w generalizing p q with
 | nil => simp [tripleScanADB2,hg]
 | cons r rs ih => simp [tripleScanADB2,ih,add_assoc]

theorem source_triple_wrap897 (g : Bool → Bool → Bool → R)
 (hg : ∀ p,g p true false=g false true false) (path : List Bool) :
 tripleScanADB2 g false true (sourceWord28 path)=
 boolMomentADB2 g (frame path).mid.b (frame path).mid.a
   (2*(frame path).mid.a-(frame path).mid.b:ℕ)
   (min ((frame path).mid.b-(frame path).mid.a)
     (3*(frame path).mid.a-(frame path).mid.b):ℕ)
   (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) := by
 have h := source_tripleScanADB2 g path
 rw [triple_wrap897 g hg] at h
 rw [sourceWord_central28]
 simpa [tripleScanADB2,add_comm] using h

theorem four_source_lower_zero897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r,f p q r false=0) (hf' : ∀ q r s,f false q r s=0)
 (path : List Bool) :
 fourCyclic897 f (lowerSub487 0 (sourceWord28 path))=
 (min ((frame path).mid.b-(frame path).mid.a)
   (3*(frame path).mid.a-(frame path).mid.b):ℕ)*f true false false true := by
 rw [fourCyclic897,endPair_source_lower897]
 change fourScan897 f false false true (lowerSub487 0 (sourceWord28 path))=_
 have he := four_lower_zero897 f hf false true (sourceWord28 path)
 simp only [ite_true] at he
 rw [he]
 rw [source_triple_zero897 _ (by intros; rfl)]
 simp [boolMomentADB2,boolJetADB2,lowerFourZero897,hf,hf']

theorem four_source_lower_one897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r,f p q r false=0) (hf' : ∀ q r s,f false q r s=0)
 (path : List Bool) :
 fourCyclic897 f (lowerSub487 1 (sourceWord28 path))=
 ((frame path).mid.a:R)*(f true true false true+f true false true true) := by
 rw [fourCyclic897,endPair_source_lower897]
 change fourScan897 f false true true (lowerSub487 1 (sourceWord28 path))=_
 rw [four_lower_one897 f hf false true,source_triple_wrap897 _ (by intros; rfl)]
 simp [boolMomentADB2,boolJetADB2,lowerFourOne897,hf,hf']

theorem four_source_lower_two897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r,f p q r false=0) (hf' : ∀ q r s,f false q r s=0)
 (path : List Bool) :
 fourCyclic897 f (lowerSub487 2 (sourceWord28 path))=
 ((frame path).mid.b:R)*(f true true false true+f true false true true) := by
 rw [fourCyclic897,endPair_source_lower897]
 change fourScan897 f false true true (lowerSub487 2 (sourceWord28 path))=_
 rw [four_lower_two897 f hf,(source_word_counts28 path).1,(source_word_counts28 path).2]
 simp [hf']

theorem four_source_lower_many897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r,f p q r false=0) (hf' : ∀ q r s,f false q r s=0)
 (n : ℕ) (path : List Bool) :
 fourCyclic897 f (lowerSub487 (n+3) (sourceWord28 path))=
 ((frame path).mid.b:R)*(f true true false true+f true false true true)+
 (((frame path).mid.b:R)*(n:R)+(frame path).mid.a)*f true true true true := by
 rw [fourCyclic897,endPair_source_lower897]
 simp only [show decide (0<n+3)=true by simp]
 rw [four_lower_many897 f hf,(source_word_counts28 path).1,(source_word_counts28 path).2]
 simp only [hf',add_zero]
 ring

theorem four_pell_small897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r,f p q r false=0) (hf' : ∀ q r s,f false q r s=0) :
 fourCyclic897 f (sourceWord28 [])=0 ∧
 fourCyclic897 f (sourceWord28 [true])=f true true false true+f true false true true := by
 have h0 := source_pell_word446 0
 have h1 := source_pell_word446 1
 simp only [List.replicate_zero,List.replicate_succ] at h0 h1
 rw [h0,h1]
 simp [fourCyclic897,endPairADB2,fourScan897,hf,hf']

theorem four_pell_many897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r,f p q r false=0) (hf' : ∀ q r s,f false q r s=0) (n : ℕ) :
 fourCyclic897 f (sourceWord28 (List.replicate (n+2) true))=
 f true true false true+f true false true true+(n:R)*f true true true true := by
 rw [source_pell_word446]
 unfold fourCyclic897
 have he : endPairADB2 false false (false::List.replicate (n+2+1) true)=(true,true) := by
   simpa [endPairADB2,show n+2+1=(n+1)+2 by omega] using endPair_true897 false false (n+1)
 rw [he]
 simp only [fourScan897,hf,zero_add]
 rw [show n+2+1=3+n by omega,List.replicate_add]
 have ht := four_replicate897 f n []
 simp only [List.append_nil,fourScan897,add_zero] at ht
 simp [List.replicate_succ,fourScan897,hf',ht,add_assoc]

def fourSourceMoment897 (f : Bool → Bool → Bool → Bool → R) (c r : ℕ) : R :=
 if 2*r≤c then (min (c-2*r) (4*r-c):ℕ)*f true false false true
 else if 3*r≤2*c then ((2*r-c:ℕ):R)*(f true true false true+f true false true true)
 else if 4*r≤3*c then ((c-r:ℕ):R)*(f true true false true+f true false true true)
 else ((c-r:ℕ):R)*(f true true false true+f true false true true)+
   ((4*r-3*c:ℕ):R)*f true true true true

theorem source_four_moment897 (f : Bool → Bool → Bool → Bool → R)
 (hf : ∀ p q r,f p q r false=0) (hf' : ∀ q r s,f false q r s=0) (path : List Bool) :
 fourCyclic897 f (sourceWord28 path)=
 fourSourceMoment897 f (frame path).mid.b (frame path).mid.a := by
 rcases split_first_false487 path with ⟨n,hp⟩ | ⟨n,rest,hp⟩
 · subst path
   obtain ⟨ha,hb⟩ := source_word_counts28 (List.replicate n true)
   rw [source_pell_word446] at ha hb
   simp at ha hb
   rw [←ha,←hb]
   clear ha hb
   rcases n with _|_|n
   · simpa [fourSourceMoment897] using (four_pell_small897 f hf hf').1
   · simpa [fourSourceMoment897] using (four_pell_small897 f hf hf').2
   · rw [four_pell_many897 f hf hf']
     change _=fourSourceMoment897 f (n+4) (n+3)
     unfold fourSourceMoment897
     rw [if_neg (by omega : ¬2*(n+3)≤n+4),if_neg (by omega : ¬3*(n+3)≤2*(n+4))]
     by_cases hn : n=0
     · subst n; simp
     · rw [if_neg (by omega : ¬4*(n+3)≤3*(n+4))]
       rw [show n+4-(n+3)=1 by omega,show 4*(n+3)-3*(n+4)=n by omega]
       simp
 · subst path
   rw [source_run_substitutionBF]
   obtain ⟨ha,hb⟩ := source_run_indicesBF n rest
   obtain ⟨hr,hrc,_⟩ := frame_reduced rest
   rw [ha,hb]
   rcases n with _|_|_|n
   · rw [four_source_lower_zero897 f hf hf']
     unfold fourSourceMoment897
     have h : 2*( (frame rest).mid.b*0+(frame rest).mid.a)≤
       (frame rest).mid.b*(0+1)+(frame rest).mid.a := by omega
     rw [if_pos h]
     congr 2 <;> omega
   · rw [four_source_lower_one897 f hf hf']
     unfold fourSourceMoment897
     have h1 : ¬2*((frame rest).mid.b*1+(frame rest).mid.a)≤
       (frame rest).mid.b*(1+1)+(frame rest).mid.a := by omega
     have h2 : 3*((frame rest).mid.b*1+(frame rest).mid.a)≤
       2*((frame rest).mid.b*(1+1)+(frame rest).mid.a) := by omega
     rw [if_neg h1,if_pos h2]
     congr 2 <;> omega
   · rw [four_source_lower_two897 f hf hf']
     unfold fourSourceMoment897
     split_ifs <;> try omega
     all_goals congr 2 <;> omega
   · rw [four_source_lower_many897 f hf hf']
     unfold fourSourceMoment897
     have h1 : ¬2*((frame rest).mid.b*(n+3)+(frame rest).mid.a)≤
       (frame rest).mid.b*(n+3+1)+(frame rest).mid.a := by nlinarith
     have h2 : ¬3*((frame rest).mid.b*(n+3)+(frame rest).mid.a)≤
       2*((frame rest).mid.b*(n+3+1)+(frame rest).mid.a) := by nlinarith
     have h3 : ¬4*((frame rest).mid.b*(n+3)+(frame rest).mid.a)≤
       3*((frame rest).mid.b*(n+3+1)+(frame rest).mid.a) := by nlinarith
     rw [if_neg h1,if_neg h2,if_neg h3]
     have e1 : (frame rest).mid.b*(n+3+1)+(frame rest).mid.a-
       ((frame rest).mid.b*(n+3)+(frame rest).mid.a)=(frame rest).mid.b := by
       simp only [Nat.mul_add,Nat.mul_one]; omega
     have e2 : 4*((frame rest).mid.b*(n+3)+(frame rest).mid.a)-
       3*((frame rest).mid.b*(n+3+1)+(frame rest).mid.a)=
       (frame rest).mid.b*n+(frame rest).mid.a := by
       simp only [Nat.mul_add,Nat.mul_one]; omega
     simp only [e1,e2,Nat.cast_add,Nat.cast_mul]
     ring

end
end MathGKM.Markov
