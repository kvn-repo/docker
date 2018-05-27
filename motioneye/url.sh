Pp="192.168.1.51:61377"
user="admin"
pass="Kehansen01"
echo rtsp://"$user":"$pass"@"$Pp"/videoMain
echo http://$Pp/cgi-bin/CGIProxy.fcgi?cmd=snapPicture2\&usr="admin"\&pwd="Kehansen01"
Pp="192.168.1.51:61378"
echo rtsp://"$user":"$pass"@"$Pp"/videoMain
echo http://$Pp/cgi-bin/CGIProxy.fcgi?cmd=snapPicture2\&usr="admin"\&pwd="Kehansen01"

Pp="192.168.1.51:61376"
echo rtsp://"$user":"$pass"@"$Pp"/videoMain
echo http://$Pp/cgi-bin/CGIProxy.fcgi?cmd=snapPicture2\&usr="$user"\&pwd="$pass"

