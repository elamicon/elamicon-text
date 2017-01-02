all: stream res stream/elamicon stream/elamicon-norm stream/elamicon-norm-nosep res/repetitions-with-omissions res/repetitions-with-omissions-nosep

stream:
	mkdir -p stream

res:
	mkdir -p res

stream/elamicon: raw/elamicon
	bin/private-only < $< | bin/special-to-space > $@
	
stream/elamicon-norm: raw/elamicon-normalized
	bin/private-only < $< | bin/special-to-space > $@
	
stream/elamicon-norm-nosep: raw/elamicon-normalized
	bin/private-only < $< | bin/special-to-space | bin/strip-sep > stream/elamicon-norm-nosep
	
res/repetitions-with-omissions: stream/elamicon-norm
	bin/repetitions-with-omissions < $< > $@

res/repetitions-with-omissions-nosep: stream/elamicon-norm-nosep
	bin/repetitions-with-omissions < $< > $@

clean:
	rm stream/*
	rm res/*
