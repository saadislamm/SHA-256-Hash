function [ res ] = sum0( x )

res = bitxor(rotr(x,2),rotr(x,13));
res = bitxor(res,rotr(x,22));

end