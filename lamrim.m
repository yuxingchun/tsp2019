function [lamrm,lamim]=lamrim(m,N)
lamim=blkdiag(zeros(2*(m-1)),lamr(),zeros(2*(N-m)));
lamrm=blkdiag(zeros(2*(m-1)),lamr(),zeros(2*(N-m)));
end