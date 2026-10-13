import MathGKM.Driver
open Lean MathGKM.Machine
#eval (toJson (Instruction.record 7)).compress
#eval (toJson (Instruction.rewrite [.record 7])).compress
#eval (toJson Engine.candidate).compress
#eval (toJson (Input.mk 0 none 0)).compress
