import MarkovAlignedLC6d2c
/-! Machine-authored 6d2c5a67. Missing aligned layers matter: summing
two nonconsecutive layers can fail on actual sources. Not a root refutation. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial Finset

theorem countAtom_below_cut6d (r h n s d : ℕ) (hrh : r ≤ h) (hd : d<s) :
 countAtom68 r h n s d=0 := by
 unfold countAtom68
 rw [if_neg]
 omega

theorem singleA_negative_alignment6d (p q s d : ℕ) (hd : d<s) :
 singleACount68 p q s d=0 := by
 unfold singleACount68
 have h1 (k : ℕ) := countAtom_below_cut6d 1 1 k s d (by omega) hd
 have h2 (k : ℕ) := countAtom_below_cut6d 1 2 k s d (by omega) hd
 have h3 (k l : ℕ) := countAtom_below_cut6d 2 3 (k+l) s d (by omega) hd
 simp [h1,h2,h3,show ¬(s=0 ∧ d=0) by omega]

theorem source_negative_alignment6d (n s d : ℕ) (hd : d<s) :
 (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) s d).coeff 0=0 := by
 rw [oneA_layer_count68,singleA_negative_alignment6d _ _ _ _ hd]

theorem aligned_skipped_pair6d (n : ℕ) (hn : 6 ≤ n) :
 singleAAligned6d n (n+1) 0+singleAAligned6d n (n+1) 5=
 1+3*X+14*X^2+26*X^3+24*X^4+11*X^5+2*X^6 := by
 rw [singleAAligned_zero6d n (by omega),singleAAligned_below6d n 5 (by omega) (by omega)]
 norm_num
 ring

theorem aligned_skipped_pair_failure6d (n : ℕ) (hn : 6 ≤ n) :
 let p := singleAAligned6d n (n+1) 0+singleAAligned6d n (n+1) 5
 p.coeff 1^2-p.coeff 0*p.coeff 2 = -5 := by
 dsimp only
 rw [aligned_skipped_pair6d n hn]
 norm_num [Polynomial.coeff_add,Polynomial.coeff_mul]

theorem source_skipped_pair_failure6d (n : ℕ) (hn : 6 ≤ n) :
 let w := central28 (oneAPath68 n)++[true]
 let f := fun s => (degreeLayer07a7 (X:ℤ[X]) w s s).coeff 0+
   (degreeLayer07a7 (X:ℤ[X]) w s (s+5)).coeff 0
 f 1^2-f 0*f 2 = -5 := by
 dsimp only
 have h (s : ℕ) :
   (degreeLayer07a7 (X:ℤ[X]) (central28 (oneAPath68 n)++[true]) s s).coeff 0=
   (singleAAligned6d n (n+1) 0).coeff s := by
   simpa using source_aligned_count6d n 0 s
 simp only [h,source_aligned_count6d]
 simpa only [Polynomial.coeff_add] using aligned_skipped_pair_failure6d n hn

theorem source_skipped_full_triple6d :
 let m := (frame (oneAPath68 6)).mid
 m.a=13 ∧ m.b=15 ∧
 InPolygon m.a m.b 13 0 ∧ InPolygon m.a m.b 14 0 ∧ InPolygon m.a m.b 15 0 ∧
 coeff m.p 13 0=1 ∧ coeff m.p 14 0=14 ∧ coeff m.p 15 0=91 ∧
 coeff m.p 14 0^2-coeff m.p 13 0*coeff m.p 15 0=105 := by
 obtain ⟨ha,hb⟩ := oneA_labels68 6
 norm_num at ha hb
 have h (s : ℕ) : coeff (frame (oneAPath68 6)).mid.p (13+s) 0=((14:ℕ).choose s:ℤ) := by
   simpa only [ha,hb] using source_boundary_choose68 (oneAPath68 6) s
 dsimp only
 rw [ha,hb,h 0,h 1,h 2]
 norm_num [InPolygon,Nat.choose]

#print axioms source_negative_alignment6d
#print axioms source_skipped_pair_failure6d
#print axioms source_skipped_full_triple6d
end
end MathGKM.Markov
