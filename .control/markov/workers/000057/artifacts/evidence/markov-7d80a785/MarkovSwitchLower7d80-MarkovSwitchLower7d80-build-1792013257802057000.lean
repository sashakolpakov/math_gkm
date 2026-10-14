import MarkovFourth5a7
import MarkovPellSource0618
import MarkovPolygonWord28b1
/-! Machine-authored 7d80a785. Closed mixed words have at least two switches. -/
namespace MathGKM.Markov
noncomputable section

theorem last_append7d80 (e : Bool) (w z : List Bool) :
 lastFrom5a7 e (w++z)=lastFrom5a7 (lastFrom5a7 e w) z := by
 induction w generalizing e with
 | nil => rfl
 | cons r w ih => simpa [lastFrom5a7] using ih r

theorem switches_zero_last7d80 (e : Bool) (w : List Bool)
 (h : switchesFrom5a7 e w=0) : lastFrom5a7 e w=e := by
 induction w generalizing e with
 | nil => rfl
 | cons r w ih =>
   simp only [switchesFrom5a7] at h
   have her : e=r := by split_ifs at h with he <;> omega
   subst r
   exact ih e (by simpa using h)

theorem switches_closed7d80 (e : Bool) (w : List Bool)
 (hl : lastFrom5a7 e w=e) (hm : (!e) ∈ w) : 2 ≤ switchesFrom5a7 e w := by
 induction w generalizing e with
 | nil => simp at hm
 | cons r w ih =>
   by_cases he : e=r
   · subst r
     have hm' : (!e) ∈ w := by simpa using hm
     simpa [switchesFrom5a7] using ih e hl hm'
   · have hpos : 1 ≤ switchesFrom5a7 r w := by
       by_contra hn
       have hzero : switchesFrom5a7 r w=0 := by omega
       have hr := switches_zero_last7d80 r w hzero
       simp only [lastFrom5a7] at hl
       exact he (hl.symm.trans hr)
     simp only [switchesFrom5a7,if_neg he]
     omega

theorem palindrome_last7d80 (e : Bool) (w : List Bool)
 (hp : List.Palindrome (e::w)) : lastFrom5a7 e w=e := by
 cases hp with
 | singleton => rfl
 | cons_concat d z hz => simp [last_append7d80,lastFrom5a7]

theorem palindrome_mixed_switches7d80 (e : Bool) (w : List Bool)
 (hp : List.Palindrome (e::w)) (ht : 0 < (e::w).count true)
 (hf : 0 < (e::w).count false) : 2 ≤ switchesFrom5a7 e w := by
 apply switches_closed7d80 e w (palindrome_last7d80 e w hp)
 cases e
 · simpa using (List.count_pos_iff.mp ht)
 · simpa using (List.count_pos_iff.mp hf)

theorem source_fourth_mixed7d80 (path : List Bool)
 (ha : 2 ≤ (frame path).mid.a) (hab : (frame path).mid.a+2 ≤ (frame path).mid.b) :
 ∃ n m s : ℕ, n+2=(frame path).mid.b ∧ m+1=(frame path).mid.a ∧ 2 ≤ s ∧
   6*((quotientSlice774 path 3).map (Int.castRingHom ℝ))=
     CubicPoly5a7 (cubicA5a7 m) (cubicB5a7 n m s) (cubicC5a7 n m) (cubicD5a7 n) := by
 obtain ⟨hc,hl⟩ := source_word_counts28 path
 rw [sourceWord_central28] at hc hl
 have hcc : (central28 path).count true+1=(frame path).mid.a := by simpa using hc
 have hcl : (central28 path).length+2=(frame path).mid.b := by simpa using hl
 have hp := central_palindrome28 path
 generalize hw : central28 path=w at hcc hcl hp
 cases w with
 | nil => simp at hcc; omega
 | cons e w =>
   have hfalse : 0 < (e::w).count false := by
     have := bool_counts5a7 (e::w)
     omega
   refine ⟨(e::w).length,(e::w).count true,switchesFrom5a7 e w,hcl,hcc,
     palindrome_mixed_switches7d80 e w hp (by omega) hfalse,?_⟩
   have h := word_cubic5a7 (Polynomial.X : Polynomial ℤ) e w
   have hn : (1+(w.length : Polynomial ℤ))=((e::w).length : Polynomial ℤ) := by simp; ring
   have hm : ((if e then 1 else 0)+(w.count true : Polynomial ℤ))=
       ((e::w).count true : Polynomial ℤ) := by cases e <;> simp [List.count_cons]; ring
   rw [hn,hm] at h
   have hi : 6*quotientSlice774 path 3 =
       cubicExpr5a7 Polynomial.X (e::w).length ((e::w).count true) (switchesFrom5a7 e w) := by
     unfold quotientSlice774
     rw [source_quotient_central0618,hw]
     exact h
   have hh := congrArg (Polynomial.map (Int.castRingHom ℝ)) hi
   simpa only [Polynomial.map_mul,Polynomial.map_ofNat,cubicExpr_map5a7] using hh

#print axioms palindrome_mixed_switches7d80
#print axioms source_fourth_mixed7d80
end
end MathGKM.Markov
