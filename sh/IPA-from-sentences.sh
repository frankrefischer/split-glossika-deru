# die IPA-Sätze herausfiltern
# und den IPA-Marker entfernen
egrep '^IPA ' $1|\
sed 's/^IPA //g'|\

# Problem: in runden Klammern sind Alternativen angegeben.
# Lösung:  Weil wir noch nicht wissen, was wir mit denen machen,
#          entfernen wir sie erstmal ganz.
sed 's/ ([^)]*)//g'|\

# Problem: Zeichen für männlich/weiblich stören beim antworten.
#          Genauso Gedankenstriche.
# Lösung:  entfernen
sed 's/[♂♀]//g;s/— //g'|\

# Problem: optionale Teile sind mit eckigen Klammern markiert.
#          Weil wir noch nicht wissen, was wir mit denen machen,
#          entfernen wir erstmal die eckigen Klammern.
sed 's/\[//g;s/]//g'


