% a=[5 6 7 8 9 10];
% w=1:1:10;
% a=cos(w*2);
% c=length(a);
% a=[c a];
a=[1 2 3 4 5 6 7 8 9 10];
b=[10 9 8 7 6 5 4 3 2 1];
file=fopen('test15.dat','w');
fprintf(file,'\n%f',a);
fclose(file);
file=fopen('test16.dat','w');
fprintf(file,'\n%f',b);
fclose(file);
%A = (dlmread('test15.dat'))'
