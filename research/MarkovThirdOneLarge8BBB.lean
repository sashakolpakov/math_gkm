import MarkovThirdOneBridge8BBB
import MarkovThirdOneLow8BBB
import MarkovThirdOneMidLow8BBB
import MarkovThirdOneMidHigh8BBB
import MarkovThirdOneHigh8BBB
/-! Machine-authored request 8bbb934e. Third lower diagonal on every source
true::false::rest with predecessor denominator at least four. -/
namespace MathGKM.Markov
noncomputable section

theorem thirdOne_chamber_lc8BBB (c r q t u : ℤ) (h : ThirdChamber75 c r q t u) (j : ℕ) :
 thirdOneSeq8BBB c r q t u j*thirdOneSeq8BBB c r q t u (j+2)≤
   thirdOneSeq8BBB c r q t u (j+1)^2 := by
 obtain ⟨x,y,hx,hy,h⟩ := h
 rcases h with ⟨rfl,rfl,rfl,rfl,rfl⟩ | ⟨rfl,rfl,rfl,rfl,rfl⟩ |
   ⟨rfl,rfl,rfl,rfl,rfl⟩ | ⟨rfl,rfl,rfl,rfl,rfl⟩
 · exact thirdOne_low_lc8BBB x y hx hy j
 · exact thirdOne_midlow_lc8BBB x y hx hy j
 · exact thirdOne_midhigh_lc8BBB x y hx hy j
 · exact thirdOne_high_lc8BBB x y hx hy j

theorem source_third_one_large8BBB (rest : List Bool) (hc : 4≤(frame rest).mid.b)
 (i j : ℕ) (hs : i+j+2=(frame (true::false::rest)).mid.a+3) :
 coeff (frame (true::false::rest)).mid.p i (j+2)*
 coeff (frame (true::false::rest)).mid.p (i+2) j≤
 coeff (frame (true::false::rest)).mid.p (i+1) (j+1)^2 := by
 have h := thirdOne_chamber_lc8BBB _ _ _ _ _ (source_third_chamberADB2 rest hc) j
 rw [←source_third_one_raw8BBB rest hc i (j+2) (by omega),
   ←source_third_one_raw8BBB rest hc (i+2) j (by omega),
   ←source_third_one_raw8BBB rest hc (i+1) (j+1) (by omega)] at h
 nlinarith only [h]

#print axioms source_third_one_large8BBB
end
end MathGKM.Markov
