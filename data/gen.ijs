#! /usr/bin/jconsole

db =: 2e4,~(([%~0.5<.@:+*)~ 10^100&>) 19.4806*2^48%~i.479


trend =: 8 * 1 , *`(480 {.!.1 $&0@[ , 0 0 3 _2 p. (%~i.)@])/"1] 1 360 80,_3 400 40,:1 130 140
gen =:  3 : 0"1
  curve =. 1 o. 0.2 + (1.75+0.3*{.y) %: (50+20*{:y) %~ db-&.*:12+6*?0
  null =. (2>(?0)+3*{.y) * (10*_1+|%4&o.) (30+130*{.y)-~(150*2-{:y)%~db
  (0.6*480?@$0) + null + ((+0.5-:@:-~0?@$~#)7 1 1 1 2) +/ .* trend,5*curve
)


TEMPLATE =: 0 : 0

Frequency	dB	UnweightedDATA
overall dB	0.0 dB
decay	Average
averaging	No Smoothing
source	Totally Made Up


saved	--/-/--, --:-- AM
peak	0.0Hz
)
fmtfr =: TEMPLATE rplc 'DATA';LF,@:,.db ([,TAB,])&":"0 ]
writefr =: ('LR'(],' ',[,'.txt'"_)&.><@[) (1!:2~ fmtfr)"_1 (0.5<.@:+])&.(10&*)@]


randsel =: ] {~ (0?@$~[) I.~ +/\@:(%+/)@:(2%@:+i.@#)@]
getbrand =: 3 : 0
  br =. randsel&'KQZGCDRBM' (2+?3)
  br ;< ,&.>/ (1 0+(2,1+?9)?@$3) randsel&.> ({.@":"0 i.10) ;~ 'HETF',,~br
)

BRANDS =: (~.@[,.</.)/|:(#~[:~:{:"1);<@(,.>)/"1 getbrand"0 i.6

fmt_brands =: 3 : 0
  surr =. {.@[ , ] , {:@[
  q =. '"'&surr
  ind =. '  '&,"1
  fmtList =. ('['(<0 0)}>) @: (}:,,&' ]'&.>@{:) @: (', '&,&.>)
  fmtBP =. ;@:(,&','&.>@}:,fmtList&.>@{:)@]
  b =. ('name';'phones') <@(,&': '@>@[ (],"1~#@]{.[) fmtBP)"1 &: (q L: 0) y
  ;<@(LF,~dtb)"1 (,.'[]') surr ind (,.'{}') surr }. ; ('}, {',ind)&.> b
)

'phone_book.json' (1!:2<)~ fmt_brands BRANDS
((>@[writefr])"_1 [: gen 0?@$~2 2,~#) ;{:"1 BRANDS

exit ''