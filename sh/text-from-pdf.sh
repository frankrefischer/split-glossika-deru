PDF_TO_TEXT=pdftotext
PDF_TO_TEXT_OPTIONS="-q -enc UTF-8 -raw -nopgbrk"

PDF_FILE=$1

CONVERT_GLOSSIKA_PDF_FILE_TO_TEXT="$PDF_TO_TEXT $PDF_TO_TEXT_OPTIONS $PDF_FILE -"

$CONVERT_GLOSSIKA_PDF_FILE_TO_TEXT |\
grep -v "DERU"|egrep -v "^[[:digit:]]*$"


