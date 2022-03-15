function [ res ] = sigma1( x )

res = bitxor(rotr(x,17), rotr(x,19));
res = bitxor(res,bitshift(x,-10));

end