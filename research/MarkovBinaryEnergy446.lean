import MarkovAdjacency446
/-! Machine-authored 446bbcdc. Exact binary cyclic energy compression. -/
namespace MathGKM.Markov
noncomputable section
set_option linter.unusedSimpArgs false

def bit446 {R : Type*} [CommRing R] (r : Bool) : R := if r then 1 else 0
def energyScan446 {R : Type*} [CommRing R] (b d l y : R) : Bool → List Bool → R
 | p, [] => (b+d*bit446 p)*l
 | p, r::rs => (b+d*bit446 p)*(l+y*d*bit446 r)+energyScan446 b d l y r rs

/-- The scan ends at A, and the initial vertex is an explicitly supplied bit. -/
theorem energyScan_formula446 {R : Type*} [CommRing R] (b d l y : R)
 (p : Bool) (w : List Bool) :
 energyScan446 b d l y p w =
 (w.length:R)*b*l+(w.count true:R)*(d*l+b*y*d)+
 (bbScan446 p w:R)*y*d^2+(b+d*bit446 p)*l := by
 induction w generalizing p with
 | nil => simp [energyScan446,bbScan446]
 | cons r rs ih =>
   rw [energyScan446,ih]
   cases p <;> cases r <;>
     simp [bbScan446,bit446,List.count_cons,Nat.cast_add] <;> ring

def cyclicEnergy446 {R : Type*} [CommRing R] (b d l y : R) (w : List Bool) : R :=
 energyScan446 b d l y false w-b*l

theorem cyclicEnergy_formula446 {R : Type*} [CommRing R] (b d l y : R)
 (w : List Bool) :
 cyclicEnergy446 b d l y w =
 (w.length:R)*b*l+(w.count true:R)*(d*l+b*y*d)+(bbCount446 w:R)*y*d^2 := by
 rw [cyclicEnergy446,energyScan_formula446]
 simp [bit446,bbCount446]

/-- For actual source words the cyclic adjacency parameter is exact, not an
arbitrary extra parameter. This is an equality, not a log-concavity assertion. -/
theorem source_cyclic_energy446 {R : Type*} [CommRing R] (b d y : R)
 (path : List Bool) :
 cyclicEnergy446 b d (y-1+y*b) y (sourceWord28 path)=
 (y-1)*((frame path).mid.b*b+(frame path).mid.a*d)+
 y*((frame path).mid.b*b^2+2*(frame path).mid.a*b*d+
   (2*(frame path).mid.a-(frame path).mid.b:ℕ)*d^2) := by
 rw [cyclicEnergy_formula446,(source_word_counts28 path).1,
   (source_word_counts28 path).2,source_bb_count446]
 ring

def pairEnergy446 {R : Type*} [CommRing R] (f : Bool → R) : List Bool → R
 | [] => 0
 | r::rs => f r*(rs.map f).sum+pairEnergy446 f rs

theorem binary_sum446 {R : Type*} [CommRing R] (f : Bool → R) (w : List Bool) :
 (w.map f).sum=((w.length:R)-(w.count true:R))*f false+(w.count true:R)*f true := by
 induction w with
 | nil => simp
 | cons r rs ih =>
   cases r <;> simp [List.count_cons,ih,Nat.cast_add] <;> ring

theorem pairEnergy_square446 {R : Type*} [CommRing R] (f : Bool → R)
 (w : List Bool) :
 2*pairEnergy446 f w=(w.map f).sum^2-(w.map fun r => (f r)^2).sum := by
 induction w with
 | nil => simp [pairEnergy446]
 | cons r rs ih =>
   simp only [pairEnergy446,List.map_cons,List.sum_cons]
   linear_combination ih

theorem pairEnergy_counts446 {R : Type*} [CommRing R] (h₀ h₁ : R)
 (w : List Bool) :
 2*pairEnergy446 (fun r => if r then h₁ else h₀) w=
 (((w.length:R)-(w.count true:R))*h₀+(w.count true:R)*h₁)^2-
 (((w.length:R)-(w.count true:R))*h₀^2+(w.count true:R)*h₁^2) := by
 rw [pairEnergy_square446,binary_sum446,binary_sum446]
 simp

#print axioms source_cyclic_energy446
#print axioms pairEnergy_counts446
end
end MathGKM.Markov
