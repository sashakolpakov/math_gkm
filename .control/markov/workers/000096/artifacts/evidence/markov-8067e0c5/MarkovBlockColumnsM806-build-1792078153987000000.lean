import MarkovBlockValue0M806
import MarkovBlockValue1M806
import MarkovBlockValue2M806
/-! Machine-authored 8067e0c5. Exact column assembly. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384

def blockColumn00M806 (J E R : ℤ) : ℤ := ((blockLP000M042 J E*R^0 + blockLP010M042 J E*R^1) + (blockLP020M042 J E*R^2 + (blockLP030M042 J E*R^3 + blockLP040M042 J E*R^4)))

def blockColumn01M806 (J E R : ℤ) : ℤ := ((blockLP001M042 J E*R^0 + blockLP011M042 J E*R^1) + (blockLP021M042 J E*R^2 + blockLP031M042 J E*R^3))

def blockColumn02M806 (J E R : ℤ) : ℤ := (blockLP002M042 J E*R^0 + (blockLP012M042 J E*R^1 + blockLP022M042 J E*R^2))

def blockColumn03M806 (J E R : ℤ) : ℤ := (blockLP003M042 J E*R^0 + blockLP013M042 J E*R^1)

def blockColumn04M806 (J E R : ℤ) : ℤ := blockLP004M042 J E*R^0

theorem block_columns0M806 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+10)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+5))=((blockColumn00M806 J E R*C^0 + blockColumn01M806 J E R*C^1) + (blockColumn02M806 J E R*C^2 + (blockColumn03M806 J E R*C^3 + blockColumn04M806 J E R*C^4))) := by
 rw [block_value0M806]
 unfold blockColumn00M806 blockColumn01M806 blockColumn02M806 blockColumn03M806 blockColumn04M806
 ring

def blockColumn10M806 (J E R : ℤ) : ℤ := ((blockLP100M042 J E*R^0 + blockLP110M042 J E*R^1) + (blockLP120M042 J E*R^2 + (blockLP130M042 J E*R^3 + blockLP140M042 J E*R^4)))

def blockColumn11M806 (J E R : ℤ) : ℤ := ((blockLP101M042 J E*R^0 + blockLP111M042 J E*R^1) + (blockLP121M042 J E*R^2 + blockLP131M042 J E*R^3))

def blockColumn12M806 (J E R : ℤ) : ℤ := (blockLP102M042 J E*R^0 + (blockLP112M042 J E*R^1 + blockLP122M042 J E*R^2))

def blockColumn13M806 (J E R : ℤ) : ℤ := (blockLP103M042 J E*R^0 + blockLP113M042 J E*R^1)

def blockColumn14M806 (J E R : ℤ) : ℤ := blockLP104M042 J E*R^0

theorem block_columns1M806 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+11)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+6))=((blockColumn10M806 J E R*C^0 + blockColumn11M806 J E R*C^1) + (blockColumn12M806 J E R*C^2 + (blockColumn13M806 J E R*C^3 + blockColumn14M806 J E R*C^4))) := by
 rw [block_value1M806]
 unfold blockColumn10M806 blockColumn11M806 blockColumn12M806 blockColumn13M806 blockColumn14M806
 ring

def blockColumn20M806 (J E R : ℤ) : ℤ := ((blockLP200M042 J E*R^0 + blockLP210M042 J E*R^1) + (blockLP220M042 J E*R^2 + (blockLP230M042 J E*R^3 + blockLP240M042 J E*R^4)))

def blockColumn21M806 (J E R : ℤ) : ℤ := ((blockLP201M042 J E*R^0 + blockLP211M042 J E*R^1) + (blockLP221M042 J E*R^2 + blockLP231M042 J E*R^3))

def blockColumn22M806 (J E R : ℤ) : ℤ := (blockLP202M042 J E*R^0 + (blockLP212M042 J E*R^1 + blockLP222M042 J E*R^2))

def blockColumn23M806 (J E R : ℤ) : ℤ := (blockLP203M042 J E*R^0 + blockLP213M042 J E*R^1)

def blockColumn24M806 (J E R : ℤ) : ℤ := blockLP204M042 J E*R^0

theorem block_columns2M806 (C R J E : ℤ) :
 (fourthShapeK0B (R+C+5) ((J+E+5)*(R+C+5)+(R+4)) (2*J+E+12)+shiftShapeCC (J+E+5) (R+C+5) (R+4) (J+7))=((blockColumn20M806 J E R*C^0 + blockColumn21M806 J E R*C^1) + (blockColumn22M806 J E R*C^2 + (blockColumn23M806 J E R*C^3 + blockColumn24M806 J E R*C^4))) := by
 rw [block_value2M806]
 unfold blockColumn20M806 blockColumn21M806 blockColumn22M806 blockColumn23M806 blockColumn24M806
 ring
end
end MathGKM.Markov
