"""Machine-authored generation of explicit Lean proof text, never admission."""
import pathlib
r=pathlib.Path('research')
s=(r/'MarkovQuinticBoundsE582.lean').read_text()
s=s[s.index('theorem quintic_certificateE582'):s.index('#print axioms')]
s=s.replace('quintic_certificateE582','small_quintic_certificateE582').replace('quintic_inequalitiesE582','small_quintic_inequalitiesE582')
a=s.index('theorem small_quintic_inequalitiesE582')
cert=s[:a];proof=s[a:]
cert=cert.replace('(x y : ℝ) (hx : 0 ≤ x) (hy : 0 ≤ y)', '(x : ℝ) (hx : 0 ≤ x) (m : ℕ) (hm : 1 ≤ m) (hm8 : m ≤ 8)')
cert=cert.replace(' let m := x+9\n let n := m+y',' let n := x+18')
cert=cert.replace('(2*y)', '(2*m)').replace(' n m 0 y y 2',' n m 0 (n-m) (n-m) 2').replace(' n m 0 y 0 0 2',' n m 0 (n-m) 0 0 2')
cert=cert.replace('qbE582 n m (2*m) 0 0 0','qbE582 n m (2*m) (n-3*m-2) (n-4*m-3) 0')
cert=cert.replace('qcE582 n m (2*m) 0 (2*m) 2 0','qcE582 n m (2*m) (n-3*m-2) (2*(n-m)) 2 0')
cert=cert.replace(' dsimp\n',' interval_cases m <;> (try simp only [Nat.cast_ofNat])\n all_goals dsimp\n').replace(' unfold qaE582',' all_goals unfold qaE582').replace(" repeat' constructor"," all_goals repeat' constructor")
proof=proof.replace('(n m s t h k e f : ℝ)\n (hm : 9 ≤ m) (hn : m ≤ n)', '(n : ℝ) (m : ℕ) (s t h k e f : ℝ)\n (hm : 1 ≤ m) (hm8 : m ≤ 8) (hn : 18 ≤ n)')
proof=proof.replace('(hsu : s ≤ 2*(n-m))','(hsu : s ≤ 2*m)').replace('(ht : 0 ≤ t)', '(ht : 0 ≤ t) (htl : n-3*m-2 ≤ t)').replace('(hh : 0 ≤ h)', '(hh : 0 ≤ h) (hhl : n-4*m-3 ≤ h)')
start=proof.index(' have cert :=');end=proof.index(' obtain ⟨bl',start)
proof=proof[:start]+''' have cert := small_quintic_certificateE582 (n-18) (by linarith) m hm hm8
 dsimp at cert
 rw [show n-18+18=n by ring] at cert
 have hm1 : (1:ℝ) ≤ m := by exact_mod_cast hm
'''+proof[end:]
proof=proof.replace('qbE582 n m (2*(n-m)) 0 0 0','qbE582 n m (2*m) (n-3*m-2) (n-4*m-3) 0').replace('qcE582 n m (2*(n-m)) 0 (2*(n-m)) 2 0','qcE582 n m (2*m) (n-3*m-2) (2*(n-m)) 2 0').replace('qdE582 n m (2*(n-m))','qdE582 n m (2*m)')
proof=proof.replace('2*(n-m)-s','2*(m:ℝ)-s')
proof=proof.replace('(show 0 ≤ m-1 by linarith) ht]', '(show 0 ≤ (m:ℝ)-1 by linarith) (show 0 ≤ t-(n-3*m-2) by linarith)]')
proof=proof.replace('(show 0 ≤ n-5 by linarith) ht]', '(show 0 ≤ n-5 by linarith) (show 0 ≤ t-(n-3*m-2) by linarith)]')
start=proof.index(' have ap :');end=proof.index(' have bsq',start)
proof=proof[:start]+''' have ap : 0 ≤ qaE582 m := by interval_cases m <;> norm_num [qaE582]
'''+proof[end:]
# Make casts explicit in standalone expressions whose type would otherwise default to Nat.
proof=proof.replace('m^2-3*m+3', '(m:ℝ)^2-3*m+3').replace('0 ≤ m :=', '0 ≤ (m:ℝ) :=').replace('0 ≤ m-1', '0 ≤ (m:ℝ)-1')
head='''import MarkovQuinticBoundsE582
/-! Machine-authored request e5822cfc. Small-count inequalities using lower local-count bounds. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 8000
set_option maxHeartbeats 8000000
'''
generated=head+cert+proof+'#print axioms small_quintic_inequalitiesE582\nend\nend MathGKM.Markov\n'
generated=generated.replace('all_goals dsimp','all_goals try dsimp').replace('sq_nonneg (m-2)','sq_nonneg ((m:ℝ)-2)')
(r/'MarkovSmallQuinticE582.lean').write_text(generated)
