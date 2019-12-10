generate w5y_nursery=F2_d2a 
recode w5y_nursery 2=0 777777=. 888888=0

generate w5y_daycentre=F2_d2b 
recode w5y_daycentre 2=0 777777=. 888888=0
generate w5y_daycentre_new=w5y_daycentre*10

generate w5y_chihome=F2_d2c
recode w5y_chihome 2=0 777777=. 888888=0
generate w5y_chihome_new=w5y_chihome*10

generate w5y_soccareinst=F2_d2d  
recode w5y_soccareinst 2=0 777777=. 888888=0
generate w5y_soccareinst_new=w5y_soccareinst*100

generate w5y_else=F2_d2d 
recode w5y_else 2=0 777777=. 888888=0
*I would be careful with coding
generate w5y_else_new=w5y_else*1000

generate w5y_careelse=w5y_chihome+w5y_soccareinst_new+w5y_else_new
recode w5y_careelse 1100=2 1101=3 
label define care5 0 "child is in nursery or day centre" 1 "child is in childrens home" ///
2 "child is in social care instit/else"  3 "child home&soc care inst&else"
label values  w5y_careelse care5

generate w5y_careelse2=w5y_careelse
recode w5y_careelse2  1/max=1
label variable w5y_careelse2 "5y;which institution child visits;1=chihome/soc care inst/else"
tab w5y_careelse2

generate w5y_nurs_dcentre=w5y_nursery+w5y_daycentre_new
recode w5y_nurs_dcentre 10=2 11=3
label define care4 0 "child at home" 1 "nursery" 2 "daycentre" 3 "nursery and daycentre"
label values w5y_nurs_dcentre care4
label variable w5y_nurs_dcentre "5y; institution which child visits"
tab w5y_nurs_dcentre
generate w5y_nurs_dcentre2=w5y_nurs_dcentre
recode w5y_nurs_dcentre2 0=1 1/max=0
label variable w5y_nurs_dcentre2 "5y; child either at home or visits institution;1=home"
tab w5y_nurs_dcentre2

*************************************************************************************
*where the child spends its time after nursery?
*************************************************************************************
generate w5y_aftnurshome= F2_d6
recode w5y_aftnurshome 2=0  888888=0 777777=.
label variable w5y_aftnurshome "5y;child goes home from nursery; 1=Yes"
tab w5y_aftnurshome

generate w5y_aftschfriends=F2_d7b  
recode w5y_aftschfriends 1/2=1 3/max=0
label variable w5y_aftschfriends "5y;from nursery goes to family friends;1=Yes"
generate w5y_aftschfriends_new=w5y_aftschfriends*10

generate w5y_aftchrelat=F2_d7a
recode w5y_aftchrelat 1/2=1 3/max=0
label variable w5y_aftchrelat "5y;from nursery goes to relatives;1=Yes"
generate w5y_aftchrelat_new=w5y_aftchrelat*100

generate w5y_aftnursnany=F2_d7c
recode w5y_aftnursnany 1/2=1 3/max=0
label variable w5y_aftnursnany "5y;from nursery goes to nany;1=Y"
generate w5y_aftnursnany_new=w5y_aftnursnany*1000

generate w5y_aftnurselse=F2_d7d
recode w5y_aftnurselse 1/2=1 3/max=0
label variable w5y_aftnurselse "5y;from nursery goes somwhere else;1=Y"
generate w5y_aftnurselse_new=w5y_aftnurselse*10000

generate w5y_aftnursscore= w5y_aftnurshome+w5y_aftschfriends_new+w5y_aftchrelat_new+w5y_aftnursnany_new+w5y_aftnurselse_new
recode w5y_aftnursscore 0= 14 10=2 100=3 110=4 1100=5 10000=6 10010=7 10100=8 10110=9 11000=10 11010=11 11100=12 11110=13
label define aftnurse 14 "else arrangement" 1 "home" 2 "friends"  3 "relatives" 4 "relatives nad friends" 5 "nany and relatives" ///
6 "nany and friends" 7 "friends and else" 8 "relatives and else" 9 "relatives, friends and else" 10 "nany and else" 11 "nany,friends and else" ///
12 "relatives,nany and else" 13 "all categories apply"
label values w5y_aftnursscore aftnurse
label variable w5y_aftnursscore "5y;where child goes after nursery?"
tab w5y_aftnursscore
*does this work properly?































