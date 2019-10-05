global L H row
% for ww=1:20
% n=4;m=2;row=n;
% L=zeros(2^n,2^n);
% R=unidrnd(2^n,1,2^n);
% for ii=1:2^n
%     L(R(ii),ii)=1;
% end
% %
% RH=unidrnd(2^m,1,2^n);
% H=zeros(2^m,2^n);
% for ii=1:2^n
%     H(RH(ii),ii)=1;
% end


ind=zeros(1,2^row);
for ii=1:2^row
    ind(ii)=find(H(:,ii)==1);
end
[~,~,gind]=unique(ind);
K=max(gind);
ck=zeros(size(K));
    for k=1:K
        indd=find(gind==k);
        if length(indd)==1
            ck(k)=0;
        elseif length(indd)>1
            Lk=L(:,indd);
            Lkk=Lk(indd,:);
            if sum(Lkk(:))==0
                warndlg('filter matrix can not be zero matrix')
                break;
            end
            ck(k)=isok(Lk,Lkk);
        end
    end
observalue=max(ck);


