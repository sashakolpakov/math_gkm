import MarkovRenewalF80

/-! Machine-authored worker f80fb8bc. Explicit deletion masks, represented
by their ordered gaps, and an exact raw positive partition formula. -/
namespace MathGKM.Markov
noncomputable section

abbrev GasCut80 := List Bool × List (List Bool)

/-- Each original core site is either deleted into the current gap, or
retained as a rank-one separator. Multiplicities of equal gaps are retained. -/
def gasCuts80 : List Bool → List GasCut80
  | [] => [([],[])]
  | r::rs => (gasCuts80 rs).map (fun g => (r::g.1,g.2)) ++
      (gasCuts80 rs).map (fun g => ([],g.1::g.2))

def gasWeight80 {R : Type*} [CommRing R] (u v t x y : R) (g : GasCut80) : R :=
  t^g.1.length*gap80 u x y g.1 *
    (g.2.map (fun h => t^h.length*gap80 u v 1 h)).prod

theorem gasWeight_delete80 {R : Type*} [CommRing R] (u v t x y : R)
    (r : Bool) (g : GasCut80) :
    gasWeight80 u v t x y (r::g.1,g.2)=
      gasWeight80 u v t (if r then t*x else 0) (if r then 0 else t*y) g := by
  simp only [gasWeight80,List.length_cons,gap_cons80,pow_succ]
  ring

theorem gasWeight_keep80 {R : Type*} [CommRing R] (u v t x y : R)
    (g : GasCut80) :
    gasWeight80 u v t x y ([],g.1::g.2)=
      (x+u*y)*gasWeight80 u v t v 1 g := by
  simp [gasWeight80,gap80]

/-- Exactly 2^length masks, including those with zero weight. -/
theorem gasCuts_length80 (w : List Bool) : (gasCuts80 w).length=2^w.length := by
  induction w with
  | nil => simp [gasCuts80]
  | cons r rs ih => simp [gasCuts80,ih,pow_succ]; omega

theorem gasRow_cuts80 {R : Type*} [CommRing R] (u v t x y : R)
    (w : List Bool) :
    gasRow80 u v t x y w = ((gasCuts80 w).map (gasWeight80 u v t x y)).sum := by
  induction w generalizing x y with
  | nil => simp [gasRow80,gasWord80,gasCuts80,gasWeight80,gap80]
  | cons r rs ih =>
    rw [gasRow_cons80,← gasRow_base80,ih,ih]
    simp only [gasCuts80,List.map_append,List.map_map,List.sum_append,Function.comp_def]
    simp_rw [gasWeight_delete80,gasWeight_keep80]
    rw [List.sum_map_mul_left]
    ring

/-- A positive ordered-gap partition function for every source path,
literally equal to the pinned raw numerator at w=1. -/
theorem source_cuts80 (path : List Bool) :
    ∃ w : List Bool, w.length+2=(frame path).mid.a+(frame path).mid.b ∧
      (frame path).mid.p=((gasCuts80 w).map (gasWeight80 U V 1 V 1)).sum := by
  obtain ⟨w,hl,he⟩ := source_gas80 path
  refine ⟨w,hl,?_⟩
  rw [he,← gasRow_base80,gasRow_cuts80]

#print axioms source_cuts80
#print axioms gasCuts_length80
end
end MathGKM.Markov
