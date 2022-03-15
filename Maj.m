function [ res ] = Maj( x, y, z )

res = bitxor(bitand(x,y), bitand(x,z));
res = bitxor(res, bitand(y,z));

end

