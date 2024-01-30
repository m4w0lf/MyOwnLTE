---------------
how to create fake tls keys for freediameter

openssl req -new -batch -x509 -days 3650 -nodes -newkey rsa:1024 -out cert.pem -keyout privkey.pem -subj /CN=my.diameter.identity
openssl dhparam -out dh.pem 1024

---------------
regerate cert for all elements.....

for i in hss mme pcrf smf
 do openssl req -new -batch -x509 -days 3650 -nodes -newkey rsa:1024 -out open5gs-$i/tls/cert.pem -keyout open5gs-$i/tls/privkey.pem -subj /CN=$i.fosdem
 openssl dhparam -out open5gs-$i/tls/dh.pem 1024
done

---------------
Wireshark filter

s1ap || diameter && !(diameter.cmd.code== 280 || diameter.cmd.code == 257) || gtpv2 || gtp || pfcp && !(pfcp.msg_type == 1 || pfcp.msg_type == 2)

---------------