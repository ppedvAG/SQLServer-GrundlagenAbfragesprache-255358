/*
	Datentypen in SQL: 3 große Gruppen

	1. Charakter/String Datentypen:
	char(10) = 'Hallo     ' = 10 Byte Speicherplatz
	nchar() = 1 Charakter = 2 Byte = 20 Byte => Verwendet UTF-16

	varchar(10) = 'Hallo' => 5 Byte Speicherplatz
	nvarchar() => 1 Charakter = 2 Byte = 10 Byte => Verwendet UTF-16

	varchar(8000) & nvarchar(4000) sind maximum
	Legacy: text --> varchar(max) = bis zu 2GB groß


	2. Numerischen Datentypen
	tinyint = 1 Byte = bis 255
	smallint = 2 Byte = ca. 32k
	int = 4 Byte = bis ca. 2,14Mrd
	bigint = 8 Byte = bis ca. 9,2 Trillionen

	bit = 1 oder 0 (True = 1, False = 0) => Es gibt kein Bool in SQL

	decimal(x, y) = x Ziffern sind gesamt Länge, davon sind y Nachkommastellen
	decimal(10, 2) = 10 Ziffern insgesamt, 2 davon sind Nachkommastellen (8 stellen vor dem Komma)
	money = ca 9,2 Trillionen
	smallmoney = ca. 214 Tausend


	3. Datum/Zeit Datentypen
	time = hh:mm:ss.nnnnnnn
	date = YYYY-MM-DD
	datetime = date + time in Millisekunden = YYYY-MM-DD hh:mm:ss.mmm
	datetime2 = YYYY-MM-DD hh:mm:ss.nnnnnnnn
	smalldatetime = präzise bis Sekunden = YYYY-MM-DD hh:mm:ss

	Andere:
	XML
	JSON
	geometry
	geographie


*/