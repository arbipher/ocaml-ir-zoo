default: build

build:
	dune build

test:
	dune runtest -f

utop:
	dune utop . -- -implicit-bindings

promote:
	dune runtest -f --auto-promote

install:
	dune install

uninstall:
	dune uninstall

clean:
	dune clean

c1 :
	ocamlc -dsource a.ml

c2 :
	ocamlc -dparsetree a.ml

c3 :
	ocamlc -dtypedtree a.ml

c4 :
	ocamlc -drawlambda a.ml

c5 :
	ocamlc -dlambda a.ml

o1 : 
	ocamlopt -dsource a.ml

o2 :
	ocamlopt -dparsetree a.ml

o3 :
	ocamlopt -dtypedtree a.ml

o4 :
	ocamlopt -drawlambda a.ml

o5-% : eg/%.ml
	ocamlopt -dlambda $<

o6-% : eg/%.ml
	ocamlopt -dclambda $<

# good
o7-% : eg/%.ml
	ocamlopt -dflambda $<

o8-% : eg/%.ml
	ocamlopt -dflambda-verbose $<

o9-% : eg/%.ml
	ocamlopt -drawflambda $<

o10 :
	ocamlopt -dcmm a.ml

o11 :
	ocamlopt -dsel a.ml

o12-% : eg/%.ml
	ocamlopt -drawclambda $<

.PHONY: default build install uninstall test clean