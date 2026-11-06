/- Machine-authored round-9 prospective trial; ordinary proof candidates. -/
import MathGKM.Markov
open MathGKM.Markov
noncomputable section
set_option maxHeartbeats 2000000
namespace FareyR9
 theorem xcorner (c d a b i j : ℕ) (hd : 0<d) (hb : 0<b)
    (hcross : b*c<a*d) (hp : d*c≤d*i+c*j) :
    b*c≤b*i+a*j ∧ (b*i+a*j=b*c → i=c ∧ j=0) := by
  have hmul := Nat.mul_le_mul_left b hp
  have hcrossj := Nat.mul_le_mul_right j (Nat.le_of_lt hcross)
  have lower : b*c≤b*i+a*j := by nlinarith
  refine ⟨lower,?_⟩
  intro he
  have hj : j=0 := by
    by_contra hn
    have hstrict := Nat.mul_lt_mul_of_pos_right hcross (by omega : 0<j)
    nlinarith
  subst j
  simp only [mul_zero,add_zero] at he
  exact ⟨by nlinarith,rfl⟩
 theorem ycorner (c d a b i j : ℕ) (hc : 0<c) (ha : 0<a)
    (hcross : a*d<b*c) (hp : d*c≤d*i+c*j) :
    a*d≤b*i+a*j ∧ (b*i+a*j=a*d → i=0 ∧ j=d) := by
  have h := xcorner d c b a j i hc ha hcross (by nlinarith)
  constructor
  · nlinarith [h.1]
  · intro he
    have hh := h.2 (by nlinarith)
    exact ⟨hh.2,hh.1⟩

def mono (x y : ℕ) : BiPoly := Polynomial.monomial x (Polynomial.monomial y 1)
def Lowest (P : BiPoly) (a b x y : ℕ) : Prop :=
  coeff P x y=1 ∧ ∀ i j, coeff P i j≠0 →
    b*x+a*y≤b*i+a*j ∧ (b*i+a*j=b*x+a*y → i=x ∧ j=y)
theorem mono_coeff (x y i j : ℕ) : coeff (mono x y) i j =
    if i=x ∧ j=y then 1 else 0 := by
  simp only [mono,coeff,Polynomial.coeff_monomial]
  split_ifs <;> simp_all [Polynomial.coeff_monomial,eq_comm]
theorem lowest_mul (P Q : BiPoly) (a b x y z t : ℕ)
    (hp : Lowest P a b x y) (hq : Lowest Q a b z t) :
    Lowest (P*Q) a b (x+z) (y+t) := by
  classical
  have low (i j : ℕ) (hij : b*i+a*j≤b*(x+z)+a*(y+t)) :
      coeff (P*Q) i j=coeff (mono (x+z) (y+t)) i j := by
    have hm : mono (x+z) (y+t)=mono x y*mono z t := by
      simp [mono,Polynomial.monomial_mul_monomial]
    rw [hm]
    dsimp [coeff]
    simp only [Polynomial.coeff_mul,Polynomial.finsetSum_coeff]
    apply Finset.sum_congr rfl
    intro uv huv
    apply Finset.sum_congr rfl
    intro st hst
    change coeff P uv.1 st.1*coeff Q uv.2 st.2 =
      coeff (mono x y) uv.1 st.1*coeff (mono z t) uv.2 st.2
    have hu := Finset.HasAntidiagonal.mem_antidiagonal.mp huv
    have hs := Finset.HasAntidiagonal.mem_antidiagonal.mp hst
    by_cases ep : uv.1=x ∧ st.1=y
    · by_cases eq : uv.2=z ∧ st.2=t
      · rcases ep with ⟨ep1,ep2⟩
        rcases eq with ⟨eq1,eq2⟩
        simp [ep1,ep2,eq1,eq2,hp.1,hq.1,mono_coeff]
      · have hz : coeff Q uv.2 st.2=0 := by
          by_contra hn
          have h := hq.2 _ _ hn
          have he : b*uv.2+a*st.2=b*z+a*t := by
            rcases ep with ⟨ep1,ep2⟩
            nlinarith
          exact eq (h.2 he)
        simp [hz,mono_coeff,eq]
    · by_cases hz : coeff P uv.1 st.1=0
      · simp [hz,mono_coeff,ep]
      · have hzq : coeff Q uv.2 st.2=0 := by
          by_contra hn
          have hp0 := hp.2 _ _ hz
          have hq0 := hq.2 _ _ hn
          have he : b*uv.1+a*st.1=b*x+a*y := by nlinarith
          exact ep (hp0.2 he)
        simp [hzq,mono_coeff,ep]
  constructor
  · simpa [mono_coeff] using low (x+z) (y+t) le_rfl
  · intro i j hn
    have hb : b*(x+z)+a*(y+t)≤b*i+a*j := by
      by_contra h
      have hh := low i j (by omega)
      have he : ¬(i=x+z ∧ j=y+t) := by rintro ⟨rfl,rfl⟩; omega
      simp [mono_coeff,he] at hh
      exact hn hh
    refine ⟨hb,?_⟩
    intro he
    have hh := low i j (by omega)
    by_contra hne
    simp [mono_coeff,hne] at hh
    exact hn hh

theorem xlowest (E : Label) (a b : ℕ) (hd : 0<E.b) (hb : 0<b)
    (hc : b*E.a<a*E.b)
    (hsp : ∀ i j, ¬InPolygon E.a E.b i j → coeff E.p i j=0)
    (hcorn : coeff E.p E.a 0=1) : Lowest E.p a b E.a 0 := by
  refine ⟨hcorn,?_⟩
  intro i j hn
  have hin : InPolygon E.a E.b i j := by
    by_contra h
    exact hn (hsp _ _ h)
  simpa using xcorner E.a E.b a b i j hd hb hc (by nlinarith [hin.1])
theorem ylowest (E : Label) (a b : ℕ) (hd : 0<E.a) (ha : 0<a)
    (hc : a*E.b<b*E.a)
    (hsp : ∀ i j, ¬InPolygon E.a E.b i j → coeff E.p i j=0)
    (hcorn : coeff E.p 0 E.b=1) : Lowest E.p a b 0 E.b := by
  refine ⟨hcorn,?_⟩
  intro i j hn
  have hin : InPolygon E.a E.b i j := by
    by_contra h
    exact hn (hsp _ _ h)
  simpa using ycorner E.a E.b a b i j hd ha hc (by nlinarith [hin.1])
theorem lowestS (a b : ℕ) (ha : 0<a) (hb : 0<b) : Lowest S a b 0 0 := by
  constructor
  · norm_num [coeff,S,U,V]
  · intro i j hn
    refine ⟨by simp,?_⟩
    intro he
    simp only [mul_zero,add_zero] at he
    exact ⟨by nlinarith,by nlinarith⟩
theorem lowestMono (a b x y : ℕ) : Lowest (U^x*V^y) a b x y := by
  have hm : U^x*V^y=mono x y := by
    simp [U,V,mono,Polynomial.X_pow_eq_monomial,← Polynomial.C_pow,
      Polynomial.monomial_mul_C]
  rw [hm]
  refine ⟨by simp [mono_coeff],?_⟩
  intro i j hn
  have he : i=x ∧ j=y := by
    by_contra h
    simp [mono_coeff,h] at hn
  rcases he with ⟨rfl,rfl⟩
  exact ⟨le_rfl,fun _ => ⟨rfl,rfl⟩⟩
theorem below (P : BiPoly) (a b x y : ℕ) (hp : Lowest P a b x y)
    (he : b*x+a*y+1=a*b) :
    ∀ i j, b*i+a*j<a*b → coeff P i j=if i=x ∧ j=y then 1 else 0 := by
  intro i j hij
  by_cases hc : i=x ∧ j=y
  · rcases hc with ⟨rfl,rfl⟩
    simp [hp.1]
  · rw [if_neg hc]
    by_contra hn
    have h := hp.2 i j hn
    exact hc (h.2 (by omega))
theorem conditional (f : Frame)
    (hsuma : f.mid.a=f.lo.a+f.hi.a) (hsumb : f.mid.b=f.lo.b+f.hi.b)
    (hdet : f.hi.a*f.lo.b=f.lo.a*f.hi.b+1)
    (hlb : 0<f.lo.b) (hhb : 0<f.hi.b)
    (hli : f.lo.a<f.lo.b) (hhi : f.hi.a≤f.hi.b) (hha : 0<f.hi.a)
    (hep : f.lo.a=0 → f.lo=⟨0,1,1⟩)
    (hsp : ∀ E ∈ [f.lo,f.mid,f.hi], ∀ i j,
      ¬InPolygon E.a E.b i j → coeff E.p i j=0)
    (hx : ∀ E ∈ [f.lo,f.mid,f.hi], coeff E.p E.a 0=1)
    (hy : ∀ E ∈ [f.lo,f.mid,f.hi], 0<E.a → coeff E.p 0 E.b=1) :
    ∀ branch : Bool,
    let F := if branch then f.hi else f.lo;
    let O := if branch then f.lo else f.hi;
    let Q := (advance f branch).mid;
    let e := if branch then (f.mid.a,f.hi.b) else (f.lo.a,f.mid.b);
    Q.b*e.1+Q.a*e.2+1=Q.a*Q.b ∧
    (∀ i j, Q.b*i+Q.a*j<Q.a*Q.b →
      coeff (S*F.p*f.mid.p) i j=(if i=e.1 ∧ j=e.2 then 1 else 0) ∧
      coeff (U^F.a*V^F.b*O.p) i j=(if i=e.1 ∧ j=e.2 then 1 else 0) ∧
      coeff Q.p i j=0) := by
  have hl := hsp f.lo (by simp)
  have hm := hsp f.mid (by simp)
  have hh := hsp f.hi (by simp)
  have hxl := hx f.lo (by simp)
  have hxm := hx f.mid (by simp)
  have hxh := hx f.hi (by simp)
  have hym := hy f.mid (by simp) (by omega : 0<f.mid.a)
  have hyh := hy f.hi (by simp) hha
  intro branch
  cases branch <;> simp only [advance,Bool.false_eq_true,↓reduceIte]
  · let a := f.lo.a+f.mid.a
    let b := f.lo.b+f.mid.b
    have ha : 0<a := by dsimp [a]; omega
    have hb : 0<b := by dsimp [b]; omega
    have c1 : b*f.lo.a<a*f.lo.b := by dsimp [a,b]; nlinarith
    have c2 : a*f.mid.b<b*f.mid.a := by dsimp [a,b]; nlinarith
    have c3 : a*f.hi.b<b*f.hi.a := by dsimp [a,b]; nlinarith
    have l := xlowest f.lo a b hlb hb c1 hl hxl
    have m := ylowest f.mid a b (by omega) ha c2 hm hym
    have h := ylowest f.hi a b hha ha c3 hh hyh
    have al := lowest_mul _ _ a b 0 0 f.lo.a 0 (lowestS a b ha hb) l
    have am := lowest_mul _ _ a b f.lo.a 0 0 f.mid.b (by simpa using al) m
    have bm := lowest_mul _ _ a b f.lo.a f.lo.b 0 f.hi.b (lowestMono a b _ _) h
    have he : b*f.lo.a+a*f.mid.b+1=a*b := by dsimp [a,b]; nlinarith
    have aa := below _ a b f.lo.a f.mid.b (by simpa using am) he
    have bb := below _ a b f.lo.a f.mid.b (by simpa [hsumb] using bm) he
    refine ⟨he,?_⟩
    intro i j hij
    have hA := aa i j hij
    have hB := bb i j hij
    exact ⟨hA,hB,by simp only [coeff,Polynomial.coeff_sub] at *; omega⟩
  · let a := f.mid.a+f.hi.a
    let b := f.mid.b+f.hi.b
    have ha : 0<a := by dsimp [a]; omega
    have hb : 0<b := by dsimp [b]; omega
    have c1 : a*f.hi.b<b*f.hi.a := by dsimp [a,b]; nlinarith
    have c2 : b*f.mid.a<a*f.mid.b := by dsimp [a,b]; nlinarith
    have c3 : b*f.lo.a<a*f.lo.b := by dsimp [a,b]; nlinarith
    have h := ylowest f.hi a b hha ha c1 hh hyh
    have m := xlowest f.mid a b (by omega) hb c2 hm hxm
    have l := xlowest f.lo a b hlb hb c3 hl hxl
    have al := lowest_mul _ _ a b 0 0 0 f.hi.b (lowestS a b ha hb) h
    have am := lowest_mul _ _ a b 0 f.hi.b f.mid.a 0 (by simpa using al) m
    have bm := lowest_mul _ _ a b f.hi.a f.hi.b f.lo.a 0 (lowestMono a b _ _) l
    have he : b*f.mid.a+a*f.hi.b+1=a*b := by dsimp [a,b]; nlinarith
    have aa := below _ a b f.mid.a f.hi.b (by simpa using am) he
    have bb := below _ a b f.mid.a f.hi.b (by simpa [hsuma,Nat.add_comm] using bm) he
    refine ⟨he,?_⟩
    intro i j hij
    have hA := aa i j hij
    have hB := bb i j hij
    exact ⟨hA,hB,by simp only [coeff,Polynomial.coeff_sub] at *; omega⟩


end FareyR9
