% 	Topic- Subject-Verb,Object-Verb Agreement in Hindi with simple sentences,single and double embedded dative/accusative case.



	% Rule 1 for sentences like: [raam, aam, todtaa, hai] and [raam_ne, aam_ko, todaa].

concat([],List,List).
concat([Head|List1],List2,[Head|List3]):-
concat(List1,List2,List3).

s(X,[]):-
np(Y,G),
vp(Z,G),
concat(Y,Z,X).

np(X,G):-
n(Y,G),
obj(Z,G),
concat(Y,Z,X).

vp(X,G):-
v(Y,G),
aux(Z,G),
concat(Y,Z,X).

	% Rule 2 for sentences like: [raam_ne, sitaa_ko, aam, diye] and [raam_ne, sitaa_ko, kapdey, khareedne_ko, kahaa] .

s-->np(Num,Per,Gen),vp(Num,Per,Gen,T).
np(Num,Per,Gen)-->n_erg(Num,P,Gen),obj_dat(Num,P,Gen).
np(Num,Per,Gen)-->n_erg(Num,P,Gen),obj(Num,P,Gen).
vp(Num,Per,Gen,T)-->tv(Num,Per,Gen,T).
vp(Num,Per,Gen,T)-->mav(Num,Per,f,pres).


	%Rule 3 for sentences like: [raam_ne, sitaa_ko, kavitaa, padhaai] and [raam_ne, gitaa_ko, aam, khareedne_ko, kahaa].

s-->kp(Num,Per,Gen),pvp(Num,Per,Gen,T).
kp(Num,Per,Gen)-->n_erg(Num,P,Gen),n_dat(Num,P,Gen),obj(Num,P,Gen).
pvp(Num,Per,Gen,T)-->perfv(Num,Per,Gen,Per).
kp(Num,Per,Gen)-->n_erg(Num,P,Gen),n_dat(Num,P,Gen),obj(Num,P,Gen).
pvp(Num,Per,Gen,T)-->v_erg(Num,Per,Gen,Per),mv(Num,Per,Gen,Per).

	%Rule 4 for sentences like: [raam_ne, rohan_ko, sitaa_ko, aam, khareedne_ko, kahney_ki, salaah_di].

s-->kcp(Num,Per,Gen),cvp(Num,Per,Gen,T).
kcp(Num,Per,Gen)-->n_erga(Num,P,Gen),n_dative(Num,P,Gen),n_accu(Num,P,Gen),obje(Num,P,Gen).
cvp(Num,Per,Gen,T)-->v_erga(Num,Per,Gen,Per),v_gen(Num,Per,Gen,Per),mdv(Num,Per,Gen,Per).

	%lexicons

%Lexicon 1

n([sitaa],f).
obj([aam],G).
v([todtii],f).
v([khaatii],f).
v([khaataa],m).
aux([hai],G).
n([raam],m).
v([todtaa],m).

	%masculine nouns and objects

n(sing,third,m)-->[raam].
n(sing,third,m)-->[shyaam].

obj_dat(sing0,P,m)-->[aam_ko].
obj_dat(sing0,P,m)-->[amrood_ko].
obj_dat(sing0,P,m)-->[anaar_ko].
obj(sing0,third,Gen)-->[aam].
obj(sing0,third,Gen)-->[amrood].
obj(sing0,third,Gen)-->[anaar].

tv(sing0,third,Gen,perf)-->[todaa].
tv(sing0,third,Gen,perf)-->[khaayaa].

	%Verbs with ergative case

v_erga(Num,third,Gen,Per)-->[khareedne_ko].
v_gen(Num,third,Gen,Per)-->[kahney_ki].
v_erga(Num,third,Gen,Per)-->[khareedne_ko].
n_erga(Num,third,m)-->[raam_ne].
n_erga(Num,third,m)-->[shyaam_ne].
v_erg(sing00,third,Gen,Per)-->[khareedne_ko].
mdv(Num,third,Gen,Per)-->[salaah_di].
mv(sing00,third,Gen,Per)-->[kahaa].

	%Nouns with accusative case

n_accu(Num,third,f)-->[raam_ko].
n_accu(Num,third,f)-->[shyaam_ko].
n_accu(Num,third,m)-->[sitaa_ko].
n_accu(Num,third,m)-->[gitaa_ko].
	%Objects(Nouns)

obje(Num,third,Gen)-->[aam].
obje(Num,third,Gen)-->[amrood].
obje(Num,third,Gen)-->[anaar].
obje(Num,third,Gen)-->[khilauney].
obje(Num,third,Gen)-->[kapdey].
	
	%Nouns with Dative case

n_dative(Num,third,m)-->[rohan_ko].
n_dative(Num,third,m)-->[sohan_ko].
n_dat(Num,third,f)-->[raam_ko].
n_dat(Num,third,f)-->[shyaam_ko].
n_dat(Num,third,m)-->[sitaa_ko].
n_dat(Num,third,m)-->[gitaa_ko].

	%Objects(Nouns)	

obj(sing00,third,Gen)-->[aam].
obj(sing00,third,Gen)-->[amrood].
obj(sing00,third,Gen)-->[anaar].
obj(sing00,third,Gen)-->[khilauney].
obj(sing00,third,Gen)-->[kapdey].
obj(plu1,third,Gen)-->[aam].
obj(plu1,third,Gen)-->[amrood].
obj(plu1,third,Gen)-->[anaar].
obj(plu2,third,Gen)-->[khilauney].
obj(plu2,third,Gen)-->[kapdey].
obj(sing1,third,Gen)-->[paani].
obj(sing2,third,Gen)-->[khaanaa].
obj(sing3,third,Gen)-->[sharaab].
obj(sing4,third,Gen)-->[baazaar].
obj(sing4,third,Gen)-->[shahar].
obj(sing4,third,Gen)-->[desh].
obj(sing5,third,Gen)-->[duniya].
obj(sing6,third,Gen)-->[ghar].
obj(sing6,third,Gen)-->[vidyalaya].
obj(sing6,third,Gen)-->[vishwavidyalaya].
obj(sing7,third,Gen)-->[saaikil].
obj(sing7,third,Gen)-->[motarsaaikil].
obj(sing7,third,Gen)-->[kaar].
obj(sing8,third,Gen)-->[likhnaa].
obj(sing8,third,Gen)-->[bolnaa].
obj(sing8,third,Gen)-->[padhnaa].
obj(sing9,third,Gen)-->[kitaab].
obj(sing9,third,Gen)-->[kavitaa].

	%Nouns with Ergative case

n_erg(Num,third,m)-->[raam_ne].
n_erg(Num,third,m)-->[shyaam_ne].
n_erg(Num,third,f)-->[sitaa_ne].
n_erg(Num,third,f)-->[gitaa_ne].

	%perfective verbs

perfv(plu1,third,Gen,Per)-->[diye].
perfv(plu2,third,Gen,Per)-->[dilaaye].
perfv(sing1,third,Gen,Per)-->[pilaayaa].
perfv(sing2,third,Gen,Per)-->[khilaayaa].
perfv(sing3,third,Gen,Per)-->[pilaayi].
perfv(sing4,third,Gen,Per)-->[ghumaayaa].
perfv(sing5,third,Gen,Per)-->[ghumaayii].
perfv(sing6,third,Gen,Per)-->[bulaayaa].
perfv(sing6,third,Gen,Per)-->[bhejaa].
perfv(sing7,third,Gen,Per)-->[dilaayii].
perfv(sing7,third,Gen,Per)-->[chalaanii_sikhaayii].
perfv(sing8,third,Gen,Per)-->[sikhaayaa].
perfv(sing9,third,Gen,Per)-->[padhaai].
