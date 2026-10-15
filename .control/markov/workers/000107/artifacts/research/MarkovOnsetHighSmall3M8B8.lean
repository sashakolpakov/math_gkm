import MarkovOnsetHighGap3M253
/-! Machine-authored request 8b851864. Extend onset gaps to N >= -4 (n >= 3). -/
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 16000000
set_option maxRecDepth 65536

theorem onsetHighGC3_0_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_0M253 N=((((((((((((39715445145600*(N+4) + 2004417112965120)*(N+4) + 46540893984915456)*(N+4) + 657190769676779520)*(N+4) + 6283139807544606720)*(N+4) + 42829342994886819840)*(N+4) + 213349012212979335168)*(N+4) + 782204967426922905600)*(N+4) + 2093927493719528570880)*(N+4) + 3989494784124258877440)*(N+4) + 5132434911915957682176)*(N+4) + 4000599515702783508480)*(N+4) + 1427845926004988313600) := by
  unfold onsetHighGC3_0_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_1M253 N=((((((((((((95039615139840*(N+4) + 4871066845446144)*(N+4) + 114715530947985408)*(N+4) + 1640849134536622080)*(N+4) + 15869709448422359040)*(N+4) + 109289151975748534272)*(N+4) + 549307339714496692224)*(N+4) + 2029597903590707036160)*(N+4) + 5469317527267951902720)*(N+4) + 10479528723137740406784)*(N+4) + 13546639789814222880768)*(N+4) + 10602709872480661340160)*(N+4) + 3797756285282736537600) := by
  unfold onsetHighGC3_0_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_2M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_2M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_2M253 N=((((((((((((99044387979264*(N+4) + 5159776067518464)*(N+4) + 123365014923902976)*(N+4) + 1789122691895132160)*(N+4) + 17521140085886287872)*(N+4) + 122015423289872351232)*(N+4) + 619351193011029147648)*(N+4) + 2308254762832519495680)*(N+4) + 6267088671280281944064)*(N+4) + 12086148675571116539904)*(N+4) + 15710916379317268709376)*(N+4) + 12356150552797587701760)*(N+4) + 4444571945101226803200) := by
  unfold onsetHighGC3_0_2M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_3M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_3M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_3M253 N=((((((((((((58583452483584*(N+4) + 3105832103313408)*(N+4) + 75481377939652608)*(N+4) + 1111285844095795200)*(N+4) + 11033108903516700672)*(N+4) + 77787900214437740544)*(N+4) + 399230688029156573184)*(N+4) + 1502501083319956930560)*(N+4) + 4114625855323583545344)*(N+4) + 7994981388576552910848)*(N+4) + 10461089384347597406208)*(N+4) + 8274495273435528560640)*(N+4) + 2991377026669835059200) := by
  unfold onsetHighGC3_0_3M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_4M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_4M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_4M253 N=((((((((((((21475472965632*(N+4) + 1160308397703168)*(N+4) + 28706387829719040)*(N+4) + 429680058354892800)*(N+4) + 4331145010075140096)*(N+4) + 30960161657673744384)*(N+4) + 160885176644515921920)*(N+4) + 612275133965244825600)*(N+4) + 1693448471608508547072)*(N+4) + 3319527586204769845248)*(N+4) + 4377272442300664381440)*(N+4) + 3486073427633612390400)*(N+4) + 1267921782977052672000) := by
  unfold onsetHighGC3_0_4M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_5M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_5M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_5M253 N=((((((((((((4990194155520*(N+4) + 275220371865600)*(N+4) + 6943134581784576)*(N+4) + 105836689285447680)*(N+4) + 1084950799303311360)*(N+4) + 7876246383926968320)*(N+4) + 41509028399674687488)*(N+4) + 159994719819841536000)*(N+4) + 447623382019707371520)*(N+4) + 886503594436039802880)*(N+4) + 1179751294259727630336)*(N+4) + 947259384357640273920)*(N+4) + 347044147887557836800) := by
  unfold onsetHighGC3_0_5M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_6M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_6M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_6M253 N=((((((((((((717216546816*(N+4) + 40448582221824)*(N+4) + 1042411790794752)*(N+4) + 16212269476085760)*(N+4) + 169336201071034368)*(N+4) + 1250775565633585152)*(N+4) + 6697486100740571136)*(N+4) + 26193056949644820480)*(N+4) + 74255360335941206016)*(N+4) + 148826373570404941824)*(N+4) + 200196153928529805312)*(N+4) + 162300269721299189760)*(N+4) + 59977057163201740800) := by
  unfold onsetHighGC3_0_6M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_7M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_7M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_7M253 N=((((((((((((58265174016*(N+4) + 3366168035328)*(N+4) + 88791368859648)*(N+4) + 1411802820771840)*(N+4) + 15055847206944768)*(N+4) + 113383069637935104)*(N+4) + 618112864476463104)*(N+4) + 2457558398541496320)*(N+4) + 7072825746565103616)*(N+4) + 14371338408767520768)*(N+4) + 19572915722011803648)*(N+4) + 16045922902529802240)*(N+4) + 5989369603424256000) := by
  unfold onsetHighGC3_0_7M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_0_8M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_0_8M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_0_8M253 N=((((((((((((2047868928*(N+4) + 121418809344)*(N+4) + 3284649639936)*(N+4) + 53508502978560)*(N+4) + 583907001237504)*(N+4) + 4493335175626752)*(N+4) + 24993279485411328)*(N+4) + 101234246890291200)*(N+4) + 296356231268794368)*(N+4) + 611581203871432704)*(N+4) + 844709606049447936)*(N+4) + 701299682432778240)*(N+4) + 264755286009446400) := by
  unfold onsetHighGC3_0_8M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_0M253 N=((((((((((((190079230279680*(N+4) + 9545982198939648)*(N+4) + 220370832092823552)*(N+4) + 3090930804216299520)*(N+4) + 29323761601751285760)*(N+4) + 198148660064127811584)*(N+4) + 977511253045167783936)*(N+4) + 3545975220717280296960)*(N+4) + 9384368889823124520960)*(N+4) + 17663986151415053549568)*(N+4) + 22438181280725397798912)*(N+4) + 17263433501176566251520)*(N+4) + 6080743714674740428800) := by
  unfold onsetHighGC3_1_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_1M253 N=((((((((((((396177551917056*(N+4) + 20216925124558848)*(N+4) + 473635638642475008)*(N+4) + 6732795799394058240)*(N+4) + 64647053561524912128)*(N+4) + 441526362297187958784)*(N+4) + 2198661590437179162624)*(N+4) + 8041006626410865623040)*(N+4) + 21430229286259517423616)*(N+4) + 40580443261317158535168)*(N+4) + 51812966597471226298368)*(N+4) + 40038614878266751057920)*(N+4) + 14156409569816715264000) := by
  unfold onsetHighGC3_1_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_2M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_2M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_2M253 N=((((((((((((351500714901504*(N+4) + 18245880876367872)*(N+4) + 434295172038131712)*(N+4) + 6263975685956567040)*(N+4) + 60942489826984722432)*(N+4) + 421164067035216347136)*(N+4) + 2119344944045479428096)*(N+4) + 7822707141860001054720)*(N+4) + 21016925182868394737664)*(N+4) + 40076676955501525204992)*(N+4) + 51479418227958541320192)*(N+4) + 39988824781623377264640)*(N+4) + 14203088630574597734400) := by
  unfold onsetHighGC3_1_2M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_3M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_3M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_3M253 N=((((((((((((171803783725056*(N+4) + 9083926156935168)*(N+4) + 219984015283716096)*(N+4) + 3223874408168816640)*(N+4) + 31824890417227235328)*(N+4) + 222850214015872794624)*(N+4) + 1134725849520344137728)*(N+4) + 4232654199682242969600)*(N+4) + 11477927545179989999616)*(N+4) + 22066621584569829163008)*(N+4) + 28548514730865194827776)*(N+4) + 22315186968273876418560)*(N+4) + 7969284864683296358400) := by
  unfold onsetHighGC3_1_3M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_4M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_4M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_4M253 N=((((((((((((49901941555200*(N+4) + 2691773352640512)*(N+4) + 66427884700434432)*(N+4) + 990742846856232960)*(N+4) + 9939536131176529920)*(N+4) + 70634290328353898496)*(N+4) + 364498567314386190336)*(N+4) + 1376073181177144934400)*(N+4) + 3771956510136082759680)*(N+4) + 7321468130833155489792)*(N+4) + 9552753034616773804032)*(N+4) + 7523087778549189181440)*(N+4) + 2704482367156504166400) := by
  unfold onsetHighGC3_1_4M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_5M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_5M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_5M253 N=((((((((((((8606598561792*(N+4) + 474431247876096)*(N+4) + 11952188817408000)*(N+4) + 181745045188116480)*(N+4) + 1856382690513125376)*(N+4) + 13412113398390325248)*(N+4) + 70265651372575948800)*(N+4) + 268940539056221061120)*(N+4) + 746404783419871199232)*(N+4) + 1465052477571982688256)*(N+4) + 1930716589479306854400)*(N+4) + 1534078224625818009600)*(N+4) + 555864263198834688000) := by
  unfold onsetHighGC3_1_5M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_6M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_6M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_6M253 N=((((((((((((815712436224*(N+4) + 46033715331072)*(N+4) + 1186131496402944)*(N+4) + 18424742144901120)*(N+4) + 191984973239549952)*(N+4) + 1412979176600764416)*(N+4) + 7529924421802524672)*(N+4) + 29274479081257697280)*(N+4) + 82410870323287425024)*(N+4) + 163853052025909542912)*(N+4) + 218450710464242909184)*(N+4) + 175385124347786035200)*(N+4) + 64142025036713164800) := by
  unfold onsetHighGC3_1_6M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_1_7M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_1_7M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_1_7M253 N=((((((((((((32765902848*(N+4) + 1896458747904)*(N+4) + 50077133438976)*(N+4) + 796286087331840)*(N+4) + 8482607232712704)*(N+4) + 63734071670341632)*(N+4) + 346218861667811328)*(N+4) + 1369976510947000320)*(N+4) + 3919357573802754048)*(N+4) + 7907664345210814464)*(N+4) + 10682964607679594496)*(N+4) + 8679436551444234240)*(N+4) + 3208207832344166400) := by
  unfold onsetHighGC3_1_7M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_2_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_2_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_2_0M253 N=((((((((((((396177551917056*(N+4) + 19794745979043840)*(N+4) + 454240781746569216)*(N+4) + 6327096541509058560)*(N+4) + 59549323875506454528)*(N+4) + 398795905818049904640)*(N+4) + 1947885650306188443648)*(N+4) + 6989914164533227683840)*(N+4) + 18284849022253980450816)*(N+4) + 33996462575462692945920)*(N+4) + 42634508761345699086336)*(N+4) + 32371948896243941376000)*(N+4) + 11250830627269941657600) := by
  unfold onsetHighGC3_2_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_2_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_2_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_2_1M253 N=((((((((((((703001429803008*(N+4) + 35713538265710592)*(N+4) + 832223127369940992)*(N+4) + 11755385772834816000)*(N+4) + 112042218681085722624)*(N+4) + 758804052845960626176)*(N+4) + 3743181021986675490816)*(N+4) + 13548923023809895464960)*(N+4) + 35708996984782326202368)*(N+4) + 66821816234498497708032)*(N+4) + 84263889956068525473792)*(N+4) + 64283402751381745827840)*(N+4) + 22432530409594144358400) := by
  unfold onsetHighGC3_2_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_2_2M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_2_2M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_2_2M253 N=((((((((((((515411351175168*(N+4) + 26656155396734976)*(N+4) + 631603988181024768)*(N+4) + 9059288648830156800)*(N+4) + 87554903028897153024)*(N+4) + 600430708622232649728)*(N+4) + 2995164446136070569984)*(N+4) + 10948943705963727421440)*(N+4) + 29107802520401554833408)*(N+4) + 54882300793724045623296)*(N+4) + 69662973519446056501248)*(N+4) + 53446721006862546370560)*(N+4) + 18742737820957168435200) := by
  unfold onsetHighGC3_2_2M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_2_3M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_2_3M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_2_3M253 N=((((((((((((199607766220800*(N+4) + 10525371946500096)*(N+4) + 253975772207775744)*(N+4) + 3704792928925777920)*(N+4) + 36362800521239592960)*(N+4) + 252888815226624933888)*(N+4) + 1277542173590339715072)*(N+4) + 4723213369446342328320)*(N+4) + 12683515634955707351040)*(N+4) + 24127789554531582345216)*(N+4) + 30865464902820927504384)*(N+4) + 23842580547027147816960)*(N+4) + 8411099670941442048000) := by
  unfold onsetHighGC3_2_3M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_2_4M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_2_4M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_2_4M253 N=((((((((((((43032992808960*(N+4) + 2317397545451520)*(N+4) + 57043627863441408)*(N+4) + 847722893436518400)*(N+4) + 8464589007743877120)*(N+4) + 59801365450111057920)*(N+4) + 306459526729316696064)*(N+4) + 1147770571284743454720)*(N+4) + 3118217065081855672320)*(N+4) + 5993685659362614312960)*(N+4) + 7738465111158397206528)*(N+4) + 6026658733476389191680)*(N+4) + 2141403597508357324800) := by
  unfold onsetHighGC3_2_4M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_2_5M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_2_5M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_2_5M253 N=((((((((((((4894274617344*(N+4) + 269646469005312)*(N+4) + 6783532001132544)*(N+4) + 102896527202058240)*(N+4) + 1047227186389450752)*(N+4) + 7530145919751684096)*(N+4) + 39218472746732224512)*(N+4) + 149065576305650565120)*(N+4) + 410423700187700527104)*(N+4) + 798451446119699054592)*(N+4) + 1042061207518557241344)*(N+4) + 819389161567337840640)*(N+4) + 293643594298530201600) := by
  unfold onsetHighGC3_2_5M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_2_6M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_2_6M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_2_6M253 N=((((((((((((229361319936*(N+4) + 12951515824128)*(N+4) + 333641712402432)*(N+4) + 5176149902622720)*(N+4) + 53806842535477248)*(N+4) + 394600888579129344)*(N+4) + 2092920166288982016)*(N+4) + 8088978075974369280)*(N+4) + 22613077640980463616)*(N+4) + 44602846451312099328)*(N+4) + 58938315518773297152)*(N+4) + 46862410742680780800)*(N+4) + 16961664286457856000) := by
  unfold onsetHighGC3_2_6M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_3_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_3_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_3_0M253 N=((((((((((((468667619868672*(N+4) + 23290209852456960)*(N+4) + 531116590104576000)*(N+4) + 7344606324090470400)*(N+4) + 68558718701987168256)*(N+4) + 454910701456132669440)*(N+4) + 2199478824629824389120)*(N+4) + 7806123790156643696640)*(N+4) + 20180517262257071849472)*(N+4) + 37057183507165151232000)*(N+4) + 45874808740701548052480)*(N+4) + 34371174332255309660160)*(N+4) + 11784974003254326067200) := by
  unfold onsetHighGC3_3_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_3_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_3_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_3_1M253 N=((((((((((((687215134900224*(N+4) + 34747376430219264)*(N+4) + 805212179870515200)*(N+4) + 11299513964691456000)*(N+4) + 106882776826172669952)*(N+4) + 717655367524367204352)*(N+4) + 3506452106486446817280)*(N+4) + 12559935966584006246400)*(N+4) + 32731969638752104218624)*(N+4) + 60524020859982809923584)*(N+4) + 75373886671916362629120)*(N+4) + 56762292808984205721600)*(N+4) + 19547704126476907315200) := by
  unfold onsetHighGC3_3_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_3_2M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_3_2M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_3_2M253 N=((((((((((((399215532441600*(N+4) + 20567300964876288)*(N+4) + 485036166978994176)*(N+4) + 6917256026794229760)*(N+4) + 66400285692442705920)*(N+4) + 451800550471105511424)*(N+4) + 2233912424533606268928)*(N+4) + 8086851624729709117440)*(N+4) + 21272470999261438279680)*(N+4) + 39657501616823311269888)*(N+4) + 49740543392593794564096)*(N+4) + 37690174313721357926400)*(N+4) + 13049068370685522739200) := by
  unfold onsetHighGC3_3_2M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_3_3M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_3_3M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_3_3M253 N=((((((((((((114754647490560*(N+4) + 6033703604060160)*(N+4) + 145047356738371584)*(N+4) + 2105739957271265280)*(N+4) + 20547059623605043200)*(N+4) + 141907496736616611840)*(N+4) + 711191973125999296512)*(N+4) + 2605964936223900303360)*(N+4) + 6929639732546406973440)*(N+4) + 13043381947225826918400)*(N+4) + 16498833019168375701504)*(N+4) + 12594924618025190031360)*(N+4) + 4388985012810733977600) := by
  unfold onsetHighGC3_3_3M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_3_4M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_3_4M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_3_4M253 N=((((((((((((16314248724480*(N+4) + 876968820080640)*(N+4) + 21529013507850240)*(N+4) + 318751126302228480)*(N+4) + 3167410060064194560)*(N+4) + 22244846913422622720)*(N+4) + 113200315518379622400)*(N+4) + 420581163490942648320)*(N+4) + 1132451697707113512960)*(N+4) + 2155574398959605514240)*(N+4) + 2753967899689966632960)*(N+4) + 2120999593486594867200)*(N+4) + 744898619030785228800) := by
  unfold onsetHighGC3_3_4M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_3_5M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_3_5M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_3_5M253 N=((((((((((((917445279744*(N+4) + 50511281651712)*(N+4) + 1268744378646528)*(N+4) + 19195267362324480)*(N+4) + 194636982823944192)*(N+4) + 1392792458269556736)*(N+4) + 7210903840886882304)*(N+4) + 27216485029332910080)*(N+4) + 74338370117214142464)*(N+4) + 143338294073414909952)*(N+4) + 185263247257808928768)*(N+4) + 144166549812585431040)*(N+4) + 51099936415757107200) := by
  unfold onsetHighGC3_3_5M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_4_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_4_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_4_0M253 N=((((((((((((343607567450112*(N+4) + 16976606165729280)*(N+4) + 384578324011155456)*(N+4) + 5277987665734533120)*(N+4) + 48847198789331582976)*(N+4) + 321042090672311500800)*(N+4) + 1536108508233254043648)*(N+4) + 5390726972463497871360)*(N+4) + 13770205102738472435712)*(N+4) + 24969563383752669265920)*(N+4) + 30509079811221280260096)*(N+4) + 22553119108517705809920)*(N+4) + 7627784225999486976000) := by
  unfold onsetHighGC3_4_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_4_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_4_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_4_1M253 N=((((((((((((399215532441600*(N+4) + 20083858036752384)*(N+4) + 462676945293803520)*(N+4) + 6448344916631224320)*(N+4) + 60517262574464532480)*(N+4) + 402755411851484332032)*(N+4) + 1948690558250291036160)*(N+4) + 6906245697721521930240)*(N+4) + 17794136399071551160320)*(N+4) + 32508558646244405673984)*(N+4) + 39977783696708712529920)*(N+4) + 29716610611629152010240)*(N+4) + 10098225878484241612800) := by
  unfold onsetHighGC3_4_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_4_2M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_4_2M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_4_2M253 N=((((((((((((172131971235840*(N+4) + 8831520630374400)*(N+4) + 207233347309535232)*(N+4) + 2937749241939886080)*(N+4) + 28002485007286272000)*(N+4) + 189006730670112768000)*(N+4) + 926152000748918931456)*(N+4) + 3319677476308836679680)*(N+4) + 8639482520640144015360)*(N+4) + 15923678905285646745600)*(N+4) + 19734050738792883290112)*(N+4) + 14767538721847144611840)*(N+4) + 5047436117345461862400) := by
  unfold onsetHighGC3_4_2M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_4_3M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_4_3M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_4_3M253 N=((((((((((((32628497448960*(N+4) + 1710232153620480)*(N+4) + 40948700880568320)*(N+4) + 591497085887447040)*(N+4) + 5736594356589035520)*(N+4) + 39337901256773468160)*(N+4) + 195551194982394101760)*(N+4) + 710080245583065907200)*(N+4) + 1869600375432499691520)*(N+4) + 3481782233803755356160)*(N+4) + 4354660822467681976320)*(N+4) + 3285093094874130677760)*(N+4) + 1130774617738425139200) := by
  unfold onsetHighGC3_4_3M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_4_4M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_4_4M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_4_4M253 N=((((((((((((2293613199360*(N+4) + 123041250017280)*(N+4) + 3011730808504320)*(N+4) + 44414260582809600)*(N+4) + 439120626104401920)*(N+4) + 3065133639464386560)*(N+4) + 15486644063352913920)*(N+4) + 57072431474509086720)*(N+4) + 152291217517774110720)*(N+4) + 287043366093544488960)*(N+4) + 362882243964433858560)*(N+4) + 276380892639532154880)*(N+4) + 95942598735436185600) := by
  unfold onsetHighGC3_4_4M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_5_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_5_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_5_0M253 N=((((((((((((159686212976640*(N+4) + 7840166043451392)*(N+4) + 176349551743991808)*(N+4) + 2400897664926351360)*(N+4) + 22021634027956469760)*(N+4) + 143310130292107247616)*(N+4) + 678373393185462288384)*(N+4) + 2353363298175968870400)*(N+4) + 5938558478519972659200)*(N+4) + 10631636739437931528192)*(N+4) + 12819304850787528081408)*(N+4) + 9348376491828329840640)*(N+4) + 3118335414589469491200) := by
  unfold onsetHighGC3_5_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_5_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_5_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_5_1M253 N=((((((((((((137705576988672*(N+4) + 6889988683726848)*(N+4) + 157729158447759360)*(N+4) + 2182402194832097280)*(N+4) + 20314008158277206016)*(N+4) + 133960212081398513664)*(N+4) + 641666193502419025920)*(N+4) + 2249510687963826094080)*(N+4) + 5729146161545097510912)*(N+4) + 10339683649295811084288)*(N+4) + 12554490065715902545920)*(N+4) + 9210250605451322327040)*(N+4) + 3088011109012262092800) := by
  unfold onsetHighGC3_5_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_5_2M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_5_2M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_5_2M253 N=((((((((((((39154196938752*(N+4) + 1999832000495616)*(N+4) + 46674681922584576)*(N+4) + 657471041018265600)*(N+4) + 6221035354724499456)*(N+4) + 41641069734996738048)*(N+4) + 202164248880221257728)*(N+4) + 717344082607189524480)*(N+4) + 1846710557886111547392)*(N+4) + 3364686126163465076736)*(N+4) + 4119651699230463492096)*(N+4) + 3044336589130872913920)*(N+4) + 1027161278631523123200) := by
  unfold onsetHighGC3_5_2M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_5_3M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_5_3M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_5_3M253 N=((((((((((((3669781118976*(N+4) + 191686873448448)*(N+4) + 4569642735501312)*(N+4) + 65654403020881920)*(N+4) + 632681797452300288)*(N+4) + 4306476028189999104)*(N+4) + 21229211883631804416)*(N+4) + 76376222114135408640)*(N+4) + 199080476440223809536)*(N+4) + 366777323225846120448)*(N+4) + 453534234353700175872)*(N+4) + 338092678906002800640)*(N+4) + 114952650412916736000) := by
  unfold onsetHighGC3_5_3M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_6_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_6_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_6_0M253 N=((((((((((((45901858996224*(N+4) + 2238253621051392)*(N+4) + 49961423295479808)*(N+4) + 674416984640716800)*(N+4) + 6127858380221448192)*(N+4) + 39469620721442881536)*(N+4) + 184769568121389318144)*(N+4) + 633445678729584967680)*(N+4) + 1578639557236604534784)*(N+4) + 2789646665735756316672)*(N+4) + 3318725051881892610048)*(N+4) + 2387030686268766289920)*(N+4) + 785172156291042508800) := by
  unfold onsetHighGC3_6_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_6_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_6_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_6_1M253 N=((((((((((((26102797959168*(N+4) + 1298256944431104)*(N+4) + 29518903344365568)*(N+4) + 405295827045580800)*(N+4) + 3740051464010072064)*(N+4) + 24429278217646374912)*(N+4) + 115805932158896308224)*(N+4) + 401480147357159915520)*(N+4) + 1010475594735490695168)*(N+4) + 1801147383706376208384)*(N+4) + 2158915147493941444608)*(N+4) + 1562911323869038510080)*(N+4) + 516945203485330636800) := by
  unfold onsetHighGC3_6_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_6_2M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_6_2M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_6_2M253 N=((((((((((((3669781118976*(N+4) + 186507746869248)*(N+4) + 4327597840269312)*(N+4) + 60546589843783680)*(N+4) + 568462889774481408)*(N+4) + 3772071752314650624)*(N+4) + 18138414180326178816)*(N+4) + 63695857584628039680)*(N+4) + 162166353472222396416)*(N+4) + 292021085010476924928)*(N+4) + 353190099634261327872)*(N+4) + 257710172432278487040)*(N+4) + 85826867996904652800) := by
  unfold onsetHighGC3_6_2M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_7_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_7_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_7_0M253 N=((((((((((((7457942274048*(N+4) + 360940730056704)*(N+4) + 7990373397823488)*(N+4) + 106882290533007360)*(N+4) + 961535520427474944)*(N+4) + 6126971977992241152)*(N+4) + 28353791915043323904)*(N+4) + 96026547602199674880)*(N+4) + 236268787069781803008)*(N+4) + 411996839513470009344)*(N+4) + 483458011696944119808)*(N+4) + 342888281209370050560)*(N+4) + 111192262954175692800) := by
  unfold onsetHighGC3_7_0M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_7_1M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_7_1M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_7_1M253 N=((((((((((((2097017782272*(N+4) + 103616354451456)*(N+4) + 2338648347377664)*(N+4) + 31845794017443840)*(N+4) + 291197894919192576)*(N+4) + 1883136190996021248)*(N+4) + 8831156967431995392)*(N+4) + 30265943426523463680)*(N+4) + 75256366161463345152)*(N+4) + 132451317936077930496)*(N+4) + 156687400669538156544)*(N+4) + 111909296531995361280)*(N+4) + 36508297665105100800) := by
  unfold onsetHighGC3_7_1M253
  ring
 rw [he]
 positivity

theorem onsetHighGC3_8_0M8B8_nonneg (N : ℤ) (hN : -4≤N) : 0≤onsetHighGC3_8_0M253 N := by
 have h : 0≤N+4 := by omega
 have he : onsetHighGC3_8_0M253 N=((((((((((((524254445568*(N+4) + 25164213387264)*(N+4) + 552107576918016)*(N+4) + 7313687744348160)*(N+4) + 65107654254526464)*(N+4) + 410224531228065792)*(N+4) + 1875814280067022848)*(N+4) + 6273280109067632640)*(N+4) + 15233100861111533568)*(N+4) + 26202542618437484544)*(N+4) + 30318083118188199936)*(N+4) + 21195943484483174400)*(N+4) + 6773820302721024000) := by
  unfold onsetHighGC3_8_0M253
  ring
 rw [he]
 positivity

attribute [local irreducible] onsetHighC3_0_0M253 onsetHighC3_0_1M253 onsetHighC3_0_2M253 onsetHighC3_0_3M253 onsetHighC3_0_4M253 onsetHighC3_1_0M253 onsetHighC3_1_1M253 onsetHighC3_1_2M253 onsetHighC3_1_3M253 onsetHighC3_2_0M253 onsetHighC3_2_1M253 onsetHighC3_2_2M253 onsetHighC3_3_0M253 onsetHighC3_3_1M253 onsetHighC3_4_0M253 onsetHighC4_0_0M253 onsetHighC4_0_1M253 onsetHighC4_0_2M253 onsetHighC4_0_3M253 onsetHighC4_0_4M253 onsetHighC4_1_0M253 onsetHighC4_1_1M253 onsetHighC4_1_2M253 onsetHighC4_1_3M253 onsetHighC4_2_0M253 onsetHighC4_2_1M253 onsetHighC4_2_2M253 onsetHighC4_3_0M253 onsetHighC4_3_1M253 onsetHighC4_4_0M253 onsetHighC5_0_0M253 onsetHighC5_0_1M253 onsetHighC5_0_2M253 onsetHighC5_0_3M253 onsetHighC5_0_4M253 onsetHighC5_1_0M253 onsetHighC5_1_1M253 onsetHighC5_1_2M253 onsetHighC5_1_3M253 onsetHighC5_2_0M253 onsetHighC5_2_1M253 onsetHighC5_2_2M253 onsetHighC5_3_0M253 onsetHighC5_3_1M253 onsetHighC5_4_0M253

theorem onsetHighGCol3_0M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_0M253 N R := by
 unfold onsetHighGCol3_0M253
 have h0 := onsetHighGC3_0_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_0_1M8B8_nonneg N hN
 have h2 := onsetHighGC3_0_2M8B8_nonneg N hN
 have h3 := onsetHighGC3_0_3M8B8_nonneg N hN
 have h4 := onsetHighGC3_0_4M8B8_nonneg N hN
 have h5 := onsetHighGC3_0_5M8B8_nonneg N hN
 have h6 := onsetHighGC3_0_6M8B8_nonneg N hN
 have h7 := onsetHighGC3_0_7M8B8_nonneg N hN
 have h8 := onsetHighGC3_0_8M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_1M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_1M253 N R := by
 unfold onsetHighGCol3_1M253
 have h0 := onsetHighGC3_1_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_1_1M8B8_nonneg N hN
 have h2 := onsetHighGC3_1_2M8B8_nonneg N hN
 have h3 := onsetHighGC3_1_3M8B8_nonneg N hN
 have h4 := onsetHighGC3_1_4M8B8_nonneg N hN
 have h5 := onsetHighGC3_1_5M8B8_nonneg N hN
 have h6 := onsetHighGC3_1_6M8B8_nonneg N hN
 have h7 := onsetHighGC3_1_7M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_2M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_2M253 N R := by
 unfold onsetHighGCol3_2M253
 have h0 := onsetHighGC3_2_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_2_1M8B8_nonneg N hN
 have h2 := onsetHighGC3_2_2M8B8_nonneg N hN
 have h3 := onsetHighGC3_2_3M8B8_nonneg N hN
 have h4 := onsetHighGC3_2_4M8B8_nonneg N hN
 have h5 := onsetHighGC3_2_5M8B8_nonneg N hN
 have h6 := onsetHighGC3_2_6M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_3M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_3M253 N R := by
 unfold onsetHighGCol3_3M253
 have h0 := onsetHighGC3_3_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_3_1M8B8_nonneg N hN
 have h2 := onsetHighGC3_3_2M8B8_nonneg N hN
 have h3 := onsetHighGC3_3_3M8B8_nonneg N hN
 have h4 := onsetHighGC3_3_4M8B8_nonneg N hN
 have h5 := onsetHighGC3_3_5M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_4M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_4M253 N R := by
 unfold onsetHighGCol3_4M253
 have h0 := onsetHighGC3_4_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_4_1M8B8_nonneg N hN
 have h2 := onsetHighGC3_4_2M8B8_nonneg N hN
 have h3 := onsetHighGC3_4_3M8B8_nonneg N hN
 have h4 := onsetHighGC3_4_4M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_5M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_5M253 N R := by
 unfold onsetHighGCol3_5M253
 have h0 := onsetHighGC3_5_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_5_1M8B8_nonneg N hN
 have h2 := onsetHighGC3_5_2M8B8_nonneg N hN
 have h3 := onsetHighGC3_5_3M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_6M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_6M253 N R := by
 unfold onsetHighGCol3_6M253
 have h0 := onsetHighGC3_6_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_6_1M8B8_nonneg N hN
 have h2 := onsetHighGC3_6_2M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_7M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_7M253 N R := by
 unfold onsetHighGCol3_7M253
 have h0 := onsetHighGC3_7_0M8B8_nonneg N hN
 have h1 := onsetHighGC3_7_1M8B8_nonneg N hN
 positivity

theorem onsetHighGCol3_8M8B8_nonneg (N R : ℤ) (hN : -4≤N) (hR : 0≤R) : 0≤onsetHighGCol3_8M253 N R := by
 unfold onsetHighGCol3_8M253
 have h0 := onsetHighGC3_8_0M8B8_nonneg N hN
 positivity

attribute [local irreducible] onsetHighCol3_3_0M253 onsetHighCol3_3_1M253 onsetHighCol3_3_2M253 onsetHighCol3_3_3M253 onsetHighCol3_3_4M253 onsetHighCol3_4_0M253 onsetHighCol3_4_1M253 onsetHighCol3_4_2M253 onsetHighCol3_4_3M253 onsetHighCol3_4_4M253 onsetHighCol3_5_0M253 onsetHighCol3_5_1M253 onsetHighCol3_5_2M253 onsetHighCol3_5_3M253 onsetHighCol3_5_4M253

theorem onsetHigh_lc3M8B8 (N C R : ℤ) (hN : -4≤N) (hC : 0≤C) (hR : 0≤R) :
 onsetHighV3M253 N C R*onsetHighV5M253 N C R ≤ (onsetHighV4M253 N C R)^2 := by
 apply sub_nonneg.mp
 rw [onsetHigh_cols3_3M253,onsetHigh_cols3_4M253,onsetHigh_cols3_5M253]
 have he : ((onsetHighCol3_4_0M253 N R*C^0 + onsetHighCol3_4_1M253 N R*C^1) + (onsetHighCol3_4_2M253 N R*C^2 + (onsetHighCol3_4_3M253 N R*C^3 + onsetHighCol3_4_4M253 N R*C^4)))^2-((onsetHighCol3_3_0M253 N R*C^0 + onsetHighCol3_3_1M253 N R*C^1) + (onsetHighCol3_3_2M253 N R*C^2 + (onsetHighCol3_3_3M253 N R*C^3 + onsetHighCol3_3_4M253 N R*C^4)))*((onsetHighCol3_5_0M253 N R*C^0 + onsetHighCol3_5_1M253 N R*C^1) + (onsetHighCol3_5_2M253 N R*C^2 + (onsetHighCol3_5_3M253 N R*C^3 + onsetHighCol3_5_4M253 N R*C^4)))=(((onsetHighGCol3_0M253 N R*C^0 + onsetHighGCol3_1M253 N R*C^1) + (onsetHighGCol3_2M253 N R*C^2 + onsetHighGCol3_3M253 N R*C^3)) + ((onsetHighGCol3_4M253 N R*C^4 + onsetHighGCol3_5M253 N R*C^5) + (onsetHighGCol3_6M253 N R*C^6 + (onsetHighGCol3_7M253 N R*C^7 + onsetHighGCol3_8M253 N R*C^8)))) := by
  rw [←onsetHighGCol3_0M253_eq,←onsetHighGCol3_1M253_eq,←onsetHighGCol3_2M253_eq,←onsetHighGCol3_3M253_eq,←onsetHighGCol3_4M253_eq,←onsetHighGCol3_5M253_eq,←onsetHighGCol3_6M253_eq,←onsetHighGCol3_7M253_eq,←onsetHighGCol3_8M253_eq]
  ring
 rw [he]
 have h0 := onsetHighGCol3_0M8B8_nonneg N R hN hR
 have h1 := onsetHighGCol3_1M8B8_nonneg N R hN hR
 have h2 := onsetHighGCol3_2M8B8_nonneg N R hN hR
 have h3 := onsetHighGCol3_3M8B8_nonneg N R hN hR
 have h4 := onsetHighGCol3_4M8B8_nonneg N R hN hR
 have h5 := onsetHighGCol3_5M8B8_nonneg N R hN hR
 have h6 := onsetHighGCol3_6M8B8_nonneg N R hN hR
 have h7 := onsetHighGCol3_7M8B8_nonneg N R hN hR
 have h8 := onsetHighGCol3_8M8B8_nonneg N R hN hR
 positivity
end
end MathGKM.Markov
