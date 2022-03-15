function [ res ] = rotr( x, n )

res = bitor(bitshift(x,-n), bitshift(x,32-n));

end