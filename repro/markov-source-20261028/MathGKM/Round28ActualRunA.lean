import MathGKM.Round28RenewalA
import MathGKM.Accepteddbe47cff06ae43fd1c953340

/-! Machine-authored use of the admitted fixed-run transport, round28. -/
namespace RenewalR28
open MathGKM.Markov
noncomputable section

theorem actual_run_series (f : Frame) (branch : Bool) :
    let F := if branch then f.hi else f.lo
    let O := if branch then f.lo else f.hi
    let r := if branch then U^F.a else V^F.b
    let q := if branch then V^F.b else U^F.a
    let H := S*F.p-r-q
    let run := fun n : ℕ => (fun g : Frame => advance g branch)^[n] f
    (1-PowerSeries.C (H+r+q)*PowerSeries.X+PowerSeries.C (r*q)*PowerSeries.X^2)*
      PowerSeries.mk (fun n => (run n).mid.p) =
      (1-PowerSeries.C q*PowerSeries.X)*PowerSeries.C f.mid.p+
        PowerSeries.C (q*(f.mid.p-r*O.p))*PowerSeries.X := by
  intro F O r q H run
  have h := (Accepteddbe47cff06ae43fd1c953340.obligation f branch).1
  have hs : PowerSeries.mk (fun n => (run n).mid.p)=
      series H r q f.mid.p (f.mid.p-r*O.p) := by
    apply PowerSeries.ext
    intro n
    have hn := congrArg Prod.fst (h n).2.2
    simpa only [series,PowerSeries.coeff_mk,state] using hn
  rw [hs]
  exact generic_series H r q f.mid.p (f.mid.p-r*O.p)

end
end RenewalR28
