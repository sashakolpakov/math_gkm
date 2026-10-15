import MarkovFullThird000FA
import MarkovFullThird001FA
import MarkovFullThird010FA
import MarkovFullThird011FA
import MarkovFullThird100FA
import MarkovFullThird101FA
import MarkovFullThird110FA
import MarkovFullThird111FA
import MarkovFullFour0000FA
import MarkovFullFour0001FA
import MarkovFullFour0010FA
import MarkovFullFour0011FA
import MarkovFullFour0100FA
import MarkovFullFour0101FA
import MarkovFullFour0110FA
import MarkovFullFour0111FA
import MarkovFullFour1000FA
import MarkovFullFour1001FA
import MarkovFullFour1010FA
import MarkovFullFour1011FA
import MarkovFullFour1100FA
import MarkovFullFour1101FA
import MarkovFullFour1110FA
import MarkovFullFour1111FA
/-! Machine-authored fa9eb434. Exact algebraic source bridge; no LC claim. -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 16384
set_option linter.unusedSimpArgs false

def fullThirdFA {A : Type*} [CommRing A] (N Z x : A) (p q r : Bool) : A :=
 match p,q,r with
 | false,false,false => fullThird000FA N Z x
 | false,false,true => fullThird001FA N Z x
 | false,true,false => fullThird010FA N Z x
 | false,true,true => fullThird011FA N Z x
 | true,false,false => fullThird100FA N Z x
 | true,false,true => fullThird101FA N Z x
 | true,true,false => fullThird110FA N Z x
 | true,true,true => fullThird111FA N Z x

theorem fullThird_eqFA {A : Type*} [CommRing A] (N Z x : A) :
 localThirdNumBC N Z x=fullThirdFA N Z x := by
 funext p q r
 cases p <;> cases q <;> cases r
 · exact fullThird000FA_eq N Z x
 · exact fullThird001FA_eq N Z x
 · exact fullThird010FA_eq N Z x
 · exact fullThird011FA_eq N Z x
 · exact fullThird100FA_eq N Z x
 · exact fullThird101FA_eq N Z x
 · exact fullThird110FA_eq N Z x
 · exact fullThird111FA_eq N Z x

def fullFourFA {A : Type*} [CommRing A] (N Z x : A) (p q r s : Bool) : A :=
 match p,q,r,s with
 | false,false,false,false => fullFour0000FA N Z x
 | false,false,false,true => fullFour0001FA N Z x
 | false,false,true,false => fullFour0010FA N Z x
 | false,false,true,true => fullFour0011FA N Z x
 | false,true,false,false => fullFour0100FA N Z x
 | false,true,false,true => fullFour0101FA N Z x
 | false,true,true,false => fullFour0110FA N Z x
 | false,true,true,true => fullFour0111FA N Z x
 | true,false,false,false => fullFour1000FA N Z x
 | true,false,false,true => fullFour1001FA N Z x
 | true,false,true,false => fullFour1010FA N Z x
 | true,false,true,true => fullFour1011FA N Z x
 | true,true,false,false => fullFour1100FA N Z x
 | true,true,false,true => fullFour1101FA N Z x
 | true,true,true,false => fullFour1110FA N Z x
 | true,true,true,true => fullFour1111FA N Z x

theorem fullFour_eqFA {A : Type*} [CommRing A] (N Z x : A) :
 localFourNumBC N Z x=fullFourFA N Z x := by
 funext p q r s
 cases p <;> cases q <;> cases r <;> cases s
 · exact fullFour0000FA_eq N Z x
 · exact fullFour0001FA_eq N Z x
 · exact fullFour0010FA_eq N Z x
 · exact fullFour0011FA_eq N Z x
 · exact fullFour0100FA_eq N Z x
 · exact fullFour0101FA_eq N Z x
 · exact fullFour0110FA_eq N Z x
 · exact fullFour0111FA_eq N Z x
 · exact fullFour1000FA_eq N Z x
 · exact fullFour1001FA_eq N Z x
 · exact fullFour1010FA_eq N Z x
 · exact fullFour1011FA_eq N Z x
 · exact fullFour1100FA_eq N Z x
 · exact fullFour1101FA_eq N Z x
 · exact fullFour1110FA_eq N Z x
 · exact fullFour1111FA_eq N Z x
end
end MathGKM.Markov
