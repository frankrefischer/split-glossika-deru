# Die Sätze beginnen mit der ersten Zeile: GMS #1....
# und enden mit dem Anfang des Index
# diesen Teil schneiden wir heraus
sed -n '/^GMS #/,/^Russisch Index/p' $1 |\
# aber die erste und letzte Zeile sind überflüssig
egrep -v '^Russisch Index' |\
egrep -v '^GMS #' |\

# Problem: manche Sätze enthalten einen Zeilenumbruch
# Lösung: aber alle beginnen mit einem Sprachmarker
#         DE, RU, ROM oder IPA
#         also sorgen wir dafür, dass alle Zeilenumbrüche
#         entfernt werden, ausser denen vor den Sprachmarkern
# Schritt 1: alle Zeilenumbrüche durch ein sicheres Zeichen ersetzen
tr '\n' '_' |\
# Schritt 2: die kodierten Zeilenumbrüche vor den Sprachmarkern
#            in ein anderes Zeichen übersetzen, das später
#            wieder durch einen Zeilenumbruch ersetzt wird
sed 's/_DE/§DE/g'|\
sed 's/_RU/§RU/g'|\
sed 's/_ROM/§ROM/g'|\
sed 's/_IPA/§IPA/g'|\
# Schritt 3: alle übrigen kodierten Zeilenumbrüche durch ein Leerzeichen ersetzen
sed 's/_/ /g'|\
# Schritt 4: und dann Zeilenumbrüche vor den Sprachmarkern wieder herstellen
tr '§' '\n'


