% Método acotado: método del punto fijo
clear, clc
%cf = input('Ingrese la función f: ', 's'); 
%cg = input('Ingrese la función g: ', 's'); 
%f = inline(cf); %#ok<DINLN> exp(x)-log10(x)-5
%g = inline(cg); %#ok<DINLN> log(log(x)+5)
f = @(x) (cos(x)-3*x);
g = @(x) (cos(x)/3);
syms x
dg = diff(g, x);
x = input('Ingrese el primer valor: ');

% Adicional para gráficar
X = linspace(0,2*pi);
Y = f(X);
Z = zeros( size(X) );
plot(X, Y)
xlabel("X")
ylabel("Y")
title("Punto Fijo")
grid on, hold on
plot(X, Z, 'r--')
legend("cos(x)-3*x","raiz")

if(abs(eval(dg)) < 1)
    tol = input('Ingrese la tolerancia: ');
    disp('       n         x0        error')
    fprintf('    0.0000    %7.4f      ------\n', x)
    n = 0; error = 100;
    while(error > tol)
        n = n+1;
        anterior = x;
        x = g(x);
        error = abs((x-anterior)/x)*100;
        disp([n, x, error])
    end
else
    disp('Ingrese otra función g(x), pues con la actual, el método diverge.')
end