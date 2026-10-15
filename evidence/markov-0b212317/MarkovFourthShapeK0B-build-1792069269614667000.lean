import MarkovFourthLowK0B
import MarkovConvK0B
/-! Machine-authored request 0b212317. Exact algebraic candidate checked separately. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fourthShapeK0B (C H J : ℤ) : ℤ :=
 -22176000*H + 29030400*H*J + -17149440*H*J^2 + 5806080*H*J^3 + -1263360*H*J^4 + 161280*H*J^5 + -13440*H*J^6 + -14515200*H^2 + 17149440*H^2*J + -8709120*H^2*J^2 + 2526720*H^2*J^3 + -403200*H^2*J^4 + 40320*H^2*J^5 + -3225600*H^3 + 3386880*H^3*J + -1491840*H^3*J^2 + 322560*H^3*J^3 + -40320*H^3*J^4 + -241920*H^4 + 228480*H^4*J + -80640*H^4*J^2 + 13440*H^4*J^3 + -70076160*C + 104003904*C*J + -69729408*C*J^2 + 27703872*C*J^3 + -7109760*C*J^4 + 1228416*C*J^5 + -131712*C*J^6 + 8928*C*J^7 + -52184160*C*H + 71898624*C*H*J + -43377152*C*H*J^2 + 15052800*C*H*J^3 + -3241280*C*H*J^4 + 422016*C*H*J^5 + -31808*C*H*J^6 + -12458880*C*H^2 + 15890112*C*H^2*J + -8648640*C*H^2*J^2 + 2520000*C*H^2*J^3 + -423360*C*H^2*J^4 + 36288*C*H^2*J^5 + -967680*C*H^3 + 1155840*C*H^3*J + -551040*C*H^3*J^2 + 134400*C*H^3*J^3 + -13440*C*H^3*J^4 + -29216880*C^2 + 47929632*C^2*J + -34513472*C^2*J^2 + 14354144*C^2*J^3 + -3829280*C^2*J^4 + 656768*C^2*J^5 + -72128*C^2*J^6 + 4016*C^2*J^7 + -11309760*C^2*H + 17728704*C^2*H*J + -11946816*C^2*H*J^2 + 4455360*C^2*H*J^3 + -987840*C^2*H*J^4 + 133056*C^2*H*J^5 + -8064*C^2*H*J^6 + -1088640*C^2*H^2 + 1649088*C^2*H^2*J + -1028160*C^2*H^2*J^2 + 342720*C^2*H^2*J^3 + -60480*C^2*H^2*J^4 + 4032*C^2*H^2*J^5 + -2288160*C^3 + 4593984*C^3*J + -3940608*C^3*J^2 + 1888320*C^3*J^3 + -544320*C^3*J^4 + 99456*C^3*J^5 + -10752*C^3*J^6 + 480*C^3*J^7 + -372960*C^3*H + 743232*C^3*H*J + -613312*C^3*H*J^2 + 275520*C^3*H*J^3 + -71680*C^3*H*J^4 + 9408*C^3*H*J^5 + -448*C^3*H*J^6 + -25200*C^4 + 75360*C^4*J + -89152*C^4*J^2 + 56224*C^4*J^3 + -21280*C^4*J^4 + 4480*C^4*J^5 + -448*C^4*J^6 + 16*C^4*J^7

theorem fourthShape_fallingK0B (c h j : ℤ) :
 16*fourthShapeK0B c h j=fourthLow0K0B c h*fallingSevenK0B (j+7-0) + fourthLow1K0B c h*fallingSevenK0B (j+7-1) + fourthLow2K0B c h*fallingSevenK0B (j+7-2) + fourthLow3K0B c h*fallingSevenK0B (j+7-3) + fourthLow4K0B c h*fallingSevenK0B (j+7-4) + fourthLow5K0B c h*fallingSevenK0B (j+7-5) + fourthLow6K0B c h*fallingSevenK0B (j+7-6) + fourthLow7K0B c h*fallingSevenK0B (j+7-7) + fourthLow8K0B c h*fallingSevenK0B (j+7-8) + fourthLow9K0B c h*fallingSevenK0B (j+7-9) + fourthLow10K0B c h*fallingSevenK0B (j+7-10) + fourthLow11K0B c h*fallingSevenK0B (j+7-11) + fourthLow12K0B c h*fallingSevenK0B (j+7-12) := by
 unfold fourthShapeK0B fallingSevenK0B fourthLow0K0B fourthLow1K0B fourthLow2K0B fourthLow3K0B fourthLow4K0B fourthLow5K0B fourthLow6K0B fourthLow7K0B fourthLow8K0B fourthLow9K0B fourthLow10K0B fourthLow11K0B fourthLow12K0B
 ring

theorem fourthLow_CK0B (c h : ℤ) :
 fourthLowPolyK0B (C c) (C h) (X:ℤ[X])=C (fourthLow0K0B c h)*X^0 + C (fourthLow1K0B c h)*X^1 + C (fourthLow2K0B c h)*X^2 + C (fourthLow3K0B c h)*X^3 + C (fourthLow4K0B c h)*X^4 + C (fourthLow5K0B c h)*X^5 + C (fourthLow6K0B c h)*X^6 + C (fourthLow7K0B c h)*X^7 + C (fourthLow8K0B c h)*X^8 + C (fourthLow9K0B c h)*X^9 + C (fourthLow10K0B c h)*X^10 + C (fourthLow11K0B c h)*X^11 + C (fourthLow12K0B c h)*X^12 := by
 simp only [fourthLowPolyK0B,fourthLow0K0B,fourthLow1K0B,fourthLow2K0B,fourthLow3K0B,fourthLow4K0B,fourthLow5K0B,fourthLow6K0B,fourthLow7K0B,fourthLow8K0B,fourthLow9K0B,fourthLow10K0B,fourthLow11K0B,fourthLow12K0B,map_add,map_sub,map_mul,map_pow,map_ofNat,map_one,map_neg]

theorem fourthLow_convolutionK0B (c h : ℤ) (j : ℕ) :
 convSevenK0B (fourthLowPolyK0B (C c) (C h) X) j=fourthLow0K0B c h*chooseShiftSevenK0B j 0 + fourthLow1K0B c h*chooseShiftSevenK0B j 1 + fourthLow2K0B c h*chooseShiftSevenK0B j 2 + fourthLow3K0B c h*chooseShiftSevenK0B j 3 + fourthLow4K0B c h*chooseShiftSevenK0B j 4 + fourthLow5K0B c h*chooseShiftSevenK0B j 5 + fourthLow6K0B c h*chooseShiftSevenK0B j 6 + fourthLow7K0B c h*chooseShiftSevenK0B j 7 + fourthLow8K0B c h*chooseShiftSevenK0B j 8 + fourthLow9K0B c h*chooseShiftSevenK0B j 9 + fourthLow10K0B c h*chooseShiftSevenK0B j 10 + fourthLow11K0B c h*chooseShiftSevenK0B j 11 + fourthLow12K0B c h*chooseShiftSevenK0B j 12 := by
 rw [fourthLow_CK0B]
 simp only [convSeven_addK0B,convSeven_monomialK0B]

theorem fourthShape_convolutionK0B (c h : ℤ) (j : ℕ) (hj : 5≤j) :
 315*convSevenK0B (fourthLowPolyK0B (C c) (C h) X) j=fourthShapeK0B c h j := by
 rw [fourthLow_convolutionK0B]
 have hs := fourthShape_fallingK0B c h j
 have h0 := chooseShiftSeven_fallingK0B j 0 (by omega)
 norm_num only [Nat.cast_ofNat] at h0
 have h1 := chooseShiftSeven_fallingK0B j 1 (by omega)
 norm_num only [Nat.cast_ofNat] at h1
 have h2 := chooseShiftSeven_fallingK0B j 2 (by omega)
 norm_num only [Nat.cast_ofNat] at h2
 have h3 := chooseShiftSeven_fallingK0B j 3 (by omega)
 norm_num only [Nat.cast_ofNat] at h3
 have h4 := chooseShiftSeven_fallingK0B j 4 (by omega)
 norm_num only [Nat.cast_ofNat] at h4
 have h5 := chooseShiftSeven_fallingK0B j 5 (by omega)
 norm_num only [Nat.cast_ofNat] at h5
 have h6 := chooseShiftSeven_fallingK0B j 6 (by omega)
 norm_num only [Nat.cast_ofNat] at h6
 have h7 := chooseShiftSeven_fallingK0B j 7 (by omega)
 norm_num only [Nat.cast_ofNat] at h7
 have h8 := chooseShiftSeven_fallingK0B j 8 (by omega)
 norm_num only [Nat.cast_ofNat] at h8
 have h9 := chooseShiftSeven_fallingK0B j 9 (by omega)
 norm_num only [Nat.cast_ofNat] at h9
 have h10 := chooseShiftSeven_fallingK0B j 10 (by omega)
 norm_num only [Nat.cast_ofNat] at h10
 have h11 := chooseShiftSeven_fallingK0B j 11 (by omega)
 norm_num only [Nat.cast_ofNat] at h11
 have h12 := chooseShiftSeven_fallingK0B j 12 (by omega)
 norm_num only [Nat.cast_ofNat] at h12
 linear_combination (hs + (fourthLow0K0B c h)*h0 + (fourthLow1K0B c h)*h1 + (fourthLow2K0B c h)*h2 + (fourthLow3K0B c h)*h3 + (fourthLow4K0B c h)*h4 + (fourthLow5K0B c h)*h5 + (fourthLow6K0B c h)*h6 + (fourthLow7K0B c h)*h7 + (fourthLow8K0B c h)*h8 + (fourthLow9K0B c h)*h9 + (fourthLow10K0B c h)*h10 + (fourthLow11K0B c h)*h11 + (fourthLow12K0B c h)*h12) / 16

theorem source_fourth_shapeK0B (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) (i j : ℕ)
 (hs : i+j=(frame (List.replicate n true++false::rest)).mid.a+4)
 (hj : 5≤j) (hn : j<n) :
 7560*coeff (frame (List.replicate n true++false::rest)).mid.p i j =
 fourthShapeK0B (frame rest).mid.b ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) j := by
 have he := source_fourth_initial_binomialK0B n rest hc i j hs hn
 have ht := fourthShape_convolutionK0B ((frame rest).mid.b:ℤ)
   ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a) j hj
 have hp : fourthNumeratorBC (n:ℤ[X]) 0 X (frame rest).mid.b (frame rest).mid.a =
     fourthLowPolyK0B (C ((frame rest).mid.b:ℤ))
       (C ((n:ℤ)*(frame rest).mid.b+(frame rest).mid.a)) X := by
   rw [fourthNumerator_zeroK0B]
   simp only [map_add,map_mul,map_natCast]
 rw [hp] at he
 change 24*coeff _ i j=convSevenK0B _ j at he
 linear_combination 315*he+ht
end
end MathGKM.Markov
