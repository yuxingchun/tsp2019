function a = getan(N,f)
a=zeros(N,1);
for k=0:N-1
a(k+1)=exp(2*pi*k*f*1j);
end
end

