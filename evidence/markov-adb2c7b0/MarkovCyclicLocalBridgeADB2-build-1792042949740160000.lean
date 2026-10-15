import MarkovLocalTelescopingADB2
import MarkovCyclicMoments6905
import MarkovCubicSource6905
/-! Machine-authored request adb2c7b0. Ordered matrix sums to local scans. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option linter.unusedSimpArgs false
variable {R : Type*} [CommRing R]

def singleLADB2 (m : Mat16 R[X]) : R :=
 2*(m.d.coeff 1)^3-6*m.d.coeff 1*m.d.coeff 2+6*m.d.coeff 3
def edgeLADB2 (m n : Mat16 R[X]) : R :=
 singleLADB2 m+6*(m.c.coeff 1*n.b.coeff 2+m.c.coeff 2*n.b.coeff 1)-
 6*m.c.coeff 1*n.b.coeff 1*(m.d.coeff 1+n.d.coeff 1)+6*m.c.coeff 1*n.a.coeff 1
def matrixLScanADB2 : List (Mat16 R[X]) → R
 | [] => 0
 | [m] => singleLADB2 m
 | m::n::ns => edgeLADB2 m n+matrixLScanADB2 (n::ns)
def openLADB2 (w : List (Mat16 R[X])) : R :=
 2*powerSum6905 3 w-6*same126905 w+6*single36905 w+
 6*pair36905 w-6*pairPenalty6905 w+6*triple36905 w

theorem openL_consADB2 (m n p : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (hp : p.b.coeff 1=1) :
 openLADB2 (m::n::p::ms)=edgeLADB2 m n+openLADB2 (n::p::ms) := by
 simp only [openLADB2,powerSum6905,same126905,single36905,pair36905,
   pairPenalty6905,triple36905,firstB6905,hp,edgeLADB2,singleLADB2]
 ring

theorem openL_scanADB2 (ms : List (Mat16 R[X])) (p q : Mat16 R[X])
 (h : ∀ z∈ms++[p,q],z.b.coeff 1=1) :
 openLADB2 (ms++[p,q])+6*p.c.coeff 1*q.a.coeff 1=
 matrixLScanADB2 (ms++[p,q]) := by
 induction ms with
 | nil =>
   simp [openLADB2,powerSum6905,same126905,single36905,pair36905,
     pairPenalty6905,triple36905,firstB6905,matrixLScanADB2,edgeLADB2,singleLADB2]
   <;> ring
 | cons m ms ih =>
   have ht : ∀ z∈ms++[p,q],z.b.coeff 1=1 := by
     intro z hz; exact h z (List.mem_cons_of_mem m hz)
   have hh := ih ht
   cases ms with
   | nil =>
     rw [List.cons_append,List.nil_append,openL_consADB2 m p q [] (h q (by simp))]
     simp only [List.nil_append,matrixLScanADB2] at hh ⊢
     linear_combination hh
   | cons n ns =>
     cases ns with
     | nil =>
       simp only [List.cons_append,List.nil_append] at hh ⊢
       rw [openL_consADB2 m n p [q] (h p (by simp)),matrixLScanADB2]
       linear_combination hh
     | cons k ks =>
       simp only [List.cons_append] at hh ⊢
       rw [openL_consADB2 m n k (ks++[p,q]) (h k (by simp)),matrixLScanADB2]
       linear_combination hh

theorem cyclicL_scanADB2 (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X]))
 (h : ∀ z∈m::n::(ms++[p,q]),z.b.coeff 1=1) :
 cyclicL6905 m n ms p q=
 matrixLScanADB2 (m::n::(ms++[p,q]))-singleLADB2 q+edgeLADB2 q m := by
 have he := openL_scanADB2 (m::n::ms) p q (by simpa using h)
 have hm := h m (by simp)
 have hn := h n (by simp)
 simp only [List.cons_append] at he
 unfold cyclicL6905
 simp only [hm,hn,mul_one]
 unfold openLADB2 at he
 unfold edgeLADB2
 rw [hm]
 linear_combination he

def booleanGaugesADB2 (p : Bool) : List Bool → List (Mat16 BiPoly)
 | [] => []
 | q::qs => booleanGauge6905 p q::booleanGaugesADB2 q qs

theorem booleanGauges_b1ADB2 (p : Bool) (w : List Bool) :
 ∀ z∈booleanGaugesADB2 p w,z.b.coeff 1=1 := by
 induction w generalizing p with
 | nil => simp [booleanGaugesADB2]
 | cons q qs ih =>
   intro z hz
   simp only [booleanGaugesADB2,List.mem_cons] at hz
   rcases hz with rfl|hz
   · exact (booleanGauge_jets6905 p q).2.1
   · exact ih q z hz

theorem edgeL_booleanADB2 (p q r : Bool) :
 edgeLADB2 (booleanGauge6905 p q) (booleanGauge6905 q r)=localL6905 X p q r := by
 obtain ⟨ha,hb,hc,hd,hb2,hc2,hd2,hd3⟩ := booleanGauge_jets6905 p q
 obtain ⟨na,nb,nc,nd,nb2,nc2,nd2,nd3⟩ := booleanGauge_jets6905 q r
 simp only [edgeLADB2,singleLADB2,ha,hb,hc,hd,hb2,hc2,hd2,hd3,
   na,nb,nd,nb2,localL6905]
 ring

theorem booleanGauges_runsADB2 (p : Bool) (w : List Bool) :
 booleanGaugesADB2 p w=
 gaugedRuns6905 (2*bit6905 p*X) (w.map fun q => if q then 1 else 0) := by
 induction w generalizing p with
 | nil => rfl
 | cons q qs ih =>
   simp only [booleanGaugesADB2,List.map_cons,gaugedRuns6905,booleanGauge6905]
   have he : 2*runSumA27 (X:ℤ[X]) (if q then 1 else 0)=2*bit6905 q*X := by
     cases q <;> simp [runSumA27,bit6905]
   rw [he,ih]

theorem booleanGauges_appendADB2 (p : Bool) (w : List Bool) (q : Bool) :
 booleanGaugesADB2 p (w++[q])=
 booleanGaugesADB2 p w++[booleanGauge6905 (endPairADB2 p p w).2 q] := by
 induction w generalizing p with
 | nil => rfl
 | cons r rs ih =>
   simp only [List.cons_append,booleanGaugesADB2,ih,endPairADB2]
   have he : (endPairADB2 r r rs).2=(endPairADB2 p r rs).2 := by
     cases rs <;> rfl
   rw [he]

theorem matrixL_booleanADB2 (p q s t : Bool) (w : List Bool) :
 matrixLScanADB2 (booleanGaugesADB2 p (q::(w++[s,t])))=
 localLScanADB2 X p q (w++[s,t])+singleLADB2 (booleanGauge6905 s t) := by
 induction w generalizing p q with
 | nil => simp [booleanGaugesADB2,matrixLScanADB2,edgeL_booleanADB2,localLScanADB2,add_assoc]
 | cons r rs ih =>
   simpa only [List.cons_append,booleanGaugesADB2,matrixLScanADB2,
     edgeL_booleanADB2,localLScanADB2,add_assoc] using
     congrArg (fun x => localL6905 X p q r+x) (ih q r)

#print axioms cyclicL_scanADB2
#print axioms matrixL_booleanADB2
end
end MathGKM.Markov
