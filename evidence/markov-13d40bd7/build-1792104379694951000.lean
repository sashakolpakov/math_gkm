import MarkovCyclicLocalBridgeADB2
import MarkovFirstTwoCyclicADB2
/-! Machine-authored request 13d40bd7. General local moments without a
constant first upper-right coefficient hypothesis. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
variable {R : Type*} [CommRing R]
set_option maxHeartbeats 3000000

def hlocalLM13D (m n p : Mat16 R[X]) : R :=
 singleLADB2 m+6*(m.c.coeff 1*n.b.coeff 2+m.c.coeff 2*n.b.coeff 1)-
 6*m.c.coeff 1*n.b.coeff 1*(m.d.coeff 1+n.d.coeff 1)+
 6*m.c.coeff 1*n.a.coeff 1*p.b.coeff 1
def hscanM13D (f : Mat16 R[X] → Mat16 R[X] → Mat16 R[X] → R)
 (m n : Mat16 R[X]) : List (Mat16 R[X]) → R
 | [] => 0
 | p::ps => f m n p+hscanM13D f n p ps

theorem hopenL_consM13D (m n p : Mat16 R[X]) (ms : List (Mat16 R[X])) :
 openLADB2 (m::n::p::ms)=hlocalLM13D m n p+openLADB2 (n::p::ms) := by
 simp only [openLADB2,powerSum6905,same126905,single36905,pair36905,
   pairPenalty6905,triple36905,firstB6905,hlocalLM13D,singleLADB2]
 ring

theorem hopenL_scanM13D (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X])) :
 openLADB2 (m::n::(ms++[p,q]))=
 hscanM13D hlocalLM13D m n (ms++[p,q])+openLADB2 [p,q] := by
 induction ms generalizing m n with
 | nil => simp only [List.nil_append,hopenL_consM13D,hscanM13D]; ring
 | cons k ks ih =>
   simp only [List.cons_append,hopenL_consM13D,hscanM13D,ih]
   ring

theorem hscan_appendM13D (f : Mat16 R[X] → Mat16 R[X] → Mat16 R[X] → R)
 (m n p q : Mat16 R[X]) (ms vs : List (Mat16 R[X])) :
 hscanM13D f m n (ms++[p,q]++vs)=
 hscanM13D f m n (ms++[p,q])+hscanM13D f p q vs := by
 induction ms generalizing m n with
 | nil => simp [hscanM13D]; ring
 | cons k ks ih => simp [hscanM13D,ih,add_assoc]

theorem cyclicL_scanM13D (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X])) :
 cyclicL6905 m n ms p q=
 hscanM13D hlocalLM13D m n (ms++[p,q,m,n]) := by
 have hs := hopenL_scanM13D m n p q ms
 have he : ms++[p,q,m,n]=ms++[p,q]++[m,n] := by simp
 rw [he,hscan_appendM13D]
 simp only [hscanM13D]
 unfold cyclicL6905 openLADB2 at *
 simp only [powerSum6905,same126905,single36905,pair36905,
   pairPenalty6905,triple36905,firstB6905] at hs
 unfold hlocalLM13D singleLADB2
 linear_combination -hs

def hsingleKM13D (m : Mat16 R[X]) : R := 2*m.d.coeff 2-(m.d.coeff 1)^2
def hlocalKM13D (m n _p : Mat16 R[X]) : R :=
 hsingleKM13D m+2*m.c.coeff 1*n.b.coeff 1
def hopenKM13D (ms : List (Mat16 R[X])) : R :=
 2*single26905 ms+2*pair26905 ms-powerSum6905 2 ms

theorem hopenK_consM13D (m n p : Mat16 R[X]) (ms : List (Mat16 R[X])) :
 hopenKM13D (m::n::p::ms)=hlocalKM13D m n p+hopenKM13D (n::p::ms) := by
 simp [hopenKM13D,hlocalKM13D,hsingleKM13D,single26905,pair26905,powerSum6905,firstB6905]
 ring
theorem hopenK_scanM13D (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X])) :
 hopenKM13D (m::n::(ms++[p,q]))=
 hscanM13D hlocalKM13D m n (ms++[p,q])+hopenKM13D [p,q] := by
 induction ms generalizing m n with
 | nil => simp only [List.nil_append,hopenK_consM13D,hscanM13D]; ring
 | cons k ks ih => simp only [List.cons_append,hopenK_consM13D,hscanM13D,ih]; ring

theorem cyclicK_scanM13D (m n p q : Mat16 R[X]) (ms : List (Mat16 R[X])) :
 cyclicK6905 m n ms p q=hscanM13D hlocalKM13D m n (ms++[p,q,m,n]) := by
 have hs := hopenK_scanM13D m n p q ms
 have he : ms++[p,q,m,n]=ms++[p,q]++[m,n] := by simp
 rw [he,hscan_appendM13D]
 simp only [hscanM13D]
 unfold cyclicK6905 hopenKM13D at *
 simp only [single26905,pair26905,powerSum6905,firstB6905] at hs
 unfold hlocalKM13D hsingleKM13D
 linear_combination -hs

theorem hscan_mapM13D (g : Bool → Mat16 R[X])
 (f : Mat16 R[X] → Mat16 R[X] → Mat16 R[X] → R) (p q : Bool) (w : List Bool) :
 hscanM13D f (g p) (g q) (w.map g)=
 tripleScanADB2 (fun p q r => f (g p) (g q) (g r)) p q w := by
 induction w generalizing p q with
 | nil => rfl
 | cons r rs ih => simp [hscanM13D,tripleScanADB2,ih]

end
end MathGKM.Markov
