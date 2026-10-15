import MarkovSecondShape07F1
namespace MathGKM.Markov
noncomputable section
set_option maxHeartbeats 9000000
set_option maxRecDepth 16384
set_option linter.unusedVariables false
def secondL007F1 (t u v : ℤ) : ℤ :=
 ((((((((8*u+(24*v+48))*u+((24*v+96)*v+88))*u+(((8*v+48)*v+88)*v+48))*t+(((400*u+(1080*v+2280))*u+((960*v+4200)*v+4040))*u+(((280*v+1920)*v+3800)*v+2160)))*t+(((7960*u+(19320*v+43440))*u+((15240*v+73680)*v+74840))*u+(((3880*v+30720)*v+66200)*v+39360)))*t+(((78800*u+(171720*v+415320))*u+((120000*v+647400)*v+699400))*u+(((26600*v+245040)*v+581320)*v+362880)))*t+(((337632*u+(670416*v+1841112))*u+((426096*v+2596704)*v+3292152))*u+(((85152*v+892632)*v+2446392)*v+1900272)))*t+(((455040*u+(859680*v+2552760))*u+((519840*v+3410280)*v+4757760))*u+(((98640*v+1111680)*v+3328560)*v+2918160)))
def secondL107F1 (t u v : ℤ) : ℤ :=
 (((((((80*u+(240*v+480))*u+((240*v+960)*v+880))*u+(((80*v+480)*v+880)*v+480))*t+(((3200*u+(8640*v+18240))*u+((7680*v+33600)*v+32320))*u+(((2240*v+15360)*v+30400)*v+17280)))*t+(((47760*u+(115920*v+260640))*u+((91440*v+442080)*v+449040))*u+(((23280*v+184320)*v+397200)*v+236160)))*t+(((270920*u+(600600*v+1524240))*u+((430200*v+2354880)*v+2789800))*u+(((98600*v+892560)*v+2231560)*v+1640640)))*t+(((443808*u+(937224*v+2574912))*u+((638544*v+3771384)*v+4929888))*u+(((138888*v+1354392)*v+3717888)*v+3096192)))
def secondL207F1 (t u v : ℤ) : ℤ :=
 ((((((320*u+(960*v+1920))*u+((960*v+3840)*v+3520))*u+(((320*v+1920)*v+3520)*v+1920))*t+(((9600*u+(25920*v+54720))*u+((23040*v+100800)*v+96960))*u+(((6720*v+46080)*v+91200)*v+51840)))*t+(((80880*u+(199440*v+473520))*u+((160560*v+798720)*v+893520))*u+(((42000*v+332400)*v+768240)*v+539280)))*t+(((170960*u+(400800*v+1032600))*u+((306000*v+1650480)*v+2042440))*u+(((75680*v+649560)*v+1658200)*v+1320720)))
def secondL307F1 (t u v : ℤ) : ℤ :=
 (((((640*u+(1920*v+3840))*u+((1920*v+7680)*v+7040))*u+(((640*v+3840)*v+7040)*v+3840))*t+(((10640*u+(29040*v+65280))*u+((26160*v+120000)*v+128080))*u+(((7760*v+54720)*v+118480)*v+80160)))*t+(((32480*u+(83760*v+204960))*u+((71040*v+355920)*v+421120))*u+(((19760*v+152880)*v+367840)*v+282240)))
def secondL407F1 (t u v : ℤ) : ℤ :=
 ((((520*u+(1560*v+3360))*u+((1560*v+6720)*v+6920))*u+(((520*v+3360)*v+6920)*v+4560))*t+(((3040*u+(8520*v+20040))*u+((7920*v+37560)*v+42920))*u+(((2440*v+17520)*v+40280)*v+30000)))
def secondL507F1 (t u v : ℤ) : ℤ :=
 (((112*u+(336*v+768))*u+((336*v+1536)*v+1712))*u+(((112*v+768)*v+1712)*v+1248))
def secondC007F1 (t u v : ℤ) : ℤ :=
 ((((((((8*u+(24*v+48))*u+((24*v+96)*v+88))*u+(((8*v+48)*v+88)*v+48))*t+(((360*u+(960*v+2040))*u+((840*v+3720)*v+3600))*u+(((240*v+1680)*v+3360)*v+1920)))*t+(((6440*u+(15240*v+34800))*u+((11640*v+57840)*v+59560))*u+(((2840*v+23520)*v+51880)*v+31200)))*t+(((57240*u+(120000*v+298200))*u+((79800*v+450600)*v+498240))*u+(((16560*v+163920)*v+404640)*v+257280)))*t+(((234032*u+(439776*v+1228392))*u+((259776*v+1669344)*v+2106472))*u+(((46832*v+544872)*v+1538152)*v+1151712)))*t+(((335520*u+(581760*v+1787760))*u+((314640*v+2242440)*v+3154680))*u+(((50880*v+673560)*v+2121720)*v+1812960)))
def secondC107F1 (t u v : ℤ) : ℤ :=
 (((((((80*u+(240*v+480))*u+((240*v+960)*v+880))*u+(((80*v+480)*v+880)*v+480))*t+(((2880*u+(7680*v+16320))*u+((6720*v+29760)*v+28800))*u+(((1920*v+13440)*v+26880)*v+15360)))*t+(((38640*u+(91440*v+208800))*u+((69840*v+347040)*v+357360))*u+(((17040*v+141120)*v+311280)*v+187200)))*t+(((207960*u+(443400*v+1130160))*u+((301800*v+1699200)*v+1991160))*u+(((64440*v+622320)*v+1568280)*v+1114560)))*t+(((359848*u+(713904*v+1985472))*u+((448104*v+2776584)*v+3606968))*u+(((86848*v+941832)*v+2635448)*v+2129952)))
def secondC207F1 (t u v : ℤ) : ℤ :=
 ((((((320*u+(960*v+1920))*u+((960*v+3840)*v+3520))*u+(((320*v+1920)*v+3520)*v+1920))*t+(((8640*u+(23040*v+48960))*u+((20160*v+89280)*v+86400))*u+(((5760*v+40320)*v+80640)*v+46080)))*t+(((68400*u+(164880*v+390000))*u+((128880*v+646080)*v+713040))*u+(((32400*v+263280)*v+605040)*v+412560)))*t+(((150720*u+(340080*v+873240))*u+((246720*v+1353360)*v+1649640))*u+(((56880*v+513240)*v+1307160)*v+1009920)))
def secondC307F1 (t u v : ℤ) : ℤ :=
 (((((640*u+(1920*v+3840))*u+((1920*v+7680)*v+7040))*u+(((640*v+3840)*v+7040)*v+3840))*t+(((9840*u+(26640*v+59520))*u+((23760*v+108480)*v+114480))*u+(((6960*v+48960)*v+104880)*v+69600)))*t+(((30640*u+(77760*v+188160))*u+((64560*v+321840)*v+374000))*u+(((17440*v+135600)*v+321680)*v+240480)))
def secondC407F1 (t u v : ℤ) : ℤ :=
 ((((520*u+(1560*v+3360))*u+((1560*v+6720)*v+6920))*u+(((520*v+3360)*v+6920)*v+4560))*t+(((3000*u+(8400*v+19560))*u+((7800*v+36600)*v+41280))*u+(((2400*v+17040)*v+38640)*v+28320)))
def secondC507F1 (t u v : ℤ) : ℤ :=
 (((112*u+(336*v+768))*u+((336*v+1536)*v+1712))*u+(((112*v+768)*v+1712)*v+1248))
def secondR007F1 (t u v : ℤ) : ℤ :=
 ((((((((8*u+(24*v+48))*u+((24*v+96)*v+88))*u+(((8*v+48)*v+88)*v+48))*t+(((320*u+(840*v+1800))*u+((720*v+3240)*v+3160))*u+(((200*v+1440)*v+2920)*v+1680)))*t+(((5080*u+(11640*v+27120))*u+((8520*v+43920)*v+46040))*u+(((1960*v+17280)*v+39320)*v+24000)))*t+(((40000*u+(79800*v+205560))*u+((49680*v+298440)*v+340280))*u+(((9400*v+102960)*v+268280)*v+174720)))*t+(((151152*u+(264096*v+768792))*u+((141216*v+992064)*v+1275432))*u+(((22032*v+299832)*v+906792)*v+668592)))*t+(((214560*u+(333360*v+1094760))*u+((155520*v+1266840)*v+1841040))*u+(((20160*v+338400)*v+1183680)*v+995760)))
def secondR107F1 (t u v : ℤ) : ℤ :=
 (((((((80*u+(240*v+480))*u+((240*v+960)*v+880))*u+(((80*v+480)*v+880)*v+480))*t+(((2560*u+(6720*v+14400))*u+((5760*v+25920)*v+25280))*u+(((1600*v+11520)*v+23360)*v+13440)))*t+(((30480*u+(69840*v+162720))*u+((51120*v+263520)*v+276240))*u+(((11760*v+103680)*v+235920)*v+144000)))*t+(((152200*u+(307800*v+799440))*u+((195000*v+1158720)*v+1361000))*u+(((37480*v+403920)*v+1050440)*v+729600)))*t+(((263088*u+(479544*v+1379712))*u+((268224*v+1816824)*v+2382288))*u+(((43608*v+569112)*v+1677168)*v+1323072)))
def secondR207F1 (t u v : ℤ) : ℤ :=
 ((((((320*u+(960*v+1920))*u+((960*v+3840)*v+3520))*u+(((320*v+1920)*v+3520)*v+1920))*t+(((7680*u+(20160*v+43200))*u+((17280*v+77760)*v+75840))*u+(((4800*v+34560)*v+70080)*v+40320)))*t+(((56400*u+(131760*v+312240))*u+((98640*v+504960)*v+552240))*u+(((23280*v+199920)*v+461520)*v+306000)))*t+(((124720*u+(266400*v+689400))*u+((178800*v+1023120)*v+1238120))*u+(((36640*v+368280)*v+951800)*v+713520)))
def secondR307F1 (t u v : ℤ) : ℤ :=
 (((((640*u+(1920*v+3840))*u+((1920*v+7680)*v+7040))*u+(((640*v+3840)*v+7040)*v+3840))*t+(((9040*u+(24240*v+53760))*u+((21360*v+96960)*v+100880))*u+(((6160*v+43200)*v+91280)*v+59040)))*t+(((28160*u+(69840*v+167520))*u+((56160*v+280080)*v+319840))*u+(((14480*v+114480)*v+268480)*v+194880)))
def secondR407F1 (t u v : ℤ) : ℤ :=
 ((((520*u+(1560*v+3360))*u+((1560*v+6720)*v+6920))*u+(((520*v+3360)*v+6920)*v+4560))*t+(((2960*u+(8280*v+19080))*u+((7680*v+35640)*v+39640))*u+(((2360*v+16560)*v+37000)*v+26640)))
def secondR507F1 (t u v : ℤ) : ℤ :=
 (((112*u+(336*v+768))*u+((336*v+1536)*v+1712))*u+(((112*v+768)*v+1712)*v+1248))
def secondGap007F1 (t u v : ℤ) : ℤ :=
 ((secondC007F1 t u v)*(secondC007F1 t u v)-(secondL007F1 t u v)*(secondR007F1 t u v))
def secondGap107F1 (t u v : ℤ) : ℤ :=
 ((secondC007F1 t u v)*(secondC107F1 t u v)-(secondL007F1 t u v)*(secondR107F1 t u v))+((secondC107F1 t u v)*(secondC007F1 t u v)-(secondL107F1 t u v)*(secondR007F1 t u v))
def secondGap207F1 (t u v : ℤ) : ℤ :=
 ((secondC007F1 t u v)*(secondC207F1 t u v)-(secondL007F1 t u v)*(secondR207F1 t u v))+((secondC107F1 t u v)*(secondC107F1 t u v)-(secondL107F1 t u v)*(secondR107F1 t u v))+((secondC207F1 t u v)*(secondC007F1 t u v)-(secondL207F1 t u v)*(secondR007F1 t u v))
def secondGap307F1 (t u v : ℤ) : ℤ :=
 ((secondC007F1 t u v)*(secondC307F1 t u v)-(secondL007F1 t u v)*(secondR307F1 t u v))+((secondC107F1 t u v)*(secondC207F1 t u v)-(secondL107F1 t u v)*(secondR207F1 t u v))+((secondC207F1 t u v)*(secondC107F1 t u v)-(secondL207F1 t u v)*(secondR107F1 t u v))+((secondC307F1 t u v)*(secondC007F1 t u v)-(secondL307F1 t u v)*(secondR007F1 t u v))
def secondGap407F1 (t u v : ℤ) : ℤ :=
 ((secondC007F1 t u v)*(secondC407F1 t u v)-(secondL007F1 t u v)*(secondR407F1 t u v))+((secondC107F1 t u v)*(secondC307F1 t u v)-(secondL107F1 t u v)*(secondR307F1 t u v))+((secondC207F1 t u v)*(secondC207F1 t u v)-(secondL207F1 t u v)*(secondR207F1 t u v))+((secondC307F1 t u v)*(secondC107F1 t u v)-(secondL307F1 t u v)*(secondR107F1 t u v))+((secondC407F1 t u v)*(secondC007F1 t u v)-(secondL407F1 t u v)*(secondR007F1 t u v))
def secondGap507F1 (t u v : ℤ) : ℤ :=
 ((secondC007F1 t u v)*(secondC507F1 t u v)-(secondL007F1 t u v)*(secondR507F1 t u v))+((secondC107F1 t u v)*(secondC407F1 t u v)-(secondL107F1 t u v)*(secondR407F1 t u v))+((secondC207F1 t u v)*(secondC307F1 t u v)-(secondL207F1 t u v)*(secondR307F1 t u v))+((secondC307F1 t u v)*(secondC207F1 t u v)-(secondL307F1 t u v)*(secondR207F1 t u v))+((secondC407F1 t u v)*(secondC107F1 t u v)-(secondL407F1 t u v)*(secondR107F1 t u v))+((secondC507F1 t u v)*(secondC007F1 t u v)-(secondL507F1 t u v)*(secondR007F1 t u v))
def secondGap607F1 (t u v : ℤ) : ℤ :=
 ((secondC107F1 t u v)*(secondC507F1 t u v)-(secondL107F1 t u v)*(secondR507F1 t u v))+((secondC207F1 t u v)*(secondC407F1 t u v)-(secondL207F1 t u v)*(secondR407F1 t u v))+((secondC307F1 t u v)*(secondC307F1 t u v)-(secondL307F1 t u v)*(secondR307F1 t u v))+((secondC407F1 t u v)*(secondC207F1 t u v)-(secondL407F1 t u v)*(secondR207F1 t u v))+((secondC507F1 t u v)*(secondC107F1 t u v)-(secondL507F1 t u v)*(secondR107F1 t u v))
def secondGap707F1 (t u v : ℤ) : ℤ :=
 ((secondC207F1 t u v)*(secondC507F1 t u v)-(secondL207F1 t u v)*(secondR507F1 t u v))+((secondC307F1 t u v)*(secondC407F1 t u v)-(secondL307F1 t u v)*(secondR407F1 t u v))+((secondC407F1 t u v)*(secondC307F1 t u v)-(secondL407F1 t u v)*(secondR307F1 t u v))+((secondC507F1 t u v)*(secondC207F1 t u v)-(secondL507F1 t u v)*(secondR207F1 t u v))
def secondGap807F1 (t u v : ℤ) : ℤ :=
 ((secondC307F1 t u v)*(secondC507F1 t u v)-(secondL307F1 t u v)*(secondR507F1 t u v))+((secondC407F1 t u v)*(secondC407F1 t u v)-(secondL407F1 t u v)*(secondR407F1 t u v))+((secondC507F1 t u v)*(secondC307F1 t u v)-(secondL507F1 t u v)*(secondR307F1 t u v))
def secondGap907F1 (t u v : ℤ) : ℤ :=
 ((secondC407F1 t u v)*(secondC507F1 t u v)-(secondL407F1 t u v)*(secondR507F1 t u v))+((secondC507F1 t u v)*(secondC407F1 t u v)-(secondL507F1 t u v)*(secondR407F1 t u v))
def secondGap1007F1 (t u v : ℤ) : ℤ :=
 ((secondC507F1 t u v)*(secondC507F1 t u v)-(secondL507F1 t u v)*(secondR507F1 t u v))
theorem second_expand_L07F1 (t s u v : ℤ) :
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+8)=(secondL007F1 t u v)*s^0+(secondL107F1 t u v)*s^1+(secondL207F1 t u v)*s^2+(secondL307F1 t u v)*s^3+(secondL407F1 t u v)*s^4+(secondL507F1 t u v)*s^5 := by
 unfold secondShape07F1 secondL007F1 secondL107F1 secondL207F1 secondL307F1 secondL407F1 secondL507F1
 ring
theorem second_expand_C07F1 (t s u v : ℤ) :
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+9)=(secondC007F1 t u v)*s^0+(secondC107F1 t u v)*s^1+(secondC207F1 t u v)*s^2+(secondC307F1 t u v)*s^3+(secondC407F1 t u v)*s^4+(secondC507F1 t u v)*s^5 := by
 unfold secondShape07F1 secondC007F1 secondC107F1 secondC207F1 secondC307F1 secondC407F1 secondC507F1
 ring
theorem second_expand_R07F1 (t s u v : ℤ) :
 secondShape07F1 (t+s+4) (u+v+3) (u+2) (2*t+s+10)=(secondR007F1 t u v)*s^0+(secondR107F1 t u v)*s^1+(secondR207F1 t u v)*s^2+(secondR307F1 t u v)*s^3+(secondR407F1 t u v)*s^4+(secondR507F1 t u v)*s^5 := by
 unfold secondShape07F1 secondR007F1 secondR107F1 secondR207F1 secondR307F1 secondR407F1 secondR507F1
 ring
end
end MathGKM.Markov
