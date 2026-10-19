import MathGKM.MarkovTopBoundary

/-! Machine-authored round-0006. Second total-degree remainders for the pinned recurrence. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 800000

def SecondForm (P : BiPoly) (d : ℕ) (A : BiPoly) : Prop :=
  Below (P-(U+V)^d-A) (d-1)

lemma secondForm_mul {P Q A B : BiPoly} {d e : ℕ}
    (hd : 1 ≤ d) (he : 1 ≤ e)
    (hp : SecondForm P d A) (hq : SecondForm Q e B)
    (htq : TopForm Q e) (hbq : SupportBound Q e)
    (hba : SupportBound A (d-1)) :
    SecondForm (P*Q) (d+e) (A*(U+V)^e+(U+V)^d*B) := by
  have hw : SupportBound ((U+V)^d) d := by
    simpa using (SupportBound.u.add SupportBound.v).pow d
  have h1 := hp.mul hbq
  have h2 := hq.mul hw
  have h3 := htq.mul hba
  rw [mul_comm] at h2 h3
  have h2' : Below ((U+V)^d*(Q-(U+V)^e-B)) (d+e-1) := by
    convert h2 using 1 <;> omega
  have h1' : Below ((P-(U+V)^d-A)*Q) (d+e-1) := by
    convert h1 using 1 <;> omega
  have h3' : Below (A*(Q-(U+V)^e)) (d+e-1) := by
    convert h3 using 1 <;> omega
  have hh := (h1'.add h2').add h3'
  unfold SecondForm
  convert hh using 1
  rw [pow_add]
  ring

lemma secondForm_sub {P Q A B : BiPoly} {d : ℕ}
    (hp : SecondForm P d A) (hq : Below (Q-B) (d-1)) :
    SecondForm (P-Q) d (A-B) := by
  intro i j hij
  have h1 := hp i j hij
  have h2 := hq i j hij
  have hh : P-Q-(U+V)^d-(A-B) = (P-(U+V)^d-A)-(Q-B) := by ring
  rw [hh]
  simp only [coeff, Polynomial.coeff_sub] at h1 h2 ⊢
  change coeff P i j - coeff ((U+V)^d) i j - coeff A i j = 0 at h1
  change coeff Q i j - coeff B i j = 0 at h2
  change (coeff P i j - coeff ((U+V)^d) i j - coeff A i j) -
    (coeff Q i j - coeff B i j) = 0
  rw [h1, h2, sub_zero]

lemma secondForm_s : SecondForm S 1 1 := by
  intro i j h
  have hh : S-(U+V)^1-1=0 := by simp [S]
  rw [hh]
  simp [coeff]

lemma subleading_shift (L : BiPoly) (d e : ℕ) (hd : 1 ≤ d)
    (hL : d=1 → L=0) :
    (L*(U+V)^(d-2))*(U+V)^(e+1) = L*(U+V)^(d+e-1) := by
  by_cases h : d=1
  · simp [hL h]
  · rw [mul_assoc, ← pow_add]
    congr 2
    omega

lemma secondForm_s_mul {P Q L M : BiPoly} {d e : ℕ}
    (hd : 1 ≤ d) (he : 1 ≤ e)
    (hL : d=1 → L=0) (hM : e=1 → M=0)
    (hp : SecondForm P d (L*(U+V)^(d-2)))
    (hq : SecondForm Q e (M*(U+V)^(e-2)))
    (htp : TopForm P d) (htq : TopForm Q e)
    (hbp : SupportBound P d) (hbq : SupportBound Q e)
    (hbL : SupportBound (L*(U+V)^(d-2)) (d-1)) :
    SecondForm (S*P*Q) (d+e+1) ((L+M+(U+V))*(U+V)^(d+e-1)) := by
  have h1 := secondForm_mul (by omega : 1 ≤ 1) hd secondForm_s hp htp hbp SupportBound.one
  have hb1 : SupportBound (1*(U+V)^d+(U+V)^1*(L*(U+V)^(d-2))) d := by
    have hw : SupportBound ((U+V)^d) d := by
      simpa using (SupportBound.u.add SupportBound.v).pow d
    have hh := (SupportBound.u.add SupportBound.v).mul hbL
    simpa only [one_mul, pow_one, Nat.add_sub_of_le hd, max_self] using hw.add hh
  have h2 := secondForm_mul (by omega : 1 ≤ 1+d) he h1 hq htq hbq (by
    convert hb1 using 1 <;> omega)
  have heq : (1*(U+V)^d+(U+V)^1*(L*(U+V)^(d-2)))*(U+V)^e +
      (U+V)^(1+d)*(M*(U+V)^(e-2)) =
      (L+M+(U+V))*(U+V)^(d+e-1) := by
    have hsl := subleading_shift L d e hd hL
    have hsm := subleading_shift M e d he hM
    have hw : (U+V)*(U+V)^(d+e-1) = (U+V)^(d+e) := by
      rw [← pow_succ']
      congr 1
      omega
    rw [pow_one, one_mul, add_mul, ← pow_add]
    have hl : (U+V)*(L*(U+V)^(d-2))*(U+V)^e = L*(U+V)^(d+e-1) := by
      rw [← hsl, pow_succ]
      ring
    have hm : (U+V)^(1+d)*(M*(U+V)^(e-2)) = M*(U+V)^(d+e-1) := by
      rw [Nat.add_comm 1 d, pow_succ, ← Nat.add_comm e d, ← hsm]
      ring
    rw [hl, hm]
    rw [add_mul, add_mul, hw]
    ring
  rw [heq] at h2
  convert h2 using 1 <;> omega

def subleadingLinear (a b : ℕ) : BiPoly :=
  ((b-1 : ℕ) : ℤ) • U + ((a-1 : ℕ) : ℤ) • V

lemma SupportBound.zsmul {P : BiPoly} {d : ℕ} (hp : SupportBound P d) (z : ℤ) :
    SupportBound (z • P) d := by
  intro i j hij
  simp only [coeff, Polynomial.coeff_smul, smul_eq_mul]
  change z * coeff P i j = 0
  rw [hp i j hij, mul_zero]

lemma subleadingLinear_bound (a b : ℕ) : SupportBound (subleadingLinear a b) 1 := by
  exact (SupportBound.u.zsmul _).add (SupportBound.v.zsmul _)

lemma subleadingLinear_one (a b : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b)
    (h : a+b-1=1) : subleadingLinear a b = 0 := by
  have h1 : a=1 := by omega
  have h2 : b=1 := by omega
  simp [subleadingLinear, h1, h2]

lemma subleading_term_bound (a b : ℕ) (ha : 1 ≤ a) (hb : 1 ≤ b) :
    SupportBound (subleadingLinear a b*(U+V)^(a+b-1-2)) (a+b-1-1) := by
  by_cases h : a+b-1=1
  · rw [subleadingLinear_one a b ha hb h, zero_mul]
    intro i j hij
    simp [coeff]
  · have hw := (SupportBound.u.add SupportBound.v).pow (a+b-1-2)
    have hh := (subleadingLinear_bound a b).mul hw
    simp only [max_self, Nat.mul_one] at hh
    apply hh.mono
    omega

lemma subleadingLinear_add (a b c d : ℕ)
    (ha : 1 ≤ a) (hb : 1 ≤ b) (hc : 1 ≤ c) (hd : 1 ≤ d) :
    subleadingLinear (a+c) (b+d) = subleadingLinear a b + subleadingLinear c d + (U+V) := by
  simp only [subleadingLinear, Nat.cast_sub (by omega : 1 ≤ b+d),
    Nat.cast_sub (by omega : 1 ≤ a+c), Nat.cast_sub hb, Nat.cast_sub ha,
    Nat.cast_sub hd, Nat.cast_sub hc, Nat.cast_add, Nat.cast_one,
    add_smul, sub_smul, one_smul]
  abel

def LabelSecond (l : Label) : Prop :=
  1 ≤ l.a → 1 ≤ l.b → SecondForm l.p (l.a+l.b-1)
    (subleadingLinear l.a l.b*(U+V)^(l.a+l.b-1-2))

lemma second_positive_mutation (l m h : Label)
    (hal : 1 ≤ l.a) (hbl : 1 ≤ l.b) (ham : 1 ≤ m.a) (hbm : 1 ≤ m.b)
    (hbh : 1 ≤ h.b)
    (sum_a : m.a=l.a+h.a) (sum_b : m.b=l.b+h.b)
    (sl : LabelSecond l) (sm : LabelSecond m)
    (tl : LabelTop l) (tm : LabelTop m)
    (bl : LabelBound l) (bm : LabelBound m) (bh : LabelBound h) :
    SecondForm (S*l.p*m.p-U^l.a*V^l.b*h.p) (l.a+m.a+(l.b+m.b)-1)
      (subleadingLinear (l.a+m.a) (l.b+m.b)*(U+V)^(l.a+m.a+(l.b+m.b)-1-2)) := by
  have hs := secondForm_s_mul (by omega : 1 ≤ l.a+l.b-1)
    (by omega : 1 ≤ m.a+m.b-1)
    (subleadingLinear_one l.a l.b hal hbl)
    (subleadingLinear_one m.a m.b ham hbm)
    (sl hal hbl) (sm ham hbm) tl tm bl bm (subleading_term_bound l.a l.b hal hbl)
  rw [← subleadingLinear_add l.a l.b m.a m.b hal hbl ham hbm] at hs
  have hs' : SecondForm (S*l.p*m.p) (l.a+m.a+(l.b+m.b)-1)
      (subleadingLinear (l.a+m.a) (l.b+m.b)*(U+V)^(l.a+m.a+(l.b+m.b)-1-2)) := by
    convert hs using 1 <;> congr 2 <;> omega
  have hh := ((SupportBound.u.pow l.a).mul (SupportBound.v.pow l.b)).mul bh
  have hh' : Below (U^l.a*V^l.b*h.p) (l.a+m.a+(l.b+m.b)-1-1) := by
    apply Below.of_bound hh
    simp only [LabelBound, Nat.mul_one] at *
    omega
  have hh'' : Below (U^l.a*V^l.b*h.p-0) (l.a+m.a+(l.b+m.b)-1-1) := by
    simpa only [sub_zero] using hh'
  simpa only [sub_zero] using secondForm_sub hs' hh''

lemma second_zero_endpoint (P Q : BiPoly) (n : ℕ) (hn : 2 ≤ n)
    (hp : SecondForm P n (((n-1:ℕ):ℤ) • U*(U+V)^(n-2)))
    (tp : TopForm P n) (bp : SupportBound P n) (tq : TopForm Q (n-1)) :
    SecondForm (S*P-V*Q) (n+1) ((n:ℤ) • U*(U+V)^(n-1)) := by
  have hs := secondForm_mul (by omega : 1 ≤ 1) (by omega : 1 ≤ n)
    secondForm_s hp tp bp SupportBound.one
  have hshift := subleading_shift (((n-1:ℕ):ℤ) • U) n 0 (by omega) (by omega)
  simp only [Nat.add_zero, Nat.zero_add, pow_one] at hshift
  have ha : 1*(U+V)^n+(U+V)^1*(((n-1:ℕ):ℤ) • U*(U+V)^(n-2)) =
      (((n-1:ℕ):ℤ) • U+(U+V))*(U+V)^(n-1) := by
    have hw : (U+V)*(U+V)^(n-1) = (U+V)^n := by
      rw [← pow_succ']; congr 1; omega
    calc
      _ = (U+V)^n + (((n-1:ℕ):ℤ) • U*(U+V)^(n-2))*(U+V) := by
        rw [one_mul, pow_one]; ring
      _ = _ := by rw [hshift, add_mul, hw]; exact add_comm _ _
  rw [ha] at hs
  have hq := tq.mul SupportBound.v
  have hq' : Below (V*Q-V*(U+V)^(n-1)) (n+1-1) := by
    have hh : V*Q-V*(U+V)^(n-1) = (Q-(U+V)^(n-1))*V := by ring
    rw [hh]
    convert hq using 1 <;> omega
  have hh := secondForm_sub hs (by convert hq' using 1 <;> omega)
  have hc : (((n-1:ℕ):ℤ) • U+(U+V))*(U+V)^(n-1)-V*(U+V)^(n-1) =
      (n:ℤ) • U*(U+V)^(n-1) := by
    have hc1 : (((n-1:ℕ):ℤ) • U+(U+V))-V=(n:ℤ) • U := by
      rw [Nat.cast_sub (by omega : 1 ≤ n), Nat.cast_one, sub_smul, one_smul]
      abel
    rw [← sub_mul, hc1]
  rw [hc] at hh
  convert hh using 1 <;> omega

lemma invariant_positive (f : Frame) (hi : FrameInvariant f) :
    1 ≤ f.hi.a ∧ 1 ≤ f.mid.a ∧ 2 ≤ f.mid.b := by
  have hd := hi.det
  have hh : 1 ≤ f.hi.a := by
    by_contra hn
    have hz : f.hi.a=0 := by omega
    rw [hz] at hd
    have hn0 : (0:ℤ) ≤ (f.lo.a:ℤ)*(f.hi.b:ℤ) := by positivity
    simp only [Nat.cast_zero, mul_zero, zero_sub] at hd
    omega
  have ha := hi.sum_a
  have hb := hi.sum_b
  have hl := hi.lo_pos
  have hr := hi.hi_pos
  omega

def FrameSecond (f : Frame) : Prop :=
  LabelSecond f.lo ∧ LabelSecond f.mid ∧ LabelSecond f.hi ∧
    (f.lo.a=0 → f.lo.b=1 ∧ f.lo.p=1)

lemma initial_second : FrameSecond initial := by
  refine ⟨?_, ?_, ?_, ?_⟩
  · intro ha hb
    have : 1 ≤ (0:ℕ) := ha
    omega
  · intro ha hb
    change Below (((U+V)^2+U)-(U+V)^2-(subleadingLinear 1 2*(U+V)^0)) 1
    have hh : ((U+V)^2+U)-(U+V)^2-(subleadingLinear 1 2*(U+V)^0)=0 := by
      simp [subleadingLinear]
    rw [hh]
    intro i j hij
    simp [coeff]
  · intro ha hb
    change Below ((U+V)-(U+V)^1-(subleadingLinear 1 1*(U+V)^0)) 0
    simp only [subleadingLinear, Nat.sub_self, Nat.cast_zero, zero_smul, add_zero,
      zero_mul, pow_one, sub_self, sub_zero]
    intro i j hij
    simp [coeff]
  · intro hz
    exact ⟨rfl,rfl⟩

lemma advance_second (f : Frame) (hi : FrameInvariant f) (hb : FrameBound f)
    (ht : FrameTop f) (hs : FrameSecond f) (r : Bool) : FrameSecond (advance f r) := by
  rcases hs with ⟨sl,sm,sh,hz⟩
  have hp := invariant_positive f hi
  have hma := hp.2.1
  have hmb := hp.2.2
  have hla := hi.lo_le
  have hlb := hi.lo_pos
  have hhb := hi.hi_pos
  cases r <;> simp only [advance, Bool.false_eq_true, ↓reduceIte, FrameSecond]
  · refine ⟨sl, ?_, sm, hz⟩
    intro ha hb'
    by_cases hl : f.lo.a=0
    · rcases hz hl with ⟨hl1,hlp⟩
      have hdet := hi.det
      rw [hl,hl1] at hdet
      have hha : f.hi.a=1 := by norm_num at hdet; exact_mod_cast hdet
      have hma1 : f.mid.a=1 := by have := hi.sum_a; omega
      have hmb1 : f.mid.b=f.hi.b+1 := by have := hi.sum_b; omega
      have hm := sm hma (by omega)
      have hqn : 1+f.hi.b-1=f.mid.b-1 := by omega
      have hqn' : TopForm f.hi.p (f.mid.b-1) := by
        have hh : TopForm f.hi.p (f.hi.a+f.hi.b-1) := ht.2.2
        simpa only [hha,hqn] using hh
      have hpn : SecondForm f.mid.p f.mid.b
          (((f.mid.b-1:ℕ):ℤ) • U*(U+V)^(f.mid.b-2)) := by
        simpa [hma1, subleadingLinear, Nat.add_sub_cancel_left] using hm
      have htn : TopForm f.mid.p f.mid.b := by
        have hh : TopForm f.mid.p (f.mid.a+f.mid.b-1) := ht.2.1
        simpa only [hma1, Nat.add_sub_cancel_left] using hh
      have hbn : SupportBound f.mid.p f.mid.b := by
        have hh : SupportBound f.mid.p (f.mid.a+f.mid.b-1) := hb.2.1
        simpa only [hma1, Nat.add_sub_cancel_left] using hh
      have hh := second_zero_endpoint f.mid.p f.hi.p f.mid.b hmb hpn htn hbn hqn'
      change SecondForm _ _ _
      have he : 1+f.mid.b-2=f.mid.b-1 := by omega
      simpa [hl,hl1,hlp,hma1, subleadingLinear, Nat.add_sub_cancel_left, he, Nat.add_comm] using hh
    · have hh := second_positive_mutation f.lo f.mid f.hi (by omega) (by omega)
        hma (by omega) (by omega) hi.sum_a hi.sum_b sl sm ht.1 ht.2.1 hb.1 hb.2.1 hb.2.2
      exact hh
  · refine ⟨sm, ?_, sh, ?_⟩
    · intro ha hb'
      change SecondForm (S*f.hi.p*f.mid.p-U^f.hi.a*V^f.hi.b*f.lo.p)
        (f.mid.a+f.hi.a+(f.mid.b+f.hi.b)-1)
        (subleadingLinear (f.mid.a+f.hi.a) (f.mid.b+f.hi.b)*
          (U+V)^(f.mid.a+f.hi.a+(f.mid.b+f.hi.b)-1-2))
      have hh := second_positive_mutation f.hi f.mid f.lo hp.1 (by omega) hma (by omega) (by omega)
        (by have hh := hi.sum_a; omega) (by have hh := hi.sum_b; omega)
        sh sm ht.2.2 ht.2.1 hb.2.2 hb.2.1 hb.1
      simpa only [Nat.add_comm] using hh
    · intro hm0
      have : f.mid.a=0 := hm0
      omega

theorem frame_second (path : List Bool) : FrameSecond (frame path) := by
  induction path using List.reverseRecOn with
  | nil => exact initial_second
  | append_singleton p r ih =>
      simpa only [frame, List.foldl_append, List.foldl_cons, List.foldl_nil] using
        advance_second (frame p) (frame_invariant p) (frame_support_bound p) (frame_top p) ih r

theorem middle_second (path : List Bool) :
    let m := (frame path).mid
    SecondForm m.p (m.a+m.b-1)
      (subleadingLinear m.a m.b*(U+V)^(m.a+m.b-1-2)) := by
  have hp := invariant_positive (frame path) (frame_invariant path)
  exact (frame_second path).2.1 hp.2.1 (by omega)

lemma binomial_off_degree (d i j : ℕ) (h : i+j ≠ d) :
    coeff ((U+V)^d) i j = 0 := by
  unfold coeff U V
  rw [Polynomial.coeff_X_add_C_pow]
  rw [← Polynomial.C_eq_natCast, Polynomial.coeff_mul_C]
  by_cases hi : d < i
  · simp [Nat.choose_eq_zero_of_lt hi]
  · have hj : d-i ≠ j := by omega
    simp [Polynomial.coeff_X_pow, hj, Ne.symm hj]

lemma SecondForm.coefficient {P A : BiPoly} {d : ℕ} (hp : SecondForm P d A)
    (hd : 1 ≤ d) (i j : ℕ) (h : i+j=d-1) : coeff P i j = coeff A i j := by
  have hh := hp i j (by omega)
  simp only [coeff, Polynomial.coeff_sub] at hh
  change coeff P i j - coeff ((U+V)^d) i j - coeff A i j = 0 at hh
  rw [binomial_off_degree d i j (by omega)] at hh
  exact sub_eq_zero.mp (by simpa only [sub_zero] using hh)

def TotalHomogeneous (P : BiPoly) (n : ℕ) : Prop :=
  ∀ i j, i+j ≠ n → coeff P i j = 0

lemma TotalHomogeneous.mul {P Q : BiPoly} {d e : ℕ}
    (hp : TotalHomogeneous P d) (hq : TotalHomogeneous Q e) :
    TotalHomogeneous (P*Q) (d+e) := by
  intro i j hij
  simp only [coeff, Polynomial.coeff_mul, Polynomial.finsetSum_coeff]
  apply Finset.sum_eq_zero
  intro ab hab
  apply Finset.sum_eq_zero
  intro cd hcd
  have ha := Finset.HasAntidiagonal.mem_antidiagonal.mp hab
  have hc := Finset.HasAntidiagonal.mem_antidiagonal.mp hcd
  change coeff P ab.1 cd.1 * coeff Q ab.2 cd.2 = 0
  by_cases hh : ab.1+cd.1=d
  · rw [hq _ _ (by omega), mul_zero]
  · rw [hp _ _ hh, zero_mul]

lemma subleadingLinear_homogeneous (a b : ℕ) :
    TotalHomogeneous (subleadingLinear a b) 1 := by
  intro i j hij
  simp only [subleadingLinear, coeff, Polynomial.coeff_add, Polynomial.coeff_smul,
    smul_eq_mul]
  have hu : coeff U i j = 0 := by
    simp only [coeff, U, Polynomial.coeff_X]
    split_ifs with h
    · have hj : j ≠ 0 := by omega
      simp [Polynomial.coeff_one, hj]
    · simp
  have hv : coeff V i j = 0 := by
    simp only [coeff, V, Polynomial.coeff_C]
    split_ifs with h
    · have hj : j ≠ 1 := by omega
      simp [Polynomial.coeff_X, hj, Ne.symm hj]
    · simp
  change ((b-1:ℕ):ℤ) * coeff U i j + ((a-1:ℕ):ℤ) * coeff V i j = 0
  rw [hu,hv,mul_zero,mul_zero,add_zero]

def totalComponent (P : BiPoly) (n : ℕ) : BiPoly :=
  ∑ ij ∈ Finset.HasAntidiagonal.antidiagonal n,
    Polynomial.monomial ij.1 (Polynomial.monomial ij.2 (coeff P ij.1 ij.2))

lemma totalComponent_coeff (P : BiPoly) (n i j : ℕ) :
    coeff (totalComponent P n) i j = if i+j=n then coeff P i j else 0 := by
  classical
  simp only [totalComponent, coeff, Polynomial.finsetSum_coeff]
  by_cases hsum : i+j=n
  · rw [if_pos hsum, Finset.sum_eq_single (i,j)]
    · simp
    · intro ab hab hne
      by_cases h1 : ab.1=i
      · have h2 : ab.2 ≠ j := by intro hh; apply hne; exact Prod.ext h1 hh
        simp [Polynomial.coeff_monomial, h1, h2]
      · simp [Polynomial.coeff_monomial, h1]
    · intro hnot
      exact False.elim (hnot (Finset.HasAntidiagonal.mem_antidiagonal.mpr hsum))
  · rw [if_neg hsum]
    apply Finset.sum_eq_zero
    intro ab hab
    have hh := Finset.HasAntidiagonal.mem_antidiagonal.mp hab
    by_cases h1 : ab.1=i
    · have h2 : ab.2 ≠ j := by omega
      simp [Polynomial.coeff_monomial, h1, h2]
    · simp [Polynomial.coeff_monomial, h1]

lemma totalComponent_eq_of_coeff (P A : BiPoly) (n : ℕ)
    (ha : TotalHomogeneous A n)
    (hp : ∀ i j, i+j=n → coeff P i j = coeff A i j) :
    totalComponent P n = A := by
  apply Polynomial.ext
  intro i
  apply Polynomial.ext
  intro j
  change coeff (totalComponent P n) i j = coeff A i j
  rw [totalComponent_coeff]
  split_ifs with h
  · exact hp i j h
  · exact (ha i j h).symm

theorem middle_subleading_component (path : List Bool) :
    let m := (frame path).mid
    let d := m.a+m.b-1
    totalComponent m.p (d-1) = subleadingLinear m.a m.b*(U+V)^(d-2) := by
  have hpos := invariant_positive (frame path) (frame_invariant path)
  have hd : 2 ≤ (frame path).mid.a+(frame path).mid.b-1 := by omega
  apply totalComponent_eq_of_coeff
  · have hh := (subleadingLinear_homogeneous (frame path).mid.a (frame path).mid.b).mul
      (binomial_off_degree ((frame path).mid.a+(frame path).mid.b-1-2))
    convert hh using 1 <;> omega
  · intro i j hij
    exact (middle_second path).coefficient (by omega) i j hij

end
end MathGKM.Markov
