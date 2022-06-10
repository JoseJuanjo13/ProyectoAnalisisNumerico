% Metodos acotados: metodo del punto fijo.
clear , clc
xf(1)=input('Ingrese el valor inicial: ');
tol=input('Ingrese el porcentaje de error: ');
syms x;
f=input('Ingrese la función f(x), despejada g(f(x)): ');

i=1;
ea(1)=100;
while abs(ea(i))>=tol,
    xf(i+1) = subs(f,x,xf(i)); 
    ea(i+1) = abs((xf(i+1)-xf(i))/xf(i+1))*100; 
    i=i+1;
end
fprintf('i     xf(i)         Error aprox (i) \n');
for j=1:i;
    %fprintf('%2d \t %11.7f \t %7.3f \n',j-1,xf(j),ea(j));
    A(j,:)=[j-1,   xf(j),  ea(j)];
end

disp(A);