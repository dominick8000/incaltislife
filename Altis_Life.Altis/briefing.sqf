waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};

player createDiarySubject ["changelog","Change Log"];
player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["policerules","Police Procedures/Rules"];
player createDiarySubject ["safezones","Safe Zones (No Killing)"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Activity"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controls"];

/*  Example
	player createDiaryRecord ["", //Container
		[
			"", //Subsection
				"
				TEXT HERE<br/><br/>
				"
		]
	];
*/
	player createDiaryRecord["changelog",
		[
			"Official Change Log",
				"
					The official change log can be found on the BIS forums (search Altis Life RPG)
				"
		]
	];
	
	player createDiaryRecord["changelog",
		[
			"Custom Change Log",
				"
					This section is meant for people doing their own edits to the mission, DO NOT REMOVE THE ABOVE.
				"
		]
	];

		player createDiaryRecord ["serverrules",
		[
			"Exploits", 
				"
				These are considered exploits, and you will not be kicked, but banned.<br/><br/>

				1. Es ist verboten mit einer anderen Methode als mit einem Heli oder Bezahlung aus dem Gef�ngnis zu entkommen.<br/>
				2. Disconnect oder �hnliche Methoden um dem Roleplay zu entgehen.<br/>
				3. Duping von Items oder Geld. Wenn euch am Anfang des Spiels eine sehr gro�e Summe an Geld �berwiesen wird, meldet dies SOFORT dem Admin. Falls ihr das nicht tut und die Admins in der Datenbank einen unrealistischen Wert ohne Erkl�rung finden, werdet ihr ohne Vorwarnung gebannt.<br/>
				4. Verwendung von gehackten Items. Falls ihr ein gehacktes Item findet, meldet dies SOFORT dem Admin oder ihr werdet ohne Vorwarnung gebannt.<br/>
				5. Verwendung von Bugs f�r euren Vorteil.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					Zerst�rung, �berf�lle, Mord oder �hnliches in der N�he oder in den folgenden Zonen wird je nach Schwere mit einem Kick/Bann bestraft.<br/><br/>
					
					Jeder Fahrzeugshop<br/>
					Jeder Waffenshop<br/>
					Alle Polizei-HQs<br/>
					Rebellenau�enposten<br/>
					Donatorshops<br/>
					100m im Umkreis eines ATMs<br/><br/>
				"
		]
	];
					
	
	player createDiaryRecord ["serverrules",
		[
			"Bannable Offenses", 
				"
				Consider this your one and only warning.<br/><br/>
				
				1. Hacking<br/>
				2. Cheating<br/>
				3. Exploiting (See 'Exploits')<br/>
				4. 3 oder mehrmals gekickt worden sein<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Cop Interaction", 
				"
				
				1. Zivilisten werden f�r das Betrachten von Polizeirucks�cken und -fahrzeugen verhaftet. Mehrmaliges Durchf�hren dieser Aktion resultiert in einem Kick/Bann.<br/>
				2. Zivilisten werden verhaftet, wenn diese Polizisten verfolgen, um die Position der Polizei zu verraten.<br/>
				3. Zivilisten oder Rebellen, die Polizisten in St�dten oder anderen Orten ohne RP Grund t�ten, werden nach RDM bestraft.<br/>
				4. Verfolgung und Beleidigung von Polizisten auf l�ngere Zeit wird als Spam/Grief angesehen und mit einem Kick/Bann bestraft.<br/>
				5. Aktiv die Polizei daran hindern ihren Job zu machen f�hrt zu einer Verhaftung. Mehrmaliges Durchf�hren dieser Aktion resultiert in einem Kick/Bann.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Boats", 
				"
				
				1. Wegschieben eines Bootes ohne Erlaubnis<br/>
				2. Verschieben eines Bootes um jemanden zu verletzen/t�ten. Das ist kein RP sondern ein Fehler in der Spielmechanik.<br/>
				3. �berfahren von Tauchern/Schwimmern<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				
				1. Absichtliches Rammen mit einem Helikopter. Egal ob Menschen, Geb�ude oder andere Fahrzeuge.<br/>
				2. Unter 150m st�ndig �ber eine Stadt fliegen.<br/>
				3. Stehlen von Helikopter ohne Vorwarnung und Zeit f�r den Besitzer, den Heli abzuschlie�en.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Vehicles", 
				"
				Items on this list may result in your removal from the server and/or ban, based on the admins discretion.<br/><br/>
				
				1. Absichtliches �berfahren. Unf�lle werden einzeln untersucht.<br/>
				2. Absichtlich vor ein Fahrzeug werfen, um get�tet/verletzt zu werden.<br/>
				3. Rammen von anderen Fahrzeugen, um eine Explosion zu verursachen.<br/>
				4. Andauerndes Einsteigen in Fahrzeuge anderer Leute wird nicht als RP angesehen.<br/>
				5. Diebstahl eines Vehikels, nur um es zu zerst�ren.<br/>
				6. Kaufen mehrerer Fahrzeuge um eines der ersten 5 Dinge zu tun.<br/>
				7. Der einzige Grund um auf ein Fahrzeug zu schie�en ist, um es fahrunt�chtig zu machen oder Warnsch�sse in einem RP Szenario abzugeben. Ihr d�rft nicht auf Fahrzeuge schie�en um diese zu zerst�ren.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Communication Rules", 
				"
				Items on this list may result in your removal from the server and/or ban, based on the admins discretion.<br/><br/>
				
				1. Der Sidechat darf nicht f�r Musik oder Voicegespr�che verwendet werden.<br/>
				2. Spammen eines Chats wird mit Kick/Bann bestraft.<br/>
				4. Teamspeak Channel m�ssen eingehalten werden. Polizisten in Polizistenchannel, Zivilisten in Zivilistenchannel.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching (RDM)", 
				"
				
				1. Das T�ten ohne RP Grund.<br/>
				2. Das Starten einer Rebellion erlaubt nicht das T�ten. Ein genauerer Grund muss vorhanden sein.<br/>
				3. Polizisten und Zivilisten/Rebellen k�nnen nur ein Feuergefecht starten, wenn die Gr�nde zu einem Verbrechen f�hren.<br/>
				4. Wenn du im Kreuzfeuer eines Gefechts stirbst, wird das NICHT als RDM angesehen.<br/>
				5. Jemanden zu T�ten um Andere zu verteidigen wird NICHT als RMD angesehen.<br/>
				6. Jemanden zu t�ten ohne Ihm genug Zeit zu geben, Befehle zu folgen, wird als RDM angesehen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"New Life Rule", 
				"
				Die New Life Regeln betrifft Zivilisten/Rebellen sowie Polizisten.<br/><br/>

				1. Wenn du get�tet wirst, musst du 15 Minuten warten, bevor du an den Unfallort zur�ckzukehren darfst.<br/>
				2. Wenn du w�hrend des Roleplays get�tet wirst, werden deine vergangen Taten vergessen, du darfst aber keine Rache �ben.<br/>
				3. Wenn du von RDM get�tet wurdest, gilt die New Life Regel NICHT.<br/>
				4. Wenn du manuell neu spawnst, gilt die New Life Regel NICHT.<br/>
				5. Wenn du dich absichtlich t�test, um dem RP zu entgehen, gilt die New Life Regel NICHT.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["serverrules",
		[
			"Don't Be A Dick!"
		]
	];
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Crisis Negotiation",
				"
				Krisenmanagement muss vom Sergeant behandelt werden. Falls kein Sergeant auf dem Server ist, ist der vom Rang n�chst h�here Polizisten verantwortlich.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"The Federal Reserve",
				"
				1. Die Bank darf von keinem Zivilisten betreten werden, au�er eine Genehmigung liegt vor. Falls ein Zivilist trotzdem die Bank betritt, wird dieser eskortiert oder verhaftet.
				2. Helikopter, die �ber der Bank fliegen, werden gebeten weiterzufliegen oder au�er Gefecht gesetzt wenn diese verweigern.<br/>
				2. Wenn die Bank ausgeraubt wird, sollten sich alle verf�gbaren Polizisten auf den Weg zur Bank begeben.<br/>
				3. T�dliche Gewalt darf auf die R�uber angewendet werden, wenn keine Alternative besteht. Jede Option, um die R�uber zu tasern, wird bevorzugt.<br/>
				4. Die Polizisten d�rfen nicht blind in die Bank schie�en.<br/>
				5. Die Polizei sollte Zivilisten in der N�he evakuieren.<br/>
				6. Jeder Zivilist, der versucht, die Polizei beim eintreten in das Geb�ude zu st�ren, wird als Komplize angesehen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				1. Kein Helikopter darf ohne Erlaubnis innerhalb jeder Stadt landen. (Kavala, Athira, Pyrigos, Sofia)
				2. Helikopter d�rfen nicht auf Stra�en landen.<br/>
				3. Die Polizei darf tempor�r alle Landungen verbieten.<br/>
				4. Helikopter d�rfen ohne Erlaubnis nicht unter 150m �ber eine Stadt fliegen.<br/>
				5. Helikopter d�rfen nicht �ber einer Stadt schweben. Polizeihelikopter nur w�hrend eines Polizeieinsatzes.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrolling", 
				"
				1. Die Polizei kann auf Stra�en und in St�dten patrouilleren, um nach verlassenen Fahrzeugen oder krimineller Aktivit�t zu suchen.<br/>
				2. Patrouillen d�rfen zu Fu� in der Stadt und in einem Fahrzeug au�erhalb der Stadt durchgef�hrt werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				
				1. An einem Checkpoint m�ssen mindestens 3 Polizisten anwesend sein.
				2. Checkpoints d�rfen nur auf Stra�en angelegt, bemannt werden.<br/>
				3.Vorhandene Checkpoints mit Infrastruktur: Checkpoint Charlie, Checkpoint Alpha, Checkpoint Grenze.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Vehicles", 
				"
				1. Fahrzeuge, die auf einem Parkplatz stehen oder ordnungsgem�� abgestellt wurden, sollten nicht untersucht werden.<br/>
				2. Fahrzeuge, die verlassen sind/kaputt sind/ oder kein Fahrer anwesend ist, d�rfen beschlagnahmt werden.<br/>
				3. Boote sollten nahe an der K�ste abgestellt werden.<br/>
				4. Jedes Fahrzeug das l�nger nicht bewegt wurde, darf beschlagnahmt werden.<br/>
				5. Falls Zweifel bestehen, untersucht das Fahrzeug und schreibt den Inhaber an.<br/>
				6. Waffen auf Fahrzeugen sollten d�rfen nur verwendet werden, um Fahrzeuge au�er Gefecht zu setzen.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Speeding", 
				"
				Innerhalb gro�er St�dte: 50 km/h<br/>
				Kleine Stra�en: 60 km/h<br/>
				Hauptstra�en: 65 km/h<br/>
				Au�erhalb der St�dte: 110 km/h<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arresting and Ticketing",
				"
				1. Du darfst niemanden verhaften, wenn er f�r ein Ticket bezahlt hat.
				2. Du musst dem Verd�chtigen sagen warum du Ihn verhaftest, BEVOR du ihn verhaftest.<br/>
				3. Wenn ein Zivilist gesucht wird, darfst du ihn verhaften.<br/>
				4. Wenn ein Ticket dreimal hintereinander nicht bezahlt wird, wird der Zivilist in Gef�ngnis verfrachtet.<br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Weapons", 
				"
				Ein Polizist darf NIEMALS Zivilisten mit Waffen versorgen. Wenn ihr das tut werdet ihr von der Whitelist entfernt.<br/><br/>

				Legale Waffen, die mit Waffenlizenz getragen werden d�rfen:<br/>
				1. P07<br/>
				2. Rook<br/>
				3. ACP-C2<br/>
				4. Zubr<br/>
				5. 4-five<br/>
				6. PDW2000<br/><br/>

				Jeder andere Waffe ist illegal.<br/><br/>

				1. Waffen m�ssen innerhalb einer Stadt eingesteckt werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Non-Lethal Force",
				"
				At this time the Taser (Silenced P07) is the only form of Non-Lethal Force.<br/><br/>

				1. Der Taser sollte nur daf�r verwendet werden, einen Zivilisten au�er Gefecht zu setzen.<br/>
				2. Feuere den Taser nie ohne Ziel ab.<br/>
				3. Verwende nur den Taser, wenn es nach den Regeln angebracht ist. Zwinge anderen nicht deinen Willen auf.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Lethal Force",
				"
				1. T�dliche Gewalt darf nur angewendet werden, um dein Leben, oder des eines Anderen zu sch�tzen. T�dliche Gewalt darf nur angewendet werden, wenn nicht t�dliche Gewalt NICHT mehr effektiv ist.<br/>
				2. Waffen d�rfen nicht ohne Grund abgefeuert werden.<br/><br/>
				"
		]
	];
	
		
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebel Rules",
				"
				1. Rebellen d�rfen nicht ohne guten Grund Polizisten angreifen.<br/>
				2. Ein Rebell muss erst eine Gang gr�nden, bevor z.B. Forderungen gestellt werden d�rfen.<br/>
				3. Gegenwehr gegen die Regierung, erlaubt kein RDM.<br/>
				4. Gegenwehr sollte aus mehr als nur Ausrauben und erschie�en Polizisten bestehen.<br/>
				5. Die Gegenwehr muss koordiniert sein.<br/>
				6. Ein GUTER Grund steht hinter JEDEM Angriff.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Vehicles",
				"
				A civilian in control of the following prohibited vehicles is subject to the consequences defined in the unauthorized control of a prohibited vehicle law.<br/><br/>

				1. Ifrit<br/>
				2. Speedboat<br/>
				3. Hunter<br/>
				4. Police Offroad<br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Weapons",
				"
				A civilian in possession of the following is subject to the consequences as defined in the illegal possession of a firearm law.<br/><br/>

				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. Mk.20 Series<br/>
				5. Mk.18 ABR<br/>
				6. SDAR Rifle<br/>
				7. Sting SMG<br/>
				8. Silenced P07 (Taser)<br/>
				9. Any explosives<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				The following items are illegal to posses:<br/><br/>
				1. Turtle<br/>
				2. Cocaine<br/>
				3. Heroin<br/>
				4. Cannabis<br/>
				5. Marijuana<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Shift + R: Restrain (Cop Only)<br/>
				Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				Left Shift + L: Activates cop siren lights (as a cop).<br/>
				"
		]
	];