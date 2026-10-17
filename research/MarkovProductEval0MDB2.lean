import MarkovProduct0S21MDB2
import MarkovDenseTransportMDB2
/-! Machine-authored db238071. No numerical experiment is used as a proof. -/
namespace MathGKM.Markov
noncomputable section
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
attribute [local irreducible] devalMC9F
theorem prod0s19_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod0s19MDB2 = devalMC9F 4 v dp0s18MC9F * devalMC9F 4 v df36MC9F :=
 dense_mul_transportMDB2 4 dp0s18MC9F df36MC9F prod0s19MDB2 prod0s19_eqMDB2 v
theorem prod0s20_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod0s20MDB2 = devalMC9F 4 v prod0s19MDB2 * devalMC9F 4 v df37MC9F :=
 dense_mul_transportMDB2 4 prod0s19MDB2 df37MC9F prod0s20MDB2 prod0s20_eqMDB2 v
theorem prod0s21_evalMDB2 (v : ℕ → ℚ) : devalMC9F 4 v prod0s21MDB2 = devalMC9F 4 v prod0s20MDB2 * devalMC9F 4 v df31MC9F :=
 dense_mul_transportMDB2 4 prod0s20MDB2 df31MC9F prod0s21MDB2 prod0s21_eqMDB2 v
theorem product0_evalMDB2 (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) prod0s21MDB2 = pf0MAD5 T x g z*pf2MAD5 T x g z*pf3MAD5 T x g z*pf16MAD5 T x g z*pf5MAD5 T x g z*pf17MAD5 T x g z*pf32MAD5 T x g z*pf34MAD5 T x g z*pf24MAD5 T x g z*pf25MAD5 T x g z*pf28MAD5 T x g z*pf29MAD5 T x g z*pf0MAD5 T x g z*pf2MAD5 T x g z*pf33MAD5 T x g z*pf30MAD5 T x g z*pf16MAD5 T x g z*pf26MAD5 T x g z*pf5MAD5 T x g z*pf36MAD5 T x g z*pf37MAD5 T x g z*pf31MAD5 T x g z := by
 simp only [prod0s21_evalMDB2,prod0s20_evalMDB2,prod0s19_evalMDB2,dp0s18MC9F_evalMC9F,dp0s17MC9F_evalMC9F,dp0s16MC9F_evalMC9F,dp0s15MC9F_evalMC9F,dp0s14MC9F_evalMC9F,dp0s13MC9F_evalMC9F,dp0s12MC9F_evalMC9F,dp0s11MC9F_evalMC9F,dp0s10MC9F_evalMC9F,dp0s9MC9F_evalMC9F,dp0s8MC9F_evalMC9F,dp0s7MC9F_evalMC9F,dp0s6MC9F_evalMC9F,dp0s5MC9F_evalMC9F,dp0s4MC9F_evalMC9F,dp0s3MC9F_evalMC9F,dp0s2MC9F_evalMC9F,dp0s1MC9F_evalMC9F,df0_evalMC9F,df1_evalMC9F,df2_evalMC9F,df3_evalMC9F,df4_evalMC9F,df5_evalMC9F,df6_evalMC9F,df7_evalMC9F,df8_evalMC9F,df9_evalMC9F,df10_evalMC9F,df11_evalMC9F,df12_evalMC9F,df13_evalMC9F,df14_evalMC9F,df15_evalMC9F,df16_evalMC9F,df17_evalMC9F,df18_evalMC9F,df19_evalMC9F,df20_evalMC9F,df21_evalMC9F,df22_evalMC9F,df23_evalMC9F,df24_evalMC9F,df25_evalMC9F,df26_evalMC9F,df27_evalMC9F,df28_evalMC9F,df29_evalMC9F,df30_evalMC9F,df31_evalMC9F,df32_evalMC9F,df33_evalMC9F,df34_evalMC9F,df35_evalMC9F,df36_evalMC9F,df37_evalMC9F]
end
end MathGKM.Markov
