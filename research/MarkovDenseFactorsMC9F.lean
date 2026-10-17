import MarkovDenseCertificateMC9F
import MarkovFactorBridgeMAD5
/-! Machine-authored c9f23b44. Exact kernel-checked dense certificate. -/
namespace MathGKM.Markov
set_option maxRecDepth 100000
set_option maxHeartbeats 16000000
def df0MC9F : DenseMC9F 4 := [[[[2]],[[1]]],[[[1]]]]
theorem df0_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df0MC9F = pf0MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df0MC9F,pf0MAD5]
 <;> ring
def df1MC9F : DenseMC9F 4 := [[[[7,1]],[[1]]],[[[1]]]]
theorem df1_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df1MC9F = pf1MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df1MC9F,pf1MAD5]
 <;> ring
def df2MC9F : DenseMC9F 4 := [[[[8,1]],[[1]]],[[[1]]]]
theorem df2_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df2MC9F = pf2MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df2MC9F,pf2MAD5]
 <;> ring
def df3MC9F : DenseMC9F 4 := [[[[54,15,1],[28,4],[4]],[[15,2],[4]],[[1]]],[[[15,2],[4]],[[2]]],[[[1]]]]
theorem df3_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df3MC9F = pf3MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df3MC9F,pf3MAD5]
 <;> ring
def df4MC9F : DenseMC9F 4 := [[],[[[1]]]]
theorem df4_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df4MC9F = pf4MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df4MC9F,pf4MAD5]
 <;> ring
def df5MC9F : DenseMC9F 4 := [[[[5,1]]],[[[1]]]]
theorem df5_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df5MC9F = pf5MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df5MC9F,pf5MAD5]
 <;> ring
def df6MC9F : DenseMC9F 4 := [[[[6,1]]],[[[1]]]]
theorem df6_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df6MC9F = pf6MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df6MC9F,pf6MAD5]
 <;> ring
def df7MC9F : DenseMC9F 4 := [[[[84,19,1],[36,4],[4]],[[36,4],[8]],[[4]]],[[[19,2],[4]],[[4]]],[[[1]]]]
theorem df7_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df7MC9F = pf7MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df7MC9F,pf7MAD5]
 <;> ring
def df8MC9F : DenseMC9F 4 := [[[[1]],[[1]]],[[[1]]]]
theorem df8_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df8MC9F = pf8MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df8MC9F,pf8MAD5]
 <;> ring
def df9MC9F : DenseMC9F 4 := [[[[6,1]],[[1]]],[[[1]]]]
theorem df9_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df9MC9F = pf9MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df9MC9F,pf9MAD5]
 <;> ring
def df10MC9F : DenseMC9F 4 := [[[[68,17,1],[32,4],[4]],[[17,2],[4]],[[1]]],[[[17,2],[4]],[[2]]],[[[1]]]]
theorem df10_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df10MC9F = pf10MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df10MC9F,pf10MAD5]
 <;> ring
def df11MC9F : DenseMC9F 4 := [[[[1]]],[[[1]]]]
theorem df11_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df11MC9F = pf11MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df11MC9F,pf11MAD5]
 <;> ring
def df12MC9F : DenseMC9F 4 := [[[[7,1]]],[[[1]]]]
theorem df12_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df12MC9F = pf12MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df12MC9F,pf12MAD5]
 <;> ring
def df13MC9F : DenseMC9F 4 := [[[[68,17,1],[32,4],[4]],[[32,4],[8]],[[4]]],[[[17,2],[4]],[[4]]],[[[1]]]]
theorem df13_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df13MC9F = pf13MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df13MC9F,pf13MAD5]
 <;> ring
def df14MC9F : DenseMC9F 4 := [[[[],[1]]]]
theorem df14_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df14MC9F = pf14MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df14MC9F,pf14MAD5]
 <;> ring
def df15MC9F : DenseMC9F 4 := [[[[58,15,1],[28,4],[4]],[[15,2],[4]],[[1]]],[[[15,2],[4]],[[2]]],[[[1]]]]
theorem df15_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df15MC9F = pf15MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df15MC9F,pf15MAD5]
 <;> ring
def df16MC9F : DenseMC9F 4 := [[[[2],[1]],[[1]]]]
theorem df16_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df16MC9F = pf16MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df16MC9F,pf16MAD5]
 <;> ring
def df17MC9F : DenseMC9F 4 := [[[[88,19,1],[36,4],[4]],[[36,4],[8]],[[4]]],[[[19,2],[4]],[[4]]],[[[1]]]]
theorem df17_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df17MC9F = pf17MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df17MC9F,pf17MAD5]
 <;> ring
def df18MC9F : DenseMC9F 4 := [[[[1],[1]]]]
theorem df18_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df18MC9F = pf18MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df18MC9F,pf18MAD5]
 <;> ring
def df19MC9F : DenseMC9F 4 := [[[[72,17,1],[32,4],[4]],[[17,2],[4]],[[1]]],[[[17,2],[4]],[[2]]],[[[1]]]]
theorem df19_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df19MC9F = pf19MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df19MC9F,pf19MAD5]
 <;> ring
def df20MC9F : DenseMC9F 4 := [[[[1],[1]],[[1]]]]
theorem df20_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df20MC9F = pf20MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df20MC9F,pf20MAD5]
 <;> ring
def df21MC9F : DenseMC9F 4 := [[[[72,17,1],[32,4],[4]],[[32,4],[8]],[[4]]],[[[17,2],[4]],[[4]]],[[[1]]]]
theorem df21_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df21MC9F = pf21MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df21MC9F,pf21MAD5]
 <;> ring
def df22MC9F : DenseMC9F 4 := [[[[5,1]],[[1]]],[[[1]]]]
theorem df22_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df22MC9F = pf22MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df22MC9F,pf22MAD5]
 <;> ring
def df23MC9F : DenseMC9F 4 := [[[[56,15,1],[28,4],[4]],[[15,2],[4]],[[1]]],[[[15,2],[4]],[[2]]],[[[1]]]]
theorem df23_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df23MC9F = pf23MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df23MC9F,pf23MAD5]
 <;> ring
def df24MC9F : DenseMC9F 4 := [[[[3],[1]],[[1]]]]
theorem df24_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df24MC9F = pf24MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df24MC9F,pf24MAD5]
 <;> ring
def df25MC9F : DenseMC9F 4 := [[[[3,1]]],[[[1]]]]
theorem df25_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df25MC9F = pf25MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df25MC9F,pf25MAD5]
 <;> ring
def df26MC9F : DenseMC9F 4 := [[[[4,1]]],[[[1]]]]
theorem df26_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df26MC9F = pf26MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df26MC9F,pf26MAD5]
 <;> ring
def df27MC9F : DenseMC9F 4 := [[[[86,19,1],[36,4],[4]],[[36,4],[8]],[[4]]],[[[19,2],[4]],[[4]]],[[[1]]]]
theorem df27_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df27MC9F = pf27MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df27MC9F,pf27MAD5]
 <;> ring
def df28MC9F : DenseMC9F 4 := [[[[2],[1]]]]
theorem df28_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df28MC9F = pf28MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df28MC9F,pf28MAD5]
 <;> ring
def df29MC9F : DenseMC9F 4 := [[[[4,1]],[[1]]],[[[1]]]]
theorem df29_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df29MC9F = pf29MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df29MC9F,pf29MAD5]
 <;> ring
def df30MC9F : DenseMC9F 4 := [[[[70,17,1],[32,4],[4]],[[17,2],[4]],[[1]]],[[[17,2],[4]],[[2]]],[[[1]]]]
theorem df30_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df30MC9F = pf30MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df30MC9F,pf30MAD5]
 <;> ring
def df31MC9F : DenseMC9F 4 := [[[[70,17,1],[32,4],[4]],[[32,4],[8]],[[4]]],[[[17,2],[4]],[[4]]],[[[1]]]]
theorem df31_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df31MC9F = pf31MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df31MC9F,pf31MAD5]
 <;> ring
def df32MC9F : DenseMC9F 4 := [[[[3]],[[1]]],[[[1]]]]
theorem df32_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df32MC9F = pf32MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df32MC9F,pf32MAD5]
 <;> ring
def df33MC9F : DenseMC9F 4 := [[[[9,1]],[[1]]],[[[1]]]]
theorem df33_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df33MC9F = pf33MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df33MC9F,pf33MAD5]
 <;> ring
def df34MC9F : DenseMC9F 4 := [[[[10,1]],[[1]]],[[[1]]]]
theorem df34_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df34MC9F = pf34MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df34MC9F,pf34MAD5]
 <;> ring
def df35MC9F : DenseMC9F 4 := [[[[8,1]]],[[[1]]]]
theorem df35_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df35MC9F = pf35MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df35MC9F,pf35MAD5]
 <;> ring
def df36MC9F : DenseMC9F 4 := [[[[2]]],[[[1]]]]
theorem df36_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df36MC9F = pf36MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df36MC9F,pf36MAD5]
 <;> ring
def df37MC9F : DenseMC9F 4 := [[[[9,1]]],[[[1]]]]
theorem df37_evalMC9F (x g z T : ℚ) : devalMC9F 4 (fun k => match k with | 0 => x | 1 => g | 2 => z | _ => T) df37MC9F = pf37MAD5 T x g z := by
 norm_num [devalMC9F,denseEvalMC9F,df37MC9F,pf37MAD5]
 <;> ring
end MathGKM.Markov
