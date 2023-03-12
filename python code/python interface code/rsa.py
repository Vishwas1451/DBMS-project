# from Crypto.Util.number import getPrime, bytes_to_long, inverse, long_to_bytes
# import random

p = 95045794698083623118304148227984000267150475757223519385317921855135578021219
q = 67903255733523041328015519388456835241166931966846450187800141740692096096443
import cryptography
import crypto.util.number
e, n = 65537, p*q
phi = (p-1)*(q-1)
d = crypto.inverse(e, phi)

print(d)
print(e)
print(n)
print(phi)