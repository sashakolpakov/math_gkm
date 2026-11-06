import MathGKM.Round121StructureA

namespace PacketSubmissionR121

theorem claim0 :
∀ (N sigma : ℕ) (o : LocalRetilingR76.Obj) (ho : LocalRetilingR76.valid N o),
LocalRetilingR76.du sigma o + LocalRetilingR76.dv N sigma o + o.1.card = N := PacketStructureR121.total_degree

theorem claim1 :
∀ (N sigma r t : ℕ) (z w : LocalRetilingR76.Pair)
    (hz : LocalRetilingR76.valid N z.1 ∧ LocalRetilingR76.valid N z.2)
    (hw : LocalRetilingR76.valid N w.1 ∧ LocalRetilingR76.valid N w.2)
    (hd : LocalRetilingR76.du sigma z.1=r ∧ LocalRetilingR76.du sigma z.2=r+2 ∧
      LocalRetilingR76.du sigma w.1=r+1 ∧ LocalRetilingR76.du sigma w.2=r+1 ∧
      LocalRetilingR76.dv N sigma z.1=t ∧ LocalRetilingR76.dv N sigma z.2=t ∧
      LocalRetilingR76.dv N sigma w.1=t ∧ LocalRetilingR76.dv N sigma w.2=t),
PacketsR120.packet N z w ↔
      (PacketStructureR121.splitEdit N z.1 w.1 ∧ PacketStructureR121.joinRepair N z.2 w.2) ∨
      (PacketStructureR121.splitRepair N z.1 w.1 ∧ PacketStructureR121.joinEdit N z.2 w.2) := PacketStructureR121.balanced_iff_normal_form

theorem claim2 :
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
          (if (v+sigma)%2=0 then 1 else 0))) := ⟨PacketStructureR121.contextual_delta,PacketStructureR121.local_deltas⟩

end PacketSubmissionR121

#print axioms PacketSubmissionR121.claim0

#print axioms PacketSubmissionR121.claim1

#print axioms PacketSubmissionR121.claim2
