import MarkovGasF80
import MathGKM.MarkovExamples
/-! Machine-authored 88f3b553. An obstruction to a specific pairwise path
switching proof, on the actual source 1/4. This is not a root refutation.
Weights are exponent pairs of literal monomials, without normalization. -/
namespace MathGKM.Markov

abbrev Charge88 := ℤ × ℤ
abbrev Edge88 := Bool × Bool × Charge88

/-- The expanded edges of the raw gas A matrix, including both lower loops. -/
def edgesA88 : List Edge88 :=
 [(false,false,(0,1)),(false,true,(0,0)),
  (true,false,(1,1)),(true,true,(1,0)),(true,true,(0,0))]

def validEdges88 : Bool → List Edge88 → Bool → Prop
 | s, [], t => s=t
 | s, e::es, t => e ∈ edgesA88 ∧ e.1=s ∧ validEdges88 e.2.1 es t

def chargeEdges88 (es : List Edge88) : Charge88 :=
 (es.map (fun e => e.2.2)).sum

def scalarCharge88 (s t : Bool) (es : List Edge88) : Charge88 :=
 (if s then (0,0) else (0,1)) + chargeEdges88 es +
 (if t then (1,0) else (0,0))

def highWalk88 : List Edge88 :=
 [(true,false,(1,1)),(false,true,(0,0)),(true,true,(1,0))]
def lowWalk88 : List Edge88 :=
 [(true,true,(0,0)),(true,true,(0,0)),(true,false,(1,1))]

theorem witness_walks_valid88 :
 validEdges88 true highWalk88 true ∧ validEdges88 true lowWalk88 false ∧
 scalarCharge88 true true highWalk88=(3,1) ∧
 scalarCharge88 true false lowWalk88=(1,1) := by
 norm_num [validEdges88,highWalk88,lowWalk88,edgesA88,
   scalarCharge88,chargeEdges88]

/-- Internal states after the starting boundary and after each A edge. -/
def walkStates88 (s : Bool) (es : List Edge88) : List Bool :=
 s :: es.map (fun e => e.2.1)

theorem common_vertices88 :
 walkStates88 true highWalk88=[true,false,true,true] ∧
 walkStates88 true lowWalk88=[true,true,true,false] := by decide

/-- The two maximal pieces between common vertices have these differences.
The second includes the terminal boundary edge. -/
theorem component_charges88 :
 chargeEdges88 (highWalk88.take 2)-chargeEdges88 (lowWalk88.take 2)=(1,1) ∧
 (chargeEdges88 (highWalk88.drop 2)+(1,0))-
   (chargeEdges88 (lowWalk88.drop 2)+(0,0))=(1,-1) := by decide

/-- Each common-vertex component can be kept or exchanged. -/
def swapCharge88 (first second : Bool) : Charge88 :=
 (if first then (1,1) else (0,0)) +
 (if second then (1,-1) else (0,0))

theorem no_horizontal_midpoint_swap88 (first second : Bool) :
 swapCharge88 first second ≠ (1,0) := by
 cases first <;> cases second <;> decide

theorem all_component_swaps88 :
 ∀ first second : Bool,
 (3,1)-swapCharge88 first second ≠ (2,1) := by
 intro first second
 cases first <;> cases second <;> decide

noncomputable section

theorem actual_source_one_four88 :
 (frame [false,false]).mid.a=1 ∧ (frame [false,false]).mid.b=4 ∧
 (frame [false,false]).mid.p=gasScalar80 U V 1 [false,false,false] := by
 norm_num [frame,initial,advance,gasScalar80,gasWord80,gasT80,mm16,S]
 ring

theorem actual_raw_triple88 :
 coeff (frame [false,false]).mid.p 1 1=2 ∧
 coeff (frame [false,false]).mid.p 2 1=6 ∧
 coeff (frame [false,false]).mid.p 3 1=4 := by
 rw [actual_source_one_four88.2.2]
 norm_num [gasScalar80,gasWord80,gasT80,mm16,U,V,coeff,
   Polynomial.coeff_add,Polynomial.coeff_mul,Finset.sum_antidiagonal_eq_sum_range_succ,
   Finset.sum_range_succ]

theorem actual_polygon_triple88 :
 InPolygon 1 4 1 1 ∧ InPolygon 1 4 2 1 ∧ InPolygon 1 4 3 1 := by
 norm_num [InPolygon]

theorem actual_raw_logConcavity88 :
 coeff (frame [false,false]).mid.p 1 1 *
 coeff (frame [false,false]).mid.p 3 1 <
 coeff (frame [false,false]).mid.p 2 1 ^ 2 := by
 rw [actual_raw_triple88.1,actual_raw_triple88.2.1,actual_raw_triple88.2.2]
 norm_num

#print axioms witness_walks_valid88
#print axioms no_horizontal_midpoint_swap88
#print axioms actual_source_one_four88
#print axioms actual_raw_triple88
#print axioms actual_raw_logConcavity88
end
end MathGKM.Markov
