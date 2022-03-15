function [ res ] = sha256( filename )
tic;
constants = ['428a2f98';'71374491';'b5c0fbcf';'e9b5dba5';'3956c25b';'59f111f1';
             '923f82a4';'ab1c5ed5';'d807aa98';'12835b01';'243185be';'550c7dc3';
             '72be5d74';'80deb1fe';'9bdc06a7';'c19bf174';'e49b69c1';'efbe4786';
             '0fc19dc6';'240ca1cc';'2de92c6f';'4a7484aa';'5cb0a9dc';'76f988da';
             '983e5152';'a831c66d';'b00327c8';'bf597fc7';'c6e00bf3';'d5a79147';
             '06ca6351';'14292967';'27b70a85';'2e1b2138';'4d2c6dfc';'53380d13';
             '650a7354';'766a0abb';'81c2c92e';'92722c85';'a2bfe8a1';'a81a664b';
             'c24b8b70';'c76c51a3';'d192e819';'d6990624';'f40e3585';'106aa070';
             '19a4c116';'1e376c08';'2748774c';'34b0bcb5';'391c0cb3';'4ed8aa4a';
             '5b9cca4f';'682e6ff3';'748f82ee';'78a5636f';'84c87814';'8cc70208';
             '90befffa';'a4506ceb';'bef9a3f7';'c67178f2'];
K = uint32(hex2dec(constants));
 
%initial hash values for sha-256%
H = ['6a09e667';'bb67ae85';'3c6ef372';'a54ff53a';'510e527f';'9b05688c';'1f83d9ab';'5be0cd19'];
H = uint32(hex2dec(H));

fid = fopen(filename,'r');
M = fread(fid, '*uint8')';
fclose(fid);
L = int64(length(M)*8);        %max length =2^64

k = uint64(mod(447-L,512));         % k is equal to number of zeros in Bytes to be appended
L = swapbytes(L);
PM = horzcat(M, 128, zeros(1,(k-7)/8), typecast(L, 'uint8'));         % PM = Padded Message

N = uint64(length(PM)/64);

ParsedMsg = reshape(PM,64,N)';
W2 = uint32(zeros(1,64));

for i = 1:N
     W = reshape(ParsedMsg(i,:),4,16)';
     for j=1:16
         W2(j) =  typecast(W(j,4:-1:1), 'uint32');
     end
     
     for t=17:64
         W2(t) = uint32(mod(uint64(sigma1(W2(t-2))) + uint64(W2(t-7)) + uint64(sigma0(W2(t-15))) + uint64(W2(t-16)), 4294967296));
     end
     a = H(1);
     b = H(2);
     c = H(3);
     d = H(4);
     e = H(5);
     f = H(6);
     g = H(7);
     h = H(8);
     for t=1:64
         T1 = uint32(mod(uint64(h) + uint64(sum1(e)) + uint64(Ch(e,f,g)) + uint64(K(t)) + uint64(W2(t)), 4294967296));
         T2 = uint32(mod(uint64(sum0(a)) + uint64(Maj(a,b,c)), 4294967296));
         h = g;
         g = f;
         f = e;
         e = uint32(mod(uint64(d) + uint64(T1), 4294967296));
         d = c;
         c = b;
         b = a;
         a = uint32(mod(uint64(T1) + uint64(T2), 4294967296));
     end
    H(1) = uint32(mod(uint64(a) + uint64(H(1)), 4294967296));
    H(2) = uint32(mod(uint64(b) + uint64(H(2)), 4294967296));
    H(3) = uint32(mod(uint64(c) + uint64(H(3)), 4294967296));
    H(4) = uint32(mod(uint64(d) + uint64(H(4)), 4294967296));
    H(5) = uint32(mod(uint64(e) + uint64(H(5)), 4294967296));
    H(6) = uint32(mod(uint64(f) + uint64(H(6)), 4294967296));
    H(7) = uint32(mod(uint64(g) + uint64(H(7)), 4294967296));
    H(8) = uint32(mod(uint64(h) + uint64(H(8)), 4294967296));
end
%format hex;

res = [dec2hex(H(1),8) dec2hex(H(2),8) dec2hex(H(3),8) dec2hex(H(4),8) dec2hex(H(5),8) dec2hex(H(6),8) dec2hex(H(7),8) dec2hex(H(8),8)];
toc;