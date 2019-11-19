#!/bin/sh
#
# Rasticrac v3.3.8 (april 2018)
#
# Rapid Advanced Secure Thorough Intelligent Gaulish Nuclear Acclaimed Cracker
# Rapide Avancé Securisé Tout-terrain Intelligent Gaulois Nucléaire Approfondi Craqueur
#
# Home/Help/Donate/News: https://twitter.com/iRastignac
#
#set -x

# ======
# Please, customize the script first!
# Choices are:

# - Default language (US:english, FR:french, ES:spanish, DE:german, IT:italian, VN:vietnamese, KU:kurdish)
 RClang="US"
#RClang="FR1"
#RClang="FR2"
#RClang="ES1"
#RClang="ES2"
#RClang="DE1"
#RClang="DE2"
#RClang="IT1"
#RClang="IT2"
#RClang="VN1"
#RClang="VN2"
#RClang="KU1"
#RClang="KU2"

# - Default CrackerName (or "Anonymous").
RCcracker="Anonymous"

# - Should "extra details" appear in ipa's filename? (ie: "iPad / 3GS / etc") (You can hate them)
RCextras="YES"

# - Display graphical progress bars? (based on number and/or size of apps) ("by size" is a bit slower)
RCbarNum="YES"
RCbarSize="YES"

# - Should display be verbose? (verbose is messier and a bit slower)
RCverbose="NO"

# - Should script talk to you? (only with iOS4/5/6, only with "speak" tool from Cydia)
RCspeak="YES"

# - Should artist's name be used in ipa's filename?
RCartistfrommeta="YES"

# - Should itemId be used in filename?
RCitemId="NO"

# - Should menu display 'real name' of apps? (slower, slower, and strange sort order)
RCrealnamemenu="NO"

# - Default compression level is blank (aka "-6"), and is the best speed/size ratio.
# - Recommended. Upload/download/storage will be good.
 RCcompression=""
# - Maximum compression ("-9") (also "-8" or "-7") is slower, but size is the best.
# - If your iDevice is fast, if you're not in a hurry, if size matters. Best upload/download/storage.
#RCcompression="-9"
# - Minimum compression ("-2") (also "-3" to "-5") is way faster, but size is way worse.
# - Upload/download/storage will be worse. (other tools like CrackTM or Clutch or Crackulous use "-2").
# - With "-2", RC will be as fast as the others.
#RCcompression="-2"
# - Don't use "-1" (sloppy) or "-0" (store), as size will be horrible, and all will suffer. Avoid.

# - Should I generate fake MetaData or not?
#   (Some people hate them, some love them, some protections check them; you should really keep them)
RCmetadata="YES"

# - Should I try LamestPatchest on the executable?
#   (It won't work 100%, but sometimes it really helps) (and now it's very very fast) (you should keep it)
RClamestpatchest="NO"

# - Which menu dots do you prefer?
 RCdots=".............................."
#RCdots="------------------------------"
#RCdots="                              "
#RCdots="______________________________"

# Progress bar display
RCxxx="====="
RCsss="-----"

# Various
readonly RCversion="338"
readonly cami="/var/mobile/Library/Caches/com.apple.mobile.installation.plist"
readonly cali="/private/var/db/lsd/com.apple.lsdidentifiers.plist"
readonly sbis="/private/var/mobile/Library/SpringBoard/IconState.plist"
readonly vcba="/var/containers/Bundle/Application"
readonly lsd="/tmp/lsd.tmp"
readonly RooRoo="/private/var/tmp/RCtemp"

# DEBUG ONLY: - Force the "this script is running inside a GUI" check?
RCinaGUI="NEVER"
# DEBUG ONLY: - Check only (all tested but Ipa not created)
RCcheck="NEVER"
# DEBUG ONLY: - Eleven Mode
RCeleven="NEVER"

# Thanks you for testing.
# ======



# ======
function SelectLanguage
{
# Language US
if [ $RClang = "US" ]; then
	MsgAnaAppl="Analyzing application"
	MsgAppLoca="Locating"
	MsgBadChoi="Bad choice"
	MsgBldMenu="Building menu..."
	MsgBrzMode="Berzerk mode: cracking ALL"
	MsgBrzNoth="nothing"
	MsgCntFind="Cannot find"
	MsgCopArtw="Copying Artwork"
	MsgCopExec="and copying executable"
	MsgCreDire="Creating directories"
	MsgDskFull="Disk full"
	MsgEraMemo="Erasing memory file"
	MsgErrrors="Errors"
	MsgFakMeta="and faking MetaData"
	MsgFoundIt="Found"
	MsgInsCydi="Install from Cydia"
	MsgIpaDone="Done as"
	MsgIpaInco="Incomplete .ipa"
	MsgMarDone="Marking all apps done"
	MsgMnuEmpt="empty"
	MsgNotMeta="and no MetaData"
	MsgRemTemp="Removing temporary files"
	MsgSgnAppl="Signing the application"
	MsgSizUnit="B"
	MsgUnaLoca="Unable to locate"
	MsgWarning="Warning"
	MsgWasAskd="Asked"
	MsgWrgChoi="Wrong choice"
	MsgWrnMeta="iTunesMetadata format changed"
	MsgYouChoi="Your choices"
	MsgZipStep="Compressing the .ipa (step"
	MsgMrkDone="Mark all done                 "
	MskZroDone="Reset done list               "
fi

# Language FR1 or FR2
if [ $RClang = "FR1" -o $RClang = "FR2" ]; then
	MsgAnaAppl="Analyse d'application"
	MsgAppLoca="Recherche"
	MsgBldMenu="Construction du menu..."
	MsgBrzMode="Mode Berzerk: on craque TOUT"
	MsgCntFind="Introuvable:"
	MsgDskFull="Disque plein"
	MsgInsCydi="Installer avec Cydia"
	MsgMnuEmpt="vide"
	MsgRemTemp="Effacement fichiers temporaires"
	MsgSizUnit="o"
	MsgUnaLoca="Impossible de trouver"
	MsgWrgChoi="Mauvais choix"
	MsgWarning="Attention"
	MsgWrnMeta="nouveau format d'iTunesMetadata"
	MsgYouChoi="Votre choix"
	MsgSgnAppl="Signature de l'application"
	MsgCopArtw="Copie de l'Artwork"
	MsgFakMeta="et fausses MetaData"
	MsgNotMeta="et pas de MetaData"
	MsgWasAskd="Voulu"
	MsgErrrors="Erreurs"
	MsgBrzNoth="rien"
	MsgMrkDone="Tout marquer fait             "
	MskZroDone="Effacer liste fait            "
fi
# Language FR1 (ascii)
if [ $RClang = "FR1" ]; then
	MsgBadChoi="$( echo -ne "Choix erron\0351" )"
	MsgCopExec="$( echo -ne "& copie de l'ex\0351cutable" )"
	MsgCreDire="$( echo -ne "Cr\0351ation r\0351pertoires" )"
	MsgIpaInco="$( echo -ne "Ipa incompl\0350te" )"
	MsgEraMemo="$( echo -ne "Effacement fichier m\0351moire" )"
	MsgIpaDone="$( echo -ne "R\0351sultat:" )"
	MsgMarDone="$( echo -ne "Toutes les apps sont marqu\0351es comme trait\0351es" )"
	MsgZipStep="$( echo -ne "Compression de l'ipa (\0351tape" )"
	MsgFoundIt="$( echo -ne "Trouv\0351" )"
fi
# Language FR2 (utf8)
if [ $RClang = "FR2" ]; then
	MsgBadChoi="$( echo -ne "Choix erron\0303\0251" )"
	MsgCopExec="$( echo -ne "& copie de l'ex\0303\0251cutable" )"
	MsgCreDire="$( echo -ne "Cr\0303\0251ation r\0303\0251pertoires" )"
	MsgIpaInco="$( echo -ne "Ipa incompl\0303\0250te" )"
	MsgEraMemo="$( echo -ne "Effacement fichier m\0303\0251moire" )"
	MsgIpaDone="$( echo -ne "R\0303\0251sultat:" )"
	MsgMarDone="$( echo -ne "Toutes les apps sont marqu\0303\0251es comme trait\0303\0251es" )"
	MsgZipStep="$( echo -ne "Compression de l'ipa (\0303\0251tape" )"
	MsgFoundIt="$( echo -ne "Trouv\0303\0251" )"
fi

# Language ES1 or ES2
if [ $RClang = "ES1" -o $RClang = "ES2" ]; then
	MsgBrzMode="Modo Berzerk: crackando TODO"
	MsgCntFind="No encontro"
	MsgCopExec="y copiando ejecutable"
	MsgCreDire="Creando directorios"
	MsgEraMemo="Borrado memoria archivo"
	MsgInsCydi="Instalarlo desde Cydia"
	MsgIpaDone="Done as"
	MsgMarDone="Marcando todas aplicaciones como 'hecho'"
	MsgRemTemp="Borrando archivos temporales"
	MsgSizUnit="B"
	MsgUnaLoca="Incapaz de ubicar"
	MsgWarning="Warning"
	MsgWrnMeta="iTunesMetadata formato cambiado"
	MsgCopArtw="Copiando Artwork"
	MsgFakMeta="y fingiendo MetaData"
	MsgNotMeta="y no MetaData"
	MsgFoundIt="Found"
	MsgWasAskd="Asked"
	MsgErrrors="Errores"
	MsgBrzNoth="nada"
	MsgMrkDone="Marcar todas hechas           "
	MskZroDone="Vaciar lista hechas           "
fi
# Language ES1 (ascii)
if [ $RClang = "ES1" ]; then
	MsgAnaAppl="$( echo -ne "Analizando aplicaci\0363n" )"
	MsgAppLoca="$( echo -ne "Ubicaci\0363n" )"
	MsgBadChoi="$( echo -ne "Mala elecci\0363n" )"
	MsgBldMenu="$( echo -ne "Construyendo men\0372..." )"
	MsgIpaInco="$( echo -ne "\0241 Incompleta .ipa" )"
	MsgDskFull="$( echo -ne "\0277 Disco lleno" )"
	MsgMnuEmpt="$( echo -ne "vac\0355o" )"
	MsgWrgChoi="$( echo -ne "Opci\0363n incorrecta" )"
	MsgYouChoi="$( echo -ne "\0277 Su elecci\0363" )"
	MsgZipStep="$( echo -ne "Compresi\0363n de .ipa (paso" )"
	MsgSgnAppl="$( echo -ne "Firma de la aplicaci\0363n" )"
fi
# Language ES2 (utf8)
if [ $RClang = "ES2" ]; then
	MsgAnaAppl="$( echo -ne "Analizando aplicaci\0303\0263n" )"
	MsgAppLoca="$( echo -ne "Ubicaci\0303\0263n" )"
	MsgBadChoi="$( echo -ne "Mala elecci\0303\0263n" )"
	MsgBldMenu="$( echo -ne "Construyendo men\0303\0272..." )"
	MsgIpaInco="$( echo -ne "\0302\0241 Incompleta .ipa" )"
	MsgDskFull="$( echo -ne "\0302\0277 Disco lleno" )"
	MsgMnuEmpt="$( echo -ne "vac\0303\0255o" )"
	MsgWrgChoi="$( echo -ne "Opci\0303\0263n incorrecta" )"
	MsgYouChoi="$( echo -ne "\0302\0277 Su elecci\0303\0263" )"
	MsgZipStep="$( echo -ne "Compresi\0303\0263n de .ipa (paso" )"
	MsgSgnAppl="$( echo -ne "Firma de la aplicaci\0303\0263n" )"
fi

# Language DE1 or DE2. Translation by Ushnak.
if [ $RClang = "DE1" -o $RClang = "DE2" ]; then
	MsgAnaAppl="Analyse der App"
	MsgAppLoca="Suche"
	MsgBrzMode="Berzerker Modus: ALLES wird gecrackt"
	MsgCntFind="Nicht aufzufinden:"
	MsgCopExec="Kopieren der Executable"
	MsgCreDire="Erstellen der Ordner"
	MsgDskFull="Kein Speicher mehr"
	MsgInsCydi="Installieren mit Cydia"
	MsgIpaDone="Fertig"
	MsgMnuEmpt="leer"
	MsgMarDone="Alle Apps als gecrackt markieren"
	MsgSizUnit="B"
	MsgWrgChoi="Schlechte Wahl"
	MsgWarning="Warnung"
	MsgYouChoi="Ihre Wahl"
	MsgZipStep="Kompression der .ipa (Schritt"
	MsgSgnAppl="Signieren der App"
	MsgCopArtw="Kopieren des Artworks"
	MsgFakMeta="und der falschen MetaData"
	MsgNotMeta="und keine MetaData"
	MsgFoundIt="Gefunden"
	MsgWasAskd="Angefragt"
	MsgErrrors="Fehler"
	MsgBrzNoth="Nichts"
fi
# Language DE1 (ascii). Translation by Ushnak.
if [ $RClang = "DE1" ]; then
	MsgBadChoi="$( echo -ne "Ung\0374ltige Wahl" )"
	MsgBldMenu="$( echo -ne "Aufbau des Men\0374s..." )"
	MsgIpaInco="$( echo -ne "Unvollst\0344ndige .ipa" )"
	MsgEraMemo="$( echo -ne "L\0366schen des Zwischenspeichers" )"
	MsgRemTemp="$( echo -ne "L\0366schen des Speichers" )"
	MsgUnaLoca="$( echo -ne "Unm\0366glich zu Finden" )"
	MsgWrnMeta="$( echo -ne "Das Format der iTunesMetaData wurde ge\0344ndert" )"
	MsgMrkDone="$( echo -ne "Alles als angew\0344hlt           " )"
	MskZroDone="$( echo -ne "Liste der angew\0344hlten l\0366schen " )"
fi
# Language DE2 (utf8). Translation by Ushnak.
if [ $RClang = "DE2" ]; then
	MsgBadChoi="$( echo -ne "Ung\0303\0274ltige Wahl" )"
	MsgBldMenu="$( echo -ne "Aufbau des Men\0303\0274s..." )"
	MsgIpaInco="$( echo -ne "Unvollst\0303\0244ndige .ipa" )"
	MsgEraMemo="$( echo -ne "L\0303\0266schen des Zwischenspeichers" )"
	MsgRemTemp="$( echo -ne "L\0303\0266schen des Speichers" )"
	MsgUnaLoca="$( echo -ne "Unm\0303\0266glich zu Finden" )"
	MsgWrnMeta="$( echo -ne "Das Format der iTunesMetaData wurde ge\0303\0244ndert" )"
	MsgMrkDone="$( echo -ne "Alles als angew\0303\0244hlt           " )"
	MskZroDone="$( echo -ne "Liste der angew\0303\0244hlten l\0303\0266schen " )"
fi

# Language IT1 and IT2. Translation by Wfede21.
if [ $RClang = "IT1" -o $RClang = "IT2" ]; then
	MsgAnaAppl="Analisi applicazione"
	MsgAppLoca="Localizzo"
	MsgBadChoi="Scelta sbagliata"
	MsgBldMenu="Costruisco il menu..."
	MsgCntFind="Impossibile trovare"
	MsgCopExec="e copio l'eseguibile"
	MsgCreDire="Creo le cartelle"
	MsgIpaInco=".ipa non completa"
	MsgDskFull="Memoria piena"
	MsgEraMemo="Cancellando file di memoria"
	MsgInsCydi="Installa da Cydia"
	MsgIpaDone="Fatto come"
	MsgMnuEmpt="vuoto"
	MsgMarDone="Tutte le app craccate"
	MsgRemTemp="Rimozione file temporanei"
	MsgSizUnit="B"
	MsgUnaLoca="Impossibile trovare"
	MsgWrgChoi="Scelta sbagliata"
	MsgWarning="Attenzione"
	MsgWrnMeta="formato iTunesMetadata cambiato"
	MsgYouChoi="La tua scelta"
	MsgZipStep="Compressione .ipa (passo"
	MsgSgnAppl="Signing the application"
	MsgCopArtw="Copia di Artwork"
	MsgFakMeta="e falsifico MetaData"
	MsgNotMeta="e niente MetaData"
	MsgFoundIt="Trovato"
	MsgWasAskd="Chiesto"
	MsgErrrors="Errore"
	MsgBrzNoth="niente"
	MsgMrkDone="Segna come tutte craccate     "
	MskZroDone="Azzera lista app craccate     "
fi
# Language IT1 (ascii). Translation by Wfede21.
if [ $RClang = "IT1" ]; then
	MsgBrzMode="$( echo -ne "Modalit\0340 Berzerk: crack di tutte le app" )"
fi
# Language IT2 (utf8). Translation by Wfede21.
if [ $RClang = "IT2" ]; then
	MsgBrzMode="$( echo -ne "Modalit\0303\0240 Berzerk: crack di tutte le app" )"
fi
# Language VN. Translation by Lamapple.
if [ $RClang = "VN1" ]; then
	MsgAnaAppl="$( echo -ne "\020\01ang Ph\0342n t\0355ch \0350\036ng d\0345\036ng" )"
	MsgAppLoca="$( echo -ne "\020\01ang \021\01\0313\036nh v\0313\036" )"
	MsgBadChoi="$( echo -ne "L\0361\036a ch\0315\036n t\0307\036" )"
	MsgBldMenu="$( echo -ne "\020\01ang t\0241\036o menu..." )"
	MsgBrzMode="$( echo -ne "Ch\0277\036 \021\01\0331\036 Berzerk: \020\01ang crack t\0245\036t c\0243\036" )"
	MsgBrzNoth="$( echo -ne "Kh\0364ng c\0363 g\0354" )"
	MsgCntFind="$( echo -ne "Kh\0364ng t\0354m th\0245\036y" )"
	MsgCopArtw="$( echo -ne "\020\01ang sao ch\0351p \0242\036nh minh h\0315\036a" )"
	MsgCopExec="$( echo -ne "v\0340 \021\01ang sao ch\0351p th\0361\036c thi" )"
	MsgCreDire="$( echo -ne "\020\01ang t\0241\036o th\0260\01 m\0345\036c" )"
	MsgDskFull="$( echo -ne "B\0331\036 nh\0333\036 \021\01\0247\036y" )"
	MsgEraMemo="$( echo -ne "\020\01ang xo\0341 t\0255\036p tin b\0331\036 nh\0333\036" )"
	MsgErrrors="$( echo -ne "L\0327\036i" )"
	MsgFakMeta="$( echo -ne "v\0340 \021\01ang gi\0243\036 m\0241\036o MetaData" )"
	MsgFoundIt="$( echo -ne "T\0354m th\0245\036y" )"
	MsgInsCydi="$( echo -ne "C\0340i\021\01\0267\036t t\0353\036 Cydia" )"
	MsgIpaDone="$( echo -ne "Th\0361\036c hi\0307\036n nh\0260\01" )"
	MsgIpaInco="$( echo -ne "Ch\0260\01a ho\0340n th\0340nh .ipa" )"
	MsgMarDone="$( echo -ne "\020\01\0341nh d\0245\036u t\0245\036t c\0243\036 c\0341c \0351\036ng d\0345\036ng \021\01\0260\01\0343\036c th\0361\036c hi\0307\036n" )"
	MsgMnuEmpt="$( echo -ne "Tr\0321\036ng" )"
	MsgNotMeta="$( echo -ne "v\0340 kh\0364ng c\0363 MetaData" )"
	MsgRemTemp="$( echo -ne "\020\01ang lo\0241\036i b\0317\036 c\0341c t\0255\036p tin t\0241\036m th\0335\036i" )"
	MsgSgnAppl="$( echo -ne "\020\01ang Sign c\0341c \0351\036ng d\0345\036ng" )"
	MsgSizUnit="B"
	MsgUnaLoca="$( echo -ne "Kh\0364ng th\0245\036y \021\01\0260\01\0335\036ng d\0253\036n" )"
	MsgWarning="$( echo -ne "C\0243\036nh b\0341o" )"
	MsgWasAskd="$( echo -ne "H\0317\036i" )"
	MsgWrgChoi="$( echo -ne "L\0361\036a ch\0315\036n sai" )"
	MsgWrnMeta="$( echo -ne "\020\01\0313\036nh d\0241\036ng iTunesMetadata \021\01\0343 thay \021\01\0325\036i" )"
	MsgYouChoi="$( echo -ne "L\0361\036a ch\0315\036n c\0347\036a b\0241\036n" )"
	MsgZipStep="$( echo -ne "\020\01ang n\0351n c\0341c .ipa (b\0260\01\0333\036c" )"
	MsgMrkDone="$( echo -ne "\020\01\0341nh d\0245\036u t\0245\036t c\0243\036 \021\01\0260\01\0343\036c th\0361\036c hi\0307\036n                 " )"
	MskZroDone="$( echo -ne "\020\01\0267\036t l\0241\036i danh s\0341ch \021\01\0260\01\0343\036c th\0361\036c hi\0307\036n               " )"
fi
if [ $RClang = "VN2" ]; then
	MsgAnaAppl="$( echo -ne "\0304\0220ang Ph\0303\0242n t\0303\0255ch \0341\0273\0250ng d\0341\0273\0245ng" )"
	MsgAppLoca="$( echo -ne "\0304\0220ang \0304\0221\0341\0273\0213nh v\0341\0273\0213" )"
	MsgBadChoi="$( echo -ne "L\0341\0273\0261a ch\0341\0273\0215n t\0341\0273\0207" )"
	MsgBldMenu="$( echo -ne "\0304\0220ang t\0341\0272\0241o menu..." )"
	MsgBrzMode="$( echo -ne "Ch\0341\0272\0277 \0304\0221\0341\0273\0231 Berzerk: \0304\0220ang crack t\0341\0272\0245t c\0341\0272\0243" )"
	MsgBrzNoth="$( echo -ne "Kh\0303\0264ng c\0303\0263 g\0303\0254" )"
	MsgCntFind="$( echo -ne "Kh\0303\0264ng t\0303\0254m th\0341\0272\0245y" )"
	MsgCopArtw="$( echo -ne "\0304\0220ang sao ch\0303\0251p \0341\0272\0242nh minh h\0341\0273\0215a" )"
	MsgCopExec="$( echo -ne "v\0303\0240 \0304\0221ang sao ch\0303\0251p th\0341\0273\0261c thi" )"
	MsgCreDire="$( echo -ne "\0304\0220ang t\0341\0272\0241o th\0306\0260 m\0341\0273\0245c" )"
	MsgDskFull="$( echo -ne "B\0341\0273\0231 nh\0341\0273\0233 \0304\0221\0341\0272\0247y" )"
	MsgEraMemo="$( echo -ne "\0304\0220ang xo\0303\0241 t\0341\0272\0255p tin b\0341\0273\0231 nh\0341\0273\0233" )"
	MsgErrrors="$( echo -ne "L\0341\0273\0227i" )"
	MsgFakMeta="$( echo -ne "v\0303\0240 \0304\0221ang gi\0341\0272\0243 m\0341\0272\0241o MetaData" )"
	MsgFoundIt="$( echo -ne "T\0303\0254m th\0341\0272\0245y" )"
	MsgInsCydi="$( echo -ne "C\0303\0240i\0304\0221\0341\0272\0267t t\0341\0273\0253 Cydia" )"
	MsgIpaDone="$( echo -ne "Th\0341\0273\0261c hi\0341\0273\0207n nh\0306\0260" )"
	MsgIpaInco="$( echo -ne "Ch\0306\0260a ho\0303\0240n th\0303\0240nh .ipa" )"
	MsgMarDone="$( echo -ne "\0304\0220\0303\0241nh d\0341\0272\0245u t\0341\0272\0245t c\0341\0272\0243 c\0303\0241c \0341\0273\0251ng d\0341\0273\0245ng \0304\0221\0306\0260\0341\0273\0243c th\0341\0273\0261c hi\0341\0273\0207n" )"
	MsgMnuEmpt="$( echo -ne "Tr\0341\0273\0221ng" )"
	MsgNotMeta="$( echo -ne "v\0303\0240 kh\0303\0264ng c\0303\0263 MetaData" )"
	MsgRemTemp="$( echo -ne "\0304\0220ang lo\0341\0272\0241i b\0341\0273\0217 c\0303\0241c t\0341\0272\0255p tin t\0341\0272\0241m th\0341\0273\0235i" )"
	MsgSgnAppl="$( echo -ne "\0304\0220ang Sign c\0303\0241c \0341\0273\0251ng d\0341\0273\0245ng" )"
	MsgSizUnit="B"
	MsgUnaLoca="$( echo -ne "Kh\0303\0264ng th\0341\0272\0245y \0304\0221\0306\0260\0341\0273\0235ng d\0341\0272\0253n" )"
	MsgWarning="$( echo -ne "C\0341\0272\0243nh b\0303\0241o" )"
	MsgWasAskd="$( echo -ne "H\0341\0273\0217i" )"
	MsgWrgChoi="$( echo -ne "L\0341\0273\0261a ch\0341\0273\0215n sai" )"
	MsgWrnMeta="$( echo -ne "\0304\0220\0341\0273\0213nh d\0341\0272\0241ng iTunesMetadata \0304\0221\0303\0243 thay \0304\0221\0341\0273\0225i" )"
	MsgYouChoi="$( echo -ne "L\0341\0273\0261a ch\0341\0273\0215n c\0341\0273\0247a b\0341\0272\0241n" )"
	MsgZipStep="$( echo -ne "\0304\0220ang n\0303\0251n c\0303\0241c .ipa (b\0306\0260\0341\0273\0233c" )"
	MsgMrkDone="$( echo -ne "\0304\0220\0303\0241nh d\0341\0272\0245u t\0341\0272\0245t c\0341\0272\0243 \0304\0221\0306\0260\0341\0273\0243c th\0341\0273\0261c hi\0341\0273\0207n                 " )"
	MskZroDone="$( echo -ne "\0304\0220\0341\0272\0267t l\0341\0272\0241i danh s\0303\0241ch \0304\0221\0306\0260\0341\0273\0243c th\0341\0273\0261c hi\0341\0273\0207n               " )"
fi
# Language KU. Translation by Ak0-Sardashti.
if [ $RClang = "KU1" ]; then
	MsgAnaAppl="$( echo -ne "/\06'\06H\06'\06\0251\061\06/\06F\06 (\06\0306\06 4\06\0314\06\0251\061\06/\06F\06\0325\06H\06\0325\06" )"
	MsgAppLoca="$( echo -ne "4\06H\06J\06F\06 /\06J\06'\061\06I\06 C\061\06/\06F\06" )"
	MsgBadChoi="$( echo -ne "G\06\0325\06\0265\06(\06\0230\06'\061\06/\06\0325\06\0314\06 .\061\06'\06~\06" )"
	MsgBldMenu="$( echo -ne "D\06\0314\063\06*\06\0314\06 (\06F\06\0314\06'\06*\06 F\06'\06F\06..." )"
	MsgBrzMode="$( echo -ne "Berzerk \0206\06\0306\06F\06*\06\0314\06\0325\06*\06\0314\06: \0251\06\0225\06'\06\0251\06 \0251\061\06/\06F\06\0314\06 G\06\0325\06E\06H\06H\06*\06" )"
	MsgBrzNoth="$( echo -ne "G\06\0314\06\0206\06" )"
	MsgCntFind="$( echo -ne "F\06\0325\06*\06H\06'\06F\061\06'\06 (\06/\06\0306\062\061\06\0316\06*\06\0325\06H\06\0325\06" )"
	MsgCopArtw="$( echo -ne "D\06\0325\06(\06\0325\061\06\0257\061\06*\06F\06\0325\06H\06\0325\06\0314\06 \0251\06'\061\06\0325\06\0251\06\0325\06*\06" )"
	MsgCopExec="$( echo -ne "H\06\0325\06 D\06\0325\06(\06\0325\061\06\0257\061\06*\06F\06\0325\06H\06\0325\06\0314\06 executable" )"
	MsgCreDire="$( echo -ne "\0225\06\0316\06(\06\0325\061\06 /\061\06H\063\06*\06 /\06\0325\06\0251\06'\06*\06" )"
	MsgDskFull="$( echo -ne "/\06J\063\06C\06 ~\06\0225\06" )"
	MsgEraMemo="$( echo -ne "3\06\0225\06\0314\06F\06\0325\06H\06\0325\06\0314\06 A\06'\06\0314\06D\06\0314\06 E\06\0314\06E\06\0306\061\06\0314\06" )"
	MsgErrrors="$( echo -ne "G\06\0325\06\0265\06\0325\06" )"
	MsgFakMeta="$( echo -ne "H\06 2\06'\06F\06J\06'\061\06I\06 /\06\0325\061\06(\06'\061\06\0325\06I\06 2\06'\06F\06J\06'\061\06I\06 A\06\0316\06\0265\06(\06'\062\06 /\06'\06*\06" )"
	MsgFoundIt="$( echo -ne "/\06\0306\062\06J\06J\06\0325\06H\06\0325\06" )"
	MsgInsCydi="$( echo -ne "/\06'\06E\06\0325\062\06 1\06'\06F\06/\06F\06 D\06\0325\063\06\0314\06/\06\0314\06'\06" )"
	MsgIpaDone="$( echo -ne "*\06\0325\06H\06'\06H\06 (\06H\06H\06 D\06\0325\06" )"
	MsgIpaInco="$( echo -ne "F\06'\06*\06\0325\06H\06'\06H\06 .ipa" )"
	MsgMarDone="$( echo -ne "F\06J\064\06'\06F\06 /\06\0325\06C\06'\06*\06 G\06\0325\06E\06H\06H\06 (\06\0325\061\06F\06'\06E\06\0325\06 *\06\0325\06H\06'\06H\06 (\06H\06H\06" )"
	MsgMnuEmpt="$( echo -ne "(\06\0325\06*\06'\06\0265\06" )"
	MsgNotMeta="$( echo -ne "H\06 F\06\0325\06.\06\0316\061\06 2\06'\06F\06J\06'\061\06I\06 /\06\0325\061\06 (\06'\061\06\0325\06I\06 2\06'\06F\06J\06'\061\06I\06" )"
	MsgRemTemp="$( echo -ne "A\06'\06J\06D\06I\06 C\06'\06*\06I\06 D\06'\06 /\06\0325\06(\06'\06*\06" )"
	MsgSgnAppl="$( echo -ne "/\06'\06H\06'\06 C\061\06/\06F\06\0325\06C\06\0325\06 &\06J\06E\062\06'\06 /\06\0325\06C\06'\06*\06" )"
	MsgSizUnit="B"
	MsgUnaLoca="$( echo -ne "F\06\0325\06*\06H\06'\06F\061\06'\06 4\06H\06\0316\06F\06\0325\06\0251\06\0325\06 /\06\0314\06'\061\06\0314\06 (\06\0251\061\06\0316\06*\06" )"
	MsgWarning="$( echo -ne "G\06\0306\064\06/\06'\061\06I\06 /\06\0325\06/\06'\06*\06" )"
	MsgWasAskd="$( echo -ne "/\06'\06H\06'\06 /\06\0325\06C\06'\06*\06" )"
	MsgWrgChoi="$( echo -ne "G\06\0325\06\0265\06(\06\0230\06'\061\06/\06\0325\06\0314\06 G\06\0325\06\0265\06\0325\06" )"
	MsgWrnMeta="$( echo -ne "iTunesMetadata 4\06\0316\06H\06\0325\06 \0257\06H\06\0225\06'\06I\06" )"
	MsgYouChoi="$( echo -ne "G\06\0325\06\0265\06(\06\0230\06'\061\06/\06\0325\06\0314\06 *\06\0306\06" )"
	MsgZipStep="$( echo -ne "/\06\0325\06~\06\0325\063\06*\06\0316\06*\06 .ipa (step" )"
	MsgMrkDone="$( echo -ne "/\06\0314\06'\061\06\0314\06 \0251\061\06/\06F\06\0325\06\0251\06'\06F\06 *\06\0325\06H\06'\06H\06 \0251\061\06'\06   " )"
	MskZroDone="$( echo -ne "D\06J\063\06*\06\0325\06I\06 *\06\0325\06H\06'\06H\06 (\06H\06H\06 \0225\06\0316\06C\06 /\06\0325\06.\06'\06*\06\0325\06H\06\0325\06 (\06\0325\06   " )"
fi
if [ $RClang = "KU2" ]; then
	MsgAnaAppl="$( echo -ne "\0330\0257\0330\0247\0331\0210\0330\0247\0332\0251\0330\0261\0330\0257\0331\0206 \0330\0250\0333\0206 \0330\0264\0333\0214\0332\0251\0330\0261\0330\0257\0331\0206\0333\0225\0331\0210\0333\0225" )"
	MsgAppLoca="$( echo -ne "\0330\0264\0331\0210\0331\0212\0331\0206 \0330\0257\0331\0212\0330\0247\0330\0261\0331\0211 \0331\0203\0330\0261\0330\0257\0331\0206" )"
	MsgBadChoi="$( echo -ne "\0331\0207\0333\0225\0332\0265\0330\0250\0332\0230\0330\0247\0330\0261\0330\0257\0333\0225\0333\0214 \0330\0256\0330\0261\0330\0247\0331\0276" )"
	MsgBldMenu="$( echo -ne "\0331\0204\0333\0214\0330\0263\0330\0252\0333\0214 \0330\0250\0331\0206\0333\0214\0330\0247\0330\0252 \0331\0206\0330\0247\0331\0206..." )"
	MsgBrzMode="$( echo -ne "Berzerk \0332\0206\0333\0206\0331\0206\0330\0252\0333\0214\0333\0225\0330\0252\0333\0214: \0332\0251\0332\0225\0330\0247\0332\0251 \0332\0251\0330\0261\0330\0257\0331\0206\0333\0214 \0331\0207\0333\0225\0331\0205\0331\0210\0331\0210\0330\0252" )"
	MsgBrzNoth="$( echo -ne "\0331\0207\0333\0214\0332\0206" )"
	MsgCntFind="$( echo -ne "\0331\0206\0333\0225\0330\0252\0331\0210\0330\0247\0331\0206\0330\0261\0330\0247 \0330\0250\0330\0257\0333\0206\0330\0262\0330\0261\0333\0216\0330\0252\0333\0225\0331\0210\0333\0225" )"
	MsgCopArtw="$( echo -ne "\0331\0204\0333\0225\0330\0250\0333\0225\0330\0261\0332\0257\0330\0261\0330\0252\0331\0206\0333\0225\0331\0210\0333\0225\0333\0214 \0332\0251\0330\0247\0330\0261\0333\0225\0332\0251\0333\0225\0330\0252" )"
	MsgCopExec="$( echo -ne "\0331\0210\0333\0225 \0331\0204\0333\0225\0330\0250\0333\0225\0330\0261\0332\0257\0330\0261\0330\0252\0331\0206\0333\0225\0331\0210\0333\0225\0333\0214 executable" )"
	MsgCreDire="$( echo -ne "\0332\0225\0333\0216\0330\0250\0333\0225\0330\0261 \0330\0257\0330\0261\0331\0210\0330\0263\0330\0252 \0330\0257\0333\0225\0332\0251\0330\0247\0330\0252" )"
	MsgDskFull="$( echo -ne "\0330\0257\0331\0212\0330\0263\0331\0203 \0331\0276\0332\0225" )"
	MsgEraMemo="$( echo -ne "\0330\0263\0332\0225\0333\0214\0331\0206\0333\0225\0331\0210\0333\0225\0333\0214 \0331\0201\0330\0247\0333\0214\0331\0204\0333\0214 \0331\0205\0333\0214\0331\0205\0333\0206\0330\0261\0333\0214" )"
	MsgErrrors="$( echo -ne "\0331\0207\0333\0225\0332\0265\0333\0225" )"
	MsgFakMeta="$( echo -ne "\0331\0210 \0330\0262\0330\0247\0331\0206\0331\0212\0330\0247\0330\0261\0331\0211 \0330\0257\0333\0225\0330\0261\0330\0250\0330\0247\0330\0261\0333\0225\0331\0211 \0330\0262\0330\0247\0331\0206\0331\0212\0330\0247\0330\0261\0331\0211 \0331\0201\0333\0216\0332\0265\0330\0250\0330\0247\0330\0262 \0330\0257\0330\0247\0330\0252" )"
	MsgFoundIt="$( echo -ne "\0330\0257\0333\0206\0330\0262\0331\0212\0331\0212\0333\0225\0331\0210\0333\0225" )"
	MsgInsCydi="$( echo -ne "\0330\0257\0330\0247\0331\0205\0333\0225\0330\0262 \0330\0261\0330\0247\0331\0206\0330\0257\0331\0206 \0331\0204\0333\0225\0330\0263\0333\0214\0330\0257\0333\0214\0330\0247" )"
	MsgIpaDone="$( echo -ne "\0330\0252\0333\0225\0331\0210\0330\0247\0331\0210 \0330\0250\0331\0210\0331\0210 \0331\0204\0333\0225" )"
	MsgIpaInco="$( echo -ne "\0331\0206\0330\0247\0330\0252\0333\0225\0331\0210\0330\0247\0331\0210 .ipa" )"
	MsgMarDone="$( echo -ne "\0331\0206\0331\0212\0330\0264\0330\0247\0331\0206 \0330\0257\0333\0225\0331\0203\0330\0247\0330\0252 \0331\0207\0333\0225\0331\0205\0331\0210\0331\0210 \0330\0250\0333\0225\0330\0261\0331\0206\0330\0247\0331\0205\0333\0225 \0330\0252\0333\0225\0331\0210\0330\0247\0331\0210 \0330\0250\0331\0210\0331\0210" )"
	MsgMnuEmpt="$( echo -ne "\0330\0250\0333\0225\0330\0252\0330\0247\0332\0265" )"
	MsgNotMeta="$( echo -ne "\0331\0210 \0331\0206\0333\0225\0330\0256\0333\0216\0330\0261 \0330\0262\0330\0247\0331\0206\0331\0212\0330\0247\0330\0261\0331\0211 \0330\0257\0333\0225\0330\0261 \0330\0250\0330\0247\0330\0261\0333\0225\0331\0211 \0330\0262\0330\0247\0331\0206\0331\0212\0330\0247\0330\0261\0331\0211" )"
	MsgRemTemp="$( echo -ne "\0331\0201\0330\0247\0331\0212\0331\0204\0331\0211 \0331\0203\0330\0247\0330\0252\0331\0211 \0331\0204\0330\0247 \0330\0257\0333\0225\0330\0250\0330\0247\0330\0252" )"
	MsgSgnAppl="$( echo -ne "\0330\0257\0330\0247\0331\0210\0330\0247 \0331\0203\0330\0261\0330\0257\0331\0206\0333\0225\0331\0203\0333\0225 \0330\0246\0331\0212\0331\0205\0330\0262\0330\0247 \0330\0257\0333\0225\0331\0203\0330\0247\0330\0252" )"
	MsgSizUnit="$( echo -ne "\0330\0250" )"
	MsgUnaLoca="$( echo -ne "\0331\0206\0333\0225\0330\0252\0331\0210\0330\0247\0331\0206\0330\0261\0330\0247 \0330\0264\0331\0210\0333\0216\0331\0206\0333\0225\0332\0251\0333\0225 \0330\0257\0333\0214\0330\0247\0330\0261\0333\0214 \0330\0250\0332\0251\0330\0261\0333\0216\0330\0252" )"
	MsgWarning="$( echo -ne "\0331\0207\0333\0206\0330\0264\0330\0257\0330\0247\0330\0261\0331\0211 \0330\0257\0333\0225\0330\0257\0330\0247\0330\0252" )"
	MsgWasAskd="$( echo -ne "\0330\0257\0330\0247\0331\0210\0330\0247 \0330\0257\0333\0225\0331\0203\0330\0247\0330\0252" )"
	MsgWrgChoi="$( echo -ne "\0331\0207\0333\0225\0332\0265\0330\0250\0332\0230\0330\0247\0330\0261\0330\0257\0333\0225\0333\0214 \0331\0207\0333\0225\0332\0265\0333\0225" )"
	MsgWrnMeta="$( echo -ne "iTunesMetadata \0330\0264\0333\0216\0331\0210\0333\0225 \0332\0257\0331\0210\0332\0225\0330\0247\0331\0211" )"
	MsgYouChoi="$( echo -ne "\0331\0207\0333\0225\0332\0265\0330\0250\0332\0230\0330\0247\0330\0261\0330\0257\0333\0225\0333\0214 \0330\0252\0333\0206" )"
	MsgZipStep="$( echo -ne "\0330\0257\0333\0225\0331\0276\0333\0225\0330\0263\0330\0252\0333\0216\0330\0252 .ipa (step" )"
	MsgMrkDone="$( echo -ne "\0330\0257\0333\0214\0330\0247\0330\0261\0333\0214 \0332\0251\0330\0261\0330\0257\0331\0206\0333\0225\0332\0251\0330\0247\0331\0206 \0330\0252\0333\0225\0331\0210\0330\0247\0331\0210 \0332\0251\0330\0261\0330\0247   " )"
	MskZroDone="$( echo -ne "\0331\0204\0331\0212\0330\0263\0330\0252\0333\0225\0331\0211 \0330\0252\0333\0225\0331\0210\0330\0247\0331\0210 \0330\0250\0331\0210\0331\0210 \0332\0225\0333\0216\0331\0203 \0330\0257\0333\0225\0330\0256\0330\0247\0330\0252\0333\0225\0331\0210\0333\0225 \0330\0250\0333\0225   " )"
fi
}



# ======
function UnicodeToHuman
{
# Convert from unicode to human, and remove unwanted chars
human=$(echo -n "$unicode" | sed -e "s: :_:g" | od -c -A n -v --width=999 | sed \
	-e 's:+:Plus:g' \
	-e 's:302.240:_:g' \
	-e 's:302.251:_:g' \
	-e 's:302.256:_:g' \
	-e 's:302.260:Degree:g' \
	-e "s:302.264:':g" \
	-e 's:303.201:A:g' \
	-e 's:303.207:C:g' \
	-e 's:303.211:E:g' \
	-e 's:303.216:I:g' \
	-e 's:303.224:O:g' \
	-e 's:303.234:U:g' \
	-e 's:303.237:B:g' \
	-e 's:303.240:a:g' \
	-e 's:303.241:a:g' \
	-e 's:303.242:a:g' \
	-e 's:303.245:a:g' \
	-e 's:303.247:c:g' \
	-e 's:303.250:e:g' \
	-e 's:303.251:e:g' \
	-e 's:303.252:e:g' \
	-e 's:303.253:e:g' \
	-e 's:303.255:i:g' \
	-e 's:303.256:i:g' \
	-e 's:303.257:i:g' \
	-e 's:303.263:o:g' \
	-e 's:303.264:o:g' \
	-e 's:303.266:o:g' \
	-e 's:303.270:o:g' \
	-e 's:303.271:u:g' \
	-e 's:303.273:u:g' \
	-e 's:303.274:u:g' \
	-e 's:304.237:g:g' \
	-e 's:304.261:i:g' \
	-e 's:305.215:o:g' \
	-e 's:305.223:oe:g' \
	-e 's:312.236:k:g' \
	-e 's:316.251:Omega:g' \
	-e 's:342.200.223:-:g' \
	-e 's:342.200.224:-:g' \
	-e "s:342.200.230:':g" \
	-e "s:342.200.231:':g" \
	-e 's:342.200.242:-:g' \
	-e 's:342.200.246:...:g' \
	-e 's:342.202.254:EUR:g' \
	-e 's:342.204.242:_:g' \
	-e 's:342.210.236:Infinity:g' \
	-e 's:342.213.205:.:g' \
	-e 's:342.226.272:_:g' \
	-e 's:342.227.217:-:g' \
	-e 's:342.230.205:_:g' \
	-e 's:342.231.253:_:g' \
	-e 's:342.235.222:_:g' \
	-e 's:347.246.205:_:g' \
	| tr -cd "[:alnum:][_'.][-]" | sed -e "s:_: :g" | sed -e "s:  : :g" )
# Todo: future enhancements
# Help wanted for unknown or other unicodes
}



# ======
function DisplayBars
{
ProgressPct=""
if [ $RCbarNum = "YES" ]; then
	ProgressXXX=$(( $BarCols * $ProgressDone / $ProgressTarget ))
	ProgressSSS=$(( $BarCols - $ProgressXXX ))
	ProgressPct=$(( 100 * $ProgressDone / $ProgressTarget ))
	echo "[${escGreen}${RCxxx:0:$ProgressXXX}${escBlue}${RCsss:0:$ProgressSSS}${escReset}] $ProgressPct%"
fi
if [ $RCbarSize = "YES" ]; then
	ProgressXXX=$(( $BarCols * $ProgressDoneSize / $ProgressTargetSize ))
	ProgressSSS=$(( $BarCols - $ProgressXXX ))
	ProgressPct=$(( 100 * $ProgressDoneSize / $ProgressTargetSize ))
	echo "[${escCyan}${RCxxx:0:$ProgressXXX}${escBlue}${RCsss:0:$ProgressSSS}${escReset}] $ProgressPct%"
fi

if [ ! -z "$ProgressPct" -a $RCspeak = "YES" ]; then
	su mobile -c "speak $ProgressPct %" &
fi
}



# ======
# Begin Dyldo Function
#µ#function DyldoFunction
#µ#{
#µ#	# String to find: name of the dyld to patch
#µ#	DyldoName="$1"
#µ#	# Offset, from found string, of value to patch
#µ#	DyldoOffset="$2"
#µ#	# Offset of current part in the executable
#µ#	DyldoCurOff="$3"
#µ#
#µ#	# Does this app have this dyld inside its headers?
#µ#	if [ ! -z "$(grep "$DyldoName" "$DeepWorkDir/$DeepAppName/Dyldo.Head")" ]; then
#µ#		# Locate the position of this dyld
#µ#		cat "$DeepWorkDir/$DeepAppName/Dyldo.Head" | tr '\n' ' ' | tr '\0' ' ' | sed -e "s:$DyldoName.*:$DyldoName:g" > "$DeepWorkDir/$DeepAppName/Dyldo.tmp"
#µ#		DyldoLong=$(stat -c%s "$DeepWorkDir/$DeepAppName/Dyldo.tmp")
#µ#		rm -f "$DeepWorkDir/$DeepAppName/Dyldo.tmp"
#µ#		# Which value is there?
#µ#		DyldoWeak=$(dd bs=1 count=1 skip=$(($DyldoLong - $DyldoOffset)) if="$DeepWorkDir/$DeepAppName/Dyldo.Head" 2> /dev/null | od -A n -t u -v )
#µ#
#µ#		# 12 (LC_LOAD_DYLIB = 0xc) or 24 (LC_LOAD_WEAK_DYLIB = 0x18)
#µ#		if [ $DyldoWeak != 24 ]; then
#µ#			if [ $DyldoWeak != 12 ]; then
#µ#				echo "${Meter36}${escRed}Error:${escReset} dyldo not 12 and not 24! ($DyldoWeak)"
#µ#			else
#µ#				echo "${Meter36}${escYellow}Note:${escReset} deeply dyldoing!"
#µ#				foo=$(echo 24 | awk '{ printf("%c",$0); }' | dd bs=1 seek=$(($DyldoCurOff + $DyldoLong - $DyldoOffset)) conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec" 2>&1> /dev/null)
#µ#				# (LC_REQ_DYLD = 0x80000000)
#µ#				foo=$(echo 128 | awk '{ printf("%c",$0); }' | dd bs=1 seek=$(($DyldoCurOff + $DyldoLong - $DyldoOffset + 3)) conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec" 2>&1> /dev/null)
#µ#				##Fixed=" DYLD"
#µ#			fi
#µ#		fi
#µ#	fi
#µ#}



# ======
# Begin Deep Function
function DeepFunction
{
# Get the parameters
DeepAppPath=$1
DeepAppName=$2
DeepAppExec=$3
DeepWorkDir=$4
WhatChuDoin=$5

# Is it an AppleWatch's plugin?
if [ -d "$DeepAppPath/$DeepAppName/"*".app/_WatchKitStub" ]; then
	echo "${escRed}Warning:${escReset} This is an AppleWatch PlugIn!"
	# Is this iDevice unable to run it? (ie: iOS is older than iOS82)
	if [ ! -e "/System/Library/Frameworks/WatchKit.framework" ]; then
		echo "${escRed}Sorry:${escReset} your iDevice can't handle AppleWatch!"
		return 1
	fi
fi

if [ "$DebugMode" = "YES" ]; then
	echo "DAP:<$DeepAppPath>"
	echo "DAN:<$DeepAppName>"
	echo "DAE:<$DeepAppExec>"
	echo "DWD:<$DeepWorkDir>"
fi

# Copying executable (with attributes) to temporary space
if [ $RCverbose = "YES" ]; then
	echo "${Meter15}$MsgCopExec"
fi
foo=$( cp -p "$DeepAppPath/$DeepAppName/$DeepAppExec" "$DeepWorkDir/$DeepAppName/" 2>&1> /dev/null )
if [ ! -e "$DeepWorkDir/$DeepAppName/$DeepAppExec" ]; then
	echo "Unable to copy application files"
	return 1
else
	# Disk full?
	if [ $(stat -c%s "$DeepWorkDir/$DeepAppName/$DeepAppExec") != $(stat -c%s "$DeepAppPath/$DeepAppName/$DeepAppExec") ]; then
		echo "${escRed}$MsgDskFull ?${escReset}"
		return 1
	fi
fi

if [ $RCverbose = "YES" ]; then
	echo -n "${Meter20}$MsgAnaAppl: "
fi

# Initialize parts index and variables
PartIndex[6]=0
PartIndex[9]=0
PartIndex[11]=0
PartIndex[64]=0
HowManyDone=0
LastDoneType=0
LastNotDonePart=0

# Looking for fat's magic numbers (CafeBabe)
CafeBabeIsFat=$(dd bs=4 count=1 skip=0 if="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2> /dev/null | od -A n -t x1 -v | grep "ca fe ba be")

# Is executable FAT or THIN?
if [ ! "$CafeBabeIsFat" ]; then
	# "THIN" will be done like a "FATx1"
	if [ $RCverbose = "YES" ]; then
		echo "${Meter25}Thin Binary found"
	fi
	HowManyParts="01"
	# Get the thin's headers, then extract the details
	ThinBabe=$(dd bs=12 count=1 skip=0 if="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2> /dev/null | od -A n -t x1 -v | tr -d ' ','\n')
	# PartType can be 6, 9, 11 or 64
	PartType[1]=$(echo "0x${ThinBabe:14:2}" | awk --non-decimal-data '{print ($1)*64 }')
	if [ ${PartType[1]} = 0 ]; then
		PartType[1]=$(echo "0x${ThinBabe:16:2}" | awk --non-decimal-data '{print ($1)+0 }')
	fi
	if [ ${PartType[1]} = 12 ]; then
		echo "ARGH: cpu12 in THIN"
		return 1
		#µ# PartType[1]=11
		#µ# foo=$(echo -ne "\x0B" | dd bs=1 seek=8 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2>&1> /dev/null)
	fi
	PartData[1]="empty"
	PartIndex[${PartType[1]}]=1
	PartOffset[1]=1
	PartLogicalSize[1]=$(stat -c%s "$DeepWorkDir/$DeepAppName/$DeepAppExec")
	PartPhysicalSize[1]=${PartLogicalSize[1]}
else
	# This is a FATx2 or FATx3 babe
 	if [ $RCverbose = "YES" ]; then
		echo "${Meter25}Fat Binary found"
	fi

	# Get the fat's full headers, keep it, then extract the details
	foo=$(dd bs=4096 count=1 skip=0 if="$DeepWorkDir/$DeepAppName/$DeepAppExec" of="$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" 2>&1> /dev/null)
	FullCafeBabe=$(cat "$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" | od -A n -t x1 -v | tr -d ' ','\n')

	# PartType can be 6, 9, 11 or 64
	PartType[1]=$(echo "0x${FullCafeBabe:16:2}" | awk --non-decimal-data '{print ($1)*64 }')
	if [ ${PartType[1]} = 0 ]; then
		PartType[1]=$(echo "0x${FullCafeBabe:30:2}" | awk --non-decimal-data '{print ($1)+0 }')
	fi
	if [ ${PartType[1]} = 12 ]; then
		echo "ARGH: cpu12 in part#1"
		return 1
		#PartType[1]=11
	fi
	PartData[1]=${FullCafeBabe:32:16}
	PartIndex[${PartType[1]}]=1

	PartType[2]=$(echo "0x${FullCafeBabe:56:2}" | awk --non-decimal-data '{print ($1)*64 }')
	if [ ${PartType[2]} = 0 ]; then
		PartType[2]=$(echo "0x${FullCafeBabe:70:2}" | awk --non-decimal-data '{print ($1)+0 }')
	fi
	if [ ${PartType[2]} = 12 ]; then
		echo "ARGH: cpu12 in part#2"
		return 1
		#PartType[2]=11
	fi
	PartData[2]=${FullCafeBabe:72:16}
	PartIndex[${PartType[2]}]=2

	# Part3 is perhaps empty, but we check it also
	PartType[3]=$(echo "0x${FullCafeBabe:96:2}" | awk --non-decimal-data '{print ($1)*64 }')
	if [ ${PartType[3]} = 0 ]; then
		PartType[3]=$(echo "0x${FullCafeBabe:110:2}" | awk --non-decimal-data '{print ($1)+0 }')
	fi
	if [ ${PartType[3]} = 12 ]; then
		echo "ARGH: cpu12 in part#3"
		return 1
		#PartType[3]=11
	fi

	PartOffset[1]=$(echo "0x${PartData[1]:0:8}" | awk --non-decimal-data '{print ($1)+1 }')
	PartLogicalSize[1]=$(echo "0x${PartData[1]:8:8}" | awk --non-decimal-data '{print ($1)+0 }')
	PartOffset[2]=$(echo "0x${PartData[2]:0:8}" | awk --non-decimal-data '{print ($1)+1 }')
	PartLogicalSize[2]=$(echo "0x${PartData[2]:8:8}" | awk --non-decimal-data '{print ($1)+0 }')

	# How many parts in FAT executable? Two or Three? Or One?
	HowManyParts=${FullCafeBabe:14:2}

	# Rare "Bad Monsters" exist! When "MonsterX3 and iOStarget<7", they say "MonsterX2" in their header!
	if [ $HowManyParts = "02" -a ${PartType[3]} != 0 ]; then
		###ExtrasAslr="$ExtrasAslr BAD"
		if [ "$DebugMode" = "YES" ]; then
			echo "${Meter25}${escRed}Note: Bad Monster found${escReset}"
		fi
		# Only 64bits iDevices can do this third part
		if [ -e "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.supf" -a $CPUType = "64" ]; then
			HowManyParts="03"
			if [ "$DebugMode" = "YES" ]; then
				echo "${Meter25}${escRed}Note: taming Bad Monster${escReset} now"
			fi
			foo=$(echo -ne "\x03" | dd bs=1 seek=7 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2>&1> /dev/null)
		else
			if [ "$DebugMode" = "YES" ]; then
				echo "${Meter25}${escRed}Note: can't tame this Bad Monster${escReset}"
			fi
			###foo=$(cat /dev/zero | dd bs=1 seek=48 count=20 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" 2>&1> /dev/null)
			###foo=$(cat /dev/zero | dd bs=1 seek=48 count=20 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2>&1> /dev/null)
		fi
	fi
	# Rare "Bad Bad Monsters" exist! When "MonsterX2 and iOStarget<7", they say "MonsterX1" in their header!
	if [ $HowManyParts = "01" -a ${PartType[2]} != 0 ]; then
		###ExtrasAslr="$ExtrasAslr BADBAD"
		if [ "$DebugMode" = "YES" ]; then
			echo "${Meter25}${escRed}Note: Bad Bad Monster found${escReset}"
		fi
		# Only 64bits iDevices can do this second part
		if [ -e "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.supf" -a $CPUType = "64" ]; then
			HowManyParts="02"
			if [ "$DebugMode" = "YES" ]; then
				echo "${Meter25}${escRed}Note: taming Bad Bad Monster${escReset} now"
			fi
			foo=$(echo -ne "\x02" | dd bs=1 seek=7 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2>&1> /dev/null)
		else
			if [ "$DebugMode" = "YES" ]; then
				echo "${Meter25}${escRed}Note: can't tame this Bad Bad Monster${escReset}"
			fi
			###foo=$(cat /dev/zero | dd bs=1 seek=48 count=20 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" 2>&1> /dev/null)
			###foo=$(cat /dev/zero | dd bs=1 seek=48 count=20 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2>&1> /dev/null)
		fi
	fi

	if [ $HowManyParts != "03" ]; then
		# Two (or one) parts only. Forcing part3 to "empty"
		PartType[3]=0
		PartData[3]="Empty"
		PartOffset[3]=$(( 1 + $(stat -c%s "$DeepWorkDir/$DeepAppName/$DeepAppExec") ))
		PartLogicalSize[3]=0
		if [ $HowManyParts != "02" ]; then
			# One part only. Forcing part2 to "empty"
			PartType[2]=0
			PartData[2]="Empty"
			PartOffset[2]=$(( 1 + $(stat -c%s "$DeepWorkDir/$DeepAppName/$DeepAppExec") ))
			PartLogicalSize[2]=0
		fi
	else
		# Three parts
		PartData[3]=${FullCafeBabe:112:16}
		PartOffset[3]=$(echo "0x${PartData[3]:0:8}" | awk --non-decimal-data '{print ($1)+1 }')
		PartLogicalSize[3]=$(echo "0x${PartData[3]:8:8}" | awk --non-decimal-data '{print ($1)+0 }')
		PartIndex[${PartType[3]}]=3
		###ExtrasAslr="$ExtrasAslr MONSTER"
	fi
	echo "${Meter25}${escBlue}Info: MonsterX$HowManyParts${escReset} (${PartType[1]} - ${PartType[2]} - ${PartType[3]})"

	# Computings
	PartPhysicalSize[1]=$(( ${PartOffset[2]} - ${PartOffset[1]} ))
	PartPhysicalSize[2]=$(( ${PartOffset[3]} - ${PartOffset[2]} ))
	PartPhysicalSize[3]=$(( 1 + $(stat -c%s "$DeepWorkDir/$DeepAppName/$DeepAppExec") - ${PartOffset[3]} ))
fi

# Display debug data
if [ "$DebugMode" = "YES" ]; then
	echo "Idx: ${PartIndex[6]} ${PartIndex[9]} ${PartIndex[11]} ${PartIndex[64]}"
	echo "Off: ${PartOffset[1]}  ${PartOffset[2]}  ${PartOffset[3]}"
	echo "Lsz: ${PartLogicalSize[1]}  ${PartLogicalSize[2]}  ${PartLogicalSize[3]}"
	echo "Psz: ${PartPhysicalSize[1]}  ${PartPhysicalSize[2]}  ${PartPhysicalSize[3]}"
fi

# Copying some files (if they are not alreay there)
if [ ! -e "$DeepWorkDir/$DeepAppName/SC_Info" ]; then
	mkdir "$DeepWorkDir/$DeepAppName/SC_Info"
	chmod 777 "$DeepWorkDir/$DeepAppName/SC_Info"
	if [ -e "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.sinf" ]; then
		cp -p "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.sinf" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.sinf"
	else
		# The ".sinf" file is not present? (Replication failed because iOS is too old, or because we are RemoteRasticracking)
		if [ "$DebugMode" = "YES" ]; then
			echo "Note: playing 'silly SINFony' now"
		fi
		# We copy the one from main executable
		cp -p "$AppPath/$AppName/SC_Info/$AppExec.sinf" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.sinf"
	fi
	cp -p "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.supp" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supp"
	if [ -e "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.supf" ]; then
		cp -p "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.supf" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supf"
	fi
	if [ -e "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.supx" ]; then
		cp -p "$DeepAppPath/$DeepAppName/SC_Info/$DeepAppExec.supx" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supx"
		#echo "SUPX!"
	fi
	if [ -e "$DeepAppPath/$DeepAppName/SC_Info/Manifest.plist" ]; then
		cp -p "$DeepAppPath/$DeepAppName/SC_Info/Manifest.plist" "$DeepWorkDir/$DeepAppName/SC_Info/Manifest.plist"
	fi
fi

# Parts are done by descending type (because iOS always takes the "highest" first)
for j in 64 11 9 6
do
	WhichPart=${PartIndex[$j]}

	if [ $CPUType = "64" -a $j != 64 -a $RCeleven = "YES" -a $WhichPart != 0 ]; then
		echo "Note: part #$j is skipped by Eleven Mode"
		WhichPart=0
	fi

	if [ $WhichPart = 0 ]; then
		if [ "$DebugMode" = "YES" ]; then
			echo "- No 'type $j' part found"
		fi
	# If a part of this type exists
	else
		if [ "$DebugMode" = "YES" ]; then
			echo "- The 'type $j' part is number $WhichPart"
		fi
		# If Cpu is not strong enough for this type of part
		if [ $j -gt $CPUType ]; then
			if [ "$DebugMode" = "YES" ]; then
				echo "  Can't do 'type $j' part with 'type $CPUType' cpu"
			fi
			LastNotDonePart=$WhichPart
		# If Cpu is strong enough for this type of part
		else
			if [ "$DebugMode" = "YES" ]; then
				echo "  Will do 'type $j' part with 'type $CPUType' cpu"
			fi
			if [ $RCverbose = "YES" ]; then
				echo "${Meter26}Cracking type$j part (#$WhichPart) on type$CPUType cpu"
			fi

			# iOS can't crack twice the same binary, so we will randomize its name before each call.
			RandRand=""

			if [ $iOSmajor -gt 7 ]; then
				# Fix for a strange "bug/behavior" with iOS9 (and iOS8?): renaming is not enough; cloning does help/fix that
				cp "$DeepWorkDir/$DeepAppName/$DeepAppExec" "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec"
				rm "$DeepWorkDir/$DeepAppName/$DeepAppExec" 
			else
				mv "$DeepWorkDir/$DeepAppName/$DeepAppExec" "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec"
			fi

			if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.sinf" ]; then
				mv "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.sinf" "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.sinf"
			fi
			mv "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supp" "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supp"
			if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supf" ]; then
				mv "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supf" "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supf"
			fi
			if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supx" ]; then
				mv "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supx" "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supx"
			fi

			# Is it an AppleWatch's plugin?
			if [ -d "$DeepAppPath/$DeepAppName/"*".app/_WatchKitStub" ]; then
				# Is this iDevice unable to run it? (ie: iOS is older than iOS82)
				if [ ! -e "/System/Library/Frameworks/WatchKit.framework" ]; then
					echo "${escRed}Sorry:${escReset} your iDevice can't handle AppleWatch!"
					return 1
#µ#					# We need to deeply analyze this part. Extraction
#µ#					foo=$( cat "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec" | tail --bytes=+${PartOffset[$WhichPart]} | head --bytes=${PartLogicalSize[$WhichPart]} > "$DeepWorkDir/$DeepAppName/Dyldo.Huge" 2> /dev/null )
#µ#					if [ $(stat -c%s "$DeepWorkDir/$DeepAppName/Dyldo.Huge") != ${PartLogicalSize[$WhichPart]} ]; then
#µ#						echo "${escRed}$MsgDskFull ?${escReset}"
#µ#						return 1
#µ#					fi
#µ#					# We will look only at its headers. How long are they?
#µ#					CryptOff=$(otool -l "$DeepWorkDir/$DeepAppName/Dyldo.Huge" | grep cryptoff | awk '{print $2}')
#µ#					if [ ! "$CryptOff" ]; then
#µ#						echo "${escRed}Unable to find CryptOff${escReset}"
#µ#						return 1
#µ#					fi
#µ#					# Get only the headers to check the DYLDs' list
#µ#					foo=$(dd bs=$CryptOff count=1 if="$DeepWorkDir/$DeepAppName/Dyldo.Huge" of="$DeepWorkDir/$DeepAppName/Dyldo.Head" 2>&1> /dev/null)
#µ#					rm -f "$WorkDir/$AppName/Dyldo.Huge"
#µ#					if [ $(stat -c%s "$DeepWorkDir/$DeepAppName/Dyldo.Head") != $CryptOff ]; then
#µ#						echo "${escRed}$MsgDskFull ?${escReset}"
#µ#						return 1
#µ#					fi
#µ#					# /System/Library/Frameworks/WatchKit.framework/WatchKit
#µ#					DyldoFunction "WatchKit\.framework/WatchKit" 78 ${PartOffset[$WhichPart]}
#µ#					# Dyldo stored back in the drawer
#µ#					rm -f "$WorkDir/$AppName/Dyldo.Head"
				fi
			fi

			if [ "$RClogger" = "YES" ]; then
				logger -t RCdump "RCbegin {"
			fi

			# An already cracked part does exist (ie: used FrameWorks)
			if [ -e "$DeepWorkDir/$DeepAppName/$DeepAppExec.$j" ]; then
				if [ "$DebugMode" = "YES" ]; then
					echo "Note: executable already ready"
				fi
				RetRet=1
				foo="Already"
				mv "$DeepWorkDir/$DeepAppName/$DeepAppExec.$j" "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec.decrypted"
			else
				# If FrameWorks' parts are not already done, that's error (unused FrameWork?)
				if [ "$WhatChuDoin" = "WORK" ]; then
					foo="unemployed FrameWork?"
					echo "DONTWORK: $foo"
					RetRet=666
					return 1
				else
					# RastDecrypted/DumpDecrypted creates its output in "current directory", so we change it before the call
					# (Warning: newer iOS tries to block that, because of a sandbox protection)
					cd "$DeepWorkDir/$DeepAppName"

					# Calling DumpDecrypted and storing its return-code
					foo=$(DYLD_INSERT_LIBRARIES=$RastDec "$DeepAppPath/$DeepAppName/$RandRand$DeepAppExec" 2>&1 1>/dev/null)
					RetRet=$?

					# Returning to initial directory
					cd "$PwdPwd" 2>&1> /dev/null
				fi
			fi


			# Testing DumpDecrypted result
			if [ $RetRet != 1 ]; then
				# 127="executable not found"; 134="wrong architecture" or "dyld symbol not found"; 137="wrong iOS type" or "missing scinfo files"; 133="dylib not loaded" or "incompatible executable"; 126="executable is not executable".
				echo "${Meter32}${escRed}Error:${escReset} RastDecrypted ERR#$RetRet (${j}on$CPUType)"
				if [ "$DebugMode" = "YES" ]; then
					echo "${Meter32}${escYellow}DUMP ERROR:${escReset} << $foo >>" | tr -d '\n'
					echo "${Meter32}."
				fi
				if [ "$RClogger" = "YES" ]; then
					echo "$foo" | logger -t RCdump
					logger -t RCdump "} RCend"
				fi
				echo "${Meter32}${escYellow}NOTE:${escReset} iDevice is '$iOSver' and executable is '$(plutil -key MinimumOSVersion "$DeepAppPath/$DeepAppName/Info.plist" 2> /dev/null | tr -d ".")'"
				return 1
			fi
			if [ "$RClogger" = "YES" ]; then
				logger -t RCdump "} RCend"
			fi
			# Does we have some output data?
			if [ ! -e "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec.decrypted" ]; then
				echo "${Meter32}${escRed}Error:${escReset} empty RastDecrypted (${j}on$CPUType)"
				return 1
			fi
			# Is the file uncut and complete?
			if [[ $(stat -c%s "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec.decrypted") != $(stat -c%s "$DeepAppPath/$DeepAppName/$RandRand$DeepAppExec") ]]; then
				echo "${escRed}$MsgDskFull ?${escReset}"
				return 1
			fi
			# Note that only one part has been decrypted! We extract it and we erase the output temp file
			foo=$( cat "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec.decrypted" | tail --bytes=+${PartOffset[$WhichPart]} | head --bytes=${PartLogicalSize[$WhichPart]} > "$DeepWorkDir/$DeepAppName/DumpedPart${PartType[$WhichPart]}" 2> /dev/null )
			rm "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec.decrypted"
			# Is the decrypted data complete?
			if [ $(stat -c%s "$DeepWorkDir/$DeepAppName/DumpedPart${PartType[$WhichPart]}") != ${PartLogicalSize[$WhichPart]} ]; then
				echo "${escRed}$MsgDskFull ?${escReset}"
				return 1
			fi

			# Getting all executable's details
			Peter=$(otool -l "$DeepWorkDir/$DeepAppName/DumpedPart${PartType[$WhichPart]}")
			# (RIP)

			# Check if decrypted part is really decrypted
			if [ "$(echo "$Peter" | grep cryptid | awk '{print $2}')" != "0" ]; then
				echo "${Meter32}${escRed}Error:${escReset} RastDecrypted still crypted (${j}on$CPUType)"
				#echo "${Meter32}${escRed}Error:${escReset} or your '/usr/bin/otool' is bad"
				#echo "${Meter32}${escRed}Error:${escReset} try once as root to 'ldid -S /usr/bin/otool'"
				return 1
			fi

			# Trying "LamestPatchest" to remove some security checks and some ads and some spies
			if [ $RClamestpatchest = "YES" ]; then
				if [ $RCverbose = "YES" ]; then
					echo -n "${Meter33}Trying LamestPatchest... "
				fi

				# Finding location of the "cstring" data block to be LamedPatched
				LPoff=$(echo "$Peter" | grep __cstring -A4 | grep offset | awk '{print $2}')
				if [ ! "$LPoff" ]; then
					echo "${Meter33}${escYellow}$MsgWarning:${escReset} unable to find LPoff"
				else
					LPsize=$(echo "$Peter" | grep __cstring -A4 | grep size | awk --non-decimal-data '{print ($2)+0 }')
					if [ ! "$LPsize" ]; then
						echo "${Meter33}${escYellow}$MsgWarning:${escReset} unable to find LPsize"
					else
						# Dumping the data block to be LamedPatched
						foo=$( cat "$DeepWorkDir/$DeepAppName/DumpedPart${PartType[$WhichPart]}" | tail --bytes=+$(($LPoff + 1)) | head --bytes=$LPsize > "$DeepWorkDir/LP.bin" 2> /dev/null )

						# Disk full?
						if [ $(stat -c%s "$DeepWorkDir/LP.bin") != $LPsize ]; then
							echo "${escRed}$MsgDskFull ?${escReset}"
							return 1
						fi

						# LamingPatching!
						sed --in-place=.BCK \
							-e 's=/Cydia\.app=/Czdjb\.bpp=g' \
							-e 's=/cydia=/czdjb=g' \
							-e 's=cydia://=czdjb://=g' \
							-e 's=/SBSettings=/SBSfttjngs=g' \
							-e 's=/WinterBoard=/WjntfrBpbrd=g' \
							-e 's=ppa\.aidyC=ppb\.bjdzC=g' \
							-e 's=/private/var/lib/apt=/prjvbtf/vbr/ljb/bpt=g' \
							-e 's=/bin/mkdir=/bjn/mkdjr=g' \
							-e 's=/bin/bash=/bjn/bbsh=g' \
							-e 's=/bin/sh=/bjn/sh=g' \
							-e 's=/etc/apt=/ftc/bpt=g' \
							-e 's=/usr/bin/ssh=/vsr/bjn/ssh=g' \
							-e 's=/usr/sbin/ssh=/vsr/sbjn/ssh=g' \
							-e 's=/private/test=-prjvbtf/tfst=g' \
							-e 's=/Applicat\d0\d0\d0ions/dele\d0\d0\d0teme\.txt=/Bppljcbt\d0\d0\d0jpns/dflf\d0\d0\d0tfmf\.txt=g' \
							-e 's=/Appl\d0\d0\d0ications/C\d0\d0ydi\d0a\.app=/Bppl\d0\d0\d0jcbtjpns/C\d0\d0zdj\d0b\.bpp=g' \
							-e 's=ations/Cy\d0\d0\d0/Applic\d0pp\d0\d0dia.a=btjpns/Cz\d0\d0\d0/Bppljc\d0pp\d0\d0djb.b=g' \
							-e 's=ate/va\d0\d0/priv\d0\d0\d0pt/\d0b/a\d0r/li=btf/vb\d0\d0/prjv\d0\d0\d0pt/\d0b/b\d0r/lj=g' \
							-e 's=pinchmedia\.com=pjnchmfdjb\.cpm=g' \
							-e 's=admob\.com=bdmpb\.cpm=g' \
							-e 's=doubleclick\.net=dpvblfcljck\.nft=g' \
							-e 's=googlesyndication\.com=gppglfszndjcbtjpn\.cpm=g' \
							-e 's=flurry\.com=flvrrz\.cpm=g' \
							-e 's=qwapi\.com=qwbpj\.cpm=g' \
							-e 's=mobclix\.com=mpbcljx\.cpm=g' \
							-e 's=http://ad\.=http://bd_=g' \
							-e 's=http://ads\.=http://bds_=g' \
							-e 's=http://ads2\.=http://bds2_=g' \
							-e 's=http://ingameads\.=http://jngbmfbds_=g' \
							-e 's=adwhirl\.com=bdwhjrl\.cpm=g' \
							-e 's=vdopia\.com=vdppjb\.cpm=g' \
							-e 's=tapjoyads\.com=tbpjpzbds\.cpm=g' \
							-e 's=/Library/MobileSubstrate=/Ljbrbrz/MpbjlfSvbstrbtf=g' \
							"$DeepWorkDir/LP.bin"

						#	"/Applications/mAdvLock.app"
						#	"/Applications/Icy\.app"
						#	"appads\.com"
						#	/System/Library/LaunchDaemons/com.ikey.bbot.plist
						#	/System/Library/LaunchDaemons/com.saurik.Cydia.Startup.plist
						#	/usr/libexec/sftp-server
						#	/Applications/MxTube.app
						#	/Applications/IntelliScreen.app
						#	/Applications/FakeCarrier.app
						#	/Applications/blackra1n.app

						# Disk full?
						if [ ! -e "$DeepWorkDir/LP.bin.BCK" ]; then
							echo "${escRed}$MsgDskFull ?${escReset}"
							return 1
						else
							if [ $(stat -c%s "$DeepWorkDir/LP.bin.BCK") != $(stat -c%s "$DeepWorkDir/LP.bin") ]; then
								echo "${escRed}$MsgDskFull ?${escReset}"
								return 1
							fi
						fi

						# Something patched or not?
						if [ $iOSmajor -gt 8 ]; then
							# Cydia's cmp tool crashes under iOS9. Workaround.
							if [ "$(cksum "$DeepWorkDir/LP.bin.BCK" | cut -f 1 -d ' ')" != "$(cksum "$DeepWorkDir/LP.bin" | cut -f 1 -d ' ')" ]; then
								false
							fi
						else
							cmp --silent "$DeepWorkDir/LP.bin.BCK" "$DeepWorkDir/LP.bin"
						fi
						# Differences --> patched
						if [ "$?" != "0" ]; then
							if [ $RCverbose = "YES" ]; then
								echo "${Meter34}patched things"
							fi
							Patched=" LP"
							foo=$(dd seek=1 count=1 obs=$LPoff ibs=$LPsize conv=notrunc if="$DeepWorkDir/LP.bin" of="$DeepWorkDir/$DeepAppName/DumpedPart${PartType[$WhichPart]}" 2>&1> /dev/null)
						else
							if [ $RCverbose = "YES" ]; then
								echo "${Meter34}found nothing"
							fi
						fi
						rm "$DeepWorkDir/LP.bin.BCK"
						rm "$DeepWorkDir/LP.bin"
					fi
				fi

			fi

			# Signing the application with 'ldid' (no more 'ldone', sorry)
			if [ $RCverbose = "YES" ]; then
				echo "${Meter35}$MsgSgnAppl (ldid)"
			fi
			foo=$(ldid -s "$DeepWorkDir/$DeepAppName/DumpedPart${PartType[$WhichPart]}" 2>&1> /dev/null)
			if [ "$?" != "0" ]; then
				echo "${escRed}STOP!${escReset} 'ldid' failed!"
				return 1
			fi
			
			# Back to previous filenames (ready for next part)
			mv "$DeepWorkDir/$DeepAppName/$RandRand$DeepAppExec" "$DeepWorkDir/$DeepAppName/$DeepAppExec"
			if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.sinf" ]; then
				mv "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.sinf" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.sinf"
			fi
			mv "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supp" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supp"
			if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supf" ]; then
				mv "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supf" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supf"
			fi
			if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supx" ]; then
				mv "$DeepWorkDir/$DeepAppName/SC_Info/$RandRand$DeepAppExec.supx" "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supx"
			fi
			# Preparing for next part (even if it doesn't exist)
			# Overwrite the PartType byte with a dummy value in the Fat Header (if it's a Fat binary). (Kinda "SwapSwapAttack style": this part won't be choosen again by iOS)
			if [ -e "$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" ]; then
				OffsetToPatch=$(( $WhichPart * 20 - 5 ))
				#DEBUG# echo "ByteTypeAttack $OffsetToPatch"
				foo=$(echo -n "z" | dd bs=1 seek=$OffsetToPatch conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2>&1> /dev/null)
			fi

			# This was the last success
			LastDoneType=$j
			# How many done with success
			HowManyDone=$(($HowManyDone + 1))

			# There are still "*.decrypted" files here: they are frameworks' ones
			if [ ! -z "$(ls -d "$DeepWorkDir/$DeepAppName/"*".decrypted" 2> /dev/null)" ]; then
				while read OnePlog
				do
					ShortPlog="$( echo "$OnePlog" | cut -f 1 -d$'\t' )"
					PlogExec="$( echo "$OnePlog" | cut -f 2 -d$'\t' )"
					# Frameworks from main executable: using them
					if [ -e "$DeepWorkDir/$DeepAppName/$ShortPlog/$PlogExec" ]; then
						if [ -e "$DeepWorkDir/$DeepAppName/$PlogExec.decrypted" ]; then
							if [ ! -e "$DeepWorkDir/$DeepAppName/$ShortPlog/$PlogExec.$j" ]; then
								if [ "$DebugMode" = "YES" ]; then
									echo "Cooking  \"$ShortPlog\\$PlogExec\\$j\""
								fi
								mv "$DeepWorkDir/$DeepAppName/$PlogExec.decrypted" "$DeepWorkDir/$DeepAppName/$ShortPlog/$PlogExec.$j"
							else
								if [ "$DebugMode" = "YES" ]; then
									echo "Skipping \"$ShortPlog\\$PlogExec\\$j\""
								fi
								rm "$DeepWorkDir/$DeepAppName/$PlogExec.decrypted"
							fi
						else
							if [ "$DebugMode" = "YES" ]; then
								echo "Missing  \"$ShortPlog\\$PlogExec\\$j\""
							fi
						fi
					else
						# Frameworks from plugins: deleting them if not needed
						if [ -e "$DeepWorkDir/$DeepAppName/$PlogExec.decrypted" ]; then
							if [ -e "$DeepWorkDir/$DeepAppName/../../$ShortPlog/$PlogExec" ]; then
								if [ -e "$DeepWorkDir/$DeepAppName/../../$ShortPlog/$PlogExec.$j" ]; then
									if [ "$DebugMode" = "YES" ]; then
										echo "Ignoring \"$ShortPlog\\$PlogExec\\$j\""
									fi
								else
									if [ "$DebugMode" = "YES" ]; then
										echo "Frying   \"$ShortPlog\\$PlogExec\\$j\""
									fi
									mv "$DeepWorkDir/$DeepAppName/$PlogExec.decrypted" "$DeepWorkDir/$DeepAppName/../../$ShortPlog/$PlogExec.$j"
								fi
							fi
							if [ -e "$DeepWorkDir/$DeepAppName/$PlogExec.decrypted" ]; then
								if [ "$DebugMode" = "YES" ]; then
									echo "Killing  \"$ShortPlog\\$PlogExec\\$j\""
								fi
								rm "$DeepWorkDir/$DeepAppName/$PlogExec.decrypted"
							fi
						fi
					fi
				done < $tempfw
			fi
		fi
	fi
done

# Removing temp files
rm "$DeepWorkDir/$DeepAppName/$DeepAppExec"
if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.sinf" ]; then
	rm "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.sinf"
fi
rm "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supp"
if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supf" ]; then
	rm "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supf"
fi
if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supx" ]; then
	rm "$DeepWorkDir/$DeepAppName/SC_Info/$DeepAppExec.supx"
fi
if [ -e "$DeepWorkDir/$DeepAppName/SC_Info/Manifest.plist" ]; then
	rm "$DeepWorkDir/$DeepAppName/SC_Info/Manifest.plist"
fi
rmdir "$DeepWorkDir/$DeepAppName/SC_Info"

#	if [ -d "$DeepWorkDir/$DeepAppName/PlugIns" ]; then
#		rm -fr "$DeepWorkDir/$DeepAppName/PlugIns"
#	fi
#	if [ -d "$DeepWorkDir/$DeepAppName/Frameworks" ]; then
#		rm -fr "$DeepWorkDir/$DeepAppName/Frameworks"
#	fi

if [ "$DebugMode" = "YES" ]; then
	echo "__________ ( --> $HowManyDone )"
fi

# Zero part was done (because cpu is way too old)
if [ $HowManyDone = 0 ]; then
	echo "${Meter40}${escRed}Error:${escReset} can't do any part!"
	return 1
else
	# Only one part was done: force from fat/monster to thin
	if [ $HowManyDone = 1 ]; then
		if [ "$DebugMode" = "YES" ]; then
			echo "Will go 'thin' now"
		fi
		# Executable will now be thin. The only good part is the "LastDoneType one".
		mv "$DeepWorkDir/$DeepAppName/DumpedPart$LastDoneType" "$DeepWorkDir/$DeepAppName/$DeepAppExec"
		CafeBabeIsFat=""
	else
		if [ "$DebugMode" = "YES" ]; then
			if [ $HowManyParts = "03" -a $HowManyDone != 3 ]; then
				echo "MonsterX03 will go X02. We will delete part number '$LastNotDonePart'"
			else
				echo "Full: $HowManyParts = $HowManyDone"
			fi
		fi
	fi
fi

# CafeBabe is still fat. Now merging parts
if [ "$CafeBabeIsFat" ]; then
	# Is it a x3 Monster?
	if [ $HowManyParts = "03" ]; then
		# It won't be a full x3 Monsters?
		if [ $HowManyDone != 3 ]; then
			# We must convert it to MonsterX2
			echo "${Meter42}${escRed}Trying to tame the beast...${escReset} (${PartType[1]} - ${PartType[2]} - ${PartType[3]})"
			# Display debug data
			if [ "$DebugMode" = "YES" ]; then
				echo "${Meter42}1> ${FullCafeBabe:16:40}"
				echo "${Meter42}2> ${FullCafeBabe:56:40}"
				echo "${Meter42}3> ${FullCafeBabe:96:40}"
			fi

			# We will remove one of the three parts
			# Parts will be swapped so third part will be removed
			if [ $LastNotDonePart != 3 ]; then
				echo "${Meter43}Transfert... Autolargue... Retournement... ($LastNotDonePart)"
				OffsetToTransfer=$(( $LastNotDonePart * 20 - 12 ))
				foo=$(dd bs=1 seek=$OffsetToTransfer skip=48 count=20 conv=notrunc status=noxfer if="$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" of="$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" 2>&1> /dev/null)
			#else
				#DEBUG# echo "The ToRemovePart is already third"
			fi

			# Third part is now PartToRemove and will be removed. Only two parts now in headers.
			foo=$(echo -ne "\x02" | dd bs=1 seek=7 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" 2>&1> /dev/null)
			foo=$(cat /dev/zero | dd bs=1 seek=48 count=20 conv=notrunc status=noxfer of="$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" 2>&1> /dev/null)

			# Display debug data
			if [ "$DebugMode" = "YES" ]; then
				FullCafeBabe=$(cat "$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" | od -A n -t x1 -v | tr -d ' ','\n')
				echo "n> ${FullCafeBabe:14:2}"
				echo "1> ${FullCafeBabe:16:40}"
				echo "2> ${FullCafeBabe:56:40}"
				echo "3> ${FullCafeBabe:96:40}"
			fi
		else
			echo "${Meter44}${escYellow}Note:${escReset} Full x3 beast (${PartType[1]} - ${PartType[2]} - ${PartType[3]})"
		fi
	fi

	# Executable is rebuilt from scratch (headers+parts)
	rm -f "$DeepWorkDir/$DeepAppName/$DeepAppExec"
	cp "$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" "$DeepWorkDir/$DeepAppName/$DeepAppExec"
	chmod 777 "$DeepWorkDir/$DeepAppName/$DeepAppExec"

	# Each done part is added to the Fat executable
	for j in 6 9 11 64
	do
		if [ -e "$DeepWorkDir/$DeepAppName/DumpedPart$j" ]; then
			#DEBUG# echo "Adding 'Type $j' Part"
			WhichPart=${PartIndex[$j]}
			foo=$(dd seek=1 count=1 obs=$(( ${PartOffset[$WhichPart]} - 1 )) ibs=${PartPhysicalSize[$WhichPart]} conv=notrunc if="$DeepWorkDir/$DeepAppName/DumpedPart$j" of="$DeepWorkDir/$DeepAppName/$DeepAppExec" 2>&1> /dev/null)
			rm -f "$DeepWorkDir/$DeepAppName/DumpedPart$j"
		fi
	done
#else
	#DEBUG# echo "CafeBabe is Thin"
fi

# Dropping my girlfriend
if [ -e "$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat" ]; then
	rm -f "$DeepWorkDir/$DeepAppName/CafeBabe.is.Fat"
fi

# Timestamp-back the executable to defeat checks
touch -r "$DeepAppPath/$DeepAppName/$DeepAppExec" "$DeepWorkDir/$DeepAppName/$DeepAppExec"

# Handling of InfoPlist, CodeResources and friends. Timestamp them to protect cracker
mkdir "$DeepWorkDir/$DeepAppName/_CodeSignature"
cp "$DeepAppPath/$DeepAppName/_CodeSignature/CodeResources" "$DeepWorkDir/$DeepAppName/_CodeSignature/CodeResources"
touch -r "$DeepAppPath/$DeepAppName/Info.plist" "$DeepWorkDir/$DeepAppName/_CodeSignature/CodeResources"
touch -r "$DeepAppPath/$DeepAppName/Info.plist" "$DeepWorkDir/$DeepAppName/_CodeSignature"
if [ -e "$DeepAppPath/$DeepAppName/CodeResources" ]; then
	ln -s "_CodeSignature/CodeResources" "$DeepWorkDir/$DeepAppName/CodeResources"
	touch -h -r "$DeepAppPath/$DeepAppName/Info.plist" "$DeepWorkDir/$DeepAppName/CodeResources"
fi
if [ -e "$DeepAppPath/$DeepAppName/ResourceRules.plist" ]; then
	cp "$DeepAppPath/$DeepAppName/ResourceRules.plist" "$DeepWorkDir/$DeepAppName/ResourceRules.plist"
	touch -r "$DeepAppPath/$DeepAppName/Info.plist" "$DeepWorkDir/$DeepAppName/ResourceRules.plist"
fi
cp -a "$DeepAppPath/$DeepAppName/Info.plist" "$DeepWorkDir/$DeepAppName/Info.plist"

# End with success
return 0
}



# ======
# Begin Core Function
function CoreFunction
{
# App to process
AppInput=$1

# Cracker's name and credits
CrackerName=$2
CreditFile=$3
if [ ! "$CrackerName" ]; then
	CrackerName="$RCcracker"
fi
if [ ! "$CreditFile" ]; then
	CreditFile="$CrackerName"
fi

# Script has app's full directory path as input (ie: called from GUI)
if [ -d "$AppInput" ]; then
	tempLoc=$AppInput
	# Script is called by RemoteRasticrac from "/tmp/"
	if [ "${AppInput:0:5}" = "/tmp/" ]; then
		RCremote="YES"
		# Compression must be "low" on the iDevice; "high" recompression will be done later by the Computer/PC
		RCcompression="-2"
	fi
else
	# Script has app's name as input
	echo "$MsgAppLoca '$AppInput'"
	# Escape the "*" as ".*"
	AppGrep=$(echo "/$AppInput\.app" | sed "s:\*:\.\*:g")
	if [ -e $lsd ]; then
		tempLoc=$(grep -i "$AppGrep" $lsd)
	else
		tempLoc=""
	fi
	if [ -z "$tempLoc" ]; then
		echo "$MsgUnaLoca '$AppInput'"
		rm -f $lsd
		return 1
	fi
	AppCount=$(echo "$tempLoc" | wc -l)
	if [ $AppCount -gt 1 ]; then
		echo "$MsgFoundIt $AppCount installation directories:"
		echo "$tempLoc"
		rm -f $lsd
		return 1
	fi
fi

# The app has been found
MenuFound=$(($MenuFound + 1))
AppPath=$(dirname "$tempLoc")
AppName=$(basename "$tempLoc")
echo -n "${Meter4}${escCyan}$MsgFoundIt ${escReset}'$(echo $AppName | sed "s:\\.app::")': "

if [ ! -d "$AppPath" ]; then
	echo "$MsgUnaLoca original installation directory"
	return 1
fi
if [ ! -d "$AppPath/$AppName" ]; then
	echo "$MsgUnaLoca .app directory"
	return 1
fi
AppExec=$(plutil -key CFBundleExecutable "$tempLoc/Info.plist" 2> /dev/null)
if [ ! -e "$AppPath/$AppName/$AppExec" ]; then
	echo "$MsgUnaLoca executable"
	return 1
fi
# Get the name from MetaData
AppDisplayName=$(plutil -key itemName "$AppPath/iTunesMetadata.plist" 2> /dev/null)
# No alphanum characters at all?
AppDisplayNameAlpha=$(echo -n "$AppDisplayName" | tr -cd "[:alnum:]")
if [ "$AppDisplayNameAlpha" = "" ]; then
	#echo "${Meter5}$MsgWarning: non-alpha name!"
	AppDisplayName=""
fi
# Get the name from InfoPlist or from executable name
if [ "$AppDisplayName" = "" ]; then
	AppDisplayName=$(plutil -key CFBundleDisplayName "$tempLoc/Info.plist" 2> /dev/null)
	AppDisplayNameAlpha=$(echo -n "$AppDisplayName" | tr -cd "[:alnum:]")
	if [ "$AppDisplayNameAlpha" = "" ]; then
		AppDisplayName=$(plutil -key CFBundleName "$tempLoc/Info.plist" 2> /dev/null)
		AppDisplayNameAlpha=$(echo -n "$AppDisplayName" | tr -cd "[:alnum:]")
		if [ "$AppDisplayNameAlpha" = "" ]; then
			AppDisplayName=$AppExec
			#AppDisplayNameAlpha=$(echo -n "$AppDisplayName" | tr -cd "[:alnum:]")
			#if [ "$AppDisplayNameAlpha" = "" ]; then
			#	echo "${Meter5}$MsgWarning: too exotic name!"
			#fi
		fi
	fi
fi

# Convert AppName from unicode to human
unicode=$AppDisplayName
UnicodeToHuman
AppDisplayName=$human

# Get the artist name from MetaData
if [ $RCartistfrommeta = "YES" ]; then
	artistName=$(plutil -key artistName "$AppPath/iTunesMetadata.plist" 2> /dev/null)
	artistNameAlpha=$(echo -n "$artistName" | tr -cd "[:alnum:]")
	# At least some alphanum inside?
	if [ "$artistNameAlpha" != "" ]; then
		# Convert from unicode to human
		unicode=$artistName
		UnicodeToHuman
		AppDisplayName="$AppDisplayName [$human]"
	fi
fi

# Show the real human name of the app
echo "${Meter6}$AppDisplayName"

# Dealing with version numbers
AppVer=$(plutil -key CFBundleVersion "$tempLoc/Info.plist" 2> /dev/null | tr -d "\n\r")
AppShortVer=$(plutil -key CFBundleShortVersionString "$tempLoc/Info.plist" 2> /dev/null | tr -d "\n\r")
if [ ! "$AppShortVer" = "" ]; then
	if [ ! "$AppShortVer" = "$AppVer" ]; then
		AppVer="$AppShortVer v$AppVer"
	fi
fi
MinOSfull=$(plutil -key MinimumOSVersion "$tempLoc/Info.plist" 2> /dev/null)
if [ "$MinOSfull" = "" ]; then
	echo "${Meter7}${escYellow}$MsgWarning:${escReset} unable to get MinOS"
	MinOSfull="0.0.0"
fi
MinOSmajor=$(echo "$MinOSfull" | cut -f 1 -d '.')
MinOS=$(echo "$MinOSfull" | tr -d '.')

# Flags in ipa's name
Patched=""
Extras=""
ExtrasMatos=""
ExtrasAslr=""
AppleWatchSuccess="perhaps"

# List of files to exclude from second zip
tempexcl=$(mktemp)
# Don't know why, but we will always exclude this one
echo "Payload/GeoJSON" > $tempexcl

# Does it need at least an iPhone3GS?
Required=$(plutil -key 'UIRequiredDeviceCapabilities' "$tempLoc/Info.plist" 2> /dev/null)
if [ ! -z "$(echo "$Required" | grep -e "armv7" -e "opengles-2")" ]; then
	ExtrasMatos=" 3GS"
fi
# Does it need at least an iPhone4?
if [ ! -z "$(echo "$Required" | grep -e "front-facing-camera" -e "gyroscope")" ]; then
	ExtrasMatos=" iPhone4"
fi
# Does it need at least an iPhone4S?
if [ ! -z "$(echo "$Required" | grep -e "bluetooth-le")" ]; then
	ExtrasMatos=" iPhone4S"
fi
# Does it need at least an iPhone5S?
if [ ! -z "$(echo "$Required" | grep -e "opengles-3")" ]; then
	ExtrasMatos=" iPhone5S"
fi

# "metal"
# "peer-peer"

# Is it iPad compatible only? Or universal?
iPad=$(plutil -key 'UIDeviceFamily' "$tempLoc/Info.plist" 2> /dev/null)
if [ ! -z "$iPad" ]; then
	if [ -z "$(echo "$iPad" | grep -e "1")" ]; then
		ExtrasMatos=" iPad"
		# Does it need at least an iPad2?
		if [ ! -z "$(echo "$Required" | grep -e "video-camera")" ]; then
			ExtrasMatos=" iPad2"
		fi
	else
		if [ ! -z "$(echo "$iPad" | grep -e "2")" ]; then
			ExtrasMatos="$ExtrasMatos Univ"
		fi
	fi
fi

# Creating temporary directory
if [ $RCverbose = "YES" ]; then
	echo -n "${Meter10}$MsgCreDire "
fi

# Old iOS structure
if [ "$vma" = "$vmd" ]; then
	WorkDir="/tmp/RC-$(date +%Y%m%d-%H%M%S)"
# New iOS structure
else
	# Temporary temp-directory with root rights
	# Clean it if it exists
	if [ -e "$RooRoo" ]; then
		rm -fr "$RooRoo"
	fi
	# It still exists? Problem
	if [ -e "$RooRoo" ]; then
		echo "${escRed}FAIL!${escReset} You must be 'root' (?)"
		return 1
	fi
	# Creating clean empty directory
	mkdir "$RooRoo" 2> /dev/null
	# It doesn't exist? Problem
	if [ ! -e "$RooRoo" ]; then
		echo "${escRed}FAIL!${escReset} You must be 'root' (?)"
		return 1
	fi
	chmod 777 "$RooRoo"
	WorkDir="$RooRoo/RC-$(date +%Y%m%d-%H%M%S)"
fi

NewAppDir="$HOME/Documents/Cracked"
if [ -e "$WorkDir" ]; then
	rm -rf "$WorkDir"
fi
mkdir -p "$WorkDir"
if [ ! -e "$NewAppDir" ]; then
	mkdir -p "$NewAppDir"
fi
mkdir -p "$WorkDir/$AppName"
if [ ! -d "$WorkDir" -o ! -d "$NewAppDir" -o ! -d "$WorkDir/$AppName" ]; then
	echo "failed! Directories not created"
	return 1
fi

# An AppleWatch's PlugIn is present
if [ -d "$AppPath/$AppName/PlugIns/"*".appex/"*".app/_WatchKitStub" ]; then
	echo "${escRed}Note:${escReset} this app is AppleWatch compatible"
fi

# An AppleWatch's WatchOS2-app is present
if [ -d "$AppPath/$AppName/Watch/"*".app/PlugIns/"*".appex/SC_Info" ]; then
	echo "${escRed}Note:${escReset} this app is WatchOS2 compatible"
	echo "${escRed}Argh:${escReset} WatchOS2 PlugIn must be killed"
	echo "Payload/$AppName/Watch/*" >> $tempexcl
	echo "Payload/$AppName/Watch" >> $tempexcl
	AppleWatchSuccess="false"
fi

if [ -d "$AppPath/$AppName/PlugIns" ]; then
	echo "${Meter25}${escRed}Note:${escReset} 'PlugIns' found"
	ExtrasAslr="$ExtrasAslr PI"
fi
if [ -d "$AppPath/$AppName/Frameworks" ]; then
	if [ ! -z "$(ls -d "$AppPath/$AppName/Frameworks/"*".framework" 2> /dev/null)" ]; then
		echo "${Meter25}${escRed}Note:${escReset} 'Frameworks's frameworks' found"
		templsd=$(mktemp)
		tempfw=$(mktemp)

		ls -d "$AppPath/$AppName/Frameworks/"*".framework" 2> /dev/null | sort -r > $templsd
		while read OnePlug
		do
			ShortPlug="$( echo "$OnePlug" | sed -e "s:$AppPath/$AppName/::g" )"
			echo "Preparing \"$ShortPlug\"..."
			#if [ ! -d "$OnePlug/SC_Info" ]; then
			#	echo "SC_Info ERROR"
			#	rm -fr "$WorkDir"
			#	return 1
			#fi
			if [ ! -e "$OnePlug/Info.plist" ]; then
				echo "Info.plist ERROR"
				rm -fr "$WorkDir"
				return 1
			fi
			PlugExec=$(plutil -key CFBundleExecutable "$OnePlug/Info.plist" 2> /dev/null)
			if [ ! -e "$OnePlug/$PlugExec" ]; then
				echo "$MsgUnaLoca Framework's executable"
				rm -fr "$WorkDir"
				return 1
			fi
			mkdir -p "$WorkDir/$AppName/$ShortPlug"

			cp -p "$OnePlug/$PlugExec" "$WorkDir/$AppName/$ShortPlug/$PlugExec"

			mkdir "$WorkDir/$AppName/$ShortPlug/SC_Info"
			chmod 777 "$WorkDir/$AppName/$ShortPlug/SC_Info"
			if [ -e "$OnePlug/SC_Info/$PlugExec.sinf" ]; then
				cp -p "$OnePlug/SC_Info/$PlugExec.sinf" "$WorkDir/$AppName/$ShortPlug/SC_Info/$PlugExec.sinf"
			else
				# The ".sinf" file is not present? (Replication failed because iOS is too old, or because we are RemoteRasticracking)
				if [ "$DebugMode" = "YES" ]; then
					echo "Note: playing 'silly SINFony' now"
				fi
				# We copy the one from main executable
				cp -p "$AppPath/$AppName/SC_Info/$AppExec.sinf" "$WorkDir/$AppName/$ShortPlug/SC_Info/$PlugExec.sinf"
			fi
			cp -p "$OnePlug/SC_Info/$PlugExec.supp" "$WorkDir/$AppName/$ShortPlug/SC_Info/$PlugExec.supp"
			if [ -e "$OnePlug/SC_Info/$PlugExec.supf" ]; then
				cp -p "$OnePlug/SC_Info/$PlugExec.supf" "$WorkDir/$AppName/$ShortPlug/SC_Info/$PlugExec.supf"
			fi
			if [ -e "$OnePlug/SC_Info/$PlugExec.supx" ]; then
				cp -p "$OnePlug/SC_Info/$PlugExec.supx" "$WorkDir/$AppName/$ShortPlug/SC_Info/$PlugExec.supx"
				#echo "PlugSUPX!"
			fi
			if [ -e "$OnePlug/SC_Info/Manifest.plist" ]; then
				cp -p "$OnePlug/SC_Info/Manifest.plist" "$WorkDir/$AppName/$ShortPlug/SC_Info/Manifest.plist"
			fi

			echo -e "$ShortPlug\t$PlugExec" >> $tempfw

		done < $templsd
		rm -f $templsd
		ExtrasAslr="$ExtrasAslr FW"
	fi

	if [ ! -z "$(ls "$AppPath/$AppName/Frameworks/"*".dylib" 2> /dev/null)" ]; then
		echo "${Meter25}${escRed}Note:${escReset} 'Frameworks' dylib' found"
		if [ ! -e "$WorkDir/$AppName/Frameworks" ]; then
			mkdir "$WorkDir/$AppName/Frameworks"
			chmod 777 "$WorkDir/$AppName/Frameworks"
		fi
		cp -p "$AppPath/$AppName/Frameworks/"*".dylib" "$WorkDir/$AppName/Frameworks"
		ExtrasAslr="$ExtrasAslr DY"
	fi
fi

# Never use a pipe for the "while" loop! Use a temp file instead
templsd=$(mktemp)
# Plugins first, (((then WatchOS2)))
ls -d "$AppPath/$AppName/PlugIns/"*".appex" "$AppPath/$AppName/Waµtch/"*".app/PlugIns/"* 2> /dev/null | sort -r > $templsd
while read OnePlug
do
	ShortPlug="$( echo "$OnePlug" | sed -e "s:$AppPath/$AppName/::g" )"
	echo "Trying to do \"$ShortPlug\"..."
	if [ ! -d "$OnePlug/SC_Info" ]; then
		echo "${escPurple}SKIPDAPLUG!${escReset} This plugin has no 'SC_Info'..."
		#µ# echo "SC_Info ERROR"
		#µ# rm -fr "$WorkDir"
		#µ# return 1
	else
		if [ ! -e "$OnePlug/Info.plist" ]; then
			echo "Info.plist ERROR"
			rm -fr "$WorkDir"
			return 1
		fi
		PlugExec=$(plutil -key CFBundleExecutable "$OnePlug/Info.plist" 2> /dev/null)
		if [ ! -e "$OnePlug/$PlugExec" ]; then
			echo "$MsgUnaLoca Plugin's executable"
			rm -fr "$WorkDir"
			return 1
		fi
		mkdir -p "$WorkDir/$AppName/$ShortPlug"

		DeepFunction "$AppPath" "$AppName/$ShortPlug" "$PlugExec" "$WorkDir" "PLUG"
		if [ $? = 1 ]; then
			# We remove only this undoable plugin.
			rm -fr "$WorkDir/$AppName/$ShortPlug"
			# We exclude this whole plugin from final IPA
			echo "Payload/$AppName/$ShortPlug/*" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug" >> $tempexcl
			# We don't "return 1"; we continue
			# return 1
			echo "${escPurple}ZAPDAPLUG!${escReset} Trying to remove uncrackable plugin..."
			# Was it an AppleWatch's PlugIn?
			if [ -d "$AppPath/$AppName/$ShortPlug/"*".app/_WatchKitStub" ]; then
				# We failed it!
				AppleWatchSuccess="false"
			fi
		else
			touch -r "$OnePlug/Info.plist" "$WorkDir/$AppName/$ShortPlug"
			echo "Payload/$AppName/$ShortPlug/$PlugExec" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug/SC_Info/*" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug/SC_Info" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug/_CodeSignature/*" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug/_CodeSignature" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug/CodeResources" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug/ResourceRules.plist" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug/Info.plist" >> $tempexcl
			# Was it an AppleWatch's PlugIn?
			if [ -d "$AppPath/$AppName/$ShortPlug/"*".app/_WatchKitStub" ]; then
				# We've done it! Or not?
				if [ "$AppleWatchSuccess" != "false" ]; then
					AppleWatchSuccess="true"
				fi
			fi
		fi
	fi
done < $templsd
rm -f $templsd

echo "Trying to do main executable..."
DeepFunction "$AppPath" "$AppName" "$AppExec" "$WorkDir" "MAIN"
if [ $? = 1 ]; then
	rm -fr "$WorkDir"
	return 1
fi

echo "Payload/$AppName/$AppExec" >> $tempexcl
echo "Payload/$AppName/SC_Info/*" >> $tempexcl
echo "Payload/$AppName/SC_Info" >> $tempexcl
echo "Payload/$AppName/_CodeSignature/*" >> $tempexcl
echo "Payload/$AppName/_CodeSignature" >> $tempexcl
echo "Payload/$AppName/CodeResources" >> $tempexcl
echo "Payload/$AppName/ResourceRules.plist" >> $tempexcl
echo "Payload/$AppName/Info.plist" >> $tempexcl
echo "Payload/iTunesArtwork" >> $tempexcl
echo "Payload/iTunesMetadata.plist" >> $tempexcl
echo "Payload/StoreKit/*" >> $tempexcl
echo "Payload/StoreKit" >> $tempexcl
echo "Payload/Documents/*" >> $tempexcl
echo "Payload/Documents" >> $tempexcl
echo "Payload/Library/*" >> $tempexcl
echo "Payload/Library" >> $tempexcl
echo "Payload/tmp/*" >> $tempexcl
echo "Payload/tmp" >> $tempexcl

# ElevenMode needs to push upto 'iOS11'
if [ $RCeleven = "YES" ]; then
	if [ $MinOSmajor -lt 11 ]; then
		echo "${Meter8}${escYellow}ElevenMode:${escReset} app was 'iOS$MinOSfull'"
		echo "${Meter8}${escYellow}ElevenMode:${escReset} app is now 'iOS11 only'"
		plutil -key MinimumOSVersion -value "11.0" "$WorkDir/$AppName/Info.plist" 2>&1> /dev/null
		MinOS="11"
	fi
	ExtrasAslr="$ExtrasAslr ELEVEN"
fi

# Never use a pipe for the "while" loop! Use a temp file instead
templsd=$(mktemp)
# Then, do all the Frameworks!
ls -d "$AppPath/$AppName/Frameworks/"*".framework" 2> /dev/null | sort -r > $templsd
while read OnePlug
do
	ShortPlug="$( echo "$OnePlug" | sed -e "s:$AppPath/$AppName/::g" )"
	echo "Trying to do \"$ShortPlug\"..."
	#if [ ! -d "$OnePlug/SC_Info" ]; then
	#	echo "SC_Info ERROR"
	#	rm -fr "$WorkDir"
	#	return 1
	#fi
	if [ ! -e "$OnePlug/Info.plist" ]; then
		echo "Info.plist ERROR"
		rm -fr "$WorkDir"
		return 1
	fi
	PlugExec=$(plutil -key CFBundleExecutable "$OnePlug/Info.plist" 2> /dev/null)
	if [ ! -e "$OnePlug/$PlugExec" ]; then
		echo "$MsgUnaLoca Plugin's executable"
		rm -fr "$WorkDir"
		return 1
	fi

	DeepFunction "$AppPath" "$AppName/$ShortPlug" "$PlugExec" "$WorkDir" "WORK"
	if [ $? = 1 ]; then
		if [ $RetRet = 666 ]; then
			# We remove only this unemployed FrameWork.
			rm -fr "$WorkDir/$AppName/$ShortPlug"
			# We exclude this whole plugin from final IPA
			echo "Payload/$AppName/$ShortPlug/*" >> $tempexcl
			echo "Payload/$AppName/$ShortPlug" >> $tempexcl
			# We don't "return 1"; we continue
			# return 1
			echo "${escPurple}ZAPDAWORK!${escReset} Trying to remove unemployed FrameWork..."
		else
			echo "CRITICAL FRAMEWORKS FAILURE! ($RetRet)"
			rm -fr "$WorkDir"
			return 1
		fi
	else
		touch -r "$OnePlug/Info.plist" "$WorkDir/$AppName/$ShortPlug"
		echo "Payload/$AppName/$ShortPlug/$PlugExec" >> $tempexcl
		echo "Payload/$AppName/$ShortPlug/SC_Info/*" >> $tempexcl
		echo "Payload/$AppName/$ShortPlug/SC_Info" >> $tempexcl
		echo "Payload/$AppName/$ShortPlug/_CodeSignature/*" >> $tempexcl
		echo "Payload/$AppName/$ShortPlug/_CodeSignature" >> $tempexcl
		echo "Payload/$AppName/$ShortPlug/CodeResources" >> $tempexcl
		echo "Payload/$AppName/$ShortPlug/ResourceRules.plist" >> $tempexcl
		echo "Payload/$AppName/$ShortPlug/Info.plist" >> $tempexcl
	fi
done < $templsd
rm -f $templsd

# Are there FrameWorks? Are they all empty/unused now?
if [ -d "$WorkDir/$AppName/Frameworks" ]; then
	if [ -z "$(ls -A "$WorkDir/$AppName/Frameworks" 2> /dev/null)" ]; then
		echo "${escPurple}ZAPDAWORK!${escReset} No more FrameWorks left!"
		# Remove empty FrameWorks directory
		rmdir "$WorkDir/$AppName/Frameworks"
		# Remove empty FrameWorks directory in IPA
		echo "Payload/$AppName/Frameworks/*" >> $tempexcl
		echo "Payload/$AppName/Frameworks" >> $tempexcl
	else
		# Are there "*.dylib" to clean?
		if [ ! -z "$(ls "$WorkDir/$AppName/Frameworks/"*".dylib" 2> /dev/null)" ]; then
			echo "Cleaning dirty frameworks' dylib..."
			rm -f "$WorkDir/$AppName/Frameworks/"*".dylib"
			# Is Frameworks' directory empty now?
			if [ -z "$(ls -A "$WorkDir/$AppName/Frameworks" 2> /dev/null)" ]; then
				rmdir "$WorkDir/$AppName/Frameworks"
			fi
		fi
	fi
fi

if [ -d "$WorkDir/$AppName/PlugIns" ]; then
	if [ ! -z "$(ls -d "$WorkDir/$AppName/PlugIns/"*".appex" 2> /dev/null)" ]; then
		touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/$AppName/PlugIns"
	else
		echo "${escPurple}ZAPDAPLUG!${escReset} No more PlugIns left!"
		# Remove empty PlugIns directory
		rmdir "$WorkDir/$AppName/PlugIns"
		# Remove empty PlugIns directory in IPA
		echo "Payload/$AppName/PlugIns/*" >> $tempexcl
		echo "Payload/$AppName/PlugIns" >> $tempexcl
	fi
fi
if [ -d "$WorkDir/$AppName/Frameworks" ]; then
	touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/$AppName/Frameworks"
fi

# Adding date
DayToday="$( date +%Y-%m-%d )"

# Adding credits file
if [ ! "$CrackerName" = "Anonymous" ]; then
	if [ $RCverbose = "YES" ]; then
		echo "${Meter65}Adding Credits"
	fi
	echo "Cracked by $CrackerName ($DayToday)" > "$WorkDir/$AppName/$CreditFile"
	if [ ! -e "$AppPath/$AppName/$AppExec.crc" ]; then
		echo "CheckSum=$(echo -n "$CrackerName" | od -A n -t x1 -v | tr -d ' ','\n')" > "$WorkDir/$AppName/$AppExec.crc"
		touch -r "$AppPath/$AppName/$AppExec" "$WorkDir/$AppName/$AppExec.crc"
	fi
fi

# Building .ipa (step 1)
mkdir -p "$WorkDir/Payload"
if [ ! -e "$WorkDir/Payload" ]; then
	echo "Failed to create Payload directory"
	rm -fr "$WorkDir"
	return 1
fi
mv "$WorkDir/$AppName" "$WorkDir/Payload/"

if [ $RCverbose = "YES" ]; then
	echo -n "${Meter66}$MsgCopArtw "
fi
if [ -e "$AppPath/iTunesArtwork" ]; then
	cp -a "$AppPath/iTunesArtwork" "$WorkDir/"
	# Timestamp ArtWork to protect cracker
	touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/iTunesArtwork"
else
	echo "${Meter66}failed!"
fi

# Faking MetaData
if [ $RCverbose = "YES" ]; then
	if [ $RCmetadata = "YES" ]; then
		echo "${Meter69}$MsgFakMeta"
	else
		echo "${Meter69}$MsgNotMeta"
	fi
fi
if [ "$CrackerName" = "Anonymous" ]; then
	CrackedBy="will.I.quit@apple.com"
else
	CrackedBy="$CrackerName@cracked.by"
	echo "${Patched}RC$CrackerName" | tr -cd "[:alnum:]" | tr "[A-Z][a-z][1-9]" "[1-9][a-z][A-Z]" > "$WorkDir/Payload/$AppName/_CodeSignature/ResourceRules"
	touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/Payload/$AppName/_CodeSignature/ResourceRules"
fi

touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/Payload/$AppName/_CodeSignature"

if [ -e "$AppPath/iTunesMetadata.plist" ]; then
	cp "$AppPath/iTunesMetadata.plist" "$WorkDir/iTunesMetadataSource.plist"
else
	echo "${Meter69}${escRed}Error:${escReset} problem with MetaData!"
	plutil -create "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
fi

# Convert to pure text (if binary plist)
plutil -xml "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
# Remove unwanted keys and subkeys; some keys show your name/email/account/etc
plutil -remove -key 'com.apple.iTunesStore.downloadInfo' "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
plutil -remove -key 'asset-info' "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
plutil -remove -key 'is-purchased-redownload' "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
plutil -remove -key 'storeCohort' "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
plutil -remove -key 'userName' "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
plutil -remove -key 'sourceApp' "$WorkDir/iTunesMetadataSource.plist" 2>&1> /dev/null
# Building lines
echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > "$WorkDir/iTunesMetadata.plist"
echo "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">" >> "$WorkDir/iTunesMetadata.plist"
echo "<plist version=\"1.0\">" >> "$WorkDir/iTunesMetadata.plist"
echo "<dict>" >> "$WorkDir/iTunesMetadata.plist"
grep -A99 "<key>UIRequiredDeviceCapabilities</key>" "$WorkDir/iTunesMetadataSource.plist" | grep -m1 -B99 -e "</dict>" -e "<dict/>" >> "$WorkDir/iTunesMetadata.plist"
echo -e "\t<key>appleId</key>" >> "$WorkDir/iTunesMetadata.plist"
echo -e "\t<string>$CrackedBy</string>" >> "$WorkDir/iTunesMetadata.plist"
echo -e "\t<key>purchaseDate</key>" >> "$WorkDir/iTunesMetadata.plist"
echo -e "\t<date>2018-03-03T03:03:03Z</date>" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>appleWatchEnabled</key>" "$WorkDir/iTunesMetadataSource.plist" | sed -e "s:true:$AppleWatchSuccess:g" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>artistId</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>artistName</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>bundleDisplayName</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>bundleShortVersionString</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>bundleVersion</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>buy-only</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>buyParams</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>copyright</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>drmVersionNumber</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>fileExtension</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>gameCenterEnabled</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>gameCenterEverEnabled</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 -m1 "<key>genre</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 -m1 "<key>genreId</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>hasMessagesExtension</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>itemId</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>itemName</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>kind</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>launchProhibited</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>playlistArtistName</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>playlistName</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>price</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>priceDisplay</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>product-type</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A99 "<key>rating</key>" "$WorkDir/iTunesMetadataSource.plist" | grep -m1 -B99 "</dict>" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>releaseDate</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>s</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>software-type</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>softwareIcon57x57URL</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>softwareIconNeedsShine</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A99 "<key>softwareSupportedDeviceIds</key>" "$WorkDir/iTunesMetadataSource.plist" | grep -m1 -B99 "</array>" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>softwareVersionBundleId</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>softwareVersionExternalIdentifier</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A199 "<key>softwareVersionExternalIdentifiers</key>" "$WorkDir/iTunesMetadataSource.plist" | grep -m1 -B199 "</array>" >> "$WorkDir/iTunesMetadata.plist"
# ???? <key>sourceApp</key> ????
grep -A99 "<key>subgenres</key>" "$WorkDir/iTunesMetadataSource.plist" | grep -m1 -B99 "</array>" >> "$WorkDir/iTunesMetadata.plist"
# ???? <key>transitGeoFileURL</key><string> ????
# ???? variantID ????
grep -A1 "<key>vendorId</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
grep -A1 "<key>versionRestrictions</key>" "$WorkDir/iTunesMetadataSource.plist" >> "$WorkDir/iTunesMetadata.plist"
echo "</dict>" >> "$WorkDir/iTunesMetadata.plist"
echo -e "</plist>\n" >> "$WorkDir/iTunesMetadata.plist"
# Timestamp Metadata to protect cracker
touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/iTunesMetadata.plist"

# Add ItemId in filename
if [ $RCitemId = "YES" ]; then
	Heidi="{$(grep -A1 "<key>itemId</key>" "$WorkDir/iTunesMetadataSource.plist" | grep "<integer>" | tr -d "\t" | sed -e 's:<integer>::g' -e 's:</integer>::g' )}."
else
	Heidi=""
fi

# Check for possible iTunesMetadata format changes
rm -f /tmp/diff.txt
diff "$WorkDir/iTunesMetadataSource.plist" "$WorkDir/iTunesMetadata.plist" > /tmp/diff.txt
rm -f "$WorkDir/iTunesMetadataSource.plist"
NewFields=$(wc -l /tmp/diff.txt | cut -f 1 -d " ")
if [ $NewFields -ne "11" -a $NewFields -ne "7" ]; then
	echo "${Meter70}${escYellow}$MsgWarning:${escReset} $MsgWrnMeta ?"
	if [ "$DebugMode" = "YES" ]; then
		echo "( $NewFields )"
		cat /tmp/diff.txt
	fi
fi
rm -f /tmp/diff.txt

# Don't want MetaData? Keeping a backup
if [ ! $RCmetadata = "YES" ]; then
	mv "$WorkDir/iTunesMetadata.plist" "$WorkDir/iTunesMetadata$RCmetadatafilename.plist"
fi

# If AppleWatchThings are a success
if [ "$AppleWatchSuccess" = "true" ]; then
	ExtrasAslr="$ExtrasAslr AW"
fi

# Want Extras in filename?
if [ $RCextras = "YES" ]; then
	Extras="$ExtrasMatos$ExtrasAslr"
fi

# echo "_____"
# cat $tempexcl
# echo "_____"

# Building ipa's filename, adding AppVersion and MinOsVersion, adding CrackerName
if [ "$CrackerName" = "Anonymous" ]; then
	CrackedBy=""
	ZipComment="On iOS$iOSver/$CPUType with Rasticrac v$RCversion ($DayToday) $Patched"
else
	CrackedBy="-$CrackerName"
	ZipComment="From $CrackerName on iOS$iOSver/$CPUType with Rasticrac v$RCversion ($DayToday) $Patched"
fi

if [ $RCeleven = "YES" ]; then
	ZipComment="$ZipComment ELEVENMODE"
fi

# ZipComment can't be added inside ".zip's comment" anymore (recent iOSes block when installation is done from iTunes)
echo -n "$ZipComment"  > "$WorkDir/.ZipComment"
touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/.ZipComment"

# Cutting too long app name
AppDisplayName=${AppDisplayName:0:150}

 IPAName="$NewAppDir/$Heidi$AppDisplayName (v$AppVer$Extras$Patched os$MinOS)$CrackedBy.rc${RCversion}_${iOSver}_$CPUType.ipa"
#IPAName="$NewAppDir/$Heidi$(echo -n "$AppDisplayName" | tr " " ".")-v$AppVer$CrackedBy.rc${RCversion}_${iOSver}_$CPUType.ipa"

# When RemoteMode, remember the real ipa's filename and use generic name instead.
if [ "$RCremote" = "YES" ]; then
	echo "$(basename "$IPAName")" > "$WorkDir/Payload/REMOTEname.txt"
	cp $tempexcl "$WorkDir/Payload/REMOTEkill.txt"
	IPAName="/tmp/REMOTEout.zip"
fi

# If check-only mode (for debug), don't create real ipa but an empty proof file
if [ $RCcheck = "YES" ]; then
	printf -v CRC '%x' $(cksum "$WorkDir/Payload/$AppName/$AppExec" | cut -f 1 -d ' ')
	touch "$IPAName.$CRC.checked"
	echo "${Meter100}${escGreen}Check:${escReset} $AppDisplayName (v$AppVer$Extras$Patched os$MinOS)."
	rm -fr "$WorkDir"
	echo "$tempLoc" >> /var/mobile/.cracked.log
	MenuOK=$(($MenuOK + 1))
	return 0
fi

# For debug only
if [ "$DebugMode" = "YES" ]; then
	IPAName="$IPAName.DEBUG1"
fi

#DEBUG
#FreeSize=$(df -m "$NewAppDir/" | grep disk | awk '{print $4}')
#echo "${Meter74}Debug: free size on device    [$FreeSize M$MsgSizUnit]"
#DEBUG

# Size of first data to compress
FirstSize=$(du -m -s "$WorkDir" | cut -f 1)
echo "${Meter75}$MsgZipStep 1) [$FirstSize M$MsgSizUnit]"

# Timestamping
touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/Payload/$AppName"
touch -r "$AppPath/$AppName/Info.plist" "$WorkDir/Payload"

cd "$WorkDir"
rm -f "$IPAName"
rm -f "$IPAName.temp"

# Script version number in zip's comment
# Faster ipa thanks to smart files order (?)
ZipError=$( zip $RCcompression -y -m -r "$IPAName.temp" "Payload/$AppName/Info.plist" iTunesMetadata$RCmetadatafilename.plist iTunesArtwork .ZipComment Payload 2>&1> /dev/null )
cd "$PwdPwd" 2>&1> /dev/null

if [ ! -z "$ZipError" ]; then
	echo "${Meter76}${escRed}ZipError${escReset}: \"$( echo "$ZipError" | tr -d "\t\n" )\""
fi

if [ ! -e "$IPAName.temp" ]; then
	echo "${escRed}Failed to compress the .ipa${escReset}"
	rm -fr "$WorkDir"
	return 1
fi

# RemoteRasticrac only does one zip step
if [ "$RCremote" != "YES" ]; then
	# Remember size of .ipa after step 1
	ZipSize=$(stat -c%s "$IPAName.temp")

	# Building .ipa (step 2)
	# Using a SymbolicLink pointing to App Directory
	ln -s "$AppPath/" "$WorkDir/Payload"

	# For debug only
	if [ "$DebugMode" = "YES" ]; then
		mv "$IPAName.temp" "$IPAName"
		IPAName="$IPAName.DEBUG2"
		# Create dummy empty zip
		touch DEBUG2emptyfile
		zip -0 -m "$IPAName.temp" DEBUG2emptyfile 2>&1> /dev/null
		#zip -d "$IPAName.temp" DEBUG2emptyfile 2>&1> /dev/null
	fi

	#DEBUG
	#FreeSize=$(df -m "$NewAppDir/" | grep disk | awk '{print $4}')
	#echo "${Meter74}Debug: free size on device    [$FreeSize M$MsgSizUnit]"
	#DEBUG

	# Size of other data to compress
	SecondSize=$(du -m -s "$AppPath" | cut -f 1)
	echo "${Meter80}$MsgZipStep 2) [$(( $SecondSize - $FirstSize )) M$MsgSizUnit]"

	Se7en="NO"
	# Control of files' size. Because Cydia's Zip tool is lame. (Cydia's 7zip is lame too, but at least it works).
	if [ $SecondSize -gt 511 ]; then
		if [ $SecondSize -gt 1023 ]; then
			if [ $SecondSize -gt 2047 ]; then
				Se7en="YES"
				echo "Warning: huge data will be very very long"
			else
				echo "Warning: large data will be very long"
			fi
		else
			echo "Warning: big data will be long"
		fi
	fi

	# Going into working directory and compress from it
	cd "$WorkDir"

	if [ $Se7en = "YES" ]; then
		echo "NOTE: forcing 7zip use"
		# Zip doesn't move/delete source, and excludes some unwanted files. Smart "-n" flag excludes already compact files.
		ZipError=$( 7za u -y -bd -mmt=on -tzip -l "$IPAName.temp"  -xr-@$tempexcl -r Payload/*  2>&1> /dev/null )
		## */
		# TODO: $RCcompression ???
	else
		# Zip doesn't move/delete source, and excludes some unwanted files. Smart "-n" flag excludes already compact files.
		ZipError=$( zip $RCcompression -u -y -r -n .jpg:.JPG:.jpeg:.png:.PNG:.gif:.GIF:.Z:.gz:.zip:.zoo:.arc:.lzh:.rar:.arj:.mp3:.mp4:.m4a:.m4v:.ogg:.ogv:.avi:.flac:.aac \
			"$IPAName.temp"  -x@$tempexcl  Payload/*  2>&1> /dev/null )
		## */
	fi

	if [ ! -z "$ZipError" ]; then
		echo "${Meter81}${escRed}ZipError${escReset}: \"$( echo "$ZipError" | tr -d "\t\n" )\""
	fi

	# Remove list of excluded files
	rm -f $tempexcl

	# It failed because disk is full (zip size after Part[2] is still the same)
	if [ $(stat -c%s "$IPAName.temp") -eq $ZipSize ]; then
		echo "${escRed}$MsgIpaInco ! $MsgDskFull ?${escReset}"
		rm -f "$IPAName.temp"
		rm -fr "$WorkDir"
		return 1
	fi

	# Removing SymbolicLink
	rm "$WorkDir/Payload"

	# Return to previous directory
	cd "$PwdPwd" 2>&1> /dev/null
fi

# Ipa final name
mv "$IPAName.temp" "$IPAName"

# Removing temporary directory
if [ $RCverbose = "YES" ]; then
	echo "${Meter98}$MsgRemTemp"
fi
rm -rf "$WorkDir"

# Cracked app is added into the already-cracked apps list
echo "$tempLoc" >> /var/mobile/.cracked.log

## Cracked app is added into Crackulous' cracked-apps-ready-to-upload list
## (Function now removed)
#p="/private/var/root/Documents/IPAStore.plist"
#if [ -e "$p" ]; then
#	#If Crackulous is running, we must close it first
#	Killous=$(ps -e | grep "/Applications/Crackulous" | grep -v "grep" | awk '{print $1}')
#	if [ "$Killous" ]; then
#		echo "${Meter99}$MsgWarning: killing Crackulous softly"
#		kill $Killous
#		sleep 1
#	fi
#	plutil -key "$IPAName" -type int -value "$(plutil -key 'itemId' "$AppPath/iTunesMetadata.plist" 2> /dev/null)" "$p" 2>&1> /dev/null
#fi

# Displaying finished Ipa details
ZipSize=$(du -m -s "$IPAName" | cut -f 1)
echo "${Meter100}${escGreen}$MsgIpaDone${escReset} \"$IPAName\" [$ZipSize M$MsgSizUnit]"

MenuOK=$(($MenuOK + 1))
}

# End Core Function
# ======




# ======
# Begin script main part

# Dirty fix for bad SSH / bad jailbreak
if [ -z "$( echo "$PATH" | grep "/usr/sbin" )" ]; then
	#echo "BADPATH!"
	PATH=$PATH:/usr/sbin
fi

# Origin's directory
PwdPwd="$PWD"

# Select texts' language
SelectLanguage

# Martine Présidente !
if [ ! -e /bin/ps ]; then
	if [ ! -e /usr/bin/ps ]; then
		echo "$MsgCntFind 'ps'. $MsgInsCydi: 'adv-cmds'"
		exit 1
	fi
fi

# Is this script running inside a GUI?
# (ie: parent process runs from "/Applications/xxx.app")
if [ ! "$(ps -e | grep "$PPID" | grep "/Applications/.*\.app/")" = "" ]; then
	RCinaGUI="YES"
fi

# Initialize progress meter labels (for GUI)
if [ $RCinaGUI = "YES" ]; then
	export TERM="xterm"
	for ((i=0;i<=100;i++)); do
		export Meter$i="$i% "
	done
else
	# Not in a GUI
#	clear
	echo ""

	# If output is not a terminal (ie: redirected to a file, etc), don't display colors/etc
	if [[ -t 1 ]]; then
		# Escape codes
		esc="$( echo -ne "\033" )"
		escReset="${esc}[0m"
		escUnder="${esc}[4m"
		escBlue="${esc}[34m"
		escGreen="${esc}[32m"
		escRed="${esc}[31m"
		escYellow="${esc}[33m"
		escPurple="${esc}[35m"
		escCyan="${esc}[36m"
	fi

	# Terminal misconfigured
	if [ -z "$TERM" ]; then
		echo "${escYellow}$MsgWarning:${escReset} your \$TERM is not set"
		export TERM="xterm"
	fi

	# MobileTermBackgrounder is used = problems ; other = problems
	if [ "$TERM" = "screen" -o "$TERM" = "vanilla" ]; then
		#echo "${escYellow}$MsgWarning:${escReset} your \$TERM is '$TERM'"
		export TERM="vt100"
	fi

	# Screen width
	if [ ! -e /usr/bin/tput ]; then
		echo "$MsgCntFind 'tput'"
		exit 1
	fi
	Cols=$(tput cols)

	# Progress bars full width
	BarCols=$(( $Cols - 8 ))
	while [ ${#RCxxx} -lt $BarCols ]
	do
		RCxxx="$RCxxx$RCxxx"
		RCsss="$RCsss$RCsss"
	done
fi

echo "${Meter0}*** ${escUnder}Rasticrac v3.3.8${escReset} ***"

if [ ! -e /usr/bin/basename ]; then
	echo "$MsgCntFind 'basename'. $MsgInsCydi: 'BigBoss Recommanded Tools'"
	exit 1
fi

if [ ! -e /usr/bin/plutil ]; then
	echo "$MsgCntFind 'plutil'. $MsgInsCydi: 'Erica Utils'"
	exit 1
fi

if [ ! -e /usr/bin/otool ]; then
	echo "$MsgCntFind 'otool'. $MsgInsCydi: 'Darwin CC Tools v855 from CoolStar'"
	exit 1
fi

if [ ! -e /bin/touch ]; then
	echo "$MsgCntFind 'touch'"
	exit 1
fi

if [ ! -e /usr/bin/zip ]; then
	echo "$MsgCntFind 'zip'"
	exit 1
fi

if [ ! -e /usr/sbin/sysctl ]; then
	echo "$MsgCntFind 'sysctl'"
	exit 1
fi

if [ ! -e /usr/bin/cut ]; then
	echo "$MsgCntFind 'cut'"
	exit 1
fi

if [ ! -e /usr/bin/awk ]; then
	echo "$MsgCntFind 'awk'. $MsgInsCydi: 'Gawk'"
	exit 1
fi

# Secret "debug" flag (can be first only)
if [ "$1" = "-debug" ]; then
	shift
	DebugMode="YES"
fi

# iDevice's type of CPU
CPUGenre=$(sysctl hw.cputype | awk '{print $2}')
if [ $? != 0 ]; then
	echo "Fatal 'sysctl' error!"
	exit 1
fi
CPUType=$(sysctl hw.cpusubtype | awk '{print $2}')

# iDevice's iOS version
iOSver=$(plutil -key ProductVersion /System/Library/CoreServices/SystemVersion.plist 2> /dev/null)
if [ $? != 0 ]; then
	echo "Fatal 'plutil' error!"
	exit 1
fi
iOSmajor=$(echo "$iOSver" | cut -f 1 -d '.')
iOSver=$(echo "$iOSver" | tr -d ".")
if [ "$DebugMode" = "YES" ]; then
	echo "${Meter1}${escYellow}Note:${escReset} running iOS$iOSver on '$CPUType@$CPUGenre' cpu on $(sysctl hw.machine | awk '{print $2}')"
fi
if [ -z "$iOSver" -o -z "$iOSmajor" ]; then
	echo "The 'plutil' tool gave empty answers!"
	exit 1
fi

# Old 'otool' fails with 64bits. We need the fresh one
if [ $iOSmajor -gt 5 ]; then
	if [ -e /usr/bin/otool64 ]; then
		echo "Obsolete 'otool'! $MsgInsCydi: 'Darwin CC Tools v855 from CoolStar'"
		echo "Note: 'Darwin CC Tools v286-8 from Saurik' is obsolete"
		exit 1
	fi
fi

# If iOS11+, force Eleven Mode
if [ $iOSmajor -gt 10 ]; then
	echo "${escGreen}FYI:${escReset} Eleven Mode is mandatory for iOS$iOSmajor"
	RCeleven="YES"
fi
# Convert compatible CpuType
if [ $CPUType = "10" ]; then
	CPUType="9"
fi
# Support for 64bits Cpu
if [ $CPUGenre = "16777228" -a $CPUType = "1" ]; then
	CPUType="64"
fi
# Test if Cpu is known and handled yet
if [ $CPUType != "6" -a $CPUType != "9" -a $CPUType != "11" -a $CPUType != "64" ]; then
	echo "${escRed}STOP:${escReset} can't handle this cpu ($CPUType@$CPUGenre) yet!"
	exit 1
fi

# We use 'ldid' only (no more 'ldone')
if [ ! -e /usr/bin/ldid ]; then
	echo "$MsgCntFind 'ldid'. $MsgInsCydi: 'Link Identity Editor'"
	exit 1
fi

# RastDecrypted/DumpDecrypted is needed to decrypt executables
# Choice between iOS7-optimized one and non-iOS7 one
if [ $iOSmajor -lt 7 ]; then
	RastDec="/usr/lib/RastDecrypted102.dylib"
else
	RastDec="/usr/lib/RastDecrypted105.iOS7.dylib"
fi
if [ ! -e $RastDec ]; then
	echo "$MsgCntFind '$RastDec'.  Install from 'rrc$RCversion.zip'"
	exit 1
fi

# Cydia's "Speak" tool is needed for speech support
if [ $iOSmajor -lt 4 ]; then
	RCspeak="NO"
fi
# Cydia's "Speak" crashes on iOS7
if [ $iOSmajor -gt 6 ]; then
	RCspeak="NO"
fi
if [ $RCspeak = "YES" ]; then
	if [ ! -e /usr/bin/speak ]; then
		echo "${Meter3}${escYellow}Note:${escReset} install 'Speak' from Cydia for speech"
		RCspeak="NO"
	fi
fi

if [ ! -e /usr/bin/head ]; then
	echo "$MsgCntFind 'head'"
	exit 1
fi

if [ ! -e /usr/bin/tail ]; then
	echo "$MsgCntFind 'tail'"
	exit 1
fi

# Create an empty public memory file
if [ ! -e /var/mobile/.cracked.log ]; then
	touch /var/mobile/.cracked.log
	chmod 666 /var/mobile/.cracked.log
fi

# Don't want MetaData? It sucks!
if [ ! $RCmetadata = "YES" ]; then
	echo "${Meter3}${escYellow}Note:${escReset} MetaData='NO' is not recommended"
	RCmetadatafilename=".backup"
fi

# Are syslog and logger available?
if [ ! -e /usr/sbin/syslogd ]; then
	echo "${Meter3}${escYellow}Note:${escReset} should install 'syslogd' from Cydia"
fi
RClogger="NO"
if [ ! -e /usr/bin/logger ]; then
	echo "${Meter3}${escYellow}Note:${escReset} should install 'logger' from Cydia (inetutils)"
else
	#Cydia's logger crashes under iOS9. Workaround.
	foo=$(logger --version)
	if [ $? = 0 ]; then
		RClogger="YES"
	##else
	##	echo "${Meter3}${escYellow}Note:${escReset} Cydia's 'logger' crashes. Update needed!"
	fi
fi

if [ ! $RCinaGUI = "YES" ]; then
	# Get and store the encrypted apps list (depending on iOS version)
	# Check for previous cached data. Does cached applist = present applist?

	rm -f $lsd
	touch $lsd
	chmod 666 $lsd

	if [ -e $vcba ]; then
		# iOS9x+ changed that (again)
		camicache="/tmp/cache.$(ls -l $sbis | tr -cd "[:alnum:]")"
		readonly vma=$vcba
		readonly vmd="/var/mobile/Containers/Data/Application"
		readonly vmaCut=7
		readonly vmaLng=72
		# temporary workaround
		RCrealnamemenu="NO"
		if [ "$DebugMode" = "YES" ]; then
			echo "${Meter1}${escYellow}Note:${escReset} using newest applist"
		fi
	else
		if [ -e $cali ]; then
			# iOS8+ changed that
			camicache="/tmp/cache.$(ls -l $cali | tr -cd "[:alnum:]")"
			readonly vma="/var/mobile/Containers/Bundle/Application"
			readonly vmd="/var/mobile/Containers/Data/Application"
			readonly vmaCut=8
			readonly vmaLng=79
			# temporary workaround
			RCrealnamemenu="NO"
			if [ "$DebugMode" = "YES" ]; then
				echo "${Meter1}${escYellow}Note:${escReset} using regular applist"
			fi
		else
			if [ -e $cami ]; then
				camicache="/tmp/cache.$(ls -l $cami | tr -cd "[:alnum:]")"
				readonly vma="/var/mobile/Applications"
				readonly vmd="$vma"
				readonly vmaCut=6
				readonly vmaLng=62
				if [ "$DebugMode" = "YES" ]; then
					echo "${Meter1}${escYellow}Note:${escReset} using oldest applist"
				fi
			else
				echo "Your iOS version sucks!"
				exit 666
			fi
		fi
	fi

	if [ -e $camicache ]; then
		if [ "$DebugMode" = "YES" ]; then
			echo "${Meter4}${escYellow}Note:${escReset} using cached applist"
		fi
		cp $camicache $lsd
	else
		if [ "$DebugMode" = "YES" ]; then
			echo "${Meter4}${escYellow}Note:${escReset} refreshing applist's cache"
		fi
		# Why is that slower than next code???
		#ls -d $vma/*/*.app/SC_Info 2> /dev/null | sort -f -t \/ -k $vmaCut | while read OneApp
		## */
		#do
		#	echo "$(dirname "$OneApp")" >> $lsd
		#done

		# Why is that faster than previous code???
		ls -d $vma/*/*.app 2> /dev/null | sort -f -t \/ -k $vmaCut | while read OneApp
		## */
		do
			if [ -d "$OneApp/SC_Info" ]; then
				echo "$OneApp" >> $lsd
			fi
		done
		cp $lsd $camicache
	fi
fi

# Secret "déjà" flag (must be alone)
if [ "$1" = "-deja" ]; then
	echo -n "Deja: "
	ls -d $vma/*/*.app 2> /dev/null | sort -f -t \/ -k $vmaCut | while read OneApp
	## */
	do
		if [ ! -d "$OneApp/SC_Info" ]; then
			if [ -e "$OneApp/../iTunesArtwork" ]; then
				echo "$OneApp" | cut -f $vmaCut -d '/' | sed "s:\\.app:,:" | tr "\n" " "
			fi
		fi
	done
	echo -e "\010\010."
	exit 0
fi

# Loop through the different flags
LoopExit="NO"
while [ $LoopExit = "NO" ]
do
	LoopExit="YES"

	# Verbose mode flag
	if [ "$1" = "-v" ]; then
		shift
		RCverbose="YES"
		LoopExit="NO"
	fi

	# Secret "check only" flag
	if [ "$1" = "-chk" ]; then
		shift
		RCcheck="YES"
		LoopExit="NO"
	fi

	# Stupid "Eleven Mode" flag
	if [ "$1" = "-eleven" ]; then
		shift
		if [ $CPUType != "64" ]; then
			echo "${escYellow}Note:${escReset} Eleven Mode forbidden on non-64bits iDevice!"
		else
			RCeleven="YES"
		fi
		LoopExit="NO"
	fi
	# Secret "LamerPatcher Off" flag
	if [ "$1" = "-lpoff" ]; then
		shift
		RClamestpatchest="NO"
		LoopExit="NO"
	fi

	# Secret "Extras Off" flag
	if [ "$1" = "-extoff" ]; then
		shift
		RCextras="NO"
		LoopExit="NO"
	fi

	# Secret "Speak Off" flag
	if [ "$1" = "-spkoff" ]; then
		shift
		RCspeak="NO"
		LoopExit="NO"
	fi

	# Secret "Artist Off" flag
	if [ "$1" = "-artoff" ]; then
		shift
		RCartistfrommeta="NO"
		LoopExit="NO"
	fi

	# Secret "Compression Ratio" flag
	if [ "$1" = "-2" -o "$1" = "-3" -o "$1" = "-4" -o "$1" = "-5" -o "$1" = "-6" -o "$1" = "-7" -o "$1" = "-8" -o "$1" = "-9" ]; then
		RCcompression="$1"
		shift
		echo "${Meter5}${escYellow}Note:${escReset} will now use Compression Ratio '$RCcompression'"
		LoopExit="NO"
	fi
done

# No more argument: display help
if [ $# -lt 1 ]; then
	if [ ! $RCinaGUI = "YES" ]; then
		# The "-a" flag is not displayed in the help, but it does exist.
		scr=$(basename $0)
		echo "List/Help: $scr"
		echo "     Menu: $scr [-v] -m [CN [CFN]]"
		echo " CrackAll: $scr [-v] -all [CN [CFN]]"
		echo " CrackOne: $scr [-v] AN [CN [CFN]]"
		echo " MarkDone: $scr -mark"
		echo "ResetDone: $scr -zero"
		echo
		echo "AN=AppName CN=CrackerName CFN=CreditFileName"
		echo
		if [ -e $lsd ]; then
			cat $lsd | cut -f $vmaCut -d '/' | sed "s:\\.app:,:" | tr "\n" " "
			echo -e "\010\010."
			rm -f $lsd
		fi
		exit 1
	else
		echo "Missing argument!"
		exit 2
	fi
fi

# Erasing memory file
if [ "$1" = "-zero" ]; then
	echo "$MsgEraMemo"
	# Don't use rm
	cp /dev/null /var/mobile/.cracked.log 2>&1> /dev/null
	rm -f $lsd
	exit 1
fi

# Marking all apps as done in memory file
if [ "$1" = "-mark" ]; then
	echo "$MsgMarDone"
	if [ -e $lsd ]; then
		cp $lsd /var/mobile/.cracked.log 2>&1> /dev/null
		rm -f $lsd
	else
		cp /dev/null /var/mobile/.cracked.log 2>&1> /dev/null
	fi
	exit 1
fi

if [ ! $RCinaGUI = "YES" ]; then
	MenuAsked=0
	MenuFound=0
	MenuOK=0
	MenuError=0
	MenuErrorList=""

	# Berzerk mode: cracking all apps
	if [ "$1" = "-all" ]; then
		echo -n "$MsgBrzMode !"
		if [ -e $lsd ]; then
			# ("grep -vf" is sloooow. Use "-Fvf")
			# Removing already-done from full apps list
			tempgrep=$(mktemp)
			grep -Fvf /var/mobile/.cracked.log $lsd > $tempgrep
			MenuAsked=$(cat $tempgrep | wc -l)
			ProgressTarget=$MenuAsked
			ProgressDone=0
			echo " ($MenuAsked)"
			echo

			if [ $RCbarSize = "YES" -a $MenuAsked != 0 ]; then
				ProgressTargetSize=0
				ProgressDoneSize=0
				echo -n "Computing total size"
				# (Never use a pipe for the "while" loop)
				while read OneApp
				do
					# Size of the app, till dawn.
					AppSize=$( du -s -k "$OneApp" | cut -f 1 )
					ProgressTargetSize=$(($ProgressTargetSize + $AppSize))
					echo -n "."
				done < $tempgrep
				echo
				echo
			fi

			# (Never use a pipe for the "while" loop)
			while read OneApp
			do
				ProgressDone=$(($ProgressDone + 1))
				echo -n "${escPurple}($ProgressDone/$ProgressTarget)${escReset} "

				if [ $RCbarSize = "YES" ]; then
					# Size of the app, till dawn.
					AppSize=$( du -s -k "$OneApp" | cut -f 1 )
					ProgressDoneSize=$(($ProgressDoneSize + $AppSize))
				fi

				CoreFunction "$OneApp" "$2" "$3"
				if [ $? = 1 ]; then
					if [ $RCspeak = "YES" ]; then
						su mobile -c "speak Error!" &
					fi
					MenuError=$(($MenuError + 1))
					if [ -z "$MenuErrorList" ]; then
						MenuErrorList="${OneApp:$vmaLng:$(( ${#OneApp} - $vmaLng - 4 ))}"
					else
						MenuErrorList="$MenuErrorList, ${OneApp:$vmaLng:$(( ${#OneApp} - $vmaLng - 4 ))}"
					fi
				fi

				DisplayBars
				echo
			done < $tempgrep
			rm -f $tempgrep
			rm -f $lsd
		else
			echo " ($MsgBrzNoth)"
		fi

		echo "$MsgWasAskd:all ($MenuAsked)  $MsgFoundIt:$MenuFound  $MsgErrrors:$MenuError  OK:$MenuOK."
		if [ ! -z "$MenuErrorList" ]; then
			echo "$MsgErrrors: $MenuErrorList."
		fi

		if [ $RCspeak = "YES" ]; then
			su mobile -c "speak Terminated." &
		fi

		exit 1
	else
		# Menu mode: displaying menu and processing user choices
		if [ "$1" = "-m" ]; then
			if [ -e $lsd ]; then
				echo -n "$MsgBldMenu"
				rm -f /tmp/lsdmenu.tmp
				touch /tmp/lsdmenu.tmp
				rm -f /tmp/lsddisp.tmp
				# Array with all the letters
				Letters=( $( echo {a..z} {a..z}{a..z} ) )
				# Search for best columns size
				BestFiller=666
				BestFound=666
				for (( i=18;i<=30;i++)); do
					FillerFound=$(( $Cols % $i ))
					if [ $FillerFound -lt $BestFiller ]; then
						BestFiller=$FillerFound
						BestFound=$i
						if [ $FillerFound = 0 ]; then
							break
						fi
					fi
				done
				LongNames=$(( $BestFound - 3 ))
				ShortNames=$(( $LongNames - 1 ))

				# Using 'real name' in menu?
				if [ $RCrealnamemenu = "YES" ]; then
					tempfile=$(mktemp)
					templist=$(mktemp)
					# Using 'list of installed apps' from SpringBoard as source for real names
					cp $cami $tempfile
					plutil -xml $tempfile 2>&1> /dev/null
					cat $tempfile | grep -F -e "<key>CFBundleDisplayName</key>" -e "<key>Container</key>" -A1 | tr -d "\t" > $templist
					rm $tempfile
				fi

				Letter=0
				LineLength=$Cols
				# ("grep -vf" is sloooow. Use "-Fvf")
				# Removing already-done from full apps list
				grep -Fvf /var/mobile/.cracked.log $lsd | while read OneApp
				do
					GoodLetter=${Letters[$Letter]}

					# Using 'real name' in menu?
					if [ $RCrealnamemenu = "YES" ]; then
						unicode="$( cat $templist | grep "${OneApp:0:61}" -B3 | grep -m1 "<string>" | sed -e 's:<string>::g' -e 's:</string>::g' )"
						# If name is too exotic, use 'internal name'
						if [ "$(echo -n "$unicode" | tr -cd "[:alnum:]")" = "" ]; then
							unicode="${OneApp:$vmaLng:$(( ${#OneApp} - $vmaLng - 4 ))}"
						fi
						UnicodeToHuman
						OneOneApp="$human$RCdots"
					else
						OneOneApp="${OneApp:$vmaLng:$(( ${#OneApp} - $vmaLng - 4 ))}$RCdots"
					fi

					if [ $Letter -lt 26 ]; then
						echo -n "${escPurple}$GoodLetter:${escReset}${OneOneApp:0:$LongNames} " >> /tmp/lsddisp.tmp
						echo "\"$GoodLetter\"$OneApp" >> /tmp/lsdmenu.tmp
						LineLength=$(( $LineLength - $LongNames - 3 ))
					else
						echo -n "${escPurple}$GoodLetter:${escReset}${OneOneApp:0:$ShortNames} " >> /tmp/lsddisp.tmp
						echo "\"$GoodLetter\"$OneApp" >> /tmp/lsdmenu.tmp
						LineLength=$(( $LineLength - $ShortNames - 4 ))
					fi

					# End of line
					if [ $LineLength = $BestFiller ]; then
						echo "" >> /tmp/lsddisp.tmp
						LineLength=$Cols
					fi

					Letter=$(($Letter + 1))
					# Too much apps (max is 27*26 = 702)
					if [ $Letter = 702 ]; then
						break
					fi
				done

				if [ $RCrealnamemenu = "YES" ]; then
					rm $templist
				fi

				# Other options
				echo -n "${escPurple}0:${escReset}${MskZroDone:0:$LongNames} " >> /tmp/lsddisp.tmp
				echo -n "${escPurple}9:${escReset}${MsgMrkDone:0:$LongNames} " >> /tmp/lsddisp.tmp

				# Displaying menu
				if [ -e /tmp/lsddisp.tmp ]; then
					echo
					clear
					echo "*** ${escUnder}Rasticrac v3.3.8 menu${escReset} ***"
					cat /tmp/lsddisp.tmp
					rm -f /tmp/lsddisp.tmp
					echo
					read -p "$MsgYouChoi ? " YourChoices
					echo
					ProgressTarget=$( echo $YourChoices | wc -w )
					ProgressDone=0

					if [ $RCbarSize = "YES" -a $ProgressTarget != 0 ]; then
						ProgressTargetSize=0
						ProgressDoneSize=0
						echo -n "Computing total size"

						# Do all these choices
						for OneChoice in $YourChoices
						do
							if [ ! "$OneChoice" = "0" ]; then
								if [ ! "$OneChoice" = "9" ]; then
									tempLoc=$(grep -i "\"$OneChoice\"" /tmp/lsdmenu.tmp | cut -f 3 -d "\"")
									if [ ! -z "$tempLoc" ]; then
										AppCount=$(echo "$tempLoc" | wc -l)
										if [ $AppCount = 1 ]; then
											# Size of the app, till dawn.
											AppSize=$( du -s -k "$tempLoc" | cut -f 1 )
											ProgressTargetSize=$(($ProgressTargetSize + $AppSize))
											echo -n "."
										fi
									fi
								fi
							fi
						done
						echo
						echo

						# Nothing to do; no need for progress
						if [ $ProgressTargetSize = 0 ]; then
							RCbarSize="ZERO"
						fi
					fi

					# Do all these choices
					for OneChoice in $YourChoices
					do
						ProgressDone=$(($ProgressDone + 1))
						echo -n "${escPurple}($ProgressDone/$ProgressTarget)${escReset} "
						MenuAsked=$(($MenuAsked + 1))
						if [ "$OneChoice" = "0" ]; then
							echo "$MsgEraMemo"
							# Don't use rm
							cp /dev/null /var/mobile/.cracked.log 2>&1> /dev/null
							MenuAsked=$(($MenuAsked - 1))
						else
							if [ "$OneChoice" = "9" ]; then
								echo "$MsgMarDone"
								cp $lsd /var/mobile/.cracked.log 2>&1> /dev/null
								MenuAsked=$(($MenuAsked - 1))
							else
								tempLoc=$(grep -i "\"$OneChoice\"" /tmp/lsdmenu.tmp | cut -f 3 -d "\"")
								if [ -z "$tempLoc" ]; then
									echo "$MsgWrgChoi ($OneChoice)"
								else
									AppCount=$(echo "$tempLoc" | wc -l)
									if [ $AppCount = 1 ]; then

										if [ $RCbarSize = "YES" ]; then
											# Size of the app, till dawn.
											AppSize=$( du -s -k "$tempLoc" | cut -f 1 )
											ProgressDoneSize=$(($ProgressDoneSize + $AppSize))
										fi

										CoreFunction "$tempLoc" "$2" "$3"
										if [ $? = 1 ]; then
											if [ $RCspeak = "YES" ]; then
												su mobile -c "speak Error!" &
											fi
											MenuError=$(($MenuError + 1))
											if [ -z "$MenuErrorList" ]; then
												MenuErrorList="${tempLoc:$vmaLng:$(( ${#tempLoc} - $vmaLng - 4 ))}"
											else
												MenuErrorList="$MenuErrorList, ${tempLoc:$vmaLng:$(( ${#tempLoc} - $vmaLng - 4 ))}"
											fi
										fi
									else
										echo "$MsgBadChoi ($OneChoice = $AppCount)"
									fi
								fi
							fi
						fi

						DisplayBars
						echo

					done
					rm -f /tmp/lsdmenu.tmp

					if [ $RCspeak = "YES" ]; then
						su mobile -c "speak Finished." &
					fi

					echo
					echo "$MsgWasAskd:$MenuAsked  $MsgFoundIt:$MenuFound  $MsgErrrors:$MenuError  OK:$MenuOK."
					if [ ! -z "$MenuErrorList" ]; then
						echo "${escRed}$MsgErrrors:${escReset} $MenuErrorList."
					fi
				else
					echo " $MsgMnuEmpt !"
				fi
				rm -f $lsd
			else
				echo " $MsgMnuEmpt !"
			fi
			exit 1
		fi
	fi
fi

# Just one app to do
CoreFunction "$1" "$2" "$3"
#if [ $? = 1 ]; then
#	echo "Error: problem encountered."
#	exit 1
#fi

# Not needed anymore
rm -f $lsd

###	# Temp-temp-dir not needed anymore
###	rm -fr "$RooRoo"


#
# Thanks.
# Merci.
# Hontoni arigato.
# This is the end, my only friend, the end.
#

