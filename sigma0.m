function [ res ] = sigma0( x )

res = bitxor(rotr(x,7), rotr(x,18));
res = bitxor(res, bitshift(x,-3));

end