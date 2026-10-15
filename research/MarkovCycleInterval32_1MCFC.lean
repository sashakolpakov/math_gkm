import MarkovSmallNumerator32MCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def cycleShape32_1MCFC (N x : ℤ) : ℤ := (((((((569088*N + ((-3282048)*x + 11211648))*N + ((8031744*x + (-55101312))*x + 105227136))*N + ((((-9717120)*x + 105154560)*x + (-409570560))*x + 571361280))*N + ((((6451200*x + (-96956160))*x + 586978560)*x + (-1674986880))*x + 1887766272))*N + ((((((-2419200)*x + 46771200)*x + (-388362240))*x + 1706382720)*x + (-3927131712))*x + 3762370752))*N + ((((((483840*x + (-11450880))*x + 121282560)*x + (-725128320))*x + 2553215616)*x + (-4979986368))*x + 4179328704))*N + ((((((((-40320)*x + 1128960)*x + (-14555520))*x + 110396160)*x + (-526176000))*x + 1563045120)*x + (-2662430400))*x + 1996081920))

theorem cycleShape32_1MCFC_value (n j : ℕ) (hn : 7≤n) (hl : 1*n+5≤j) (hu : j<(2)*n+4) :
 5040*smallValue32MCFC n (j)=16*cycleShape32_1MCFC n j := by
 have h0_0 := chooseShiftSeven_fallingK0B (j) (0*n+0) (by omega)
 push_cast at h0_0
 have h0_1 := chooseShiftSeven_fallingK0B (j) (0*n+1) (by omega)
 push_cast at h0_1
 have h0_2 := chooseShiftSeven_fallingK0B (j) (0*n+2) (by omega)
 push_cast at h0_2
 have h0_3 := chooseShiftSeven_fallingK0B (j) (0*n+3) (by omega)
 push_cast at h0_3
 have h0_4 := chooseShiftSeven_fallingK0B (j) (0*n+4) (by omega)
 push_cast at h0_4
 have h0_5 := chooseShiftSeven_fallingK0B (j) (0*n+5) (by omega)
 push_cast at h0_5
 have h0_6 := chooseShiftSeven_fallingK0B (j) (0*n+6) (by omega)
 push_cast at h0_6
 have h0_7 := chooseShiftSeven_fallingK0B (j) (0*n+7) (by omega)
 push_cast at h0_7
 have h0_8 := chooseShiftSeven_fallingK0B (j) (0*n+8) (by omega)
 push_cast at h0_8
 have h0_9 := chooseShiftSeven_fallingK0B (j) (0*n+9) (by omega)
 push_cast at h0_9
 have h0_10 := chooseShiftSeven_fallingK0B (j) (0*n+10) (by omega)
 push_cast at h0_10
 have h0_11 := chooseShiftSeven_fallingK0B (j) (0*n+11) (by omega)
 push_cast at h0_11
 have h0_12 := chooseShiftSeven_fallingK0B (j) (0*n+12) (by omega)
 push_cast at h0_12
 have h1_2 := chooseShiftSeven_fallingK0B (j) (1*n+2) (by omega)
 push_cast at h1_2
 have h1_3 := chooseShiftSeven_fallingK0B (j) (1*n+3) (by omega)
 push_cast at h1_3
 have h1_4 := chooseShiftSeven_fallingK0B (j) (1*n+4) (by omega)
 push_cast at h1_4
 have h1_5 := chooseShiftSeven_fallingK0B (j) (1*n+5) (by omega)
 push_cast at h1_5
 have h1_6 := chooseShiftSeven_fallingK0B (j) (1*n+6) (by omega)
 push_cast at h1_6
 have h1_7 := chooseShiftSeven_fallingK0B (j) (1*n+7) (by omega)
 push_cast at h1_7
 have h1_8 := chooseShiftSeven_fallingK0B (j) (1*n+8) (by omega)
 push_cast at h1_8
 have h1_9 := chooseShiftSeven_fallingK0B (j) (1*n+9) (by omega)
 push_cast at h1_9
 have h1_10 := chooseShiftSeven_fallingK0B (j) (1*n+10) (by omega)
 push_cast at h1_10
 have h1_11 := chooseShiftSeven_fallingK0B (j) (1*n+11) (by omega)
 push_cast at h1_11
 have h1_12 := chooseShiftSeven_fallingK0B (j) (1*n+12) (by omega)
 push_cast at h1_12
 have h2_4 : chooseShiftSevenK0B (j) (2*n+4)=0 := by
  exact if_neg (by omega)
 have h2_5 : chooseShiftSevenK0B (j) (2*n+5)=0 := by
  exact if_neg (by omega)
 have h2_6 : chooseShiftSevenK0B (j) (2*n+6)=0 := by
  exact if_neg (by omega)
 have h2_7 : chooseShiftSevenK0B (j) (2*n+7)=0 := by
  exact if_neg (by omega)
 have h2_8 : chooseShiftSevenK0B (j) (2*n+8)=0 := by
  exact if_neg (by omega)
 have h2_9 : chooseShiftSevenK0B (j) (2*n+9)=0 := by
  exact if_neg (by omega)
 have h2_10 : chooseShiftSevenK0B (j) (2*n+10)=0 := by
  exact if_neg (by omega)
 have h2_11 : chooseShiftSevenK0B (j) (2*n+11)=0 := by
  exact if_neg (by omega)
 have h2_12 : chooseShiftSevenK0B (j) (2*n+12)=0 := by
  exact if_neg (by omega)
 have h2_13 : chooseShiftSevenK0B (j) (2*n+13)=0 := by
  exact if_neg (by omega)
 have h3_5 : chooseShiftSevenK0B (j) (3*n+5)=0 := by
  exact if_neg (by omega)
 have h3_6 : chooseShiftSevenK0B (j) (3*n+6)=0 := by
  exact if_neg (by omega)
 have h3_7 : chooseShiftSevenK0B (j) (3*n+7)=0 := by
  exact if_neg (by omega)
 have h3_8 : chooseShiftSevenK0B (j) (3*n+8)=0 := by
  exact if_neg (by omega)
 have h3_9 : chooseShiftSevenK0B (j) (3*n+9)=0 := by
  exact if_neg (by omega)
 have h3_10 : chooseShiftSevenK0B (j) (3*n+10)=0 := by
  exact if_neg (by omega)
 have h3_11 : chooseShiftSevenK0B (j) (3*n+11)=0 := by
  exact if_neg (by omega)
 have h3_12 : chooseShiftSevenK0B (j) (3*n+12)=0 := by
  exact if_neg (by omega)
 have h3_13 : chooseShiftSevenK0B (j) (3*n+13)=0 := by
  exact if_neg (by omega)
 have h3_14 : chooseShiftSevenK0B (j) (3*n+14)=0 := by
  exact if_neg (by omega)
 unfold smallValue32MCFC
 rw [h2_4,h2_5,h2_6,h2_7,h2_8,h2_9,h2_10,h2_11,h2_12,h2_13,h3_5,h3_6,h3_7,h3_8,h3_9,h3_10,h3_11,h3_12,h3_13,h3_14]
 linear_combination (norm := skip) (smallTerm32_0_0MCFC (n:ℤ))*h0_0 + (smallTerm32_0_1MCFC (n:ℤ))*h0_1 + (smallTerm32_0_2MCFC (n:ℤ))*h0_2 + (smallTerm32_0_3MCFC (n:ℤ))*h0_3 + (smallTerm32_0_4MCFC (n:ℤ))*h0_4 + (smallTerm32_0_5MCFC (n:ℤ))*h0_5 + (smallTerm32_0_6MCFC (n:ℤ))*h0_6 + (smallTerm32_0_7MCFC (n:ℤ))*h0_7 + (smallTerm32_0_8MCFC (n:ℤ))*h0_8 + (smallTerm32_0_9MCFC (n:ℤ))*h0_9 + (smallTerm32_0_10MCFC (n:ℤ))*h0_10 + (smallTerm32_0_11MCFC (n:ℤ))*h0_11 + (smallTerm32_0_12MCFC (n:ℤ))*h0_12 + (smallTerm32_1_2MCFC (n:ℤ))*h1_2 + (smallTerm32_1_3MCFC (n:ℤ))*h1_3 + (smallTerm32_1_4MCFC (n:ℤ))*h1_4 + (smallTerm32_1_5MCFC (n:ℤ))*h1_5 + (smallTerm32_1_6MCFC (n:ℤ))*h1_6 + (smallTerm32_1_7MCFC (n:ℤ))*h1_7 + (smallTerm32_1_8MCFC (n:ℤ))*h1_8 + (smallTerm32_1_9MCFC (n:ℤ))*h1_9 + (smallTerm32_1_10MCFC (n:ℤ))*h1_10 + (smallTerm32_1_11MCFC (n:ℤ))*h1_11 + (smallTerm32_1_12MCFC (n:ℤ))*h1_12
 simp only [cycleShape32_1MCFC,fallingSevenK0B,smallTerm32_0_0MCFC,smallTerm32_0_1MCFC,smallTerm32_0_2MCFC,smallTerm32_0_3MCFC,smallTerm32_0_4MCFC,smallTerm32_0_5MCFC,smallTerm32_0_6MCFC,smallTerm32_0_7MCFC,smallTerm32_0_8MCFC,smallTerm32_0_9MCFC,smallTerm32_0_10MCFC,smallTerm32_0_11MCFC,smallTerm32_0_12MCFC,smallTerm32_1_2MCFC,smallTerm32_1_3MCFC,smallTerm32_1_4MCFC,smallTerm32_1_5MCFC,smallTerm32_1_6MCFC,smallTerm32_1_7MCFC,smallTerm32_1_8MCFC,smallTerm32_1_9MCFC,smallTerm32_1_10MCFC,smallTerm32_1_11MCFC,smallTerm32_1_12MCFC,smallTerm32_2_4MCFC,smallTerm32_2_5MCFC,smallTerm32_2_6MCFC,smallTerm32_2_7MCFC,smallTerm32_2_8MCFC,smallTerm32_2_9MCFC,smallTerm32_2_10MCFC,smallTerm32_2_11MCFC,smallTerm32_2_12MCFC,smallTerm32_2_13MCFC,smallTerm32_3_5MCFC,smallTerm32_3_6MCFC,smallTerm32_3_7MCFC,smallTerm32_3_8MCFC,smallTerm32_3_9MCFC,smallTerm32_3_10MCFC,smallTerm32_3_11MCFC,smallTerm32_3_12MCFC,smallTerm32_3_13MCFC,smallTerm32_3_14MCFC]
 push_cast
 ring

def cycleIntervalGap32_1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((31501467648*Z + (318934941696*x + 1785690095616))*Z + ((1317376327680*x + 15651129360384)*x + 44646980861952))*Z + (((3030495068160*x + 56497989058560)*x + 340597193932800)*x + 658135517921280))*Z + ((((4410437713920*x + 113625357189120)*x + 1072268665896960)*x + 4365900063866880)*x + 6416824880922624))*Z + (((((4303113486336*x + 143288945049600)*x + 1869514655662080)*x + 11903995225866240)*x + 36796769269972992)*x + 43830528461733888))*Z + ((((((2977766572032*x + 120906218668032)*x + 2028257094205440)*x + 17821078464430080)*x + 86023383414571008)*x + 215120441258311680)*x + 216116418051588096))*Z + (((((((1513296691200*x + 71702449717248)*x + 1459923283574784)*x + 16413578490839040)*x + 109004506671513600)*x + 424790561884372992)*x + 894154897616633856)*x + 778498585701580800))*Z + ((((((((568252661760*x + 30535521730560)*x + 723959960371200)*x + 9844686689402880)*x + 83316996774789120)*x + 445288192748421120)*x + 1457102896885923840)*x + 2652238322806947840)*x + 2040728500967804928))*Z + (((((((((152723128320*x + 9198131281920)*x + 247718214696960)*x + 3920886172385280)*x + 40054308300324864)*x + 271978583394631680)*x + 1217117895732264960)*x + 3435775078117294080)*x + 5514624951969595392)*x + 3805378044759760896))*Z + ((((((((((27367538688*x + 1844475494400)*x + 55870375034880)*x + 1007109445386240)*x + 11986702981005312)*x + 98181713401970688)*x + 557180259899719680)*x + 2146372490713006080)*x + 5331911437481287680)*x + 7659999136791945216)*x + 4795445123184586752))*Z + (((((((((((2898395136*x + 218048495616)*x + 7406823997440)*x + 150603305287680)*x + 2046928636182528)*x + 19566287006515200)*x + 133981521669144576)*x + 653937892795514880)*x + 2213733412977278976)*x + 4914819005092061184)*x + 6395937614355308544)*x + 3667136750133534720))*Z + ((((((((((((139345920*x + 11500683264)*x + 435090604032)*x + 9919695421440)*x + 152306855608320)*x + 1665885341417472)*x + 13333520048357376)*x + 78577787210711040)*x + 336941680828354560)*x + 1018600844655550464)*x + 2046462695663726592)*x + 2436337881915678720)*x + 1289518423209676800))

theorem cycleIntervalGap32_1MCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (cycleShape32_1MCFC (x+Z+4) (1*(x+Z+4)+5+x))*(cycleShape32_1MCFC (x+Z+4) (1*(x+Z+4)+7+x))≤(cycleShape32_1MCFC (x+Z+4) (1*(x+Z+4)+6+x))^2 := by
 apply sub_nonneg.mp
 have he : (cycleShape32_1MCFC (x+Z+4) (1*(x+Z+4)+6+x))^2-(cycleShape32_1MCFC (x+Z+4) (1*(x+Z+4)+5+x))*(cycleShape32_1MCFC (x+Z+4) (1*(x+Z+4)+7+x))=cycleIntervalGap32_1MCFCCert N Z x := by
  unfold cycleIntervalGap32_1MCFCCert cycleShape32_1MCFC
  ring
 rw [he]
 unfold cycleIntervalGap32_1MCFCCert
 positivity
end
end MathGKM.Markov
