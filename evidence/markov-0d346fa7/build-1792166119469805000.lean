import MarkovVerticalPolyM0D3
/-! Machine-authored 0d346fa7. Exact rational gap certificates. Python generated
the proposed identities; ordinary Lean ring normalization proves them. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000
set_option maxRecDepth 4096

def lowerGapFourM0D3 (x y : ℚ) : ℚ := (
   361065600 +
   1144886400 * y +
   1291852800 * y^2 +
   696729600 * y^3 +
   159667200 * y^4 +
   1482935040 * x +
   4191635520 * x * y +
   4184853120 * x * y^2 +
   1980357120 * x * y^3 +
   399651840 * x * y^4 +
   2760141384 * x^2 +
   6900372648 * x^2 * y +
   6054299712 * x^2 * y^2 +
   2485808640 * x^2 * y^3 +
   431484480 * x^2 * y^4 +
   3081811500 * x^3 +
   6752053200 * x^3 * y +
   5153115240 * x^3 * y^2 +
   1808194080 * x^3 * y^3 +
   262553760 * x^3 * y^4 +
   2301244970 * x^4 +
   4368546150 * x^4 * y +
   2858426820 * x^4 * y^2 +
   839658960 * x^4 * y^3 +
   98521920 * x^4 * y^4 +
   1211775645 * x^5 +
   1964024700 * x^5 * y +
   1079877960 * x^5 * y^2 +
   258007680 * x^5 * y^3 +
   23355360 * x^5 * y^4 +
   461749927 * x^6 +
   626481324 * x^6 * y +
   281400336 * x^6 * y^2 +
   52436160 * x^6 * y^3 +
   3417120 * x^6 * y^4 +
   128371230 * x^7 +
   141837120 * x^7 * y +
   49941360 * x^7 * y^2 +
   6793920 * x^7 * y^3 +
   282240 * x^7 * y^4 +
   25854150 * x^8 +
   22341150 * x^8 * y +
   5776380 * x^8 * y^2 +
   509040 * x^8 * y^3 +
   10080 * x^8 * y^4 +
   3679965 * x^9 +
   2331780 * x^9 * y +
   393120 * x^9 * y^2 +
   16800 * x^9 * y^3 +
   351439 * x^10 +
   145128 * x^10 * y +
   11952 * x^10 * y^2 +
   20220 * x^11 +
   4080 * x^11 * y +
   530 * x^12
  ) / 1814400

theorem lower_gap_fourM0D3 (x y : ℚ) :
 lowerPolynomialM0D3 4 (x+1) (y+1)^2 -
  lowerPolynomialM0D3 4 x (y+2)*lowerPolynomialM0D3 4 (x+2) y = lowerGapFourM0D3 x y := by
 unfold lowerGapFourM0D3
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring

theorem lower_gap_four_nonnegM0D3 (x y : ℚ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 0 ≤ lowerPolynomialM0D3 4 (x+1) (y+1)^2 -
  lowerPolynomialM0D3 4 x (y+2)*lowerPolynomialM0D3 4 (x+2) y := by
 rw [lower_gap_fourM0D3]
 unfold lowerGapFourM0D3
 positivity

def upperGapFourM0D3 (x y : ℚ) : ℚ := (
   1670844672000 +
   2907741110400 * y +
   2216914711200 * y^2 +
   967509547200 * y^3 +
   264451370400 * y^4 +
   46372838400 * y^5 +
   5096044800 * y^6 +
   320947200 * y^7 +
   8870400 * y^8 +
   4091236827840 * x +
   6828376288320 * x * y +
   4989416667600 * x * y^2 +
   2085807679680 * x * y^3 +
   545968460400 * x * y^4 +
   91684911360 * x * y^5 +
   9652272000 * x * y^6 +
   582758400 * x * y^7 +
   15456000 * x * y^8 +
   4340174414328 * x^2 +
   6856097427024 * x^2 * y +
   4728738171392 * x^2 * y^2 +
   1860835045680 * x^2 * y^3 +
   457241015120 * x^2 * y^4 +
   71889632640 * x^2 * y^5 +
   7068333440 * x^2 * y^6 +
   397689600 * x^2 * y^7 +
   9811200 * x^2 * y^8 +
   2645209045740 * x^3 +
   3893033995840 * x^3 * y +
   2486633381760 * x^3 * y^2 +
   899956392320 * x^3 * y^3 +
   201756844800 * x^3 * y^4 +
   28674320640 * x^3 * y^5 +
   2521209600 * x^3 * y^6 +
   125260800 * x^3 * y^7 +
   2688000 * x^3 * y^8 +
   1036559458670 * x^4 +
   1395811301340 * x^4 * y +
   806973034160 * x^4 * y^2 +
   260731914240 * x^4 * y^3 +
   51250508960 * x^4 * y^4 +
   6232195200 * x^4 * y^5 +
   452748800 * x^4 * y^6 +
   17606400 * x^4 * y^7 +
   268800 * x^4 * y^8 +
   276659908725 * x^5 +
   333956579640 * x^5 * y +
   170132627280 * x^5 * y^2 +
   47303215680 * x^5 * y^3 +
   7727966400 * x^5 * y^4 +
   738743040 * x^5 * y^5 +
   38035200 * x^5 * y^6 +
   806400 * x^5 * y^7 +
   51827188639 * x^6 +
   54741660792 * x^6 * y +
   23789078096 * x^6 * y^2 +
   5434084320 * x^6 * y^3 +
   686530880 * x^6 * y^4 +
   45346560 * x^6 * y^5 +
   1218560 * x^6 * y^6 +
   6892607070 * x^7 +
   6174743520 * x^7 * y +
   2189996640 * x^7 * y^2 +
   383815680 * x^7 * y^3 +
   33177600 * x^7 * y^4 +
   1128960 * x^7 * y^5 +
   648104250 * x^8 +
   471381660 * x^8 * y +
   127509840 * x^8 * y^2 +
   15186960 * x^8 * y^3 +
   671040 * x^8 * y^4 +
   42172485 * x^9 +
   23281640 * x^9 * y +
   4255920 * x^9 * y^2 +
   257440 * x^9 * y^3 +
   1809583 * x^10 +
   672384 * x^10 * y +
   62112 * x^10 * y^2 +
   46140 * x^11 +
   8640 * x^11 * y +
   530 * x^12
  ) / 1814400

theorem upper_gap_fourM0D3 (x y : ℚ) :
 upperPolynomialM0D3 4 (x+3) (y+2)^2 -
  upperPolynomialM0D3 4 (x+4) (y+1)*upperPolynomialM0D3 4 (x+2) (y+3) = upperGapFourM0D3 x y := by
 unfold upperGapFourM0D3
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring

theorem upper_gap_four_nonnegM0D3 (x y : ℚ) (hx : 0 ≤ x) (hy : 0 ≤ y) :
 0 ≤ upperPolynomialM0D3 4 (x+3) (y+2)^2 -
  upperPolynomialM0D3 4 (x+4) (y+1)*upperPolynomialM0D3 4 (x+2) (y+3) := by
 rw [upper_gap_fourM0D3]
 unfold upperGapFourM0D3
 positivity

def cross_oneGapFourM0D3 (x : ℚ) : ℚ := (
   17572464000 +
   54376755840 * x +
   75620616408 * x^2 +
   62566858860 * x^3 +
   34342692470 * x^4 +
   13190251845 * x^5 +
   3638896879 * x^6 +
   727296030 * x^7 +
   104621250 * x^8 +
   10573365 * x^9 +
   713263 * x^10 +
   28860 * x^11 +
   530 * x^12
  ) / 1814400

theorem cross_one_gap_fourM0D3 (x : ℚ) :
 lowerPolynomialM0D3 4 (x+3) 0^2 -
  lowerPolynomialM0D3 4 (x+2) 1*upperPolynomialM0D3 4 (x+2) 1 = cross_oneGapFourM0D3 x := by
 unfold cross_oneGapFourM0D3
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring

theorem cross_one_gap_four_nonnegM0D3 (x : ℚ) (hx : 0 ≤ x) :
 0 ≤ lowerPolynomialM0D3 4 (x+3) 0^2 -
  lowerPolynomialM0D3 4 (x+2) 1*upperPolynomialM0D3 4 (x+2) 1 := by
 rw [cross_one_gap_fourM0D3]
 unfold cross_oneGapFourM0D3
 positivity

def cross_twoGapFourM0D3 (x : ℚ) : ℚ := (
   235371225600 +
   629838046080 * x +
   744011950536 * x^2 +
   514333200300 * x^3 +
   232443002210 * x^4 +
   72559192845 * x^5 +
   16082924503 * x^6 +
   2556093150 * x^7 +
   289716510 * x^8 +
   22889325 * x^9 +
   1199311 * x^10 +
   37500 * x^11 +
   530 * x^12
  ) / 1814400

theorem cross_two_gap_fourM0D3 (x : ℚ) :
 upperPolynomialM0D3 4 (x+3) 1^2 -
  lowerPolynomialM0D3 4 (x+4) 0*upperPolynomialM0D3 4 (x+2) 2 = cross_twoGapFourM0D3 x := by
 unfold cross_twoGapFourM0D3
 norm_num [lowerPolynomialM0D3,upperPolynomialM0D3,Finset.sum_range_succ,
   choose_poly_succM0D3,choose_poly_zeroM0D3,Nat.choose]
 ring

theorem cross_two_gap_four_nonnegM0D3 (x : ℚ) (hx : 0 ≤ x) :
 0 ≤ upperPolynomialM0D3 4 (x+3) 1^2 -
  lowerPolynomialM0D3 4 (x+4) 0*upperPolynomialM0D3 4 (x+2) 2 := by
 rw [cross_two_gap_fourM0D3]
 unfold cross_twoGapFourM0D3
 positivity

end
end MathGKM.Markov
