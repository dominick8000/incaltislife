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
					Das offizielle Altis Life Changelog kann in den BIS Foren gefunden werden (suche Altis Life RPG)
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
				Es ist verboten Exploits auszunutzen, dazu zaehlt unter anderem: <br/><br/>

				1. mit einer anderen Methode als mit einem Heli oder Bezahlung aus dem Gefaengnis zu entkommen.<br/>
				2. Disconnect oder aehnliche Methoden um dem Roleplay zu entgehen.<br/>
				3. Duping von Items oder Geld. Wenn euch am Anfang des Spiels eine sehr grosse Summe an Geld ueberwiesen wird, meldet dies SOFORT dem Admin. Falls ihr das nicht tut und die Admins in der Datenbank einen unrealistischen Wert ohne Erklaerung finden, werdet ihr ohne Vorwarnung gebannt.<br/>
				4. Verwendung von gehackten Items. Falls ihr ein gehacktes Item findet, meldet dies SOFORT dem Admin oder ihr werdet ohne Vorwarnung gebannt.<br/>
				5. Verwendung von Bugs fuer euren Vorteil.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					Zerstoerung, Ueberfaelle, Mord oder aehnliches in der Naehe oder in den folgenden Zonen wird je nach Schwere mit einem Kick/Bann bestraft.<br/><br/>
					
					Jeder Fahrzeugspawn (Garage/Shop)<br/>
					Jeder Waffenshop<br/>
					Alle Polizei-HQs<br/>
					Rebellenaussenposten<br/>
					Donatorshops<br/>
					100m im Umkreis eines ATMs<br/><br/>
				"
		]
	];
					
	player createDiaryRecord ["serverrules",
		[
			"Interaktion mit Behoerden", 
				"
				
				1. Zivilisten werden fuer das Betrachten von Polizeirucksaecken und -fahrzeugen verhaftet. Mehrmaliges Durchfuehren dieser Aktion resultiert in einem Kick/Bann.<br/>
				2. Zivilisten werden verhaftet, wenn diese Polizisten verfolgen, um die Position der Polizei zu verraten.<br/>
				3. Zivilisten oder Rebellen, die Polizisten in Staedten oder anderen Orten ohne RP Grund toeten, werden nach RDM bestraft.<br/>
				4. Verfolgung und Beleidigung von Polizisten auf laengere Zeit wird als Spam/Grief angesehen und mit einem Kick/Bann bestraft.<br/>
				5. Aktiv die Polizei daran hindern ihren Job zu machen fuehrt zu einer Verhaftung. Mehrmaliges Durchfuehren dieser Aktion resultiert in einem Kick/Bann.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Boote", 
				"
				
				1. Wegschieben eines Bootes ohne Erlaubnis<br/>
				2. Verschieben eines Bootes um jemanden zu verletzen/toeten. Das ist kein RP sondern ein Fehler in der Spielmechanik.<br/>
				3. ueberfahren von Tauchern/Schwimmern<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Flug", 
				"
				Die Folgenden Punkte koennen zu einem Kick/Bann fuehren:<br/><br/>
				
				1. Absichtliches rammen mit einem Helikopter. Egal ob Menschen, Gebaeude oder andere Fahrzeuge.<br/>
				2. Unter 150m staendig ueber eine Stadt fliegen.<br/>
				3. Stehlen von Helikopter ohne Vorwarnung und Zeit fuer den Besitzer, den Heli abzuschliessen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Fahrzeuge", 
				"
				Die Folgenden Punkte koennen zu einem Kick/Bann fuehren:<br/><br/>
				
				1. Absichtliches ueberfahren. Unfaelle werden einzeln untersucht.<br/>
				2. Absichtlich vor ein Fahrzeug werfen, um getoetet/verletzt zu werden.<br/>
				3. Rammen von anderen Fahrzeugen, um eine Explosion zu verursachen.<br/>
				4. Andauerndes Einsteigen in Fahrzeuge anderer Leute wird nicht als RP angesehen.<br/>
				5. Diebstahl eines Vehikels, nur um es zu zerstoeren.<br/>
				6. Kaufen mehrerer Fahrzeuge um eines der ersten 5 Dinge zu tun.<br/>
				7. Der einzige Grund um auf ein Fahrzeug zu schiessen ist, um es fahruntuechtig zu machen oder Warnschuesse in einem RP Szenario abzugeben. Ihr duerft nicht auf Fahrzeuge schiessen um diese zu zerstoeren.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules", 
		[
			"Teamspeak", 
				"
				Der Teamspeak Server ist mit folgender IP zu erreichen: 85.214.149.79 Port: 9987<br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"Kommunikation", 
				"
				Folgendes wird mit einem Kick/Bann bestraft:<br/><br/>
				
				1. Der Sidechat darf nicht fuer Musik oder Voicegespraeche verwendet werden.<br/>
				2. Spammen eines Chats wird mit Kick/Bann bestraft.<br/>
				4. Teamspeak Channel muessen eingehalten werden. Polizisten in Polizistenchannel, Zivilisten in Zivilistenchannel.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching (RDM)", 
				"
				
				1. Das Toeten ohne RP Grund.<br/>
				2. Das Starten einer Rebellion erlaubt nicht das Toeten. Ein genauerer Grund muss vorhanden sein.<br/>
				3. Polizisten und Zivilisten/Rebellen koennen nur ein Feuergefecht starten, wenn die Gruende zu einem Verbrechen fuehren.<br/>
				4. Wenn du im Kreuzfeuer eines Gefechts stirbst, wird das NICHT als RDM angesehen.<br/>
				5. Jemanden zu Toeten um Andere zu verteidigen wird NICHT als RMD angesehen.<br/>
				6. Jemanden zu toeten ohne Ihm genug Zeit zu geben, Befehle zu folgen, wird als RDM angesehen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"New Life Rule", 
				"
				Die New Life Regeln betrifft Zivilisten/Rebellen sowie Polizisten.<br/><br/>

				1. Wenn du getoetet wirst, musst du 10 Minuten warten, bevor du an den Unfallort zurueckzukehren darfst.<br/>
				2. Wenn du waehrend des Roleplays getoetet wirst, werden deine vergangen Taten vergessen, du darfst aber keine Rache ueben.<br/>
				3. Wenn du von RDM getoetet wurdest, gilt die New Life Regel NICHT.<br/>
				4. Wenn du manuell neu spawnst, gilt die New Life Regel NICHT.<br/>
				5. Wenn du dich absichtlich toetest, um dem RP zu entgehen, gilt die New Life Regel NICHT.<br/><br/>
				"
		]
	];
	
// Police Section
	player createDiaryRecord ["policerules",
		[
			"Crisis Negotiation",
				"
				Krisenmanagement muss vom Sergeant behandelt werden. Falls kein Sergeant auf dem Server ist, ist der vom Rang naechst hoehere Polizisten verantwortlich.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"The Federal Reserve",
				"
				1. Die Bank darf von keinem Zivilisten betreten werden, ausser eine Genehmigung liegt vor. Falls ein Zivilist trotzdem die Bank betritt, wird dieser eskortiert oder verhaftet.
				2. Helikopter, die ueber der Bank fliegen, werden gebeten weiterzufliegen oder ausser Gefecht gesetzt wenn diese verweigern.<br/>
				2. Wenn die Bank ausgeraubt wird, sollten sich alle verfuegbaren Polizisten auf den Weg zur Bank begeben.<br/>
				3. Toedliche Gewalt darf auf die Raeuber angewendet werden, wenn keine Alternative besteht. Jede Option, um die Raeuber zu tasern, wird bevorzugt.<br/>
				4. Die Polizisten duerfen nicht blind in die Bank schiessen.<br/>
				5. Die Polizei sollte Zivilisten in der Naehe evakuieren.<br/>
				6. Jeder Zivilist, der versucht, die Polizei beim eintreten in das Gebaeude zu stoeren, wird als Komplize angesehen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				1. Kein Helikopter darf ohne Erlaubnis innerhalb jeder Stadt landen. (Kavala, Athira, Pyrigos, Sofia)
				2. Helikopter duerfen nicht auf Strassen landen.<br/>
				3. Die Polizei darf temporaer alle Landungen verbieten.<br/>
				4. Helikopter duerfen ohne Erlaubnis nicht unter 150m ueber eine Stadt fliegen.<br/>
				5. Helikopter duerfen nicht ueber einer Stadt schweben. Polizeihelikopter nur waehrend eines Polizeieinsatzes.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patroullie", 
				"
				1. Die Polizei kann auf Strassen und in Staedten patrouilleren, um nach verlassenen Fahrzeugen oder krimineller Aktivitaet zu suchen.<br/>
				2. Patrouillen duerfen zu Fuss in der Stadt und in einem Fahrzeug ausserhalb der Stadt durchgefuehrt werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				
				1. An einem Checkpoint sollten mindestens 3 Polizisten anwesend sein.
				2. Checkpoints duerfen nur auf Strassen angelegt, bemannt werden.<br/>
				3.Vorhandene Checkpoints mit Infrastruktur: Checkpoint Charlie, Checkpoint Alpha, Checkpoint Grenze.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Fahrzeuge", 
				"
				1. Fahrzeuge, die auf einem Parkplatz stehen oder ordnungsgemaess abgestellt wurden, sollten nicht untersucht werden.<br/>
				2. Fahrzeuge, die verlassen sind/kaputt sind/ oder kein Fahrer anwesend ist, duerfen beschlagnahmt werden.<br/>
				3. Boote sollten nahe an der Kueste abgestellt werden.<br/>
				4. Jedes Fahrzeug das laenger nicht bewegt wurde, darf beschlagnahmt werden.<br/>
				5. Falls Zweifel bestehen, untersucht das Fahrzeug und schreibt den Inhaber an.<br/>
				6. Waffen auf Fahrzeugen sollten duerfen nur verwendet werden, um Fahrzeuge ausser Gefecht zu setzen.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Hoechstgeschwindigkeiten", 
				"
				Innerhalb grosser Staedte: 50 km/h<br/>
				Kleine Strassen: 60 km/h<br/>
				Hauptstrassen: 65 km/h<br/>
				Ausserhalb der Staedte: 110 km/h<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Verhaftung / Ticket",
				"
				1. Du darfst niemanden verhaften, wenn er fuer ein Ticket bezahlt hat.<br/>
				2. Du musst dem Verdaechtigen sagen warum du Ihn verhaftest, BEVOR du ihn verhaftest.<br/>
				3. Wenn ein Zivilist gesucht wird, darfst du ihn verhaften.<br/>
				4. Wenn ein Ticket dreimal hintereinander nicht bezahlt wird, wird der Zivilist in Gefaengnis verfrachtet.<br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Waffen", 
				"
				Ein Polizist darf NIEMALS Zivilisten mit Waffen versorgen. Wenn ihr das tut werdet ihr von der Whitelist entfernt.<br/><br/>

				Legale Waffen, die mit Waffenlizenz getragen werden duerfen:<br/>
				1. P07<br/>
				2. Rook<br/>
				3. ACP-C2<br/>
				4. Zubr<br/>
				5. 4-five<br/>
				6. PDW2000<br/><br/>

				Jeder andere Waffe ist illegal.<br/><br/>

				1. Waffen muessen innerhalb einer Stadt eingesteckt werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Nicht toedliche Waffen",
				"
				Zurzeit ist der Taser (Silenced P07) die einzige nicht toedliche Waffe.<br/><br/>

				1. Der Taser sollte nur dafuer verwendet werden, einen Zivilisten ausser Gefecht zu setzen.<br/>
				2. Feuere den Taser nie ohne Ziel ab.<br/>
				3. Verwende nur den Taser, wenn es nach den Regeln angebracht ist. Zwinge anderen nicht deinen Willen auf.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Toedliche Waffen",
				"
				1. Toedliche Gewalt darf nur angewendet werden, um dein Leben, oder des eines Anderen zu schuetzen. Toedliche Gewalt darf nur angewendet werden, wenn nicht toedliche Gewalt NICHT mehr effektiv ist.<br/>
				2. Waffen duerfen nicht ohne Grund abgefeuert werden.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["Addons",
		[
			"Used Addons",
				" 
				Auf diesem Server sind u.a. folgende Addons installiert:<br/>
				- BRUUUDI Housing Script<br/> 
				- BTC Logistic<br/>
				- Teargas / Flashbang <br/>
				"
		]
	];
		
		
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebel Rules",
				"
				1. Rebellen duerfen nicht ohne guten Grund Polizisten angreifen.<br/>
				2. Ein Rebell muss erst eine Gang gruenden, bevor z.B. Forderungen gestellt werden duerfen.<br/>
				3. Gegenwehr gegen die Regierung, erlaubt kein RDM.<br/>
				4. Gegenwehr sollte aus mehr als nur Ausrauben und erschiessen Polizisten bestehen.<br/>
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
				Q: Pickaxe benutzen<br/>
				Y: Das Spieler Menue oeffnen<br/>
				U: Autos auf und zu sperren<br/>
				F: Polizeisirene (als cop)<br/>
				T: Kofferaum eines Autos<br/>
				Left Shift + R: fesseln (Cop Only)<br/>
				Left Shift + G: Knock out / stun (Civ Only, um auszurauben)<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				Left Shift + L: Activates cop siren lights (as a cop).<br/>
				"
		]
	];