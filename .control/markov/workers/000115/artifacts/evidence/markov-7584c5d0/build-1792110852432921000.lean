import MarkovVerticalValuesM758
/-! Machine-authored 7584c5d0. Exact piecewise cubic coefficients. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 8000000
set_option maxRecDepth 32768
set_option linter.unusedSimpArgs false
set_option linter.unusedVariables false

def vlowM758 (a r s q j : ℤ) : ℤ := 192*r*j-96*r*j^2-96*r^2+96*r^2*j-128*a*j+96*a*j^2-16*a*j^3+192*a*r-288*a*r*j+96*a*r*j^2-96*a^2+176*a^2*j-96*a^2*j^2+16*a^2*j^3

def vmidM758 (a r s q j : ℤ) : ℤ := -1056*r+576*r*j-96*r*j^2-1152*r*q+384*r*q*j-384*r*q^2+288*r^2-96*r^2*j+192*r^2*q+2544*a-2176*a*j+672*a*j^2-80*a*j^3+3296*a*q-2112*a*q*j+384*a*q*j^2+1536*a*q^2-576*a*q^2*j+256*a*q^3-576*a*r+480*a*r*j-96*a*r*j^2-384*a*r*q+192*a*r*q*j-48*a^2-128*a^2*j+96*a^2*j^2-16*a^2*j^3-320*a^2*q+96*a^2*q*j-288*a^2*q^2+96*a^2*q^2*j-64*a^2*q^3

def vbridgeM758 (a r s q j : ℤ) : ℤ := -48*r-96*r*q-96*r*q^2+48*r^2+96*r^2*q+64*a*q-16*a*q^3+48*a*r*q+96*a*r*q^2-16*a^2*q+16*a^2*q^3

def vtail2M758 (a r s q j : ℤ) : ℤ := 12-270*r+102*r^2+240*a-270*a*q+204*a*r*q-48*a^2+102*a^2*q^2

def vtail3M758 (a r s q j : ℤ) : ℤ := 24-96*r+36*r^2-96*a*q+36*a*r+72*a*r*q+36*a^2*q+36*a^2*q^2

def vtail4M758 (a r s q j : ℤ) : ℤ := 12-18*r+6*r^2-18*a-18*a*q+12*a*r+12*a*r*q+6*a^2+12*a^2*q+6*a^2*q^2

def vBlock0M758 (a r s q j : ℤ) : ℤ := 192*r*j-96*r*j^2-96*r^2+96*r^2*j-128*a*j+96*a*j^2-16*a*j^3+192*a*r-288*a*r*j+96*a*r*j^2-96*a^2+176*a^2*j-96*a^2*j^2+16*a^2*j^3

theorem vE0_polyM758 (a r s q j : ℤ) (hj : 2 ≤ j) :
 vE0M758 a r s q j=vBlock0M758 a r s q j := by
 unfold vE0M758
 rw [vFall_polyM758 j 1 (by omega)]
 rw [vFall_polyM758 j 2 (by omega)]
 rw [vFall_polyM758 j 3 (by omega)]
 rw [vFall_polyM758 j 4 (by omega)]
 rw [vFall_polyM758 j 5 (by omega)]
 simp only [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vBlock0M758]
 ring

theorem vE0_zeroM758 (a r s q j : ℤ) (hj : j ≤ 0) :
 vE0M758 a r s q j=0 := by
 unfold vE0M758
 rw [vFall_zeroM758 j 1 (by omega)]
 rw [vFall_zeroM758 j 2 (by omega)]
 rw [vFall_zeroM758 j 3 (by omega)]
 rw [vFall_zeroM758 j 4 (by omega)]
 rw [vFall_zeroM758 j 5 (by omega)]
 ring

def vBlock1M758 (a r s q j : ℤ) : ℤ := -1056*r+384*r*j-768*r*q+384*r*q*j+384*r^2-192*r^2*j+2544*a-2048*a*j+576*a*j^2-64*a*j^3+1248*a*q-960*a*q*j+192*a*q*j^2-768*a*r+768*a*r*j-192*a*r*j^2+384*a*r*q-192*a*r*q*j+48*a^2-304*a^2*j+192*a^2*j^2-32*a^2*j^3-624*a^2*q+480*a^2*q*j-96*a^2*q*j^2

theorem vE1_polyM758 (a r s q j : ℤ) (hj : 3 ≤ j) :
 vE1M758 a r s q j=vBlock1M758 a r s q j := by
 unfold vE1M758
 rw [vFall_polyM758 j 2 (by omega)]
 rw [vFall_polyM758 j 3 (by omega)]
 rw [vFall_polyM758 j 4 (by omega)]
 rw [vFall_polyM758 j 5 (by omega)]
 rw [vFall_polyM758 j 6 (by omega)]
 simp only [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vBlock1M758]
 ring

theorem vE1_zeroM758 (a r s q j : ℤ) (hj : j ≤ 1) :
 vE1M758 a r s q j=0 := by
 unfold vE1M758
 rw [vFall_zeroM758 j 2 (by omega)]
 rw [vFall_zeroM758 j 3 (by omega)]
 rw [vFall_zeroM758 j 4 (by omega)]
 rw [vFall_zeroM758 j 5 (by omega)]
 rw [vFall_zeroM758 j 6 (by omega)]
 ring

def vBlock2M758 (a r s q j : ℤ) : ℤ := 1056*r-576*r*j+96*r*j^2-288*r^2+96*r^2*j-2544*a+2176*a*j-672*a*j^2+80*a*j^3+1056*a*q-576*a*q*j+96*a*q*j^2+576*a*r-480*a*r*j+96*a*r*j^2-576*a*r*q+192*a*r*q*j+48*a^2+128*a^2*j-96*a^2*j^2+16*a^2*j^3+576*a^2*q-480*a^2*q*j+96*a^2*q*j^2-288*a^2*q^2+96*a^2*q^2*j

theorem vE2_polyM758 (a r s q j : ℤ) (hj : 5 ≤ j) :
 vE2M758 a r s q j=vBlock2M758 a r s q j := by
 unfold vE2M758
 rw [vFall_polyM758 j 2 (by omega)]
 rw [vFall_polyM758 j 3 (by omega)]
 rw [vFall_polyM758 j 4 (by omega)]
 rw [vFall_polyM758 j 5 (by omega)]
 rw [vFall_polyM758 j 6 (by omega)]
 rw [vFall_polyM758 j 7 (by omega)]
 rw [vFall_polyM758 j 8 (by omega)]
 simp only [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vBlock2M758]
 ring

theorem vE2_zeroM758 (a r s q j : ℤ) (hj : j ≤ 1) :
 vE2M758 a r s q j=0 := by
 unfold vE2M758
 rw [vFall_zeroM758 j 2 (by omega)]
 rw [vFall_zeroM758 j 3 (by omega)]
 rw [vFall_zeroM758 j 4 (by omega)]
 rw [vFall_zeroM758 j 5 (by omega)]
 rw [vFall_zeroM758 j 6 (by omega)]
 rw [vFall_zeroM758 j 7 (by omega)]
 rw [vFall_zeroM758 j 8 (by omega)]
 ring

theorem vE_zeroM758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : j ≤ 0) :
 vEM758 a r s q j=0 := by
 rw [vEM758,vE0_zeroM758 _ _ _ _ _ (by omega),vE1_zeroM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]
 ring

theorem vE_oneM758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : j=1) :
 vEM758 a r s q j=48*s := by
 subst j
 rw [vEM758,vE1_zeroM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]; ring
 norm_num [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

theorem vE_lowM758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : 2 ≤ j ∧ j ≤ q+1) :
 vEM758 a r s q j=vlowM758 a r s q j := by
 rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_zeroM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]
 simp only [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

theorem vE_bridgeM758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : j=q+2) :
 vEM758 a r s q j=vbridgeM758 a r s q j := by
 subst j
 rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]
 rw [show q+2-q=2 by ring]
 norm_num [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

theorem vE_midM758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : q+3 ≤ j ∧ j ≤ 2*q+1) :
 vEM758 a r s q j=vmidM758 a r s q j := by
 rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega),vE2_zeroM758 _ _ _ _ _ (by omega)]
 simp only [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

theorem vE_tail2M758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : j=2*q+2) :
 vEM758 a r s q j=vtail2M758 a r s q j := by
 subst j
 rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega)]
 rw [show 2*q+2-2*q=2 by ring]
 norm_num [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

theorem vE_tail3M758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : j=2*q+3) :
 vEM758 a r s q j=vtail3M758 a r s q j := by
 subst j
 rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega)]
 rw [show 2*q+3-2*q=3 by ring]
 norm_num [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

theorem vE_tail4M758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : j=2*q+4) :
 vEM758 a r s q j=vtail4M758 a r s q j := by
 subst j
 rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega)]
 rw [show 2*q+4-2*q=4 by ring]
 norm_num [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

theorem vE_pastM758 (a r s q j : ℤ) (hq : 2 ≤ q) (hj : 2*q+5 ≤ j) :
 vEM758 a r s q j=0 := by
 rw [vEM758,vE0_polyM758 _ _ _ _ _ (by omega),vE1_polyM758 _ _ _ _ _ (by omega),vE2_polyM758 _ _ _ _ _ (by omega)]
 simp only [vH0c1M758,vH0c2M758,vH0c3M758,vH0c4M758,vH0c5M758,vH1c2M758,vH1c3M758,vH1c4M758,vH1c5M758,vH1c6M758,vH2c2M758,vH2c3M758,vH2c4M758,vH2c5M758,vH2c6M758,vH2c7M758,vH2c8M758,vE0M758,vE1M758,vE2M758,vFallM758,vBlock0M758,vBlock1M758,vBlock2M758,vlowM758,vmidM758,vbridgeM758,vtail2M758,vtail3M758,vtail4M758]; ring

end
end MathGKM.Markov
