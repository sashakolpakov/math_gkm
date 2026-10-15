import MarkovOnsetOneGap1M253
import MarkovOnsetOneGap2M253
import MarkovOnsetOneGap3M253
import MarkovOnsetOneGap4M253
import MarkovOnsetOneGap5M253
import MarkovResidualAssemblyM5DC
/-! Machine-authored request 2532cf40. Full fourth slice for numerator-one predecessors. -/
namespace MathGKM.Markov
noncomputable section
attribute [local irreducible] frame coeff middleShape0M722 middleShape3M722

def onsetOneValueM253 (N C : ℤ) (k : ℕ) : ℤ :=
 match k with
 | 1 => onsetOneV1M253 N C
 | 2 => onsetOneV2M253 N C
 | 3 => onsetOneV3M253 N C
 | 4 => onsetOneV4M253 N C
 | 5 => onsetOneV5M253 N C
 | 6 => onsetOneV6M253 N C
 | 7 => onsetOneV7M253 N C
 | _ => 0

theorem onsetOne_valueM253 (n c k : ℕ) (hc : 5≤c) (hk : 1≤k) (hku : k≤7) :
 secondOnsetValueM5DC n c 1 k = onsetOneValueM253 ((n:ℤ)-7) ((c:ℤ)-5) k := by
 have hq : 2*1-c=0 := by omega
 have hl : 2*(1:ℤ)<(c:ℤ) := by omega
 have en : ((n:ℤ)-7)+7=n := by ring
 have ec : ((c:ℤ)-5)+5=c := by ring
 interval_cases k
 all_goals simp only [secondOnsetValueM5DC, onsetOneValueM253, middleRawValueM722,
   Nat.cast_add, Nat.cast_mul, Nat.cast_ofNat, if_pos hl, hq, Nat.cast_zero]
 · simpa only [en,ec] using onsetOne_value1M253 ((n:ℤ)-7) ((c:ℤ)-5)
 · simpa only [en,ec] using onsetOne_value2M253 ((n:ℤ)-7) ((c:ℤ)-5)
 · simpa only [en,ec] using onsetOne_value3M253 ((n:ℤ)-7) ((c:ℤ)-5)
 · simpa only [en,ec] using onsetOne_value4M253 ((n:ℤ)-7) ((c:ℤ)-5)
 · simpa only [en,ec] using onsetOne_value5M253 ((n:ℤ)-7) ((c:ℤ)-5)
 · simpa only [en,ec] using onsetOne_value6M253 ((n:ℤ)-7) ((c:ℤ)-5)
 · simpa only [en,ec] using onsetOne_value7M253 ((n:ℤ)-7) ((c:ℤ)-5)

theorem onsetOne_lcM253 (N C : ℤ) (hN : 0≤N) (hC : 0≤C)
 (k : ℕ) (hk : 1≤k) (hku : k≤5) :
 onsetOneValueM253 N C k*onsetOneValueM253 N C (k+2) ≤
 onsetOneValueM253 N C (k+1)^2 := by
 interval_cases k
 · exact onsetOne_lc1M253 N C hN hC
 · exact onsetOne_lc2M253 N C hN hC
 · exact onsetOne_lc3M253 N C hN hC
 · exact onsetOne_lc4M253 N C hN hC
 · exact onsetOne_lc5M253 N C hN hC

theorem secondOnset_one_lcM253 (n c k : ℕ) (hn : 7≤n) (hc : 5≤c)
 (hk : 1≤k) (hku : k≤5) :
 secondOnsetValueM5DC n c 1 k*secondOnsetValueM5DC n c 1 (k+2) ≤
 secondOnsetValueM5DC n c 1 (k+1)^2 := by
 rw [onsetOne_valueM253 n c k hc hk (by omega),
   onsetOne_valueM253 n c (k+2) hc (by omega) (by omega),
   onsetOne_valueM253 n c (k+1) hc (by omega) (by omega)]
 exact onsetOne_lcM253 _ _ (by omega) (by omega) k hk hku

theorem source_fourth_onset_oneM253 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=1)
 (i j : ℕ) (hj : 2*n<j) (hju : j≤2*n+5)
 (hs : i+j+2=(frame (List.replicate n true++false::rest)).mid.a+4) :
 coeff (frame (List.replicate n true++false::rest)).mid.p i (j+2)*
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+2) j ≤
 coeff (frame (List.replicate n true++false::rest)).mid.p (i+1) (j+1)^2 := by
 let k := j-2*n
 have hk : 1≤k := by dsimp [k]; omega
 have hku : k≤5 := by dsimp [k]; omega
 have ej : 2*n+k=j := by dsimp [k]; omega
 have ej1 : 2*n+(k+1)=j+1 := by omega
 have ej2 : 2*n+(k+2)=j+2 := by omega
 have h0 := source_fourth_second_onset_valueM5DC n rest hn hc (i+2) k hk (by omega) (by omega)
 have h1 := source_fourth_second_onset_valueM5DC n rest hn hc (i+1) (k+1) (by omega) (by omega) (by omega)
 have h2 := source_fourth_second_onset_valueM5DC n rest hn hc i (k+2) (by omega) (by omega) (by omega)
 rw [ej,hr] at h0
 rw [ej1,hr] at h1
 rw [ej2,hr] at h2
 have h := secondOnset_one_lcM253 n (frame rest).mid.b k hn hc hk hku
 rw [←h0,←h1,←h2] at h
 nlinarith only [h]

theorem run_fourth_oneM253 (n : ℕ) (rest : List Bool)
 (hn : 7≤n) (hc : 5≤(frame rest).mid.b) (hr : (frame rest).mid.a=1) :
 RunFourthLCM94 n rest := by
 apply (run_fourth_iff_five_oneM5DC n rest hn hc hr).mpr
 intro i j _ _ _ hs hj hju
 exact source_fourth_onset_oneM253 n rest hn hc hr i j hj hju hs
end
end MathGKM.Markov
