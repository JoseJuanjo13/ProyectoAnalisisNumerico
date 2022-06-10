clc
clear all
format long;
funcion=input('Ingrese la funcion f(x)=','s');
a=input('Ingrese el limite inferior del intervalo a=');
b=input('Ingrese el limite superior del intervalo b=');
cont=input('Ingrese el numero de iteraciones n=');
f=inline(funcion);
for k=1:cont
    k=k+1;
    c=(a+b)/2;
    e=abs((b-a)/2);
    A(k,:)=[k  a   b   c   f(c)  e];
    if f(a)*f(c)<0
        b=c;
    else
        a=c;
    end
end
fprintf('\n \tk \ta \tb \tc \tf(c) \terror \n');
disp(A);
fprintf('Solucion: \n  c=%8.10f\n', c);
fprintf('f(c)=%8.10f\n', f(c));
fprintf('error=%8.10f\n', e);