import MarkovProduct2S21MDB2
import MarkovDenseTransportMDB2
/-! Machine-authored db238071. No numerical experiment is used as a proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
attribute [local irreducible] devalMC9F
theorem prod2s15_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod2s15MDB2 = devalMC9F 4 v dp2s14MC9F * devalMC9F 4 v df27MC9F :=
 dense_mul_transportMDB2 4 dp2s14MC9F df27MC9F prod2s15MDB2 prod2s15_eqMDB2 v
theorem prod2s16_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod2s16MDB2 = devalMC9F 4 v prod2s15MDB2 * devalMC9F 4 v df0MC9F :=
 dense_mul_transportMDB2 4 prod2s15MDB2 df0MC9F prod2s16MDB2 prod2s16_eqMDB2 v
theorem prod2s17_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod2s17MDB2 = devalMC9F 4 v prod2s16MDB2 * devalMC9F 4 v df2MC9F :=
 dense_mul_transportMDB2 4 prod2s16MDB2 df2MC9F prod2s17MDB2 prod2s17_eqMDB2 v
theorem prod2s18_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod2s18MDB2 = devalMC9F 4 v prod2s17MDB2 * devalMC9F 4 v df33MC9F :=
 dense_mul_transportMDB2 4 prod2s17MDB2 df33MC9F prod2s18MDB2 prod2s18_eqMDB2 v
theorem prod2s19_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod2s19MDB2 = devalMC9F 4 v prod2s18MDB2 * devalMC9F 4 v df16MC9F :=
 dense_mul_transportMDB2 4 prod2s18MDB2 df16MC9F prod2s19MDB2 prod2s19_eqMDB2 v
theorem prod2s20_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod2s20MDB2 = devalMC9F 4 v prod2s19MDB2 * devalMC9F 4 v df26MC9F :=
 dense_mul_transportMDB2 4 prod2s19MDB2 df26MC9F prod2s20MDB2 prod2s20_eqMDB2 v
theorem prod2s21_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod2s21MDB2 = devalMC9F 4 v prod2s20MDB2 * devalMC9F 4 v df5MC9F :=
 dense_mul_transportMDB2 4 prod2s20MDB2 df5MC9F prod2s21MDB2 prod2s21_eqMDB2 v
theorem product2_evalMDB2 (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) prod2s21MDB2 = pf8MAD5 T x g z*pf9MAD5 T x g z*pf10MAD5 T x g z*pf20MAD5 T x g z*pf12MAD5 T x g z*pf21MAD5 T x g z*pf18MAD5 T x g z*pf9MAD5 T x g z*pf32MAD5 T x g z*pf34MAD5 T x g z*pf23MAD5 T x g z*pf24MAD5 T x g z*pf25MAD5 T x g z*pf11MAD5 T x g z*pf12MAD5 T x g z*pf27MAD5 T x g z*pf0MAD5 T x g z*pf2MAD5 T x g z*pf33MAD5 T x g z*pf16MAD5 T x g z*pf26MAD5 T x g z*pf5MAD5 T x g z := by
 simp only [prod2s21_evalMDB2,prod2s20_evalMDB2,prod2s19_evalMDB2,prod2s18_evalMDB2,prod2s17_evalMDB2,prod2s16_evalMDB2,prod2s15_evalMDB2,dp2s14MC9F_evalMC9F,dp2s13MC9F_evalMC9F,dp2s12MC9F_evalMC9F,dp2s11MC9F_evalMC9F,dp2s10MC9F_evalMC9F,dp2s9MC9F_evalMC9F,dp2s8MC9F_evalMC9F,dp2s7MC9F_evalMC9F,dp2s6MC9F_evalMC9F,dp2s5MC9F_evalMC9F,dp2s4MC9F_evalMC9F,dp2s3MC9F_evalMC9F,dp2s2MC9F_evalMC9F,dp2s1MC9F_evalMC9F,df0_evalMC9F,df1_evalMC9F,df2_evalMC9F,df3_evalMC9F,df4_evalMC9F,df5_evalMC9F,df6_evalMC9F,df7_evalMC9F,df8_evalMC9F,df9_evalMC9F,df10_evalMC9F,df11_evalMC9F,df12_evalMC9F,df13_evalMC9F,df14_evalMC9F,df15_evalMC9F,df16_evalMC9F,df17_evalMC9F,df18_evalMC9F,df19_evalMC9F,df20_evalMC9F,df21_evalMC9F,df22_evalMC9F,df23_evalMC9F,df24_evalMC9F,df25_evalMC9F,df26_evalMC9F,df27_evalMC9F,df28_evalMC9F,df29_evalMC9F,df30_evalMC9F,df31_evalMC9F,df32_evalMC9F,df33_evalMC9F,df34_evalMC9F,df35_evalMC9F,df36_evalMC9F,df37_evalMC9F]
end
end MathGKM.Markov
