import MarkovVarianceContractionM1C6
/-! Machine-authored 5bf6837d. The exact outward-shift rate and its radial
monotonicity, including the exceptional weight at index zero. -/
namespace MathGKM.Markov
noncomputable section
open Finset
set_option maxHeartbeats 8000000

def birthRateM5BF (j r : ℕ) : ℝ :=
 if r=0 then 4*j else (j:ℝ)-r-1+j/(r:ℝ)

def radialRateM5BF (j H t : ℕ) : ℝ := birthRateM5BF j t+birthRateM5BF j (H-t)

theorem birth_rate_positive_indexM5BF (j r : ℕ) (hr : 0<r) :
 birthRateM5BF j r=((r:ℝ)+1)*((j:ℝ)-r)/r := by
 unfold birthRateM5BF
 rw [if_neg (by omega : r≠0)]
 have hp : (r:ℝ)≠0 := by exact_mod_cast (show r≠0 by omega)
 field_simp
 <;> ring

theorem radial_rate_reflectM5BF (j H t : ℕ) (ht : t≤H) :
 radialRateM5BF j H (H-t)=radialRateM5BF j H t := by
 simp only [radialRateM5BF,show H-(H-t)=t by omega,add_comm]

theorem radial_rate_endpointM5BF (j H : ℕ) (hH : 0<H) :
 radialRateM5BF j H 0=5*(j:ℝ)-H-1+j/(H:ℝ) := by
 simp [radialRateM5BF,birthRateM5BF,show H≠0 by omega]
 <;> ring

theorem radial_rate_interiorM5BF (j H t : ℕ) (ht : 0<t) (hT : t<H) :
 radialRateM5BF j H t=2*(j:ℝ)-H-2+(j:ℝ)*H/((t:ℝ)*(H-t)) := by
 have hp : (t:ℝ)≠0 := by exact_mod_cast (show t≠0 by omega)
 have hq : (H:ℝ)-t≠0 := sub_ne_zero.mpr (by exact_mod_cast (show H≠t by omega))
 simp only [radialRateM5BF,birthRateM5BF,if_neg (show t≠0 by omega),
   if_neg (show H-t≠0 by omega),Nat.cast_sub (show t≤H by omega)]
 field_simp
 <;> ring

theorem radial_rate_le_endpointM5BF (j H t : ℕ) (ht : t≤H) :
 radialRateM5BF j H t≤radialRateM5BF j H 0 := by
 by_cases h0 : t=0
 · subst t; rfl
 by_cases he : t=H
 · subst t
   simpa using (radial_rate_reflectM5BF j H 0 (by omega)).le
 have hp : (1:ℝ)≤t := by exact_mod_cast (show 1≤t by omega)
 have hq : (1:ℝ)≤(H:ℝ)-t := by
   have hx : (t:ℝ)+1≤H := by exact_mod_cast (show t+1≤H by omega)
   linarith
 have hj : (0:ℝ)≤j := Nat.cast_nonneg j
 have ha : (j:ℝ)/(t:ℝ)≤j := (div_le_iff₀ (by linarith)).mpr (by nlinarith)
 have hb : (j:ℝ)/((H:ℝ)-t)≤j := (div_le_iff₀ (by linarith)).mpr (by nlinarith)
 rw [radial_rate_endpointM5BF _ _ (by omega)]
 simp only [radialRateM5BF,birthRateM5BF,if_neg h0,if_neg (show H-t≠0 by omega),Nat.cast_sub ht]
 have hc : 0≤(j:ℝ)/(H:ℝ) := by positivity
 linarith

theorem radial_rate_orderM5BF (j H t u : ℕ) (ht : t≤H) (hu : u≤H)
 (hord : ((t:ℝ)-(H:ℝ)/2)^2≤((u:ℝ)-(H:ℝ)/2)^2) :
 radialRateM5BF j H t≤radialRateM5BF j H u := by
 by_cases hu0 : u=0
 · subst u; exact radial_rate_le_endpointM5BF j H t ht
 by_cases huH : u=H
 · subst u
   have he := radial_rate_reflectM5BF j H 0 (by omega)
   simp only [Nat.sub_zero] at he
   rw [he]
   exact radial_rate_le_endpointM5BF j H t ht
 have u0 : (0:ℝ)<u := by exact_mod_cast (show 0<u by omega)
 have uH : (u:ℝ)<H := by exact_mod_cast (show u<H by omega)
 have ut : 0<(u:ℝ)*((H:ℝ)-u) := mul_pos u0 (by linarith)
 have prod : (u:ℝ)*((H:ℝ)-u)≤(t:ℝ)*((H:ℝ)-t) := by nlinarith
 have t0 : 0<t := by
   by_contra h
   have he : t=0 := by omega
   subst t
   norm_num at prod
   linarith
 have tH : t<H := by
   by_contra h
   have he : t=H := by omega
   subst t
   nlinarith
 rw [radial_rate_interiorM5BF _ _ _ t0 tH,
   radial_rate_interiorM5BF _ _ _ (by omega) (by omega)]
 have tp : 0<(t:ℝ)*((H:ℝ)-t) := lt_of_lt_of_le ut prod
 exact add_le_add_left (div_le_div_of_nonneg_left (show 0≤(j:ℝ)*H by positivity) ut prod) _

theorem kernel_birthM5BF (j s r : ℕ) (hr : r<j) :
 ((s:ℝ)+j+3-r)*reverseKernelMBEC j s (r+1)=
 birthRateM5BF j r*reverseKernelMBEC j s r := by
 by_cases hz : r=0
 · subst r
   norm_num [reverseKernelMBEC,qWeightM7E2,birthRateM5BF,Nat.descFactorial_succ]
   field_simp
   <;> ring
 have hrj : r≤j := by omega
 have hrd : r ≤ s+j+3 := by omega
 have hd : (0:ℝ)<(s+j+3).descFactorial r := by exact_mod_cast Nat.descFactorial_pos.mpr hrd
 have he : (0:ℝ)<(s:ℝ)+j+3-r := by exact_mod_cast (show r<s+j+3 by omega)
 have hp : (r:ℝ)≠0 := by exact_mod_cast hz
 rw [birth_rate_positive_indexM5BF _ _ (by omega)]
 unfold reverseKernelMBEC
 rw [Nat.descFactorial_succ,Nat.descFactorial_succ]
 simp only [qWeightM7E2,if_neg (show ¬((r+1:ℕ):ℤ)<0 by omega),
   if_neg (show ((r+1:ℕ):ℤ)≠0 by omega),if_neg (show ¬(r:ℤ)<0 by omega),
   if_neg (show (r:ℤ)≠0 by exact_mod_cast hz)]
 push_cast [Nat.cast_sub hrj,Nat.cast_sub hrd]
 field_simp
 <;> ring

end
end MathGKM.Markov
