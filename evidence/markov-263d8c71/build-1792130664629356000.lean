import MarkovRawPrefixM10D
import MarkovThirdAllMF8
/-! Machine-authored 263d8c71. Polygon-valid vertical failure in an enlarged
original-word family; excluded from every actual source numerator. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false

def clusteredWordM263 : List Bool := List.replicate 10 false++List.replicate 3 true
def clusteredPolyM263 : BiPoly := (rawPairM10D (expand80 clusteredWordM263)).2
theorem clustered_expansionM263 : clusteredPolyM263=
   C (1*X^13+2*X^14+1*X^15)*X^0+
   C (2*X^3+6*X^4+10*X^5+14*X^6+18*X^7+22*X^8+26*X^9+30*X^10+34*X^11+40*X^12+38*X^13+15*X^14)*X^1+
   C (6*X^2+38*X^3+102*X^4+186*X^5+278*X^6+366*X^7+438*X^8+482*X^9+486*X^10+440*X^11+312*X^12+105*X^13)*X^2+
   C (1*X^0+8*X^1+82*X^2+344*X^3+849*X^4+1536*X^5+2268*X^6+2872*X^7+3179*X^8+3064*X^9+2486*X^10+1508*X^11+455*X^12)*X^3+
   C (12*X^0+95*X^1+562*X^2+1901*X^3+4300*X^4+7362*X^5+10200*X^6+11772*X^7+11316*X^8+8745*X^9+4862*X^10+1365*X^11)*X^4+
   C (66*X^0+510*X^1+2369*X^2+6916*X^3+14202*X^4+22222*X^5+27580*X^6+27324*X^7+20922*X^8+11154*X^9+3003*X^10)*X^5+
   C (220*X^0+1635*X^1+6580*X^2+17010*X^3+31246*X^4+43120*X^5+45444*X^6+35640*X^7+18876*X^8+5005*X^9)*X^6+
   C (495*X^0+3480*X^1+12488*X^2+28588*X^3+45822*X^4+53256*X^5+44220*X^6+24024*X^7+6435*X^8)*X^7+
   C (792*X^0+5166*X^1+16492*X^2+32804*X^3+44064*X^4+40227*X^5+23166*X^6+6435*X^7)*X^8+
   C (924*X^0+5460*X^1+15182*X^2+25266*X^3+26620*X^4+16874*X^5+5005*X^6)*X^9+
   C (792*X^0+4110*X^1+9574*X^2+12496*X^3+9152*X^4+3003*X^5)*X^10+
   C (495*X^0+2160*X^1+3950*X^2+3588*X^3+1365*X^4)*X^11+
   C (220*X^0+755*X^1+962*X^2+455*X^3)*X^12+
   C (66*X^0+158*X^1+105*X^2)*X^13+
   C (12*X^0+15*X^1)*X^14+
   C (1*X^0)*X^15 := by
 simp only [clusteredPolyM263,clusteredWordM263,rawPairM10D,expand80,
   List.replicate_succ,List.replicate_zero,List.cons_append,List.nil_append,
   List.foldl_cons,List.foldl_nil,rawAtomicM10D,ite_true,Bool.false_eq_true,ite_false,
   U,V,map_add,map_mul,map_pow,map_ofNat,map_one,map_zero]
 ring

theorem clustered_tripleM263 : coeff clusteredPolyM263 3 0=1 ∧
 coeff clusteredPolyM263 3 1=8 ∧ coeff clusteredPolyM263 3 2=82 := by
 rw [clustered_expansionM263]
 simp only [coeff,Polynomial.coeff_add,Polynomial.coeff_C_mul_X_pow]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_ofNat_mul,Polynomial.coeff_X_pow]

theorem clustered_countsM263 : clusteredWordM263.length=13 ∧
 clusteredWordM263.count true=3 := by decide

theorem clustered_polygon_failureM263 :
 InPolygon 3 13 3 0 ∧ InPolygon 3 13 3 1 ∧ InPolygon 3 13 3 2 ∧
 coeff clusteredPolyM263 3 1^2 < coeff clusteredPolyM263 3 0*coeff clusteredPolyM263 3 2 := by
 obtain ⟨h0,h1,h2⟩ := clustered_tripleM263
 norm_num [InPolygon,h0,h1,h2]

theorem clustered_not_source_wordM263 (path : List Bool) :
 sourceWord28 path ≠ clusteredWordM263 := by
 intro he
 obtain ⟨ha,hb⟩ := source_word_counts28 path
 rw [he,clustered_countsM263.1] at hb
 rw [he,clustered_countsM263.2] at ha
 have h := source_take_floor3eda path 5 (by omega)
 rw [he,←ha,←hb] at h
 norm_num [clusteredWordM263] at h

theorem clustered_not_source_polynomialM263 (path : List Bool) :
 clusteredPolyM263 ≠ (frame path).mid.p := by
 intro he
 have h := vertical_third_allMF8 path 0
 rw [←he] at h
 obtain ⟨h0,h1,h2⟩ := clustered_tripleM263
 norm_num [h0,h1,h2] at h

end
end MathGKM.Markov
