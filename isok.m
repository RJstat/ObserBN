function ck=isok(Lk,Lkk)

d=diag(Lkk); cc=find(d==0); Lstar=Lkk(cc,cc);

for ii=1:length(Lk(1,:))
    aa(ii)=find(Lk(:,ii)==1);
end
bb=unique(aa);
if length(bb)<length(aa)
    ck=1; warndlg('filter matrix has two identity columns in the same block!')
elseif sum(sum(Lkk))==length(Lkk(:,1))
    ck=1; warndlg('filter matrix has the number of "1" the same as the matrix dimension, violating condition (A1)!')
elseif sum(d)>=2
    ck=1; warndlg('filter matrix has more than 1 "1" on the diagnal, violating condition (A2)!')
elseif sum(d)==1 && sum(Lstar(:))==0 
    ck=0;
else
    bg=biograph(Lstar);
    ck=isdag(bg)-1; 
    if ck~=0
        warndlg('filter matrix violates condition (A3)!')
    end
end
