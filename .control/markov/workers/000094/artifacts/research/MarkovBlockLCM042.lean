import MarkovBlockLChartM042
import MarkovBlockAChartM042
import MarkovBlockBChartM042
import MarkovBlockDChartM042
/-! Machine-authored 04290504. All parameter charts for the first shifted block. -/
namespace MathGKM.Markov
noncomputable section
def blockValueM042 (n c r k : ℤ) : ℤ :=
 fourthShapeK0B c (n*c+r) (n+k)+shiftShapeCC n c r k

theorem blockValue_logConcaveM042 (n c r k : ℤ) (hc : 5≤c) (hr : 1≤r)
 (hrc : r<c) (hk : 5≤k) (hkn : k≤n) :
 blockValueM042 n c r k*blockValueM042 n c r (k+2)≤
 blockValueM042 n c r (k+1)^2 := by
 have en : k-5+(n-k)+5=n := by ring
 have ek : k-5+5=k := by ring
 have ek1 : k-5+6=k+1 := by ring
 have ek2 : k-5+7=k+2 := by ring
 have e0 : 2*(k-5)+(n-k)+10=n+k := by ring
 have e1 : 2*(k-5)+(n-k)+11=n+(k+1) := by ring
 have e2 : 2*(k-5)+(n-k)+12=n+(k+2) := by ring
 unfold blockValueM042
 by_cases hh : 4≤r
 · have h := blockLChartM042 (c-r-1) (r-4) (k-5) (n-k)
     (by omega) (by omega) (by omega) (by omega)
   have ec : r-4+(c-r-1)+5=c := by ring
   have er : r-4+4=r := by ring
   rw [en,ek,ek1,ek2,ec,er,e0,e1,e2] at h
   exact sub_nonneg.mp h
 · have hh : r=3 ∨ r=2 ∨ r=1 := by omega
   have ec : c-5+5=c := by ring
   rcases hh with rfl|rfl|rfl
   · have h := blockAChartM042 (c-5) 0 (k-5) (n-k)
       (by omega) (by omega) (by omega) (by omega)
     rw [en,ek,ek1,ek2,ec,e0,e1,e2] at h
     exact sub_nonneg.mp h
   · have h := blockBChartM042 (c-5) 0 (k-5) (n-k)
       (by omega) (by omega) (by omega) (by omega)
     rw [en,ek,ek1,ek2,ec,e0,e1,e2] at h
     exact sub_nonneg.mp h
   · have h := blockDChartM042 (c-5) 0 (k-5) (n-k)
       (by omega) (by omega) (by omega) (by omega)
     rw [en,ek,ek1,ek2,ec,e0,e1,e2] at h
     exact sub_nonneg.mp h
end
end MathGKM.Markov
