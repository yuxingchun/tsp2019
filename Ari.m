function [Ar,Ai]=Ari(N)
Ar=[];
Ai=[];
for i=1:N
    [lamrm,lamim]=lamrim(i,N);
    Ar=[Ar,diag(lamrm)];
    Ai=[Ai,diag(lamim)];
end
end