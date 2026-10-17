import MathGKM.Original
import MathGKM.HarnessFixture
namespace MathGKM.Targetfeb6544a310aa08138f711fa
def Interface := True
def Transport (StudyInterface : Interface) : Prop := True
def Goal (StudyInterface : Interface) : Prop := ((Neutral.P) ∧ (Neutral.Q)) → MathGKM.HarnessFixture.Root
def Residual0 : Prop := Neutral.P
def Residual1 : Prop := Neutral.Q
end MathGKM.Targetfeb6544a310aa08138f711fa
