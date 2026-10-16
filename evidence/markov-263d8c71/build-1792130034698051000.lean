import MarkovTerminalAllM263
import MarkovPalindrome28b1
/-! Machine-authored 263d8c71. All source prefixes, second horizontal row.
This is not a full WeakLC assertion for source prefixes. -/
namespace MathGKM.Markov
noncomputable section

theorem source_prefix_secondM263 (path : List Bool) (k i : ℕ) :
 coeff (rawWord80 ((sourceWord28 path).take k)).b i 2*
 coeff (rawWord80 ((sourceWord28 path).take k)).b (i+2) 2 ≤
 coeff (rawWord80 ((sourceWord28 path).take k)).b (i+1) 2^2 := by
 cases k with
 | zero => simp [rawWord80,coeff]
 | succ k =>
   rw [sourceWord_central28]
   simpa only [List.take_succ_cons] using
     raw_starting_secondM263 ((central28 path++[true]).take k) i

end
end MathGKM.Markov
