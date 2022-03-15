function [ res ] = hex2bin( k )
res = [];
for i = 1:length(k)
    if k(i) == '0' res = [res 0 0 0 0];
    elseif k(i) == '1' res = [res 0 0 0 1];
    elseif k(i) == '2' res = [res 0 0 1 0];
    elseif k(i) == '3' res = [res 0 0 1 1];
    elseif k(i) == '4' res = [res 0 1 0 0];
    elseif k(i) == '5' res = [res 0 1 0 1];
    elseif k(i) == '6' res = [res 0 1 1 0];
    elseif k(i) == '7' res = [res 0 1 1 1];
    elseif k(i) == '8' res = [res 1 0 0 0];
    elseif k(i) == '9' res = [res 1 0 0 1];
    elseif k(i) == 'a' res = [res 1 0 1 0];
    elseif k(i) == 'b' res = [res 1 0 1 1];
    elseif k(i) == 'c' res = [res 1 1 0 0];
    elseif k(i) == 'd' res = [res 1 1 0 1];
    elseif k(i) == 'e' res = [res 1 1 1 0];
    else res = [res 1 1 1 1];
    end
end
end

