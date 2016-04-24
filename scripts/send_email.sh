echo "Subject: Subjecy" > File_Out
echo "FROM: From_name" >> File_Out
echo "To: to@to.com" >> File_Out
echo "Content-Type: text/html; charset=us-ascii" >> File_Out
echo >> File_Out
echo "<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">" >> File_Out
echo "<html>" >> File_Out
echo "<pre>" >> File_Out
echo "<font size=3 color=blue><b>Message Body</b></font>" >> File_Out

/usr/lib/sendmail "user@domain.com" < File_Out

