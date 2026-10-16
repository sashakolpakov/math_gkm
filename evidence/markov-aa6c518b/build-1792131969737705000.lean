import MathGKM.Markov
/-! Machine-authored aa6c518b. Exact bottom-strip gap certificates. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 6000000
def bottomTMAA6 (a k l : ℝ) : ℝ := (l-1)*(3*a-1)+k*(a+k+l)
def bottomJMAA6 (a k l s : ℝ) : ℝ :=
 4*s*(l-2)*(l-3)*(l-4)+(k+1)*((9*(a-1)^2+13*(a-1)+6)*(l-2)*(l-3)+
 (6*(a-1)^2+6*(a-1)*(k+l-1)+8*(a-1)+6*(k+l-1)+6)*k*(l-2)+
 (a+k+l)*(a+k+l-1)*k*(k-1))
def bottomGapMAA6 (a k l s : ℝ) : ℝ :=
 2*(k+1)*(k+l-2)*(k+l-3)*l*(bottomTMAA6 a k l)^2-
 (k+l)*(k+l-1)*(l-1)*bottomJMAA6 a k l s

theorem bottom_zeroLargeMAA6 (a k l t : ℝ) (ha : 0≤a) (hk : 0≤k) (hl : 0≤l) (ht : 0≤t) :
 0≤1*bottomGapMAA6 (a+1) (k+1) (l+3) 0 := by
 have he : 1*bottomGapMAA6 (a+1) (k+1) (l+3) 0=
    792+
    1884*l+
    1656*l^2+
    696*l^3+
    144*l^4+
    12*l^5+
    2832*k+
    5554*k*l+
    4056*k*l^2+
    1414*k*l^3+
    240*k*l^4+
    16*k*l^5+
    4198*k^2+
    6730*k^2*l+
    4006*k^2*l^2+
    1123*k^2*l^3+
    148*k^2*l^4+
    7*k^2*l^5+
    3358*k^3+
    4318*k^3*l+
    2032*k^3*l^2+
    435*k^3*l^3+
    40*k^3*l^4+
    1*k^3*l^5+
    1570*k^4+
    1567*k^4*l+
    554*k^4*l^2+
    82*k^4*l^3+
    4*k^4*l^4+
    430*k^5+
    315*k^5*l+
    76*k^5*l^2+
    6*k^5*l^3+
    64*k^6+
    31*k^6*l+
    4*k^6*l^2+
    4*k^7+
    1*k^7*l+
    1776*a+
    4336*a*l+
    3960*a*l^2+
    1750*a*l^3+
    384*a*l^4+
    34*a*l^5+
    5176*a*k+
    10108*a*k*l+
    7416*a*k*l^2+
    2595*a*k*l^3+
    440*a*k*l^4+
    29*a*k*l^5+
    5884*a*k^2+
    9128*a*k^2*l+
    5242*a*k^2*l^2+
    1384*a*k^2*l^3+
    164*a*k^2*l^4+
    6*a*k^2*l^5+
    3342*a*k^3+
    4027*a*k^3*l+
    1718*a*k^3*l^2+
    310*a*k^3*l^3+
    20*a*k^3*l^4+
    996*a*k^4+
    886*a*k^4*l+
    252*a*k^4*l^2+
    24*a*k^4*l^3+
    146*a*k^5+
    85*a*k^5*l+
    12*a*k^5*l^2+
    8*a*k^6+
    2*a*k^6*l+
    888*a^2+
    2132*a^2*l+
    1920*a^2*l^2+
    850*a^2*l^3+
    192*a^2*l^4+
    18*a^2*l^5+
    2040*a^2*k+
    3898*a^2*k*l+
    2744*a^2*k*l^2+
    905*a^2*k*l^3+
    144*a^2*k*l^4+
    9*a^2*k*l^5+
    1646*a^2*k^2+
    2434*a^2*k^2*l+
    1276*a^2*k^2*l^2+
    284*a^2*k^2*l^3+
    24*a^2*k^2*l^4+
    572*a^2*k^3+
    613*a^2*k^3*l+
    208*a^2*k^3*l^2+
    22*a^2*k^3*l^3+
    82*a^2*k^4+
    54*a^2*k^4*l+
    8*a^2*k^4*l^2+
    4*a^2*k^5+
    1*a^2*k^5*l := by
   unfold bottomGapMAA6 bottomTMAA6 bottomJMAA6
   ring
 rw [he]
 positivity

theorem bottom_smallTwoMAA6 (a k l t : ℝ) (ha : 0≤a) (hk : 0≤k) (hl : 0≤l) (ht : 0≤t) :
 0≤1*bottomGapMAA6 (a+1) (k+2) 2 0 := by
 have he : 1*bottomGapMAA6 (a+1) (k+2) 2 0=
    2016+
    6240*k+
    7862*k^2+
    5287*k^3+
    2064*k^4+
    470*k^5+
    58*k^6+
    3*k^7+
    2232*a+
    5826*a*k+
    5849*a*k^2+
    2945*a*k^3+
    793*a*k^4+
    109*a*k^5+
    6*a*k^6+
    528*a^2+
    1166*a^2*k+
    909*a^2*k^2+
    319*a^2*k^3+
    51*a^2*k^4+
    3*a^2*k^5 := by
   unfold bottomGapMAA6 bottomTMAA6 bottomJMAA6
   ring
 rw [he]
 positivity

theorem bottom_smallThreeMAA6 (a k l t : ℝ) (ha : 0≤a) (hk : 0≤k) (hl : 0≤l) (ht : 0≤t) :
 0≤1*bottomGapMAA6 (a+1) (k+1) 3 0 := by
 have he : 1*bottomGapMAA6 (a+1) (k+1) 3 0=
    792+
    2832*k+
    4198*k^2+
    3358*k^3+
    1570*k^4+
    430*k^5+
    64*k^6+
    4*k^7+
    1776*a+
    5176*a*k+
    5884*a*k^2+
    3342*a*k^3+
    996*a*k^4+
    146*a*k^5+
    8*a*k^6+
    888*a^2+
    2040*a^2*k+
    1646*a^2*k^2+
    572*a^2*k^3+
    82*a^2*k^4+
    4*a^2*k^5 := by
   unfold bottomGapMAA6 bottomTMAA6 bottomJMAA6
   ring
 rw [he]
 positivity

theorem bottom_smallFourMAA6 (a k l t : ℝ) (ha : 0≤a) (hk : 0≤k) (hl : 0≤l) (ht : 0≤t) :
 0≤1*bottomGapMAA6 (a+1) (k+1) 4 0 := by
 have he : 1*bottomGapMAA6 (a+1) (k+1) 4 0=
    5184+
    14112*k+
    16212*k^2+
    10184*k^3+
    3777*k^4+
    827*k^5+
    99*k^6+
    5*k^7+
    12240*a+
    25764*a*k+
    21808*a*k^2+
    9417*a*k^3+
    2158*a*k^4+
    243*a*k^5+
    10*a*k^6+
    6000*a^2+
    9740*a^2*k+
    5664*a^2*k^2+
    1415*a^2*k^3+
    144*a^2*k^4+
    5*a^2*k^5 := by
   unfold bottomGapMAA6 bottomTMAA6 bottomJMAA6
   ring
 rw [he]
 positivity

theorem bottom_highLargeMAA6 (a k l t : ℝ) (ha : 0≤a) (hk : 0≤k) (hl : 0≤l) (ht : 0≤t) :
 0≤4*bottomGapMAA6 ((k+l+7+t)/2) (k+1) (l+5) (2*t) := by
 have he : 4*bottomGapMAA6 ((k+l+7+t)/2) (k+1) (l+5) (2*t)=
    1134960+
    304800*t+
    23280*t^2+
    1669292*l+
    378440*l*t+
    27596*l*t^2+
    1043260*l^2+
    186696*l^2*t+
    13068*l^2*t^2+
    359850*l^3+
    46040*l^3*t+
    3106*l^3*t^2+
    74088*l^4+
    5780*l^4*t+
    372*l^4*t^2+
    9112*l^5+
    320*l^5*t+
    18*l^5*t^2+
    620*l^6+
    4*l^6*t+
    18*l^7+
    2115092*k+
    512120*k*t+
    30644*k*t^2+
    2749390*k*l+
    582588*k*l*t+
    31062*k*l*t^2+
    1500282*k*l^2+
    267972*k*l^2*t+
    12350*k*l^2*t^2+
    444925*k*l^3+
    63872*k*l^3*t+
    2417*k*l^3*t^2+
    77200*k*l^4+
    8386*k*l^4*t+
    234*k*l^4*t^2+
    7788*k*l^5+
    588*k*l^5*t+
    9*k*l^5*t^2+
    418*k*l^6+
    18*k*l^6*t+
    9*k*l^7+
    1625130*k^2+
    321252*k^2*t+
    14274*k^2*t^2+
    1818134*k^2*l+
    311076*k^2*l*t+
    11714*k^2*l*t^2+
    834646*k^2*l^2+
    118492*k^2*l^2*t+
    3556*k^2*l^2*t^2+
    201332*k^2*l^3+
    22258*k^2*l^3*t+
    476*k^2*l^3*t^2+
    26906*k^2*l^4+
    2076*k^2*l^4*t+
    24*k^2*l^4*t^2+
    1886*k^2*l^5+
    78*k^2*l^5*t+
    54*k^2*l^6+
    669302*k^3+
    98744*k^3*t+
    2806*k^3*t^2+
    623229*k^3*l+
    76648*k^3*l*t+
    1709*k^3*l*t^2+
    229484*k^3*l^2+
    22046*k^3*l^2*t+
    340*k^3*l^2*t^2+
    41816*k^3*l^3+
    2792*k^3*l^3*t+
    22*k^3*l^3*t^2+
    3774*k^3*l^4+
    132*k^3*l^4*t+
    135*k^3*l^5+
    160260*k^4+
    15768*k^4*t+
    222*k^4*t^2+
    118640*k^4*l+
    9086*k^4*l*t+
    86*k^4*l*t^2+
    32664*k^4*l^2+
    1724*k^4*l^2*t+
    8*k^4*l^2*t^2+
    3970*k^4*l^3+
    108*k^4*l^3*t+
    180*k^4*l^4+
    22400*k^5+
    1232*k^5*t+
    6*k^5*t^2+
    12284*k^5*l+
    460*k^5*l*t+
    1*k^5*l*t^2+
    2234*k^5*l^2+
    42*k^5*l^2*t+
    135*k^5*l^3+
    1698*k^6+
    36*k^6*t+
    606*k^6*l+
    6*k^6*l*t+
    54*k^6*l^2+
    54*k^7+
    9*k^7*l := by
   unfold bottomGapMAA6 bottomTMAA6 bottomJMAA6
   ring
 rw [he]
 positivity

end
end MathGKM.Markov
