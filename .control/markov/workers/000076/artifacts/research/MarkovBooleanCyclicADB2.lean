import MarkovLocalTelescopingADB2
/-! Machine-authored request adb2c7b0. Every local Boolean triple function
has an exact source cyclic sum determined by five source pattern counts. -/
namespace MathGKM.Markov
noncomputable section
variable {R : Type*} [CommRing R]

structure BoolJetADB2 (R : Type*) where
 a : R
 p : R
 q : R
 r : R
 pq : R
 pr : R
 qr : R
 pqr : R
def boolJetADB2 (f : Bool → Bool → Bool → R) : BoolJetADB2 R :=
 ⟨f false false false,
 f true false false-f false false false,
 f false true false-f false false false,
 f false false true-f false false false,
 f true true false-f true false false-f false true false+f false false false,
 f true false true-f true false false-f false false true+f false false false,
 f false true true-f false true false-f false false true+f false false false,
 f true true true-f true true false-f true false true-f false true true+
 f true false false+f false true false+f false false true-f false false false⟩
def boolPotentialADB2 (f : Bool → Bool → Bool → R) (p q : Bool) : R :=
 let j := boolJetADB2 f
 bit6905 p*j.p+bit6905 q*(j.p+j.q)+bit6905 p*bit6905 q*j.pq
def boolMomentADB2 (f : Bool → Bool → Bool → R) (c r q t u : R) : R :=
 let j := boolJetADB2 f
 c*j.a+r*(j.p+j.q+j.r)+q*(j.pq+j.qr)+t*j.pr+u*(j.pr+j.pqr)
def tripleScanADB2 (f : Bool → Bool → Bool → R) (p q : Bool) : List Bool → R
 | [] => 0
 | r::rs => f p q r+tripleScanADB2 f q r rs

theorem bool_coboundaryADB2 (f : Bool → Bool → Bool → R) (p q r : Bool) :
 f p q r=(boolJetADB2 f).a+bit6905 r*((boolJetADB2 f).p+(boolJetADB2 f).q+(boolJetADB2 f).r)+
 bit6905 q*bit6905 r*((boolJetADB2 f).pq+(boolJetADB2 f).qr)+
 bit6905 p*(1-bit6905 q)*bit6905 r*(boolJetADB2 f).pr+
 bit6905 p*bit6905 q*bit6905 r*((boolJetADB2 f).pr+(boolJetADB2 f).pqr)+
 boolPotentialADB2 f p q-boolPotentialADB2 f q r := by
 cases p <;> cases q <;> cases r <;> simp [bit6905,boolPotentialADB2,boolJetADB2] <;> ring

theorem tripleScan_momentADB2 (f : Bool → Bool → Bool → R) (p q : Bool) (w : List Bool) :
 tripleScanADB2 f p q w=
 boolMomentADB2 f w.length (w.count true) (bbScan446 q w)
   (separatedScan5 p q w) (tripleOneScan5 p q w)+
 boolPotentialADB2 f p q-
 boolPotentialADB2 f (endPairADB2 p q w).1 (endPairADB2 p q w).2 := by
 induction w generalizing p q with
 | nil => simp [tripleScanADB2,boolMomentADB2,bbScan446,separatedScan5,tripleOneScan5,endPairADB2]
 | cons r rs ih =>
   rw [tripleScanADB2,ih,bool_coboundaryADB2 f p q r]
   cases p <;> cases q <;> cases r <;>
     simp [boolMomentADB2,List.count_cons,bbScan446,separatedScan5,tripleOneScan5,
       endPairADB2,bit6905,Nat.cast_add,Nat.cast_one] <;> ring

theorem source_tripleScanADB2 (f : Bool → Bool → Bool → R) (path : List Bool) :
 tripleScanADB2 f true false (central28 path++[true,false])=
 boolMomentADB2 f (frame path).mid.b (frame path).mid.a
   (2*(frame path).mid.a-(frame path).mid.b:ℕ)
   (min ((frame path).mid.b-(frame path).mid.a)
     (3*(frame path).mid.a-(frame path).mid.b):ℕ)
   (3*(frame path).mid.a-2*(frame path).mid.b:ℕ) := by
 have hc := source_word_counts28 path
 have hb := source_bb_count446 path
 have ht := source_separated5 path
 have hu := source_tripleOne5 path
 rw [sourceWord_central28] at hc hb ht hu
 have hlen : (central28 path++[true,false]).length=(frame path).mid.b := by simpa using hc.2
 have hcount : (central28 path++[true,false]).count true=(frame path).mid.a := by simpa using hc.1
 have hbb : bbScan446 false (central28 path++[true,false])=
     2*(frame path).mid.a-(frame path).mid.b := by
   rw [show central28 path++[true,false]=(central28 path++[true])++[false] by simp,
     bb_append_falseADB2]
   simpa [bbCount446,bbScan446] using hb
 have hsep : separatedScan5 true false (central28 path++[true,false])=
     min ((frame path).mid.b-(frame path).mid.a)
       (3*(frame path).mid.a-(frame path).mid.b) := by
   rw [show central28 path++[true,false]=(central28 path++[true])++[false] by simp,
     separated_append_falseADB2]
   simpa [separated5,separatedScan5] using ht
 have htri : tripleOneScan5 true false (central28 path++[true,false])=
     3*(frame path).mid.a-2*(frame path).mid.b := by
   rw [show central28 path++[true,false]=(central28 path++[true])++[false] by simp,
     triple_append_falseADB2,triple_false5]
   simpa [tripleOne5,tripleOneScan5] using hu
 rw [tripleScan_momentADB2,endPair_appendADB2,hlen,hcount,hbb,hsep,htri]
 ring

#print axioms bool_coboundaryADB2
#print axioms source_tripleScanADB2
end
end MathGKM.Markov
