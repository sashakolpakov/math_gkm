import MarkovOnsetLFinal1M96
import MarkovOnsetA1M96
import MarkovOnsetB1M96
import MarkovOnsetD1M96
import MarkovOnsetLFinal2M96
import MarkovOnsetA2M96
import MarkovOnsetB2M96
import MarkovOnsetD2M96
import MarkovOnsetLFinal3M96
import MarkovOnsetA3M96
import MarkovOnsetB3M96
import MarkovOnsetD3M96
import MarkovOnsetLFinal4M96
import MarkovOnsetA4M96
import MarkovOnsetB4M96
import MarkovOnsetD4M96
import MarkovOnsetValue1M96
import MarkovOnsetValue2M96
import MarkovOnsetValue3M96
import MarkovOnsetValue4M96
import MarkovOnsetValue5M96
import MarkovOnsetValue6M96
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000

theorem onset_lc1M96 (n c r : ℤ) (hn : 4≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) :
 onsetValue1M96 n c r*onsetValue3M96 n c r≤onsetValue2M96 n c r^2 := by
 by_cases hh : 4≤r
 · have h := onsetL1M96 (n-4) (c-r-1) (r-4) (by omega) (by omega) (by omega)
   have en : n-4+4=n := by ring
   have ec : r-4+(c-r-1)+5=c := by ring
   have er : r-4+4=r := by ring
   rw [en,ec,er] at h
   exact sub_nonneg.mp h
 · have cases : r=3 ∨ r=2 ∨ r=1 := by omega
   rcases cases with h|h|h <;> subst r
   · have h := onsetA1M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetB1M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetD1M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h

theorem onset_lc2M96 (n c r : ℤ) (hn : 4≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) :
 onsetValue2M96 n c r*onsetValue4M96 n c r≤onsetValue3M96 n c r^2 := by
 by_cases hh : 4≤r
 · have h := onsetL2M96 (n-4) (c-r-1) (r-4) (by omega) (by omega) (by omega)
   have en : n-4+4=n := by ring
   have ec : r-4+(c-r-1)+5=c := by ring
   have er : r-4+4=r := by ring
   rw [en,ec,er] at h
   exact sub_nonneg.mp h
 · have cases : r=3 ∨ r=2 ∨ r=1 := by omega
   rcases cases with h|h|h <;> subst r
   · have h := onsetA2M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetB2M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetD2M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h

theorem onset_lc3M96 (n c r : ℤ) (hn : 4≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) :
 onsetValue3M96 n c r*onsetValue5M96 n c r≤onsetValue4M96 n c r^2 := by
 by_cases hh : 4≤r
 · have h := onsetL3M96 (n-4) (c-r-1) (r-4) (by omega) (by omega) (by omega)
   have en : n-4+4=n := by ring
   have ec : r-4+(c-r-1)+5=c := by ring
   have er : r-4+4=r := by ring
   rw [en,ec,er] at h
   exact sub_nonneg.mp h
 · have cases : r=3 ∨ r=2 ∨ r=1 := by omega
   rcases cases with h|h|h <;> subst r
   · have h := onsetA3M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetB3M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetD3M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h

theorem onset_lc4M96 (n c r : ℤ) (hn : 4≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) :
 onsetValue4M96 n c r*onsetValue6M96 n c r≤onsetValue5M96 n c r^2 := by
 by_cases hh : 4≤r
 · have h := onsetL4M96 (n-4) (c-r-1) (r-4) (by omega) (by omega) (by omega)
   have en : n-4+4=n := by ring
   have ec : r-4+(c-r-1)+5=c := by ring
   have er : r-4+4=r := by ring
   rw [en,ec,er] at h
   exact sub_nonneg.mp h
 · have cases : r=3 ∨ r=2 ∨ r=1 := by omega
   rcases cases with h|h|h <;> subst r
   · have h := onsetA4M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetB4M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h
   · have h := onsetD4M96 (n-4) (c-5) 0 (by omega) (by omega) (by omega)
     have en : n-4+4=n := by ring
     have ec : c-5+5=c := by ring
     rw [en,ec] at h
     exact sub_nonneg.mp h

theorem onset_early_lcM96 (n c r : ℤ) (k : ℕ) (hn : 4≤n) (hc : 5≤c)
 (hr : 1≤r) (hrc : r<c) (hk : 1≤k) (hk4 : k≤4) :
 earlyBlockValueM042 n c r k*earlyBlockValueM042 n c r (k+2)≤
 earlyBlockValueM042 n c r (k+1)^2 := by
 interval_cases k
 · norm_num only [Nat.reduceAdd]
   rw [onset_value1M96,onset_value2M96,onset_value3M96]
   exact onset_lc1M96 n c r hn hc hr hrc
 · norm_num only [Nat.reduceAdd]
   rw [onset_value2M96,onset_value3M96,onset_value4M96]
   exact onset_lc2M96 n c r hn hc hr hrc
 · norm_num only [Nat.reduceAdd]
   rw [onset_value3M96,onset_value4M96,onset_value5M96]
   exact onset_lc3M96 n c r hn hc hr hrc
 · norm_num only [Nat.reduceAdd]
   rw [onset_value4M96,onset_value5M96,onset_value6M96]
   exact onset_lc4M96 n c r hn hc hr hrc
end
end MathGKM.Markov
