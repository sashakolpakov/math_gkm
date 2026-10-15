import MarkovThirdAllCycles8BBB
/-! Machine-authored bdee9a64. Scalar Cayley--Hamilton recurrence for
every entry and every coefficient of an actual source run block. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 1000000
set_option linter.unusedSimpArgs false

theorem run_matrix_recurrenceBDEE (n : ℕ) :
 let p := lowerMatrix487 n
 let q := lowerMatrix487 (n+1)
 let r := lowerMatrix487 (n+2)
 let t := 1+V+U*(1+V)^2
 r.a=t*q.a-V*p.a ∧ r.b=t*q.b-V*p.b ∧
 r.c=t*q.c-V*p.c ∧ r.d=t*q.d-V*p.d := by
 dsimp only
 rw [show n+2=(n+1)+1 by omega, lowerMatrix_step487,lowerMatrix_step487]
 simp only [mm16,ambientT5c,if_true]
 constructor
 · ring
 constructor
 · ring
 constructor <;> ring

def runEntryBDEE (e : Fin 4) (n : ℕ) : BiPoly :=
 if e=0 then (lowerMatrix487 n).a else
 if e=1 then (lowerMatrix487 n).b else
 if e=2 then (lowerMatrix487 n).c else (lowerMatrix487 n).d

theorem run_entry_recurrenceBDEE (e : Fin 4) (n : ℕ) :
 runEntryBDEE e (n+2)=(1+V+U*(1+V)^2)*runEntryBDEE e (n+1)-V*runEntryBDEE e n := by
 have h := run_matrix_recurrenceBDEE n
 dsimp only at h
 fin_cases e <;> simp [runEntryBDEE,h.1,h.2.1,h.2.2.1,h.2.2.2]

theorem run_jet_recurrenceBDEE (e : Fin 4) (n k : ℕ) :
 (runEntryBDEE e (n+2)).coeff (k+1)=
 (1+X)*(runEntryBDEE e (n+1)).coeff (k+1)-X*(runEntryBDEE e n).coeff (k+1)+
 (1+X)^2*(runEntryBDEE e (n+1)).coeff k := by
 rw [run_entry_recurrenceBDEE]
 have he (P : BiPoly) : (1+V+U*(1+V)^2)*P=
     C (1+X)*P+U*(C ((1+X)^2)*P) := by
   simp only [map_add,map_one,map_pow,U,V]; ring
 rw [he]
 simp only [Polynomial.coeff_sub,Polynomial.coeff_add,Polynomial.coeff_C_mul,
   U,V,Polynomial.coeff_X_mul]
 ring

theorem run_jet_zero_recurrenceBDEE (e : Fin 4) (n : ℕ) :
 (runEntryBDEE e (n+2)).coeff 0=
 (1+X)*(runEntryBDEE e (n+1)).coeff 0-X*(runEntryBDEE e n).coeff 0 := by
 rw [run_entry_recurrenceBDEE]
 simp [Polynomial.mul_coeff_zero,U,V]
 ring

#print axioms run_jet_recurrenceBDEE
#print axioms run_jet_zero_recurrenceBDEE
end
end MathGKM.Markov
