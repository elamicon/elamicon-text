all: elamicon-stream elamicon-normalized-stream elamicon-normalized-nosep-stream

elamicon-stream: raw/elamicon
	bin/private-only < raw/elamicon | bin/special-to-space > elamicon-stream
	
elamicon-normalized-stream: raw/elamicon-normalized
	bin/private-only < raw/elamicon-normalized | bin/special-to-space > elamicon-normalized-stream
	
elamicon-normalized-nosep-stream: raw/elamicon-normalized
	bin/private-only < raw/elamicon-normalized | bin/special-to-space | bin/strip-sep > elamicon-normalized-nosep-stream
	
clean:
	rm elamicon-*
