awk 'BEGIN{
        FS=","
        print  "<HTML>""<TABLE border="1">"
        counter=0
}
{
        if ( counter == 0 ) {
                counter++
                for(i=1;i<=NF;i++)
                        printf "<TH>%s</TH>", $i
                print ""
        } else {
                printf "<TR>"
                for(i=1;i<=NF;i++)
                        if ( $i == $NF && $i == "DOWN" ) {
                                printf  "<TD bgcolor='red'>%s</TD>",$i
                        } else { 
                                printf "<TD  bgcolor='lime'>%s</TD>",$i
                        }
                print "</TR>"    
        }
}
END{
        print "</TABLE></BODY></HTML>"
}
' $1


