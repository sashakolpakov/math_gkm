import MarkovSmallArithmeticM8F7
import MarkovSecondDiagonalM8F7
/-! Machine-authored 8f77f493. All small starting columns, zeros retained. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 3000000

theorem source_two_diagonal_zeroM8F7 (path : List Bool)
 (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p 0 (j+2)*coeff (frame path).mid.p 2 j≤
 coeff (frame path).mid.p 1 (j+1)^2 := by
 obtain ⟨q,hq,hb,_⟩ := source_two_squares3556 path ha
 by_cases hp : InPolygon (frame path).mid.a (frame path).mid.b 0 (j+2)
 · have hh := hp
   rw [ha,hb] at hh
   obtain ⟨hl,hu⟩ := hh
   have hj : 2*q+1≤j+2 := by nlinarith
   exact first_six_raw05ef path (2*q-j) 0 j (by omega) (by rw [ha,hb]; omega)
 · rw [raw_outside_polygon18 path 0 (j+2) hp,zero_mul]
   exact sq_nonneg _

theorem source_two_diagonal_oneM8F7 (path : List Bool)
 (ha : (frame path).mid.a=2) (j : ℕ) :
 coeff (frame path).mid.p 1 (j+2)*coeff (frame path).mid.p 3 j≤
 coeff (frame path).mid.p 2 (j+1)^2 := by
 obtain ⟨q,hq,hb,_⟩ := source_two_squares3556 path ha
 by_cases hp : InPolygon (frame path).mid.a (frame path).mid.b 1 (j+2)
 · have hh := hp
   rw [ha,hb] at hh
   obtain ⟨hl,hu⟩ := hh
   have hj : q≤j+1 := by nlinarith
   by_cases ht : 2*q≤j+6
   · exact first_six_raw05ef path (2*q-j-1) 1 j (by omega) (by rw [ha,hb]; omega)
   have hq3 : 3≤q := by omega
   have lo (s d k : ℕ) (he : s+d=q) :
     coeff (frame path).mid.p k s=lowerValM58E s d k :=
     source_two_lower_formulaM58E path s d k ha (by rw [he]; exact hb)
   have up (N d k : ℕ) (hN : 1≤N) (hd : 1≤d) (he : N+d=q) :
     coeff (frame path).mid.p k (N+2*d)=upperValM2B3 N d k :=
     source_two_upper_formulaM2B3 path N d k hN hd ha (by rw [he]; exact hb)
   by_cases he : j+1=q
   · have h0 := up (q-1) 1 1 (by omega) (by omega) (by omega)
     rw [show q-1+2*1=j+2 by omega] at h0
     rw [h0,lo j 1 3 (by omega),lo (j+1) 0 2 (by omega)]
     convert small_cross1_arithmeticM8F7 q (by omega) using 1 <;> congr 2 <;> omega
   by_cases he0 : j=q
   · subst j
     have h0 := up (q-2) 2 1 (by omega) (by omega) (by omega)
     have h1 := up (q-1) 1 2 (by omega) (by omega) (by omega)
     rw [show q-2+2*2=q+2 by omega] at h0
     rw [show q-1+2*1=q+1 by omega] at h1
     rw [h0,h1,lo q 0 3 (by omega)]
     exact small_cross0_arithmeticM8F7 q hq3
   · let N := 2*q-j
     let d := j-q
     have hN : 3≤N := by dsimp [N]; omega
     have hd : 1≤d := by dsimp [d]; omega
     have hNd : N+d=q := by dsimp [N,d]; omega
     have hjd : N+2*d=j := by dsimp [N,d]; omega
     have h0 := up (N-2) (d+2) 1 (by omega) (by omega) (by omega)
     have h1 := up (N-1) (d+1) 2 (by omega) (by omega) (by omega)
     have h2 := up N d 3 (by omega) hd hNd
     rw [show N-2+2*(d+2)=j+2 by omega] at h0
     rw [show N-1+2*(d+1)=j+1 by omega] at h1
     rw [hjd] at h2
     rw [h0,h1,h2]
     exact small_upper_arithmeticM8F7 N d hN hd
 · rw [raw_outside_polygon18 path 1 (j+2) hp,zero_mul]
   exact sq_nonneg _

theorem small_two_diagonalM8F7 : SmallTwoDiagonalMDB9 := by
 intro path ha i j hi
 interval_cases i
 · exact source_two_diagonal_zeroM8F7 path ha j
 · exact source_two_diagonal_oneM8F7 path ha j
 · exact source_two_diagonal_secondM8F7 path ha j

end
end MathGKM.Markov
