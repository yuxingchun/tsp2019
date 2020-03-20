function [Qr,Qi]=Qri(N)
Qr=[];
Qi=[];
for i=1:N
    [Qrm,Qim]=Qrim(i,N);
    Qr=[Qr,Qrm];
    Qi=[Qi,Qim];
end
end