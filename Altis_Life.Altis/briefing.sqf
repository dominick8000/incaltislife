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

				1. Es ist verboten mit einer anderen Methode als mit einem Heli oder Bezahlung aus dem Gefängnis zu entkommen.<br/>
				2. Disconnect oder ähnliche Methoden um dem Roleplay zu entgehen.<br/>
				3. Duping von Items oder Geld. Wenn euch am Anfang des Spiels eine sehr große Summe an Geld überwiesen wird, meldet dies SOFORT dem Admin. Falls ihr das nicht tut und die Admins in der Datenbank einen unrealistischen Wert ohne Erklärung finden, werdet ihr ohne Vorwarnung gebannt.<br/>
				4. Verwendung von gehackten Items. Falls ihr ein gehacktes Item findet, meldet dies SOFORT dem Admin oder ihr werdet ohne Vorwarnung gebannt.<br/>
				5. Verwendung von Bugs für euren Vorteil.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord["safezones",
		[
			"Safe Zones",
				"
					Zerstörung, Überfälle, Mord oder ähnliches in der Nähe oder in den folgenden Zonen wird je nach Schwere mit einem Kick/Bann bestraft.<br/><br/>
					
					Jeder Fahrzeugshop<br/>
					Jeder Waffenshop<br/>
					Alle Polizei-HQs<br/>
					Rebellenaußenposten<br/>
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
				
				1. Zivilisten werden für das Betrachten von Polizeirucksäcken und -fahrzeugen verhaftet. Mehrmaliges Durchführen dieser Aktion resultiert in einem Kick/Bann.<br/>
				2. Zivilisten werden verhaftet, wenn diese Polizisten verfolgen, um die Position der Polizei zu verraten.<br/>
				3. Zivilisten oder Rebellen, die Polizisten in Städten oder anderen Orten ohne RP Grund töten, werden nach RDM bestraft.<br/>
				4. Verfolgung und Beleidigung von Polizisten auf längere Zeit wird als Spam/Grief angesehen und mit einem Kick/Bann bestraft.<br/>
				5. Aktiv die Polizei daran hindern ihren Job zu machen führt zu einer Verhaftung. Mehrmaliges Durchführen dieser Aktion resultiert in einem Kick/Bann.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Boats", 
				"
				
				1. Wegschieben eines Bootes ohne Erlaubnis<br/>
				2. Verschieben eines Bootes um jemanden zu verletzen/töten. Das ist kein RP sondern ein Fehler in der Spielmechanik.<br/>
				3. Überfahren von Tauchern/Schwimmern<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Aviation", 
				"
				
				1. Absichtliches Rammen mit einem Helikopter. Egal ob Menschen, Gebäude oder andere Fahrzeuge.<br/>
				2. Unter 150m ständig über eine Stadt fliegen.<br/>
				3. Stehlen von Helikopter ohne Vorwarnung und Zeit für den Besitzer, den Heli abzuschließen.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Vehicles", 
				"
				Items on this list may result in your removal from the server and/or ban, based on the admins discretion.<br/><br/>
				
				1. Absichtliches Überfahren. Unfälle werden einzeln untersucht.<br/>
				2. Absichtlich vor ein Fahrzeug werfen, um getötet/verletzt zu werden.<br/>
				3. Rammen von anderen Fahrzeugen, um eine Explosion zu verursachen.<br/>
				4. Andauerndes Einsteigen in Fahrzeuge anderer Leute wird nicht als RP angesehen.<br/>
				5. Diebstahl eines Vehikels, nur um es zu zerstören.<br/>
				6. Kaufen mehrerer Fahrzeuge um eines der ersten 5 Dinge zu tun.<br/>
				7. Der einzige Grund um auf ein Fahrzeug zu schießen ist, um es fahruntüchtig zu machen oder Warnschüsse in einem RP Szenario abzugeben. Ihr dürft nicht auf Fahrzeuge schießen um diese zu zerstören.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Communication Rules", 
				"
				Items on this list may result in your removal from the server and/or ban, based on the admins discretion.<br/><br/>
				
				1. Der Sidechat darf nicht für Musik oder Voicegespräche verwendet werden.<br/>
				2. Spammen eines Chats wird mit Kick/Bann bestraft.<br/>
				4. Teamspeak Channel müssen eingehalten werden. Polizisten in Polizistenchannel, Zivilisten in Zivilistenchannel.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["serverrules",
		[
			"Random Deathmatching (RDM)", 
				"
				
				1. Das Töten ohne RP Grund.<br/>
				2. Das Starten einer Rebellion erlaubt nicht das Töten. Ein genauerer Grund muss vorhanden sein.<br/>
				3. Polizisten und Zivilisten/Rebellen können nur ein Feuergefecht starten, wenn die Gründe zu einem Verbrechen führen.<br/>
				4. Wenn du im Kreuzfeuer eines Gefechts stirbst, wird das NICHT als RDM angesehen.<br/>
				5. Jemanden zu Töten um Andere zu verteidigen wird NICHT als RMD angesehen.<br/>
				6. Jemanden zu töten ohne Ihm genug Zeit zu geben, Befehle zu folgen, wird als RDM angesehen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["serverrules",
		[
			"New Life Rule", 
				"
				Die New Life Regeln betrifft Zivilisten/Rebellen sowie Polizisten.<br/><br/>

				1. Wenn du getötet wirst, musst du 15 Minuten warten, bevor du an den Unfallort zurückzukehren darfst.<br/>
				2. Wenn du während des Roleplays getötet wirst, werden deine vergangen Taten vergessen, du darfst aber keine Rache üben.<br/>
				3. Wenn du von RDM getötet wurdest, gilt die New Life Regel NICHT.<br/>
				4. Wenn du manuell neu spawnst, gilt die New Life Regel NICHT.<br/>
				5. Wenn du dich absichtlich tötest, um dem RP zu entgehen, gilt die New Life Regel NICHT.<br/><br/>
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
				Krisenmanagement muss vom Sergeant behandelt werden. Falls kein Sergeant auf dem Server ist, ist der vom Rang nächst höhere Polizisten verantwortlich.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"The Federal Reserve",
				"
				1. Die Bank darf von keinem Zivilisten betreten werden, außer eine Genehmigung liegt vor. Falls ein Zivilist trotzdem die Bank betritt, wird dieser eskortiert oder verhaftet.
				2. Helikopter, die über der Bank fliegen, werden gebeten weiterzufliegen oder außer Gefecht gesetzt wenn diese verweigern.<br/>
				2. Wenn die Bank ausgeraubt wird, sollten sich alle verfügbaren Polizisten auf den Weg zur Bank begeben.<br/>
				3. Tödliche Gewalt darf auf die Räuber angewendet werden, wenn keine Alternative besteht. Jede Option, um die Räuber zu tasern, wird bevorzugt.<br/>
				4. Die Polizisten dürfen nicht blind in die Bank schießen.<br/>
				5. Die Polizei sollte Zivilisten in der Nähe evakuieren.<br/>
				6. Jeder Zivilist, der versucht, die Polizei beim eintreten in das Gebäude zu stören, wird als Komplize angesehen.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["policerules",
		[
			"Aviation",
				"
				1. Kein Helikopter darf ohne Erlaubnis innerhalb jeder Stadt landen. (Kavala, Athira, Pyrigos, Sofia)
				2. Helikopter dürfen nicht auf Straßen landen.<br/>
				3. Die Polizei darf temporär alle Landungen verbieten.<br/>
				4. Helikopter dürfen ohne Erlaubnis nicht unter 150m über eine Stadt fliegen.<br/>
				5. Helikopter dürfen nicht über einer Stadt schweben. Polizeihelikopter nur während eines Polizeieinsatzes.<br/><br/>

				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Patrolling", 
				"
				1. Die Polizei kann auf Straßen und in Städten patrouilleren, um nach verlassenen Fahrzeugen oder krimineller Aktivität zu suchen.<br/>
				2. Patrouillen dürfen zu Fuß in der Stadt und in einem Fahrzeug außerhalb der Stadt durchgeführt werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Checkpoints", 
				"
				
				1. An einem Checkpoint müssen mindestens 3 Polizisten anwesend sein.
				2. Checkpoints dürfen nur auf Straßen angelegt, bemannt werden.<br/>
				3.Vorhandene Checkpoints mit Infrastruktur: Checkpoint Charlie, Checkpoint Alpha, Checkpoint Grenze.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Vehicles", 
				"
				1. Fahrzeuge, die auf einem Parkplatz stehen oder ordnungsgemäß abgestellt wurden, sollten nicht untersucht werden.<br/>
				2. Fahrzeuge, die verlassen sind/kaputt sind/ oder kein Fahrer anwesend ist, dürfen beschlagnahmt werden.<br/>
				3. Boote sollten nahe an der Küste abgestellt werden.<br/>
				4. Jedes Fahrzeug das länger nicht bewegt wurde, darf beschlagnahmt werden.<br/>
				5. Falls Zweifel bestehen, untersucht das Fahrzeug und schreibt den Inhaber an.<br/>
				6. Waffen auf Fahrzeugen sollten dürfen nur verwendet werden, um Fahrzeuge außer Gefecht zu setzen.<br/><br/>
				"
		]
	];

	player createDiaryRecord ["policerules",
		[
			"Speeding", 
				"
				Innerhalb großer Städte: 50 km/h<br/>
				Kleine Straßen: 60 km/h<br/>
				Hauptstraßen: 65 km/h<br/>
				Außerhalb der Städte: 110 km/h<br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Arresting and Ticketing",
				"
				1. Du darfst niemanden verhaften, wenn er für ein Ticket bezahlt hat.
				2. Du musst dem Verdächtigen sagen warum du Ihn verhaftest, BEVOR du ihn verhaftest.<br/>
				3. Wenn ein Zivilist gesucht wird, darfst du ihn verhaften.<br/>
				4. Wenn ein Ticket dreimal hintereinander nicht bezahlt wird, wird der Zivilist in Gefängnis verfrachtet.<br/>
				"
		]
	];
		
	player createDiaryRecord ["policerules",
		[
			"Weapons", 
				"
				Ein Polizist darf NIEMALS Zivilisten mit Waffen versorgen. Wenn ihr das tut werdet ihr von der Whitelist entfernt.<br/><br/>

				Legale Waffen, die mit Waffenlizenz getragen werden dürfen:<br/>
				1. P07<br/>
				2. Rook<br/>
				3. ACP-C2<br/>
				4. Zubr<br/>
				5. 4-five<br/>
				6. PDW2000<br/><br/>

				Jeder andere Waffe ist illegal.<br/><br/>

				1. Waffen müssen innerhalb einer Stadt eingesteckt werden.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Non-Lethal Force",
				"
				At this time the Taser (Silenced P07) is the only form of Non-Lethal Force.<br/><br/>

				1. Der Taser sollte nur dafür verwendet werden, einen Zivilisten außer Gefecht zu setzen.<br/>
				2. Feuere den Taser nie ohne Ziel ab.<br/>
				3. Verwende nur den Taser, wenn es nach den Regeln angebracht ist. Zwinge anderen nicht deinen Willen auf.<br/><br/>
				"
		]
	];
	
	player createDiaryRecord ["policerules",
		[
			"Use of Lethal Force",
				"
				1. Tödliche Gewalt darf nur angewendet werden, um dein Leben, oder des eines Anderen zu schützen. Tödliche Gewalt darf nur angewendet werden, wenn nicht tödliche Gewalt NICHT mehr effektiv ist.<br/>
				2. Waffen dürfen nicht ohne Grund abgefeuert werden.<br/><br/>
				"
		]
	];
	
		
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebel Rules",
				"
				1. Rebellen dürfen nicht ohne guten Grund Polizisten angreifen.<br/>
				2. Ein Rebell muss erst eine Gang gründen, bevor z.B. Forderungen gestellt werden dürfen.<br/>
				3. Gegenwehr gegen die Regierung, erlaubt kein RDM.<br/>
				4. Gegenwehr sollte aus mehr als nur Ausrauben und erschießen Polizisten bestehen.<br/>
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