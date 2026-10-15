import MarkovSecondOne07F1
import MarkovSecondTwo07F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem second_one_lc07F1 (n c j : ℤ) (hc : 2 ≤ c)
 (hj : n+5 ≤ j) (hn : j ≤ 2*n+1) :
 secondShape07F1 n c 1 (j-1)*secondShape07F1 n c 1 (j+1) ≤ (secondShape07F1 n c 1 j)^2 := by
 by_cases hh : c=2
 · subst c
   have h := second_Two_shift07F1 (j-n-5) (2*n+1-j) (by omega) (by omega)
   have h0 : j-n-5+(2*n+1-j)+4=n := by ring
   have h1 : 2*(j-n-5)+(2*n+1-j)+8=j-1 := by ring
   have h2 : 2*(j-n-5)+(2*n+1-j)+9=j := by ring
   have h3 : 2*(j-n-5)+(2*n+1-j)+10=j+1 := by ring
   simpa only [h0,h1,h2,h3] using h
 · have h := second_One_shift07F1 (j-n-5) (2*n+1-j) (c-3) (by omega) (by omega) (by omega)
   have h0 : j-n-5+(2*n+1-j)+4=n := by ring
   have h1 : 2*(j-n-5)+(2*n+1-j)+8=j-1 := by ring
   have h2 : 2*(j-n-5)+(2*n+1-j)+9=j := by ring
   have h3 : 2*(j-n-5)+(2*n+1-j)+10=j+1 := by ring
   have hc0 : c-3+3=c := by ring
   simpa only [h0,h1,h2,h3,hc0] using h
#print axioms second_one_lc07F1
end
end MathGKM.Markov
