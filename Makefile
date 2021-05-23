build-bin:
	export GO111MODULE=auto && GOOS=linux GOARCH=amd64 go build -o ${PWD}/CENTOS/home/subnet .
	cp server.certPEM  ./CENTOS/home
	cp server.keyPEM ./CENTOS/home
	cp ca.certPEM ./CENTOS/home
init-ca:
	subnet --mode init-server-certs --cert server.certPEM --key server.keyPEM --ca ca.certPEM --ca_key ca.keyPEM
	subnet --mode make-client-cert --ca ca.certPEM --ca_key ca.keyPEM client.certPEM client.keyPEM