import MathGKM.Original
import MathGKM.HarnessFixture
def MathGKM.Target32ba58c788a1dba172cfa3ef.Residual0 : Prop := Neutral.P
def MathGKM.Target32ba58c788a1dba172cfa3ef.Residual1 : Prop := Neutral.Q
def MathGKM.Target32ba58c788a1dba172cfa3ef.Residual2 : Prop := Goal
def MathGKM.Target32ba58c788a1dba172cfa3ef.Interface := True
def MathGKM.Target32ba58c788a1dba172cfa3ef.Transport (StudyInterface : MathGKM.Target32ba58c788a1dba172cfa3ef.Interface) : Prop := True
def MathGKM.Target32ba58c788a1dba172cfa3ef.Goal (StudyInterface : MathGKM.Target32ba58c788a1dba172cfa3ef.Interface) : Prop := (MathGKM.Target32ba58c788a1dba172cfa3ef.Residual0 ∧ MathGKM.Target32ba58c788a1dba172cfa3ef.Residual1 ∧ MathGKM.Target32ba58c788a1dba172cfa3ef.Residual2) → MathGKM.HarnessFixture.Root
