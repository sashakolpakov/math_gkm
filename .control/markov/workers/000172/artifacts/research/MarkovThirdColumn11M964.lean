import MarkovThirdColumnsBaseM964
/-! Machine-authored 9647c1ba. Exact third-correction column certificate.
External arithmetic proposes coefficients; Lean ring checks the identity. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 18000000
set_option maxRecDepth 8192
attribute [local irreducible] threeRawM9E2

def thirdColumn11M964 (x : ℚ) (r : Bool) : ℚ :=
 if r then (1813968+x*((19969674463/2310)+x*((150781409766819409/8147739600)+x*((486927650675217543329/20532303792000)+x*((77345078232005579/3783780000)+x*((1402332819322481000407/111152321280000)+x*((77704183200625829/13412044800)+x*((434414120518015831/213983078400)+x*((2653249354085736683/4803701760000)+x*((778414044455202066893/6590678814720000)+x*((38663815594332637/1931334451200)+x*((967272716224499/357654528000)+x*((14098014814985279/48283361280000)+x*((3648172306901011/144850083840000)+x*((65128071443807/37661021798400)+x*((123605404966429/1318135762944000)+x*((1243245154951/313841848320000)+x*((606508043/4755179520000)+x*((99212321/32832685670400)+x*((317772547/6402373705728000)+x*((18057199/35777970708480000)+x*(10186763/4257578514309120000)))))))))))))))))))))) else (75582+x*((1547267199/3080)+x*((5832222519740629/4073869800)+x*((16150378533821603213/6844101264000)+x*((41612026569221/16336320)+x*((17846806040176073281/9262693440000)+x*((66313999233609109/62270208000)+x*((3469749085102966397/7846046208000)+x*((3310978762345671379/23538138624000)+x*((650621211096249569/18723519360000)+x*((4644533588577149/689762304000)+x*((9951854681223671/9656672256000)+x*((12324548430859/98537472000)+x*((64634541052373/5364817920000)+x*((86490739934029/94152554496000)+x*((72567603802387/1318135762944000)+x*((11477650193/4483454976000)+x*((28376824753/313841848320000)+x*((357135253/152437469184000)+x*((1628897/38802264883200)+x*((28259299/60822550204416000)+x*(10186763/4257578514309120000))))))))))))))))))))))
theorem source_third_column11M964 (d : ℕ) (r : Bool) :
 (threeRawM9E2 (thirdQM964 d r) r 11 (thirdJM964 d r):ℚ)=thirdColumn11M964 d r := by
 have h := source_third_polynomialM964 d 8 r
 norm_num only [Nat.reduceAdd,Nat.reduceSub,show (1:ℕ) ≤ 8 by omega,if_true] at h
 rw [h]
 unfold lowColumnMAE9
 simp only [sum_range_succ,sum_range_zero]
 norm_num only [Nat.reduceAdd,Nat.reduceSub,Nat.choose_zero_right,Nat.choose_self,
   Nat.choose_succ_succ,Nat.choose_zero_succ,Nat.cast_ofNat]
 cases r <;> simp only [sourceNME9C,thirdQM964,thirdJM964,thirdCM964,thirdLM964,thirdVM964,
   Bool.false_eq_true,if_false,if_true,Nat.cast_add,Nat.cast_mul,Nat.cast_ofNat,Nat.cast_one,
   thirdColumn11M964,binomial_poly_0M295,binomial_poly_1M295,binomial_poly_2M295,binomial_poly_3M295,binomial_poly_4M295,binomial_poly_5M295,binomial_poly_6M295,binomial_poly_7M295,binomial_poly_8M295,binomial_poly_9M295,binomial_poly_10M295,binomial_poly_11M295,binomial_poly_12M295,binomial_poly_13M295,binomial_poly_14M295,binomial_poly_15M295,binomial_poly_16M295,binomial_poly_17M295,binomial_poly_18M295,binomial_poly_19M295,binomial_poly_20M295,binomial_poly_21M295] <;> ring

end
end MathGKM.Markov
