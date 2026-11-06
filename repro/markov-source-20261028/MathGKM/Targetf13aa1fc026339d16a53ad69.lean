import MathGKM.Round47ReindexA
import MathGKM.Markov
def MathGKM.Targetf13aa1fc026339d16a53ad69.Interface :=
  (
    True
  )
def MathGKM.Targetf13aa1fc026339d16a53ad69.Transport (StudyInterface : MathGKM.Targetf13aa1fc026339d16a53ad69.Interface) : Prop :=
  (
    True
  )
def MathGKM.Targetf13aa1fc026339d16a53ad69.Goal (StudyInterface : MathGKM.Targetf13aa1fc026339d16a53ad69.Interface) : Prop :=
  (
    ∀ (n h j l : ℕ) (hn : h+4 ≤ n),
        HorizontalR46.complete n h j l + HorizontalR46.complete n h j (l+2) =
          HorizontalR47.boundary (n-(h+1)) (HorizontalR46.F n (h+1) j) (HorizontalR46.F n (h+1) j) l (2*(n-h)-2) -
          HorizontalR47.boundary (n-(h+2)) (HorizontalR46.F n h j) (HorizontalR46.F n (h+2) j) l (2*(n-h)-2) +
          HorizontalR47.C (n-(h+1)-2) (n-(h+1)) (fun q => HorizontalR46.F n (h+1) j (q+2))
            (HorizontalR46.F n (h+1) j) (l+2) (2*(n-h)-2) -
          HorizontalR47.C (n-h-2) (n-(h+2)) (fun q => HorizontalR46.F n h j (q+2))
            (HorizontalR46.F n (h+2) j) (l+2) (2*(n-h)-2) +
          HorizontalR46.complete n h j (l+2)
  )
