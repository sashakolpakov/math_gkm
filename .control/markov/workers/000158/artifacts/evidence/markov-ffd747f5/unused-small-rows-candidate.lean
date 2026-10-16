import MarkovLowerShapeME9C
import MarkovHorizontalB46
/-! Machine-authored ffd747f5. Exact small source rows, checked by ring algebra. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 10000
theorem fifth_small_poly1FMFFD : Bivariate.swap (frame [true,false]).mid.p=
 C (1*X^3+4*X^4+6*X^5+4*X^6+1*X^7)*X^0 +
 C (8*X^3+23*X^4+22*X^5+7*X^6)*X^1 +
 C (4*X^2+34*X^3+50*X^4+21*X^5)*X^2 +
 C (24*X^2+60*X^3+35*X^4)*X^3 +
 C (8*X^1+40*X^2+35*X^3)*X^4 +
 C (1*X^0+14*X^1+21*X^2)*X^5 +
 C (2*X^0+7*X^1)*X^6 +
 C (1*X^0)*X^7 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row1FMFFD (i : ℕ) : threeRawM9E2 1 false i 5=(1*X^0+14*X^1+21*X^2:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 0 false]
 change coeff (frame [true,false]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly1FMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem fifth_small_poly1TMFFD : Bivariate.swap (frame [true,true]).mid.p=
 C (1*X^3+3*X^4+3*X^5+1*X^6)*X^0 +
 C (8*X^3+14*X^4+6*X^5)*X^1 +
 C (8*X^2+26*X^3+15*X^4)*X^2 +
 C (4*X^1+24*X^2+20*X^3)*X^3 +
 C (1*X^0+11*X^1+15*X^2)*X^4 +
 C (2*X^0+6*X^1)*X^5 +
 C (1*X^0)*X^6 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row1TMFFD (i : ℕ) : threeRawM9E2 1 true i 5=(2*X^0+6*X^1:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 0 true]
 change coeff (frame [true,true]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly1TMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem fifth_small_poly2FMFFD : Bivariate.swap (frame [false,true,false]).mid.p=
 C (1*X^3+7*X^4+21*X^5+35*X^6+35*X^7+21*X^8+7*X^9+1*X^10)*X^0 +
 C (8*X^3+50*X^4+130*X^5+180*X^6+140*X^7+58*X^8+10*X^9)*X^1 +
 C (34*X^3+179*X^4+378*X^5+400*X^6+212*X^7+45*X^8)*X^2 +
 C (4*X^2+108*X^3+412*X^4+636*X^5+448*X^6+120*X^7)*X^3 +
 C (24*X^2+243*X^3+610*X^4+602*X^5+210*X^6)*X^4 +
 C (72*X^2+356*X^3+532*X^4+252*X^5)*X^5 +
 C (8*X^1+120*X^2+308*X^3+210*X^4)*X^6 +
 C (20*X^1+112*X^2+120*X^3)*X^7 +
 C (1*X^0+23*X^1+45*X^2)*X^8 +
 C (2*X^0+10*X^1)*X^9 +
 C (1*X^0)*X^10 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row2FMFFD (i : ℕ) : threeRawM9E2 2 false i 5=(72*X^2+356*X^3+532*X^4+252*X^5:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 1 false]
 change coeff (frame [false,true,false]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly2FMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem fifth_small_poly2TMFFD : Bivariate.swap (frame [false,true,true]).mid.p=
 C (1*X^3+6*X^4+15*X^5+20*X^6+15*X^7+6*X^8+1*X^9)*X^0 +
 C (8*X^3+41*X^4+84*X^5+86*X^6+44*X^7+9*X^8)*X^1 +
 C (34*X^3+136*X^4+206*X^5+140*X^6+36*X^7)*X^2 +
 C (8*X^2+104*X^3+265*X^4+252*X^5+84*X^6)*X^3 +
 C (36*X^2+195*X^3+280*X^4+126*X^5)*X^4 +
 C (4*X^1+80*X^2+196*X^3+126*X^4)*X^5 +
 C (16*X^1+84*X^2+84*X^3)*X^6 +
 C (1*X^0+20*X^1+36*X^2)*X^7 +
 C (2*X^0+9*X^1)*X^8 +
 C (1*X^0)*X^9 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row2TMFFD (i : ℕ) : threeRawM9E2 2 true i 5=(4*X^1+80*X^2+196*X^3+126*X^4:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 1 true]
 change coeff (frame [false,true,true]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly2TMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem fifth_small_poly3FMFFD : Bivariate.swap (frame [false,false,true,false]).mid.p=
 C (1*X^3+10*X^4+45*X^5+120*X^6+210*X^7+252*X^8+210*X^9+120*X^10+45*X^11+10*X^12+1*X^13)*X^0 +
 C (8*X^3+77*X^4+328*X^5+812*X^6+1288*X^7+1358*X^8+952*X^9+428*X^10+112*X^11+13*X^12)*X^1 +
 C (34*X^3+308*X^4+1212*X^5+2708*X^6+3760*X^7+3324*X^8+1828*X^9+572*X^10+78*X^11)*X^2 +
 C (104*X^3+853*X^4+2988*X^5+5788*X^6+6692*X^7+4617*X^8+1760*X^9+286*X^10)*X^3 +
 C (4*X^2+267*X^3+1816*X^4+5370*X^5+8540*X^6+7638*X^7+3630*X^8+715*X^9)*X^4 +
 C (24*X^2+572*X^3+3030*X^4+7140*X^5+8652*X^6+5280*X^7+1287*X^8)*X^5 +
 C (72*X^2+988*X^3+3892*X^4+6804*X^5+5544*X^6+1716*X^7)*X^6 +
 C (160*X^2+1324*X^3+3678*X^4+4224*X^5+1716*X^6)*X^7 +
 C (8*X^1+252*X^2+1317*X^3+2310*X^4+1287*X^5)*X^8 +
 C (20*X^1+288*X^2+880*X^3+715*X^4)*X^9 +
 C (32*X^1+220*X^2+286*X^3)*X^10 +
 C (1*X^0+32*X^1+78*X^2)*X^11 +
 C (2*X^0+13*X^1)*X^12 +
 C (1*X^0)*X^13 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row3FMFFD (i : ℕ) : threeRawM9E2 3 false i 5=(24*X^2+572*X^3+3030*X^4+7140*X^5+8652*X^6+5280*X^7+1287*X^8:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 2 false]
 change coeff (frame [false,false,true,false]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly3FMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem fifth_small_poly3TMFFD : Bivariate.swap (frame [false,false,true,true]).mid.p=
 C (1*X^3+9*X^4+36*X^5+84*X^6+126*X^7+126*X^8+84*X^9+36*X^10+9*X^11+1*X^12)*X^0 +
 C (8*X^3+68*X^4+252*X^5+532*X^6+700*X^7+588*X^8+308*X^9+92*X^10+12*X^11)*X^1 +
 C (34*X^3+265*X^4+881*X^5+1620*X^6+1780*X^7+1169*X^8+425*X^9+66*X^10)*X^2 +
 C (104*X^3+706*X^4+2004*X^5+3036*X^6+2584*X^7+1170*X^8+220*X^9)*X^3 +
 C (8*X^2+267*X^3+1406*X^4+3180*X^5+3668*X^6+2130*X^7+495*X^8)*X^4 +
 C (36*X^2+540*X^3+2084*X^4+3472*X^5+2688*X^6+792*X^7)*X^5 +
 C (96*X^2+828*X^3+2198*X^4+2394*X^5+924*X^6)*X^6 +
 C (4*X^1+180*X^2+904*X^3+1500*X^4+792*X^5)*X^7 +
 C (16*X^1+224*X^2+645*X^3+495*X^4)*X^8 +
 C (28*X^1+180*X^2+220*X^3)*X^9 +
 C (1*X^0+29*X^1+66*X^2)*X^10 +
 C (2*X^0+12*X^1)*X^11 +
 C (1*X^0)*X^12 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row3TMFFD (i : ℕ) : threeRawM9E2 3 true i 5=(36*X^2+540*X^3+2084*X^4+3472*X^5+2688*X^6+792*X^7:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 2 true]
 change coeff (frame [false,false,true,true]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly3TMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem fifth_small_poly4FMFFD : Bivariate.swap (frame [false,false,false,true,false]).mid.p=
 C (1*X^3+13*X^4+78*X^5+286*X^6+715*X^7+1287*X^8+1716*X^9+1716*X^10+1287*X^11+715*X^12+286*X^13+78*X^14+13*X^15+1*X^16)*X^0 +
 C (8*X^3+104*X^4+616*X^5+2200*X^6+5280*X^7+8976*X^8+11088*X^9+10032*X^10+6600*X^11+3080*X^12+968*X^13+184*X^14+16*X^15)*X^1 +
 C (34*X^3+437*X^4+2523*X^5+8652*X^6+19608*X^7+30870*X^8+34482*X^9+27348*X^10+15102*X^11+5533*X^12+1211*X^13+120*X^14)*X^2 +
 C (104*X^3+1294*X^4+7140*X^5+23044*X^6+48244*X^7+68544*X^8+67004*X^9+44540*X^10+19284*X^11+4914*X^12+560*X^13)*X^3 +
 C (259*X^3+3030*X^4+15576*X^5+46136*X^6+86780*X^7+107554*X^8+87900*X^9+45716*X^10+13741*X^11+1820*X^12)*X^4 +
 C (4*X^2+572*X^3+5940*X^4+27520*X^5+72540*X^6+118328*X^7+122112*X^8+77836*X^9+28028*X^10+4368*X^11)*X^5 +
 C (24*X^2+1132*X^3+9934*X^4+40062*X^5+90580*X^6+122220*X^7+97911*X^8+43043*X^9+8008*X^10)*X^6 +
 C (72*X^2+1964*X^3+14152*X^4+47888*X^5+88584*X^6+92136*X^7+50622*X^8+11440*X^9)*X^7 +
 C (160*X^2+2949*X^3+16939*X^4+45990*X^5+64878*X^6+45903*X^7+12870*X^8)*X^8 +
 C (300*X^2+3744*X^3+16600*X^4+33792*X^5+32032*X^6+11440*X^7)*X^9 +
 C (8*X^1+448*X^2+3926*X^3+12683*X^4+17017*X^5+8008*X^6)*X^10 +
 C (20*X^1+540*X^2+3268*X^3+6734*X^4+4368*X^5)*X^11 +
 C (32*X^1+528*X^2+1911*X^3+1820*X^4)*X^12 +
 C (44*X^1+364*X^2+560*X^3)*X^13 +
 C (1*X^0+41*X^1+120*X^2)*X^14 +
 C (2*X^0+16*X^1)*X^15 +
 C (1*X^0)*X^16 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row4FMFFD (i : ℕ) : threeRawM9E2 4 false i 5=(4*X^2+572*X^3+5940*X^4+27520*X^5+72540*X^6+118328*X^7+122112*X^8+77836*X^9+28028*X^10+4368*X^11:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 3 false]
 change coeff (frame [false,false,false,true,false]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly4FMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
theorem fifth_small_poly4TMFFD : Bivariate.swap (frame [false,false,false,true,true]).mid.p=
 C (1*X^3+12*X^4+66*X^5+220*X^6+495*X^7+792*X^8+924*X^9+792*X^10+495*X^11+220*X^12+66*X^13+12*X^14+1*X^15)*X^0 +
 C (8*X^3+95*X^4+510*X^5+1635*X^6+3480*X^7+5166*X^8+5460*X^9+4110*X^10+2160*X^11+755*X^12+158*X^13+15*X^14)*X^1 +
 C (34*X^3+394*X^4+2033*X^5+6160*X^6+12152*X^7+16324*X^8+15134*X^9+9568*X^10+3950*X^11+962*X^12+105*X^13)*X^2 +
 C (104*X^3+1147*X^4+5556*X^5+15528*X^6+27620*X^7+32454*X^8+25212*X^9+12496*X^10+3588*X^11+455*X^12)*X^3 +
 C (259*X^3+2624*X^4+11568*X^5+28904*X^6+44716*X^7+43848*X^8+26620*X^9+9152*X^10+1365*X^11)*X^4 +
 C (8*X^2+576*X^3+4970*X^4+19152*X^5+41146*X^6+52752*X^7+40227*X^8+16874*X^9+3003*X^10)*X^5 +
 C (36*X^2+1116*X^3+7860*X^4+25410*X^5+44688*X^6+44220*X^7+23166*X^8+5005*X^9)*X^6 +
 C (96*X^2+1844*X^3+10274*X^4+26568*X^5+35640*X^6+24024*X^7+6435*X^8)*X^7 +
 C (200*X^2+2549*X^3+10812*X^4+20922*X^5+18876*X^6+6435*X^7)*X^8 +
 C (4*X^1+336*X^2+2848*X^3+8745*X^4+11154*X^5+5005*X^6)*X^9 +
 C (16*X^1+432*X^2+2486*X^3+4862*X^4+3003*X^5)*X^10 +
 C (28*X^1+440*X^2+1508*X^3+1365*X^4)*X^11 +
 C (40*X^1+312*X^2+455*X^3)*X^12 +
 C (1*X^0+38*X^1+105*X^2)*X^13 +
 C (2*X^0+15*X^1)*X^14 +
 C (1*X^0)*X^15 := by
 simp only [frame,List.foldl_cons,List.foldl_nil,advance,initial,
   Bool.false_eq_true,if_false,if_true,S,U,V,map_add,map_mul,map_sub,map_pow,
   map_one,map_ofNat,Bivariate.swap_X,Bivariate.swap_Y]
 norm_num
 ring
theorem fifth_small_row4TMFFD (i : ℕ) : threeRawM9E2 4 true i 5=(8*X^2+576*X^3+4970*X^4+19152*X^5+41146*X^6+52752*X^7+40227*X^8+16874*X^9+3003*X^10:Polynomial ℤ).coeff i := by
 rw [←three_raw_formulaM9E2,←three_path_polynomialM9E2 3 true]
 change coeff (frame [false,false,false,true,true]).mid.p i 5=_
 rw [←swap_coeff46,fifth_small_poly4TMFFD]
 simp only [Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num
end
end MathGKM.Markov
