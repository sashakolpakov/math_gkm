import MarkovCutCertificate0MFEE
import MarkovCutCertificate1MFEE
/-! Machine-authored fee405c8. Exact rational forms for the h=t cut. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 12000000
set_option maxRecDepth 8192

def cutBaseMFEE (j t : ℚ) : ℚ := liftWeightMAE9 j t 0/liftDenMAE9 t 0
def cutNext0MFEE (j t : ℚ) : ℚ :=
 (t+j+4)*liftWeightMAE9 j (t+1) 0/((t+4)*liftDenMAE9 (t+1) 0)
def cutNext1MFEE (j t : ℚ) : ℚ :=
 j*(t+j+4)*liftWeightMAE9 j (t+1) 1/((t+4)*liftDenMAE9 (t+1) 1)
def cutLast1MFEE (j t : ℚ) : ℚ :=
 j*(t+j+4)*(t+j+5)*liftWeightMAE9 j (t+2) 1/
 ((t+4)*(t+5)*liftDenMAE9 (t+2) 1)
def cutLast2MFEE (j t : ℚ) : ℚ :=
 j*(j-1)*(t+j+4)*(t+j+5)*liftWeightMAE9 j (t+2) 2/
 (2*(t+4)*(t+5)*liftDenMAE9 (t+2) 2)

theorem cut_rational_zeroMFEE (t s : ℚ) (ht : 0 ≤ t) (hs : 0 ≤ s) :
 cutBaseMFEE (s+2) t*cutLast2MFEE (s+2) t ≤ cutNext1MFEE (s+2) t^2 := by
 let D := 2*(t+4)^2*(t+5)*(liftDenMAE9 (t+1) 1)^2*liftDenMAE9 t 0*liftDenMAE9 (t+2) 2
 have hd : 0 < D := by dsimp [D,liftDenMAE9]; positivity
 have he : D*(cutNext1MFEE (s+2) t^2-cutBaseMFEE (s+2) t*cutLast2MFEE (s+2) t)=
   cutCertificate0MFEE t s := by
   rw [←cut_certificate_identity0MFEE]
   dsimp [D,cutNext1MFEE,cutBaseMFEE,cutLast2MFEE]
   unfold liftDenMAE9
   have h4 : t+4≠0 := ne_of_gt (by linarith)
   have h5 : t+5≠0 := ne_of_gt (by linarith)
   have h6 : t+6≠0 := ne_of_gt (by linarith)
   have h7 : t+7≠0 := ne_of_gt (by linarith)
   have h8 : t+8≠0 := ne_of_gt (by linarith)
   have h9 : t+9≠0 := ne_of_gt (by linarith)
   simp only [show t+1+1+4=t+6 by ring,show t+1+1+5=t+7 by ring,
     show t+0+4=t+4 by ring,show t+0+5=t+5 by ring,
     show t+2+2+4=t+8 by ring,show t+2+2+5=t+9 by ring]
   field_simp
   <;> ring
 have hp := cut_certificate_nonneg0MFEE t s ht hs
 have hh : 0 ≤ cutNext1MFEE (s+2) t^2-cutBaseMFEE (s+2) t*cutLast2MFEE (s+2) t := by
   exact (mul_nonneg_iff_of_pos_left hd).mp (he.symm ▸ hp)
 exact sub_nonneg.mp hh

theorem cut_rational_oneMFEE (t s : ℚ) (ht : 0 ≤ t) (hs : 0 ≤ s) :
 cutBaseMFEE (s+2) t*cutLast1MFEE (s+2) t ≤
   2*cutNext1MFEE (s+2) t*cutNext0MFEE (s+2) t := by
 let D := (t+4)^2*(t+5)*liftDenMAE9 (t+1) 1*liftDenMAE9 (t+1) 0*
   liftDenMAE9 t 0*liftDenMAE9 (t+2) 1
 have hd : 0 < D := by dsimp [D,liftDenMAE9]; positivity
 have he : D*(2*cutNext1MFEE (s+2) t*cutNext0MFEE (s+2) t-
   cutBaseMFEE (s+2) t*cutLast1MFEE (s+2) t)=cutCertificate1MFEE t s := by
   rw [←cut_certificate_identity1MFEE]
   dsimp [D,cutNext1MFEE,cutNext0MFEE,cutBaseMFEE,cutLast1MFEE]
   unfold liftDenMAE9
   have h4 : t+4≠0 := ne_of_gt (by linarith)
   have h5 : t+5≠0 := ne_of_gt (by linarith)
   have h6 : t+6≠0 := ne_of_gt (by linarith)
   have h7 : t+7≠0 := ne_of_gt (by linarith)
   have h8 : t+8≠0 := ne_of_gt (by linarith)
   simp only [show t+1+1+4=t+6 by ring,show t+1+1+5=t+7 by ring,
     show t+1+0+4=t+5 by ring,show t+1+0+5=t+6 by ring,
     show t+0+4=t+4 by ring,show t+0+5=t+5 by ring,
     show t+2+1+4=t+7 by ring,show t+2+1+5=t+8 by ring]
   field_simp
   <;> ring
 have hp := cut_certificate_nonneg1MFEE t s ht hs
 have hh : 0 ≤ 2*cutNext1MFEE (s+2) t*cutNext0MFEE (s+2) t-
   cutBaseMFEE (s+2) t*cutLast1MFEE (s+2) t := by
   exact (mul_nonneg_iff_of_pos_left hd).mp (he.symm ▸ hp)
 exact sub_nonneg.mp hh

end
end MathGKM.Markov
