import MathGKM.Round121SubmissionA
import MathGKM.Markov
def MathGKM.Targetb63aa1d4a40cbe7efcdade33.Interface :=
  (
    True
  )
def MathGKM.Targetb63aa1d4a40cbe7efcdade33.Transport (StudyInterface : MathGKM.Targetb63aa1d4a40cbe7efcdade33.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetb63aa1d4a40cbe7efcdade33.Goal (StudyInterface : MathGKM.Targetb63aa1d4a40cbe7efcdade33.Interface) : Prop :=
  (
    (∀ (pre post a b : List PacketsR120.Tile) (sigma : ℕ)
        (hw : PacketsR120.width a=PacketsR120.width b),
    (LocalRetilingR76.du sigma (PacketsR120.decode (pre++b++post)) : ℤ)-LocalRetilingR76.du sigma (PacketsR120.decode (pre++a++post)) =
          (PacketStructureR121.uscore sigma (PacketsR120.width pre) b : ℤ)-PacketStructureR121.uscore sigma (PacketsR120.width pre) a) ∧
    (∀ (sigma v : ℕ),
    ((PacketStructureR121.uscore sigma v [PacketsR120.Tile.V] : ℤ)-PacketStructureR121.uscore sigma v [PacketsR120.Tile.U] = -1) ∧
        ((PacketStructureR121.uscore sigma v [PacketsR120.Tile.U] : ℤ)-PacketStructureR121.uscore sigma v [PacketsR120.Tile.V] = 1) ∧
        (∀ a b, PacketsR120.monomer a → PacketsR120.monomer b →
          (PacketStructureR121.uscore sigma v [a,b] : ℤ)-PacketStructureR121.uscore sigma v [PacketsR120.Tile.D] =
            (if a=PacketsR120.Tile.U then 1 else 0)+(if b=PacketsR120.Tile.U then 1 else 0)-
              (if (v+sigma)%2=0 then 1 else 0)) ∧
        (∀ a, PacketsR120.monomer a →
          (PacketStructureR121.uscore sigma v [a,PacketsR120.Tile.D] : ℤ)-PacketStructureR121.uscore sigma v [PacketsR120.Tile.D,a] =
            (if (v+1+sigma)%2=0 then 1 else 0)-
              (if (v+sigma)%2=0 then 1 else 0)))
  )
