import MarkovProduct3S21MDB2
import MarkovDenseTransportMDB2
/-! Machine-authored db238071. No numerical experiment is used as a proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
attribute [local irreducible] devalMC9F
theorem prod3s15_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod3s15MDB2 = devalMC9F 4 v dp3s14MC9F * devalMC9F 4 v df27MC9F :=
 dense_mul_transportMDB2 4 dp3s14MC9F df27MC9F prod3s15MDB2 prod3s15_eqMDB2 v
theorem prod3s16_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod3s16MDB2 = devalMC9F 4 v prod3s15MDB2 * devalMC9F 4 v df28MC9F :=
 dense_mul_transportMDB2 4 prod3s15MDB2 df28MC9F prod3s16MDB2 prod3s16_eqMDB2 v
theorem prod3s17_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod3s17MDB2 = devalMC9F 4 v prod3s16MDB2 * devalMC9F 4 v df29MC9F :=
 dense_mul_transportMDB2 4 prod3s16MDB2 df29MC9F prod3s17MDB2 prod3s17_eqMDB2 v
theorem prod3s18_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod3s18MDB2 = devalMC9F 4 v prod3s17MDB2 * devalMC9F 4 v df22MC9F :=
 dense_mul_transportMDB2 4 prod3s17MDB2 df22MC9F prod3s18MDB2 prod3s18_eqMDB2 v
theorem prod3s19_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod3s19MDB2 = devalMC9F 4 v prod3s18MDB2 * devalMC9F 4 v df36MC9F :=
 dense_mul_transportMDB2 4 prod3s18MDB2 df36MC9F prod3s19MDB2 prod3s19_eqMDB2 v
theorem prod3s20_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod3s20MDB2 = devalMC9F 4 v prod3s19MDB2 * devalMC9F 4 v df35MC9F :=
 dense_mul_transportMDB2 4 prod3s19MDB2 df35MC9F prod3s20MDB2 prod3s20_eqMDB2 v
theorem prod3s21_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod3s21MDB2 = devalMC9F 4 v prod3s20MDB2 * devalMC9F 4 v df37MC9F :=
 dense_mul_transportMDB2 4 prod3s20MDB2 df37MC9F prod3s21MDB2 prod3s21_eqMDB2 v
theorem product3_evalMDB2 (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) prod3s21MDB2 = pf11MAD5 T x g z*pf12MAD5 T x g z*pf13MAD5 T x g z*pf18MAD5 T x g z*pf9MAD5 T x g z*pf19MAD5 T x g z*pf18MAD5 T x g z*pf9MAD5 T x g z*pf32MAD5 T x g z*pf34MAD5 T x g z*pf23MAD5 T x g z*pf24MAD5 T x g z*pf25MAD5 T x g z*pf11MAD5 T x g z*pf12MAD5 T x g z*pf27MAD5 T x g z*pf28MAD5 T x g z*pf29MAD5 T x g z*pf22MAD5 T x g z*pf36MAD5 T x g z*pf35MAD5 T x g z*pf37MAD5 T x g z := by
 simp only [prod3s21_evalMDB2,prod3s20_evalMDB2,prod3s19_evalMDB2,prod3s18_evalMDB2,prod3s17_evalMDB2,prod3s16_evalMDB2,prod3s15_evalMDB2,dp3s14MC9F_evalMC9F,dp3s13MC9F_evalMC9F,dp3s12MC9F_evalMC9F,dp3s11MC9F_evalMC9F,dp3s10MC9F_evalMC9F,dp3s9MC9F_evalMC9F,dp3s8MC9F_evalMC9F,dp3s7MC9F_evalMC9F,dp3s6MC9F_evalMC9F,dp3s5MC9F_evalMC9F,dp3s4MC9F_evalMC9F,dp3s3MC9F_evalMC9F,dp3s2MC9F_evalMC9F,dp3s1MC9F_evalMC9F,df0_evalMC9F,df1_evalMC9F,df2_evalMC9F,df3_evalMC9F,df4_evalMC9F,df5_evalMC9F,df6_evalMC9F,df7_evalMC9F,df8_evalMC9F,df9_evalMC9F,df10_evalMC9F,df11_evalMC9F,df12_evalMC9F,df13_evalMC9F,df14_evalMC9F,df15_evalMC9F,df16_evalMC9F,df17_evalMC9F,df18_evalMC9F,df19_evalMC9F,df20_evalMC9F,df21_evalMC9F,df22_evalMC9F,df23_evalMC9F,df24_evalMC9F,df25_evalMC9F,df26_evalMC9F,df27_evalMC9F,df28_evalMC9F,df29_evalMC9F,df30_evalMC9F,df31_evalMC9F,df32_evalMC9F,df33_evalMC9F,df34_evalMC9F,df35_evalMC9F,df36_evalMC9F,df37_evalMC9F]
end
end MathGKM.Markov
