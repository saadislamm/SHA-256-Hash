function [ res ] = sum1( x )

res = bitxor(rotr(x,6),rotr(x,11));
res = bitxor(res,rotr(x,25));

end


