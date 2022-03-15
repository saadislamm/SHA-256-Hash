function [ res ] = Ch( x,y,z )

res = bitxor(bitand(x,y), bitand(bitcmp(x),z));

end