import MarkovRunFieldBDEE
/-! Machine-authored bdee9a64. Closed rational expression for every mixed
source's third lower slice, all run lengths and all cycle lengths. No LC claim. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 3000000
set_option maxRecDepth 8192
set_option linter.unusedSimpArgs false

def closedHBDEE (n : ℕ) : RunFieldBDEE := closedJetBDEE 3 1 n+closedJetBDEE 2 0 n
def closedKBDEE (n : ℕ) : RunFieldBDEE := closedJetBDEE 3 2 n+closedJetBDEE 2 1 n
def closedFirstBDEE (n c r : ℕ) : RunFieldBDEE :=
 ((c:RunFieldBDEE)-r)*closedHBDEE n+r*closedHBDEE (n+1)-(1+runXBDEE)
def closedSecondBDEE (n c r : ℕ) : RunFieldBDEE :=
 let h₀ := closedHBDEE n
 let h₁ := closedHBDEE (n+1)
 let k₀ := closedKBDEE n
 let k₁ := closedKBDEE (n+1)
 let b := closedJetBDEE 2 0 n
 let d := 2*runXBDEE^(n+1)
 2*(((c:RunFieldBDEE)-r)*k₀+r*k₁)+(((c:RunFieldBDEE)-r)*h₀+r*h₁)^2-
 (((c:RunFieldBDEE)-r)*h₀^2+r*h₁^2)+
 2*((runXBDEE-1)*((c:RunFieldBDEE)*b+r*d)+
 runXBDEE*((c:RunFieldBDEE)*b^2+2*r*b*d+((2*r-c:ℕ):RunFieldBDEE)*d^2))-
 2*(1+runXBDEE)*(((c:RunFieldBDEE)-r)*h₀+r*h₁-1-runXBDEE)+
 if c=2 then 2*runXBDEE^(2*n+3) else 0

def closedLocalBDEE (n : ℕ) (p q r : Bool) : RunFieldBDEE :=
 let m₁ := closedGaugeJetBDEE n p q 1
 let m₂ := closedGaugeJetBDEE n p q 2
 let m₃ := closedGaugeJetBDEE n p q 3
 let k₁ := closedGaugeJetBDEE n q r 1
 let k₂ := closedGaugeJetBDEE n q r 2
 2*m₁.d^3-6*m₁.d*m₂.d+6*m₃.d+6*(m₁.c*k₂.b+m₂.c*k₁.b)-
 6*m₁.c*k₁.b*(m₁.d+k₁.d)+6*m₁.c*k₁.a

def closedThirdBDEE (n c r : ℕ) : RunFieldBDEE :=
 let F := closedFirstBDEE n c r
 3*F*closedSecondBDEE n c r-2*F^3-2*(1+runXBDEE)^3+
 boolMomentADB2 (closedLocalBDEE n) c r (2*r-c:ℕ)
   (min (c-r) (3*r-c):ℕ) (3*r-2*c:ℕ)

def correctedClosedThirdBDEE (n c r : ℕ) : RunFieldBDEE :=
 closedThirdBDEE n c r+
 if c=2 then -12*runXBDEE^(c*(n+1)+r)*(closedFirstBDEE n c r+1+runXBDEE)
 else if c=3 then 6*runXBDEE^(c*(n+1)+r) else 0

theorem map_lowerHBDEE (n : ℕ) : runEmbedBDEE (lowerH487 n)=closedHBDEE n := by
 have h := (lowerMatrix_jets487 n).2.2.2.2.2.2
 rw [←h,←(lowerMatrix_jets487 n).2.2.1,map_add]
 exact congrArg₂ (·+·) (map_run_jetBDEE 3 1 n) (map_run_jetBDEE 2 0 n)

theorem map_runKBDEE (n : ℕ) : runEmbedBDEE (runKBF (lowerMatrix487 n))=closedKBDEE n := by
 unfold runKBF closedKBDEE
 rw [map_add]
 exact congrArg₂ (·+·) (map_run_jetBDEE 3 2 n) (map_run_jetBDEE 2 1 n)

theorem map_runBBDEE (n : ℕ) : runEmbedBDEE (runB446 n)=closedJetBDEE 2 0 n := by
 have h := map_run_jetBDEE 2 0 n
 change runEmbedBDEE ((lowerMatrix487 n).c.coeff 0)=_ at h
 simpa only [(lowerMatrix_jets487 n).2.2.1,runB446] using h

theorem map_firstBDEE (n c r : ℕ) : runEmbedBDEE (firstRunPolyADB2 n c r)=closedFirstBDEE n c r := by
 have he : firstRunPolyADB2 n c r=
     ((c:ℤ[X])-(r:ℤ[X]))*lowerH487 n+(r:ℤ[X])*lowerH487 (n+1)-(1+X) := by
   unfold firstRunPolyADB2
   rw [lowerH487]
   ring
 rw [he]
 simp only [closedFirstBDEE,map_sub,map_mul,map_add,map_natCast,map_one,map_lowerHBDEE,runXBDEE]

theorem map_secondBDEE (n c r : ℕ) :
 runEmbedBDEE (secondCompressed446 n c r)=closedSecondBDEE n c r := by
 unfold secondCompressed446 closedSecondBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_natCast,map_ofNat,map_one,
   map_lowerHBDEE,map_runKBDEE,map_runBBDEE,runD446]
 split_ifs <;> simp only [map_mul,map_ofNat,map_pow,map_zero,runXBDEE]

theorem map_gauge_coeffsBDEE (n : ℕ) (p q : Bool) (k : Fin 4) :
 runEmbedBDEE ((runBooleanGaugeADB2 n p q).a.coeff k.val)=(closedGaugeJetBDEE n p q k).a ∧
 runEmbedBDEE ((runBooleanGaugeADB2 n p q).b.coeff k.val)=(closedGaugeJetBDEE n p q k).b ∧
 runEmbedBDEE ((runBooleanGaugeADB2 n p q).c.coeff k.val)=(closedGaugeJetBDEE n p q k).c ∧
 runEmbedBDEE ((runBooleanGaugeADB2 n p q).d.coeff k.val)=(closedGaugeJetBDEE n p q k).d := by
 have h := map_run_gauge_jetBDEE n p q k
 exact ⟨congrArg Mat16.a h,congrArg Mat16.b h,congrArg Mat16.c h,congrArg Mat16.d h⟩

theorem map_localBDEE (n : ℕ) (p q r : Bool) :
 runEmbedBDEE (runLocalLADB2 n p q r)=closedLocalBDEE n p q r := by
 have hm1 := map_gauge_coeffsBDEE n p q 1
 have hm2 := map_gauge_coeffsBDEE n p q 2
 have hm3 := map_gauge_coeffsBDEE n p q 3
 have hk1 := map_gauge_coeffsBDEE n q r 1
 have hk2 := map_gauge_coeffsBDEE n q r 2
 norm_num at hm1 hm2 hm3 hk1 hk2
 unfold runLocalLADB2 edgeLADB2 singleLADB2 closedLocalBDEE
 simp only [map_add,map_sub,map_mul,map_pow,map_ofNat,
   hm1.2.2.1,hm1.2.2.2,hm2.2.2.1,hm2.2.2.2,hm3.2.2.2,
   hk1.1,hk1.2.1,hk1.2.2.2,hk2.2.1]

theorem map_bool_momentBDEE (f : Bool → Bool → Bool → ℤ[X]) (c r q t u : ℤ[X]) :
 runEmbedBDEE (boolMomentADB2 f c r q t u)=
 boolMomentADB2 (fun a b d => runEmbedBDEE (f a b d))
   (runEmbedBDEE c) (runEmbedBDEE r) (runEmbedBDEE q) (runEmbedBDEE t) (runEmbedBDEE u) := by
 simp only [boolMomentADB2,boolJetADB2,map_add,map_sub,map_mul]

theorem map_thirdBDEE (n c r : ℕ) :
 runEmbedBDEE (thirdRunPolyADB2 n c r)=closedThirdBDEE n c r := by
 simp only [thirdRunPolyADB2,closedThirdBDEE,map_add,map_sub,map_mul,map_pow,
   map_ofNat,map_one,map_firstBDEE,map_secondBDEE,map_bool_momentBDEE,
   map_natCast,map_localBDEE,runXBDEE]

theorem map_corrected_thirdBDEE (n c r : ℕ) :
 runEmbedBDEE (correctedThirdRun8BBB n c r)=correctedClosedThirdBDEE n c r := by
 unfold correctedThirdRun8BBB correctedClosedThirdBDEE
 rw [map_add,map_thirdBDEE]
 split_ifs <;> simp only [map_neg,map_mul,map_add,map_pow,map_ofNat,map_one,map_zero,
   map_firstBDEE,runXBDEE]

theorem source_third_closedBDEE (n : ℕ) (rest : List Bool) :
 runEmbedBDEE (6*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 3)=
 correctedClosedThirdBDEE n (frame rest).mid.b (frame rest).mid.a := by
 rw [source_third_all_cycles8BBB,map_corrected_thirdBDEE]

/-- The rational expression uniquely identifies the whole integer polynomial.
No evaluation in X, truncation, or coefficient-support restriction occurs. -/
theorem source_third_closed_iffBDEE (n : ℕ) (rest : List Bool) (P : ℤ[X]) :
 runEmbedBDEE P=correctedClosedThirdBDEE n (frame rest).mid.b (frame rest).mid.a ↔
 P=6*cutCoeffA27 (X:ℤ[X]) X 1
   (central28 (List.replicate n true++false::rest)++[true]) 3 := by
 rw [←source_third_closedBDEE n rest]
 exact run_embed_injectiveBDEE.eq_iff

theorem source_third_closed_coeffBDEE (n : ℕ) (rest : List Bool) (P : ℤ[X])
 (h : runEmbedBDEE P=correctedClosedThirdBDEE n (frame rest).mid.b (frame rest).mid.a)
 (i j : ℕ) (hij : i+j=(frame (List.replicate n true++false::rest)).mid.a+3) :
 P.coeff j=6*coeff (frame (List.replicate n true++false::rest)).mid.p i j := by
 rw [(source_third_closed_iffBDEE n rest P).mp h,Polynomial.coeff_ofNat_mul,
   source_cut_coeffA27 _ i j 3 hij]

#print axioms source_third_closedBDEE
#print axioms source_third_closed_iffBDEE
#print axioms source_third_closed_coeffBDEE
end
end MathGKM.Markov
