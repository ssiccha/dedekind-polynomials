R<X> := PolynomialRing(Integers()); 
dedekindPolysFactors := eval Read("data/factors-of-dedekind-polys");
dedekindPolysLastFactors := [f[#f] : f in dedekindPolysFactors];
groups := [GaloisGroup(NumberField(f)) : f in dedekindPolysLastFactors];
