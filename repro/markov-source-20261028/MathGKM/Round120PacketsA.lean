import MathGKM.Round76RetilingA

/- Machine-authored round120. Literal tile-word elementary edits; the packet
allows degree changes at intermediate valid pairs. No old retiling or swap. -/
namespace PacketsR120
open LocalRetilingR76
inductive Tile where
  | D | U | V
  deriving DecidableEq
open Tile
def width : List Tile → ℕ
  | [] => 0
  | D::xs => 2+width xs
  | _::xs => 1+width xs
def decodeFrom : ℕ → List Tile → Obj
  | _, [] => (∅,∅)
  | v, D::xs => let o := decodeFrom (v+2) xs; (insert v o.1,o.2)
  | v, U::xs => let o := decodeFrom (v+1) xs; (o.1,insert v o.2)
  | v, V::xs => decodeFrom (v+1) xs
def decode (xs : List Tile) : Obj := decodeFrom 0 xs
def monomer (x : Tile) : Prop := x=U ∨ x=V
inductive Rule : List Tile → List Tile → Prop where
  | uv : Rule [U] [V]
  | vu : Rule [V] [U]
  | split (a b : Tile) : monomer a → monomer b → Rule [D] [a,b]
  | join (a b : Tile) : monomer a → monomer b → Rule [a,b] [D]
  | slideR (a : Tile) : monomer a → Rule [D,a] [a,D]
  | slideL (a : Tile) : monomer a → Rule [a,D] [D,a]
def edit (N : ℕ) (x y : Obj) : Prop :=
  valid N x ∧ valid N y ∧ ∃ pre post a b : List Tile,
    Rule a b ∧ width (pre++a++post)=N ∧ width (pre++b++post)=N ∧
    decode (pre++a++post)=x ∧ decode (pre++b++post)=y
def pairEdit (N : ℕ) (z w : Pair) : Prop :=
  valid N z.1 ∧ valid N z.2 ∧ valid N w.1 ∧ valid N w.2 ∧
    ((edit N z.1 w.1 ∧ z.2=w.2) ∨ (z.1=w.1 ∧ edit N z.2 w.2))
def packet (N : ℕ) (z w : Pair) : Prop :=
  (z=w ∧ valid N z.1 ∧ valid N z.2) ∨ pairEdit N z w ∨
  (∃ a, pairEdit N z a ∧ pairEdit N a w) ∨
  (∃ a b, pairEdit N z a ∧ pairEdit N a b ∧ pairEdit N b w)

def A : Obj := ({0,2,4,6,8},∅)
def B : Obj := ({0,3,5},∅)
def A' : Obj := ({0,2,4,6},{8})
def B' : Obj := ({0,2,5},∅)
def B'' : Obj := ({0,2,5,8},∅)
instance validDec (N : ℕ) (o : Obj) : Decidable (valid N o) := by
  unfold valid; infer_instance

theorem first_edit : edit 10 A A' := by
  refine ⟨by decide,by decide,[D,D,D,D],[],[D],[U,V],
    Rule.split U V (Or.inl rfl) (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem second_edit : edit 10 B B' := by
  refine ⟨by decide,by decide,[D],[D,V,V,V], [V,D],[D,V],
    Rule.slideL V (Or.inr rfl),by decide,by decide,by decide,by decide⟩
theorem third_edit : edit 10 B' B'' := by
  refine ⟨by decide,by decide,[D,D,V,D,V],[],[V,V],[D],
    Rule.join V V (Or.inr rfl) (Or.inr rfl),by decide,by decide,by decide,by decide⟩

theorem seed_escape :
    valid 10 A ∧ valid 10 B ∧
    dv 10 1 A=5 ∧ dv 10 1 B=5 ∧ du 1 A=0 ∧ du 1 B=2 ∧
    valid 10 A' ∧ valid 10 B'' ∧
    dv 10 1 A'=5 ∧ dv 10 1 B''=5 ∧ du 1 A'=1 ∧ du 1 B''=1 ∧
    packet 10 (A,B) (A',B'') := by
  refine ⟨by decide,by decide,by decide,by decide,by decide,by decide,
    by decide,by decide,by decide,by decide,by decide,by decide,?_⟩
  apply Or.inr; apply Or.inr; apply Or.inr
  refine ⟨(A',B),(A',B'),?_,?_,?_⟩
  · exact ⟨by decide,by decide,by decide,by decide,Or.inl ⟨first_edit,rfl⟩⟩
  · exact ⟨by decide,by decide,by decide,by decide,Or.inr ⟨rfl,second_edit⟩⟩
  · exact ⟨by decide,by decide,by decide,by decide,Or.inr ⟨rfl,third_edit⟩⟩
end PacketsR120
#print axioms PacketsR120.seed_escape
