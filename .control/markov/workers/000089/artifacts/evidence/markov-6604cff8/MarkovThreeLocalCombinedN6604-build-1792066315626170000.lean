import MarkovThreeMoment0N6604
import MarkovThreeMoment1N6604
import MarkovThreeMoment2N6604
import MarkovThreeMoment3N6604
namespace MathGKM.Markov
noncomputable section
theorem runLocalFour_threeN6604 (p q r s : Bool) :
 runLocalFourBE 3 p q r s=threeLocalFourN6604 p q r s := by
 cases p <;> cases q
 · exact runLocalFour_three_0N6604 r s
 · exact runLocalFour_three_1N6604 r s
 · exact runLocalFour_three_2N6604 r s
 · exact runLocalFour_three_3N6604 r s
end
end MathGKM.Markov
