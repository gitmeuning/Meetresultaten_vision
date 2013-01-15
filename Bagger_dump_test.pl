# Eindresultaten: txtbestand in databaseformaat (tabs) tbv statische analyses in SPSS of Excel. 
#   			: logbestand met ID_1,last name, first name, Course_ID, export_foldernaam tbv dubbel_blind_proef(?).
#				: Alléén per course exporteren ter voorkoming van verontreiniging?
#				: Sleutel / item om ARIA/DSV-databases te koppelen (?). Datawarehouse.		
# Zoveel mogelijk automatiseren/opschonen/regels samenvoegen aan de Perl-kant (chronologisch).
# Eén regel bevat uiteindelijk één meting (t.b.v. Excel zonder VB-truuks, opschonen e.d. :-)  ).
#
#
# Alle Perl standaards aanroepen

#!/usr/bin/perl
use strict;
use warnings;
use diagnostics;
# remove test line

print "\n\n\n henk \t\n\n\n";

# Eerst worden alle stappen, variabelen, bestandsnamen en bewerkingen gedeclareerd




# Print tussenresultaten vwg outputcontrole (file)
# Logfile met mislukte foto's (Dispose, export opnieuw voor een schone ARIA-database)
# Beschrijf fouten / to do's / versiebeheer GIT-HUB tzt
# Beschrijving verwerking matchexportbestand	(voorbeeld)
#
# regel 1	:	"Raw Data (Scale: VAR_IEC)"
# regel 2	:	"-------------------------"
# regel 3	:	"						" (leeg)	
# regel 4	:	"Patient Name: Pasma, Wengel ter"	(logfile tbv databases koppelen)
# regel 5	:	"Patient ID: 03398621"				( strip 8 cijfers, kolon 'A' en logfile)
# regel 6	:	"						" (leeg)
# regel 7	:	"						" (leeg)
# regel 8	:	"User: hr"				(bestand geëxporteerd onder log in :)
# regel 9	:	"Date: 31-3-2011 15:55:02"	(bestand geëxporteerd op:)
# regel 10	:	"						" (leeg)
# regel 11	:	"						" (leeg)
# regel 12	:	"Image ID"				(39 columnheaders zónder patient_id)	
# regel 13	:	"[cm] of [deg]" 		eenheden in cm of graden
#
# Inhoud onbewerkte matchresultaten (met patient_id 40 columns)	:	"Image ID	Acquisition Beam ID	Image Type	Couch Vrt	Couch Long	Couch Lat	Couch Pitch	Couch Roll	Couch Rot	Source Rtn	Date	Time	Image Status	Plan ID	Course ID	Session Date	Session Time	Online Match Vrt	Online Match Long	Online Match Lat	Online Match Pitch	Online Match Roll	Online Match Rot	Offline Match Vrt	Offline Match Long	Offline Match Lat	Offline Match Pitch	Offline Match Roll	Offline Match Rot	Treatment Field ID	Treatment Pos Vrt	Treatment Pos Long	Treatment Pos Lat	Treatment Pos Pitch	Treatment Pos Roll	Treatment Pos Rot	Treatment Pos Source Rtn	Fraction	Date	Time" 
#
# Deelproblemen:
# Datum tijd kolommen (DD-MM-YYYY in YYYY-MM-DD) veranderen in fool-proof fixed length formaat tbv chronologisch sorteren ---> s/(\t)(\d{2})-(\d{2})-(\d{4})(\t)(\d{2}):(\d{2}):(\d{2})(\t)/$1$4$3$2$5$6$7$8$9/g;
# Ontbrekende session_id's toevoegen op basis van date/time session opened voorgaande on line session / fraction
#	'P' => [ 15, 'Course ID' ],
#   'Q' => [ 16, 'Session Date' ],
#   'R' => [ 17, 'Session Time' ],
#	'AM' => [ 38, 'Fraction' ],
#
# Patiënt heeft binnen een course soms meerdere plannen waardoor teller weer op "1" gaat. Eigen teller op basis van course en gesorteerde sessions.
# Splits bestanden indien er meerdere courses zijn volgens naamconventie "ID_1-Course_ID". Verwijder bv mamma-EPI-courses uit de folder en dan definitieve conversie slag.
# (onderdeel logfile) waarschuw voor dubbele courses!

# Pair unpaired kV-session, zie ook hierboven (compare hash)
# Stop duizend exportpatiënten in één folder met strakke naamconventie (toegangsrechten!) en verwerk foldernaam in bestandsnaam database
#
#  Headers voor de database
#Optioneel print:
# $Headers_ARIA="Patient ID \tImage ID\tAcquisition Beam ID\tImage Type\tCouch Vrt\tCouch Long\tCouch Lat\tCouch Pitch\tCouch Roll\tCouch Rot\tSource Rtn\tDate\tTime\tImage Status\tPlan ID\tCourse ID\tSession Date\tSession Time\tOnline Match Vrt\tOnline Match Long\tOnline Match Lat\tOnline Match Pitch\tOnline Match Roll\tOnline Match Rot\tOffline Match Vrt\tOffline Match Long\tOffline Match Lat\tOffline Match Pitch\tOffline Match Roll\tOffline Match Rot\tTreatment Field ID\tTreatment Pos Vrt\tTreatment Pos Long\tTreatment Pos Lat\tTreatment Pos Pitch\tTreatment Pos Roll\tTreatment Pos Rot\tTreatment Pos Source Rtn\tFraction\tDate\tTime";
#
#
#

