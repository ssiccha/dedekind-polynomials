// dPolysFactors := eval Read("data/factors-of-dedekind-polys");
R<X> := PolynomialRing(Rationals());
dPolys := [X ^ 0];
primitiveDPolys := [X ^ 0];
factorizations := [Factorization(X^0)];
computeNthPoly := function(n, dPolys)
    return X / n
    * &+[ DivisorSigma(1,k) * dPolys[n - k + 1] : k in [1..n] ];
end function;

nthPoly := function(n)
    return dPolys[n + 1];
end function;

for i in [1..1000] do
    print i;
    // do this to construct the polys
    // for first 100 this takes <1s
    dPolys[i+1] := computeNthPoly(i, dPolys);
    primitiveDPolys[i+1] := Factorial(i - 1) * dPolys[i];
end for;
for i in [301..1000] do
    print i;
    // do this to factor them over Q
    // for first 100 this takes ~1min 30s in GAP, 6s in magma
    factorizations[i+1] := Factorization(primitiveDPolys[i+1]);
end for;
degrees := [
    {*<Degree(pp[1]), pp[2]> : pp in factors*}
    : factors in factorizations
];

/*
// do this to compute the galois groups
groups := [GaloisGroup(NumberField(f)) : f in dPolysLastFactors];
*/
