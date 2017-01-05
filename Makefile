all: stream res stream/syl stream/syl-space res/repetitions-with-omissions-syl res/repetitions-with-omissions res/repetitions-with-omissions-nosep

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

stream/syl: raw/syl
	bin/singleline-blocks < $< | bin/lowercase | bin/singlespace > $@

stream/syl-space: raw/syl
	bin/singleline-blocks < $< | bin/lowercase | bin/dash-to-space | bin/lowercase > $@

res/repetitions-with-omissions-syl: stream/syl-space
	bin/repetitions-with-omissions-syl < $< > $@


clean:
	rm stream/*
	rm res/*
