clear, clc

X = input('Ingresa lista puntos de x: ');
Y = input('Ingresa lista puntos de y: ');
P_o = input('Ingresa el punto que desea aproximar: ');

n = length(X);
L = zeros(n,n);

for i=1:n % for rows
    V = 1;
    for j=1:n % for making polynomial
        if i~=j
            V = conv(V,poly(X(j)))/(X(i)-X(j));
        end
    end
    L(i,:) = V*Y(i);
end
L;
P = sum(L);
F = flip(P);
disp('El polinomio es: ');

for k=n:-1:2
    fprintf('+(%.2fx^%d)', F(k), k-1);   
end

fprintf('+(%.2f)', F(1));

A = polyval(P,P_o);
fprintf('/n El valor aproximado del punto dado es: %4.f', A);

%GRAFICA

x = linspace(X(1), X(n), 100);
y = polyval(P, x);
plot(x,y,'r')
hold on
plot(X,Y,'o')
