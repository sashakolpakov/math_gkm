import MathGKM.Target31e0eea90e66fd96030add15
import MathGKM.AdapterLiveProposal017
import Lean
def StudyInterface : MathGKM.Target31e0eea90e66fd96030add15.Interface :=
  (
    AdapterLiveProposal017.interfaceProof
  )
theorem StudyTransport : MathGKM.Target31e0eea90e66fd96030add15.Transport StudyInterface :=
  (
    AdapterLiveProposal017.transportProof
  )
theorem StudyObligation : MathGKM.Target31e0eea90e66fd96030add15.Goal StudyInterface :=
  (
    AdapterLiveProposal017.identity
  )
