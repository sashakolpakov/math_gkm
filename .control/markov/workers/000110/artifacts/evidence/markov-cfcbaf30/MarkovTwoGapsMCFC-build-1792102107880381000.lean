import MarkovTwoValuesMCFC
/-! Machine-authored request cfcbaf30. Exact small-cycle numerator, no root closure. -/
namespace MathGKM.Markov
noncomputable section
open Polynomial
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536
set_option linter.unusedSimpArgs false

def twoInitial_lcMCFCCert (N Z x : ℤ) : ℤ := ((((((((((((138726604800*x + 2219625676800)*x + 13179027456000)*x + 34404197990400)*x + 34959104409600)*Z + (((((416179814400*x + 11653034803200)*x + 117223981056000)*x + 551022074265600)*x + 1237441314816000)*x + 1118691341107200))*Z + ((((((628893941760*x + 23833230704640)*x + 355255713792000)*x + 2620406838067200)*x + 10167638179184640)*x + 19980959361269760)*x + 16241417256960000))*Z + (((((((582651740160*x + 27634339676160)*x + 539764410286080)*x + 5580138951475200)*x + 32602701236797440)*x + 107623101172285440)*x + 187738197519237120)*x + 138459902902272000))*Z + ((((((((346321059840*x + 19822050017280)*x + 480061103800320)*x + 6400561155932160)*x + 51071467196252160)*x + 247738269114040320)*x + 711847175112622080)*x + 1115775604650147840)*x + 752664159623577600))*Z + (((((((((132863754240*x + 8938947870720)*x + 259809662730240)*x + 4267438453555200)*x + 43498944260997120)*x + 283996021016494080)*x + 1180543401398108160)*x + 3005750671205990400)*x + 4277611492369367040)*x + 2658181832441856000))*Z + ((((((((((32055754752*x + 2478003978240)*x + 84259690905600)*x + 1653171754106880)*x + 20654758411370496)*x + 171133219449077760)*x + 948469253514854400)*x + 3456097720966840320)*x + 7907738506620567552)*x + 10308686448240230400)*x + 5938812612801331200))*Z + (((((((((((4459069440*x + 388533583872)*x + 15123842334720)*x + 345786714685440)*x + 5140125658644480)*x + 51982567930331136)*x + 363768444534620160)*x + 1755339153225154560)*x + 5702567716915937280)*x + 11858756280596692992)*x + 14268005922811576320)*x + 7662977980651929600))*Z + ((((((((((((273530880*x + 26506690560)*x + 1160874344448)*x + 30305198407680)*x + 523375394734080)*x + 6276964421468160)*x + 53428276058701824)*x + 324197356869550080)*x + 1387468854988554240)*x + 4071616262115655680)*x + 7766607126035939328)*x + 8679854193926307840)*x + 4367219859007488000))

theorem twoInitial_lcMCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (twoInitialMCFC (x+Z+6) (x+5))*(twoInitialMCFC (x+Z+6) (x+7))≤(twoInitialMCFC (x+Z+6) (x+6))^2 := by
 apply sub_nonneg.mp
 have he : (twoInitialMCFC (x+Z+6) (x+6))^2-(twoInitialMCFC (x+Z+6) (x+5))*(twoInitialMCFC (x+Z+6) (x+7))=twoInitial_lcMCFCCert N Z x := by
  unfold twoInitial_lcMCFCCert twoInitialMCFC
  ring
 rw [he]
 unfold twoInitial_lcMCFCCert
 positivity

def twoMiddle_lcMCFCCert (N Z x : ℤ) : ℤ := ((((((((((((273530880*Z + (2105671680*x + 16164126720))*Z + ((6168379392*x + 106497441792)*x + 421381029888))*Z + (((8670412800*x + 263085096960)*x + 2366093721600)*x + 6437193154560))*Z + ((((5202247680*x + 296528117760)*x + 4858341949440)*x + 30529576304640)*x + 64404863631360))*Z + ((((124853944320*x + 4317865574400)*x + 51439825059840)*x + 255326316134400)*x + 446745620643840))*Z + ((((1362988892160*x + 36238857338880)*x + 350767792521216)*x + 1466821594054656)*x + 2220036207427584))*Z + ((((8802203074560*x + 196176760012800)*x + 1631029501624320)*x + 5971594928947200)*x + 8038725849907200))*Z + ((((36930756280320*x + 719876629463040)*x + 5306657905704960)*x + 17427212669583360)*x + 21256544944373760))*Z + ((((103816054702080*x + 1811283915571200)*x + 12060440655298560)*x + 36058214769131520)*x + 40324449645527040))*Z + ((((191120175267840*x + 3024087385374720)*x + 18388325085806592)*x + 50509261245284352)*x + 52189083900592128))*Z + ((((208443660042240*x + 3017407699353600)*x + 16890717593272320)*x + 42941260925337600)*x + 41264575847792640))*Z + ((((103238605209600*x + 1376514736128000)*x + 7137392777625600)*x + 16886271622348800)*x + 15164091913420800))

theorem twoMiddle_lcMCFC (N Z x : ℤ) (hZ : 0≤Z) (hx : 0≤x) :
 (twoMiddleMCFC (x+Z+5) (2*x+Z+10))*(twoMiddleMCFC (x+Z+5) (2*x+Z+12))≤(twoMiddleMCFC (x+Z+5) (2*x+Z+11))^2 := by
 apply sub_nonneg.mp
 have he : (twoMiddleMCFC (x+Z+5) (2*x+Z+11))^2-(twoMiddleMCFC (x+Z+5) (2*x+Z+10))*(twoMiddleMCFC (x+Z+5) (2*x+Z+12))=twoMiddle_lcMCFCCert N Z x := by
  unfold twoMiddle_lcMCFCCert twoMiddleMCFC
  ring
 rw [he]
 unfold twoMiddle_lcMCFCCert
 positivity

def twoLowGap0MCFCCert (N Z x : ℤ) : ℤ := ((((((((1879718400*N + 104908608000)*N + 2563199251200)*N + 35805942950400)*N + 312762486708000)*N + 1749164765292000)*N + 6116114746778400)*N + 12223793326903200)*N + 10690916314478400)

theorem twoLowGap0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoLow0MCFC (N+7) 0)*(twoLow2MCFC (N+7) 0)≤(twoLow1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoLow1MCFC (N+7) 0)^2-(twoLow0MCFC (N+7) 0)*(twoLow2MCFC (N+7) 0)=twoLowGap0MCFCCert N Z x := by
  unfold twoLowGap0MCFCCert twoLow0MCFC twoLow1MCFC twoLow2MCFC
  ring
 rw [he]
 unfold twoLowGap0MCFCCert
 positivity

def twoLowGap1MCFCCert (N Z x : ℤ) : ℤ := ((((((((42776294400*N + 2282486169600)*N + 53413722432000)*N + 715865452646400)*N + 6008672662574400)*N + 32338353362918400)*N + 108963372253982400)*N + 210129355331481600)*N + 177540717209587200)

theorem twoLowGap1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoLow1MCFC (N+7) 0)*(twoLow3MCFC (N+7) 0)≤(twoLow2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoLow2MCFC (N+7) 0)^2-(twoLow1MCFC (N+7) 0)*(twoLow3MCFC (N+7) 0)=twoLowGap1MCFCCert N Z x := by
  unfold twoLowGap1MCFCCert twoLow1MCFC twoLow2MCFC twoLow3MCFC
  ring
 rw [he]
 unfold twoLowGap1MCFCCert
 positivity

def twoLowGap2MCFCCert (N Z x : ℤ) : ℤ := ((((((((457076390400*N + 23123127283200)*N + 514289607955200)*N + 6565394214489600)*N + 52594867821031200)*N + 270640500440839200)*N + 873305068032180000)*N + 1615182138356220000)*N + 1310601868037985600)

theorem twoLowGap2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoLow2MCFC (N+7) 0)*(twoLow4MCFC (N+7) 0)≤(twoLow3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoLow3MCFC (N+7) 0)^2-(twoLow2MCFC (N+7) 0)*(twoLow4MCFC (N+7) 0)=twoLowGap2MCFCCert N Z x := by
  unfold twoLowGap2MCFCCert twoLow2MCFC twoLow3MCFC twoLow4MCFC
  ring
 rw [he]
 unfold twoLowGap2MCFCCert
 positivity

def twoLowGap3MCFCCert (N Z x : ℤ) : ℤ := ((((((((2822244768000*N + 133920639014400)*N + 2803974883113600)*N + 33801930101721600)*N + 256381718781056400)*N + 1251919183033562400)*N + 3840842377729098000)*N + 6765326744149612800)*N + 5235945787412121600)

theorem twoLowGap3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoLow3MCFC (N+7) 0)*(twoLow5MCFC (N+7) 0)≤(twoLow4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoLow4MCFC (N+7) 0)^2-(twoLow3MCFC (N+7) 0)*(twoLow5MCFC (N+7) 0)=twoLowGap3MCFCCert N Z x := by
  unfold twoLowGap3MCFCCert twoLow3MCFC twoLow4MCFC twoLow5MCFC
  ring
 rw [he]
 unfold twoLowGap3MCFCCert
 positivity

def twoLowGap4MCFCCert (N Z x : ℤ) : ℤ := ((((((((11561995468800*N + 507771887616000)*N + 9895611491942400)*N + 111544173474048000)*N + 793961683216128000)*N + 3648586116369600000)*N + 10558080066821414400)*N + 17573546798328729600)*N + 12872647351388160000)

theorem twoLowGap4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoLow4MCFC (N+7) 0)*(twoLow6MCFC (N+7) 0)≤(twoLow5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoLow5MCFC (N+7) 0)^2-(twoLow4MCFC (N+7) 0)*(twoLow6MCFC (N+7) 0)=twoLowGap4MCFCCert N Z x := by
  unfold twoLowGap4MCFCCert twoLow4MCFC twoLow5MCFC twoLow6MCFC
  ring
 rw [he]
 unfold twoLowGap4MCFCCert
 positivity

def twoOnsetGap0MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((273530880*N + 28612362240)*N + 1361656332288)*N + 38946317598720)*N + 744793274695680)*N + 10020912783114240)*N + 97165639872774144)*N + 683492824173035520)*N + 3459027159752048640)*N + 12274614530297118720)*N + 28978491035835629568)*N + 40864044959879823360)*N + 26044807219974144000)

theorem twoOnsetGap0MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoOnset0MCFC (N+7) 0)*(twoOnset2MCFC (N+7) 0)≤(twoOnset1MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoOnset1MCFC (N+7) 0)^2-(twoOnset0MCFC (N+7) 0)*(twoOnset2MCFC (N+7) 0)=twoOnsetGap0MCFCCert N Z x := by
  unfold twoOnsetGap0MCFCCert twoOnset0MCFC twoOnset1MCFC twoOnset2MCFC
  ring
 rw [he]
 unfold twoOnsetGap0MCFCCert
 positivity

def twoOnsetGap1MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((273530880*N + 27435663360)*N + 1254929743872)*N + 34598631997440)*N + 640045460275200)*N + 8365838724956160)*N + 79190492746530816)*N + 546820439135846400)*N + 2733026275262545920)*N + 9640799984602644480)*N + 22781617088101466112)*N + 32379901408568770560)*N + 20936754899214336000)

theorem twoOnsetGap1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoOnset1MCFC (N+7) 0)*(twoOnset3MCFC (N+7) 0)≤(twoOnset2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoOnset2MCFC (N+7) 0)^2-(twoOnset1MCFC (N+7) 0)*(twoOnset3MCFC (N+7) 0)=twoOnsetGap1MCFCCert N Z x := by
  unfold twoOnsetGap1MCFCCert twoOnset1MCFC twoOnset2MCFC twoOnset3MCFC
  ring
 rw [he]
 unfold twoOnsetGap1MCFCCert
 positivity

def twoOnsetGap2MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((273530880*N + 26258964480)*N + 1150321213440)*N + 30404660428800)*N + 540022215720960)*N + 6789972650065920)*N + 61975778127298560)*N + 413808231037501440)*N + 2006247892515471360)*N + 6889164947184844800)*N + 15907269763484467200)*N + 22180450799187394560)*N + 14126740985703628800)

theorem twoOnsetGap2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoOnset2MCFC (N+7) 0)*(twoOnset4MCFC (N+7) 0)≤(twoOnset3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoOnset3MCFC (N+7) 0)^2-(twoOnset2MCFC (N+7) 0)*(twoOnset4MCFC (N+7) 0)=twoOnsetGap2MCFCCert N Z x := by
  unfold twoOnsetGap2MCFCCert twoOnset2MCFC twoOnset3MCFC twoOnset4MCFC
  ring
 rw [he]
 unfold twoOnsetGap2MCFCCert
 positivity

def twoOnsetGap3MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((273530880*N + 25082265600)*N + 1047830740992)*N + 26380133498880)*N + 445943653908480)*N + 5334787016294400)*N + 46332065054048256)*N + 294495112159395840)*N + 1360401684017725440)*N + 4456633063912243200)*N + 9833487375217508352)*N + 13128405039154298880)*N + 8024053792849920000)

theorem twoOnsetGap3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoOnset3MCFC (N+7) 0)*(twoOnset5MCFC (N+7) 0)≤(twoOnset4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoOnset4MCFC (N+7) 0)^2-(twoOnset3MCFC (N+7) 0)*(twoOnset5MCFC (N+7) 0)=twoOnsetGap3MCFCCert N Z x := by
  unfold twoOnsetGap3MCFCCert twoOnset3MCFC twoOnset4MCFC twoOnset5MCFC
  ring
 rw [he]
 unfold twoOnsetGap3MCFCCert
 positivity

def twoOnsetGap4MCFCCert (N Z x : ℤ) : ℤ := ((((((((((((273530880*N + 23905566720)*N + 947458326528)*N + 22540781813760)*N + 358854869237760)*N + 4031382207283200)*N + 32802485417017344)*N + 195002832986357760)*N + 841582040158863360)*N + 2574672233516974080)*N + 5306568792372707328)*N + 6623328276391034880)*N + 3789694659192422400)

theorem twoOnsetGap4MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoOnset4MCFC (N+7) 0)*(twoOnset6MCFC (N+7) 0)≤(twoOnset5MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoOnset5MCFC (N+7) 0)^2-(twoOnset4MCFC (N+7) 0)*(twoOnset6MCFC (N+7) 0)=twoOnsetGap4MCFCCert N Z x := by
  unfold twoOnsetGap4MCFCCert twoOnset4MCFC twoOnset5MCFC twoOnset6MCFC
  ring
 rw [he]
 unfold twoOnsetGap4MCFCCert
 positivity

def twoTailGap1MCFCCert (N Z x : ℤ) : ℤ := ((((11112488755200*N + 255062342707200)*N + 2213313853363200)*N + 8596548875980800)*N + 12592564900070400)

theorem twoTailGap1MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoTail1MCFC (N+7) 0)*(twoTail3MCFC (N+7) 0)≤(twoTail2MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoTail2MCFC (N+7) 0)^2-(twoTail1MCFC (N+7) 0)*(twoTail3MCFC (N+7) 0)=twoTailGap1MCFCCert N Z x := by
  unfold twoTailGap1MCFCCert twoTail1MCFC twoTail2MCFC twoTail3MCFC
  ring
 rw [he]
 unfold twoTailGap1MCFCCert
 positivity

def twoTailGap2MCFCCert (N Z x : ℤ) : ℤ := ((((717163372800*N + 17522150688000)*N + 161206358241600)*N + 661577038819200)*N + 1021311570484800)

theorem twoTailGap2MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoTail2MCFC (N+7) 0)*(twoTail4MCFC (N+7) 0)≤(twoTail3MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoTail3MCFC (N+7) 0)^2-(twoTail2MCFC (N+7) 0)*(twoTail4MCFC (N+7) 0)=twoTailGap2MCFCCert N Z x := by
  unfold twoTailGap2MCFCCert twoTail2MCFC twoTail3MCFC twoTail4MCFC
  ring
 rw [he]
 unfold twoTailGap2MCFCCert
 positivity

def twoTailGap3MCFCCert (N Z x : ℤ) : ℤ := ((((22632825600*N + 583423948800)*N + 5647975905600)*N + 24331887820800)*N + 39352311129600)

theorem twoTailGap3MCFC (N Z x : ℤ) (hN : 0≤N) :
 (twoTail3MCFC (N+7) 0)*(twoTail5MCFC (N+7) 0)≤(twoTail4MCFC (N+7) 0)^2 := by
 apply sub_nonneg.mp
 have he : (twoTail4MCFC (N+7) 0)^2-(twoTail3MCFC (N+7) 0)*(twoTail5MCFC (N+7) 0)=twoTailGap3MCFCCert N Z x := by
  unfold twoTailGap3MCFCCert twoTail3MCFC twoTail4MCFC twoTail5MCFC
  ring
 rw [he]
 unfold twoTailGap3MCFCCert
 positivity
end
end MathGKM.Markov
