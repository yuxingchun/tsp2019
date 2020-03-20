N=5;
A=rand(N);
A=A*A';
cvx_begin sdp
variable P(N,N) symmetric
A'*P + P*A <= -eye(N);
P >= eye(N);
cvx_end