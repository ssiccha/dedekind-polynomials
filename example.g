dedekindPolys := [];
RX := PolynomialRing(Rationals, "X");
x := RX.1;
dedekindPolys[0 + 1] := x^0;
computeNthPoly := function(n)
    return x / n * Sum([1..n], k -> Sigma(k) * dedekindPolys[n - k + 1]);
end;

nthPoly := function(n)
    return dedekindPolys[n + 1];
end;

# do this to construct the polys, takes ~1s
for i in [1..100] do dedekindPolys[i+1] := computeNthPoly(i); od;

# do this to factor them over Q, takes ~1min 30s
factors := List(dedekindPolys, p -> Factors(RX, PrimitivePolynomial(p)[1]));
PrintTo("data/factors-of-dedekind-polys");

# from here on we need to plug the irreducible polys into magma :/
