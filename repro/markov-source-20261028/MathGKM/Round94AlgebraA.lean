import MathGKM.Round91CentralAlgebraA

/- Machine-authored round94. Scalar comparison for the complete weighted
alpha-one expression. No separate class monotonicity premise occurs. -/
namespace CompensationR94
set_option maxHeartbeats 2000000
theorem scalar (x i A B M : ℤ) (hx : 1 ≤ x) (hi : 0 ≤ i)
    (him : i ≤ 2*x+1) (hM : 0 ≤ M)
    (hA : (x+1)^2*(2*x+1)*(2*x-i+3)*A  ≤ 
      x*(x+3)*(2*x+3)*(2*x-i+1)*M)
    (hB : (x+1)*(i+2)*(2*x+1)*B  ≤  x*i*(2*x+3)*M) : A+B ≤ 2*M := by
  have hangular : 0 < 2*x-i+3 := by omega
  let V := (4*x^3+8*x^2+2*x-2)*(i-x)^2+
    (4*x^3+12*x^2+10*x+2)*i+
    4*x^5+24*x^4+60*x^3+78*x^2+50*x+12
  have hc : 0 ≤ 4*x^3+8*x^2+2*x-2 := by
    have he : 4*x^3+8*x^2+2*x-2=
        4*(x-1)^3+20*(x-1)^2+30*(x-1)+12 := by ring
    rw [he]
    positivity
  have hV : 0 ≤ V := by
    dsimp [V]
    have h0 := mul_nonneg hc (sq_nonneg (i-x))
    have h1 : 0 ≤ (4*x^3+12*x^2+10*x+2)*i := by positivity
    positivity
  have h0 := mul_nonneg hV hM
  have h1 := mul_nonneg (show 0 ≤ (x+1)*(i+2) by positivity) (sub_nonneg.mpr hA)
  have h2 := mul_nonneg (show 0 ≤ (x+1)^2*(2*x-i+3) by positivity) (sub_nonneg.mpr hB)
  have he : (x+1)^3*(i+2)*(2*x+1)*(2*x-i+3)*(2*M-A-B)=
      V*M+(x+1)*(i+2)*(x*(x+3)*(2*x+3)*(2*x-i+1)*M-
        (x+1)^2*(2*x+1)*(2*x-i+3)*A)+
      (x+1)^2*(2*x-i+3)*(x*i*(2*x+3)*M-
        (x+1)*(i+2)*(2*x+1)*B) := by dsimp [V]; ring
  have hp : 0 < (x+1)^3*(i+2)*(2*x+1)*(2*x-i+3) := by positivity
  have hh : 0 ≤ (x+1)^3*(i+2)*(2*x+1)*(2*x-i+3)*(2*M-A-B) := by
    rw [he]
    linarith
  have hh' := (mul_nonneg_iff_of_pos_left hp).mp hh
  omega
end CompensationR94
#print axioms CompensationR94.scalar
