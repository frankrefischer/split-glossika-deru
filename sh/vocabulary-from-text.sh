sed -n '/^Vokabular: /,/^Glossika Vielsätze/p' $1 |\
egrep -v '^Vokabular: ' | egrep -v '^Glossika Vielsätze'

