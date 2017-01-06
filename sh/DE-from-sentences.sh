# die DE-Sätze herausfiltern
# und den DE-Marker entfernen
egrep '^DE ' $1|\
sed 's/^DE //g'|\

# Problem: es werden Ligaturzeichen verwendet, aber anscheinend falsch
# Lösung: ersetze alle falschen Ligaturzeichen durch 
#         den korrekten Doppelbuchstaben
sed 's/¡/fl/g;s/¬/ff/g;s/¿/fi/g'|\

# Problem: manche Sätze enthalten Pfeile oder Bindestriche die stören
# Lösung: entfernen
sed 's/ > / /g'|\
sed 's/ — / /g'|\

# Problem: ein einziger Satz ist komplett zerstört
# Lösung: einfach den kaputten Satz ersetzen
sed 's/^r r r ul/Ihre Kinder sind in der Schule./'
