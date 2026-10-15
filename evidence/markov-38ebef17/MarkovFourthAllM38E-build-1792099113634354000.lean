import MarkovSmallRun0M38E
import MarkovSmallRun1M38E
import MarkovSmallRun2M38E
import MarkovSmallRun3M38E
/-! Machine-authored request 38ebef17. Exact short-run fourth slice; no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false
theorem run_fourth_allM38E (n : ℕ) (rest : List Bool)
 (hc : 5≤(frame rest).mid.b) : RunFourthLCM94 n rest := by
 by_cases hn : 4≤n
 · exact run_fourth_ge_fourM8B8 n rest hn hc
 · have hnu : n≤3 := by omega
   interval_cases n
   · exact run_fourth_0M38E rest hc
   · exact run_fourth_1M38E rest hc
   · exact run_fourth_2M38E rest hc
   · exact run_fourth_3M38E rest hc
end
end MathGKM.Markov
