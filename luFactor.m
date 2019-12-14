function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%       P = the permutation matrix

[n,m]=size(A);
if n~=m
    error('Error the matrix is not squre');
end
if rank(A) < min(n,m) 
    error('matrix is singular failed rank test');
end    
if (rcond(A) - eps ) <= 1.0e-3
    error('matrix is singular failed rcond test');
end     
 
k=0;
U=zeros(n);
L=zeros(n);
 
%TESTA=A;
if nargout ==3
    P=eye(n);
    for i = 1 : n
  [pivot, j]=max(abs(A(i:end,i)));
  num=size(find(pivot==(abs(A(i:end,i)))),1);
   
      temp=A(i,:);
      A(i,:)=A(j+k,:);
      A(j+k,:)=temp;
      temp=P(i,:);
      P(i,:)=P(j+k,:);
      P(j+k,:)=temp;
      temp=L(i,:);
      L(i,:)=L(j+k,:);
      L(j+k,:)=temp;
      k=k+1;
      
end
end

L = L + eye(n);
%srtA=A;
 
for i=2:n
    if A(i-1,i-1)==0
        error('pivot term is zero');
    end     
    L(i:end,i-1)=A(i:end,i-1)/A(i-1,i-1);
    for j=i:n
        A(j,:)=A(j,:)-A(j,i-1)/A(i-1,i-1)* A(i-1,:);
    end    
end
% use the line below to make sure no numerical resiuals is kept in the U
% matrix
U=triu(A);
% check for size of U
if sum(size(U) ~= size(A)) ~= 0
    error ('size of U not equal size of A');
end 
% check for size of L
if sum(size(L) ~= size(A)) ~= 0
    error ('size of L not equal size of A');
end  
 
if nargout==3
    if sum(size(P) ~= size(A)) ~= 0  
        error ('size of P not equal size of A');
    end  
end
% make sure that U is upper triangular 
if istriu(U)~=1
    error ('U is not upper trinagular');
end  
 
% make sure that L is lower triangular 
 
if istril(L)~=1
    error ('L is not lower trinagular');
end

end