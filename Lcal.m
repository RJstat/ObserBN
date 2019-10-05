
global L H row row2

k = 2;       % Two-valued logic
MC = lmc(k); % structure matrix for conjunction
ME = lme(k); % structure matrix for equivalance
MN = lmn(k); % structure matrix for negation
MR = lmr(k); % power-reducing matrix
MD = lmd(k); % disjunction

% The logical expression  for the third line can be written as
% logic_expr1= '(!D)&(A)';
% logic_expr2= '(!E)&B';
% logic_expr3= '(!B)&(D|C)';
% where | is disjunction, & is conjunction, and ! is negation

% convert the logic expresson to its matrix form

tic
fid=fopen(DataName); % ????
row=0;
while ~feof(fid) % ?????????
    [~]=fgets(fid); % ??fgetl
    row=row+1; % ????
end
fclose(fid); 

fid=fopen(DataName); % ????
logic_expr=cell(row,1); i=1;
while ~feof(fid) % ?????????
    logic_expr{i,1}=fgetl(fid); % ??fgetl
    i=i+1; % ????
end
fclose(fid); 
toc
matrix_expr=cell(row,1);
eqn=cell(1,row);
for i=1:row
matrix_expr{i,1} = lmparser(logic_expr{i,1});
eqn{1,i}=matrix_expr{i,1};
end

[expr0,vars] = stdform(strjoin(eqn));



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%Calculate H %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
fid=fopen(DataName2); % ????
row2=0;
while ~feof(fid) % ?????????
    [~]=fgets(fid); % ??fgetl
    row2=row2+1; % ????
end
fclose(fid); 

fid=fopen(DataName2); % ????
logic_expr2=cell(row2,1); i=1;
while ~feof(fid) % ?????????
    logic_expr2{i,1}=fgetl(fid); % ??fgetl
    i=i+1; % ????
end
fclose(fid); 
toc
matrix_expr2=cell(row2,1);
eqn2=cell(1,row2);
for i=1:row2
matrix_expr2{i,1} = lmparser(logic_expr2{i,1});
eqn2{1,i}=matrix_expr2{i,1};
end

[expr02,vars] = stdform(strjoin(eqn2));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculate the network transition matrix L and observer matrix H
L0 = eval(expr0);
H0 = eval(expr02);
v1=L0.v ;
v2=H0.v ;
L=zeros(2^row,2^row);
H=zeros(2^row2,2^row);
%sprintf('%s/Transition Matrix.txt',Output)
fid=fopen(sprintf('%s/Observability Determination.txt',Output),'w');
for k=1:2^row;
   L(v1(1,k),k)=1;

   H(v2(1,k),k)=1;
end

fprintf(fid,'The Matrix L is\n');
for i=1:2^row
   for j=1:2^row
       fprintf(fid,'%i\t',L(i,j));
   end
   fprintf(fid,'\n');
end
% fclose(fid);
% 
% fid=fopen(sprintf('%s/Observability Determination.txt',Output),'w');
fprintf(fid,'The Matrix H is\n');
for i=1:2^row2
   for j=1:2^row
       fprintf(fid,'%i\t',H(i,j));
   end
   fprintf(fid,'\n');
end
%fclose(fid);

OBS;
%fid=fopen(sprintf('%s/Observability Determination.txt',Output),'w');
if observalue==0;
    fprintf(fid,'The Boolean network is observable\n');
end
if observalue==1;
    fprintf(fid,'The Boolean network is not observable\n');
end
   fclose(fid); 
    
 %Making the reference%table%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
l=2^row;
T = table;
IntegratedState=cell(1,2^row);
Nodes=cell(row,2^row);
b=zeros(1,row);
for i=1:2^row
   for j=1:row;
   IntegratedState{1,i}=sprintf('e_%i^%i',l,i); 
    a=dec2bin(2^row-i);
    if length(a)<row
       for k=1:(row-length(a))
        b(k)=0;end
    for k=(row-length(a)+1):row
        b(k)=a(k-row+length(a));end
    end
    if length(a)==row
        b=a;end
    Nodes{j,i}=b(j);
   end
end
T.State=IntegratedState';
T.Node=Nodes';
writetable(T,'The_Corresponding_Node_Table_of_Each_Integrated_State.txt')
type 'The_Corresponding_Node_Table_of_Each_Integrated_State.txt'   
    
