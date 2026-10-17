import MathGKM.Target1aea1d01c7cc085ed6042bd5
import MathGKM.HarnessFixture
import Lean
def StudyInterface : MathGKM.Target1aea1d01c7cc085ed6042bd5.Interface := True.intro
theorem StudyTransport : MathGKM.Target1aea1d01c7cc085ed6042bd5.Transport StudyInterface := True.intro
theorem StudyObligation : MathGKM.Target1aea1d01c7cc085ed6042bd5.Goal StudyInterface := MathGKM.HarnessFixture.identity
