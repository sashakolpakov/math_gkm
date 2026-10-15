import MarkovFirstShiftLCF2
import MarkovFirstShiftCoeffF2
/-! Machine-authored f2da221d. First shifted fourth-slice source triple. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial

theorem source_fourth_first_shiftF2 (n : ℕ) (rest : List Bool)
    (hc : 5≤(frame rest).mid.b) (hn : 5≤n) (i : ℕ)
    (hs : i+n+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
    coeff (frame (List.replicate n true++false::rest)).mid.p i (n+2)*
    coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) n ≤
    coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+1)^2 := by
  have h0 := source_fourth_convF2 n rest hc (i+2) n (by omega) (by omega)
  have h1 := source_fourth_convF2 n rest hc (i+1) (n+1) (by omega) (by omega)
  have h2 := source_fourth_next_convF2 n rest hc i (by omega)
  have k0 := fourthShape_convolutionK0B ((frame rest).mid.b:ℤ)
    ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) n hn
  have k1 := fourthShape_convolutionK0B ((frame rest).mid.b:ℤ)
    ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+1) (by omega)
  have k2 := fourthShape_convolutionK0B ((frame rest).mid.b:ℤ)
    ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+2) (by omega)
  have s0 : 7560*coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) n=
      fourthShapeK0B (frame rest).mid.b ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) n := by
    linear_combination 315*h0+k0
  have s1 : 7560*coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (n+1)=
      fourthShapeK0B (frame rest).mid.b ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+1) := by
    linear_combination 315*h1+k1
  have s2 : 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i (n+2)=
      fourthShapeK0B (frame rest).mid.b ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) (n+2)+
      315*shiftCorrectionF2 (n:ℤ) (frame rest).mid.b (frame rest).mid.a := by
    linear_combination 315*h2+k2
  have hg := firstShift_logConcaveF2 (n:ℤ) (frame rest).mid.b (frame rest).mid.a
    (by exact_mod_cast hn) (by exact_mod_cast hc)
    (by exact_mod_cast (frame_reduced rest).1)
    (by exact_mod_cast (frame_reduced rest).2.1)
  push_cast at s1 s2
  rw [←s0,←s1,←s2] at hg
  nlinarith only [hg]

end
end MathGKM.Markov
