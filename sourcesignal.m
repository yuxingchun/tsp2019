%%noiseless case
function x=sourcesignal(N1)
f=[0.15,0.28,0.63,0.83];
c=[1.0,1.0,1.0,1.0];
%4个源信号help
N=4;
%N1=16;
x=zeros(N1,1);
for i=1:N
    x=x+c(i).*getan(N1,f(i));
end
end