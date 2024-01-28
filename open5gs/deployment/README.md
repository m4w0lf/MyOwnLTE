
how to create fake tls keys for freediameter

openssl req -new -batch -x509 -days 3650 -nodes -newkey rsa:1024 -out cert.pem -keyout privkey.pem -subj /CN=my.diameter.identity
openssl dhparam -out dh.pem 1024