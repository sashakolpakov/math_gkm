import MarkovSecondGap007F1
import MarkovSecondGap107F1
import MarkovSecondGap207F1
import MarkovSecondGap307F1
import MarkovSecondGap407F1
import MarkovSecondGap507F1
import MarkovSecondGap607F1
import MarkovSecondGap707F1
import MarkovSecondGap807F1
import MarkovSecondGap907F1
import MarkovSecondGap1007F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
theorem second_shift_lc07F1 (t s u v : ℤ)
 (ht : 0 ≤ t) (hs : 0 ≤ s) (hu : 0 ≤ u) (hv : 0 ≤ v) :
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+8)*
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+10) ≤
 (secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+9))^2 := by
 rw [second_expand_L07F1,second_expand_R07F1,second_expand_C07F1]
 have h0 := second_gap_0_nonneg07F1 t u v ht hu hv
 have h1 := second_gap_1_nonneg07F1 t u v ht hu hv
 have h2 := second_gap_2_nonneg07F1 t u v ht hu hv
 have h3 := second_gap_3_nonneg07F1 t u v ht hu hv
 have h4 := second_gap_4_nonneg07F1 t u v ht hu hv
 have h5 := second_gap_5_nonneg07F1 t u v ht hu hv
 have h6 := second_gap_6_nonneg07F1 t u v ht hu hv
 have h7 := second_gap_7_nonneg07F1 t u v ht hu hv
 have h8 := second_gap_8_nonneg07F1 t u v ht hu hv
 have h9 := second_gap_9_nonneg07F1 t u v ht hu hv
 have h10 := second_gap_10_nonneg07F1 t u v ht hu hv
 have he : ((secondC007F1 t u v)*s^0+(secondC107F1 t u v)*s^1+(secondC207F1 t u v)*s^2+(secondC307F1 t u v)*s^3+(secondC407F1 t u v)*s^4+(secondC507F1 t u v)*s^5)^2-((secondL007F1 t u v)*s^0+(secondL107F1 t u v)*s^1+(secondL207F1 t u v)*s^2+(secondL307F1 t u v)*s^3+(secondL407F1 t u v)*s^4+(secondL507F1 t u v)*s^5)*((secondR007F1 t u v)*s^0+(secondR107F1 t u v)*s^1+(secondR207F1 t u v)*s^2+(secondR307F1 t u v)*s^3+(secondR407F1 t u v)*s^4+(secondR507F1 t u v)*s^5)=(secondGap007F1 t u v)*s^0+(secondGap107F1 t u v)*s^1+(secondGap207F1 t u v)*s^2+(secondGap307F1 t u v)*s^3+(secondGap407F1 t u v)*s^4+(secondGap507F1 t u v)*s^5+(secondGap607F1 t u v)*s^6+(secondGap707F1 t u v)*s^7+(secondGap807F1 t u v)*s^8+(secondGap907F1 t u v)*s^9+(secondGap1007F1 t u v)*s^10 := by
   unfold secondGap007F1 secondGap107F1 secondGap207F1 secondGap307F1 secondGap407F1 secondGap507F1 secondGap607F1 secondGap707F1 secondGap807F1 secondGap907F1 secondGap1007F1
   ring
 have hp : 0 ≤ (secondGap007F1 t u v)*s^0+(secondGap107F1 t u v)*s^1+(secondGap207F1 t u v)*s^2+(secondGap307F1 t u v)*s^3+(secondGap407F1 t u v)*s^4+(secondGap507F1 t u v)*s^5+(secondGap607F1 t u v)*s^6+(secondGap707F1 t u v)*s^7+(secondGap807F1 t u v)*s^8+(secondGap907F1 t u v)*s^9+(secondGap1007F1 t u v)*s^10 := by positivity
 omega
theorem second_high_lc07F1 (n c r j : ℤ) (hr : 2 ≤ r) (hc : r+1 ≤ c)
 (hj : n+5 ≤ j) (hn : j ≤ 2*n+1) :
 secondShape07F1 n c r (j-1)*secondShape07F1 n c r (j+1) ≤ (secondShape07F1 n c r j)^2 := by
 have h := second_shift_lc07F1 (j-n-5) (2*n+1-j) (r-2) (c-r-1)
   (by omega) (by omega) (by omega) (by omega)
 have h0 : j-n-5+(2*n+1-j)+4=n := by ring
 have h1 : 2*(j-n-5)+(2*n+1-j)+8=j-1 := by ring
 have h2 : 2*(j-n-5)+(2*n+1-j)+9=j := by ring
 have h3 : 2*(j-n-5)+(2*n+1-j)+10=j+1 := by ring
 have hc0 : r-2+(c-r-1)+3=c := by ring
 have hr0 : r-2+2=r := by ring
 simpa only [h0,h1,h2,h3,hc0,hr0] using h
#print axioms second_high_lc07F1
end
end MathGKM.Markov
