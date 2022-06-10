function varargout = M_Newton(varargin)
% M_NEWTON MATLAB code for M_Newton.fig
%      M_NEWTON, by itself, creates a new M_NEWTON or raises the existing
%      singleton*.
%
%      H = M_NEWTON returns the handle to a new M_NEWTON or the handle to
%      the existing singleton*.
%
%      M_NEWTON('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M_NEWTON.M with the given input arguments.
%
%      M_NEWTON('Property','Value',...) creates a new M_NEWTON or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M_Newton_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M_Newton_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M_Newton

% Last Modified by GUIDE v2.5 31-May-2016 23:00:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M_Newton_OpeningFcn, ...
                   'gui_OutputFcn',  @M_Newton_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before M_Newton is made visible.
function M_Newton_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M_Newton (see VARARGIN)

% Choose default command line output for M_Newton
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M_Newton wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M_Newton_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ingreso_Callback(hObject, eventdata, handles)
% hObject    handle to ingreso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ingreso as text
%        str2double(get(hObject,'String')) returns contents of ingreso as a double


% --- Executes during object creation, after setting all properties.
function ingreso_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ingreso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function niteraciones_Callback(hObject, eventdata, handles)
% hObject    handle to niteraciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of niteraciones as text
%        str2double(get(hObject,'String')) returns contents of niteraciones as a double


% --- Executes during object creation, after setting all properties.
function niteraciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to niteraciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vinicial_Callback(hObject, eventdata, handles)
% hObject    handle to vinicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vinicial as text
%        str2double(get(hObject,'String')) returns contents of vinicial as a double


% --- Executes during object creation, after setting all properties.
function vinicial_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vinicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function superi_Callback(hObject, eventdata, handles)
% hObject    handle to superi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of superi as text
%        str2double(get(hObject,'String')) returns contents of superi as a double


% --- Executes during object creation, after setting all properties.
function superi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to superi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in computar.
function computar_Callback(hObject, eventdata, handles)
% hObject    handle to computar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%Calcular

F=str2double(get(handles.uitable1,'data'));
N        = length(F)      % N�mero de coeficientes del polinomio.
n        = length(F)-1     % Grado del polinomio.


tole=str2double(get(handles.niteraciones,'string')); 
     
Raices = [];                % Inicia la matriz para almacenar las ra�ces resultantes.
%  Inicia ciclo para calcularlas ra�ces de un polinomio de orden n.



%  Inicia el ciclo para calcular las ra�ces de un polinomio de orden n.
for k = 1:N-2
    % Ejecuta el m�todo de Newton.
    [R,DR]= Newton(F,n,tole);
    % N�mero de iteraciones que realiz� el m�todo hasta la convergencia.
    Nf = length(R);
    % Valor de la ra�z calculada.
    Ra = R(Nf);
    % Almacena los factores calculados de la forma Ra�ces = [ra�z]
    Raices = [Raices
              Ra];
    % Hace la deflexi�n del factor simple; es decir, es la divisi�n sint�tica de P(x).
    P1(1) = F(1);
    for k=2:n;
        P1(k) = F(k) + P1(k-1)*Ra;
    end
    F = P1;              % Asigna el residuo a un nuevo polinomio.
    n  = length(F)-1;    % Saca el grado del residuo resultante.
    clear P1
end
%  Valor de la �ltima ra�z.
Ra = -F(2);
%  Almacena la �ltima ra�z.
Raices = [Raices
          Ra] 








      
 set(handles.iteraciones,'Data',Raices); 
    


   %  Funci�n del m�todo de Newton para calcular las ra�ces simples de polinomios con la
%  estructura P(x)= k1*x^n + k2*x^(n-1) + ... + km*x + kn donde se tiene que k1=1.
%
%  El m�todo calcula la ra�z de menor m�dulo.
%
%  La funci�n se llama de la siguiente manera:
%
%              [Z,dzk]= Newton(F,n)
%
%  Entradas:
%              F  -- Vector de coeficientes.
%              n  -- Grado del polinomio.
%
%  Salida:
%              Z   -- Vector que contiene todas las aproximaciones hasta la
%                     convergencia. 
    
%              dzk -- Vector que contiene todos los incrementos calculados.
%
function [Z,dzk]=Newton(F,n,tole)
Fp = polyder(F);                % C�lculo de la primera derivada de F.
Z(1) = 0 ;                      % Ra�z para fijar la condici�n de arranque.
f0   = polyval(F,Z(1));         % Evaluaci�n del polinomio en la ra�z.
fp   = polyval(Fp,Z(1));        % Evaluaci�n de la derivada en la ra�z.
%  C�lculo del primer incremento dzk.
if fp ~= 0
    dzk(1) = -f0/fp;
    else
    dzk(1) = 1;
end
%  Ciclo iterativo para calcular Z2.
for k = 1:n
    al(k) = (abs(F(n+1)/F(k)))^(n+1-k)  *  (dzk(1)/abs(dzk(1)));
end
[x,y]  = min(abs(al));   % Regresa el m�nimo m�dulo y su posici�n.
pn       = sign(al(y));    % Toma el signo del m�nimo m�dulo.
Z(2)  = (1/2)*pn*x;     % Calcula la primera aproximaci�n a la ra�z.
%  Primera etapa que concluye cuando se cumple dos veces consecutivas con el criterio
%  de convergencia.
tol = 1;    % Inicia la tolerancia de convergencia.
kr  = 3;    % Apuntador de iteraciones.
while tol <= 3
    f0 = polyval(F,Z(kr-1));      % Evaluaci�n del polinomio en la ra�z.
    fp = polyval(Fp,Z(kr-1));     % Evaluaci�n de la derivada en la ra�z.
    wk = -f0/fp;                  % Se calcula el radio de aproximaci�n.
    % Condicional para elegir dzk.
    if abs(wk) <= 3*abs(Z(kr-1)-Z(kr-2))
       dzk(kr-1) = wk;
    else
        dzk(kr-1) = (3*abs(Z(kr-1)-Z(kr-2))*wk*exp(i*pi/4))/abs(wk);
    end
    Z(kr) = Z(kr-1)+dzk(kr-1);    % Calcula la nueva aproximaci�n de la ra�z.
    f1    = polyval(F,Z(kr));     % Evaluaci�n del polinomio en la ra�z.
    % Condicional de la evaluaci�n del polinomio con aproximaciones consecutivas,
    % para buscar nuevas aproximaciones.
    if abs(f1) > abs(f0)
        ra    = Z(kr-1)+(2:n)*dzk(kr-1);    % Ra�ces nuevas con m = 2,..., n.
        faux  = polyval(F,ra);              % Evaluaci�n de la funci�n con las ra�ces.
        [x,y] = min(abs(faux));             % Regresa el m�nimo m�dulo y su posici�n.
        Zaux  = ra(y);                      % Elecci�n del menor m�dulo.
    else
        ra    = Z(kr-1)+[1/2 1/4 (1/4)*exp(i*pi/4)]*dzk(kr-1);   % Ra�ces nuevas con
                                                                 % m = 1/2 ...
        faux  = polyval(F,ra);                                   % Evaluaci�n de la 
                                                                 % funci�n con las
                                                                 % ra�ces.
        [x,y] = min(abs(faux));                                  % Regresa el m�nimo
                                                                 % m�dulo y su
                                                                 % posici�n.
        Zaux  = ra(y);                                           % Elecci�n del menor
                                                                 % m�dulo.
    end
    % Condicional para cambiar direcci�n en caso de no encontrar un paso adecuado.
    if abs(Z(kr)) > abs(Zaux)
        dzk(kr) = -(1/2)*exp(i*pi/4)*dzk(kr-1);
        Z(kr)   = Z(kr-1)+dzk(kr);
    else
        dzk(kr) = Zaux - Z(kr-1);
        Z(kr) = Zaux;
    end
    % Evaluaci�n de la prueba de convergencia.
    fkd  = polyval(F,Z(kr));
    
    
    
    
    
        fkp1 = polyval(Fp,Z(kr-1));
    fkp2 = polyval(Fp,Z(kr));
    CDd  = 2*abs(fkd)*abs(fkp1-fkp2);
    Cdi  = (abs(fkp2))^2*abs(Z(kr-1)-Z(kr));
    if CDd <= Cdi
        tol = tol+1;
    else
        tol = tol-1;
    end
    kr = kr+1;
end
%  Si cumpli� dos veces con el criterio de convergencia, se pasa a la etapa 2. En
%  esta etapa se eval�a directamente la regla de Newton con la formula Z(n)=Z(n%
 %1)+dzk(n).
while tol > 1e-12                            % Error absoluto permitido.

   f0 = polyval(F,Z(kr-1));                 % Evaluaci�n del polinomio en la ra�z.

   fp = polyval(Fp,Z(kr-1));                % Evaluaci�n de la derivada en la ra�z.

   dzk(kr) = -f0/fp;                        % C�lculo del incremento.

   Z(kr)   = Z(kr-1)+dzk(kr);               % C�lculo de la ra�z.

   tol = abs(abs(Z(kr)) - abs(Z(kr-1)));    % Error absoluto.

   kr = kr+1;
end
%  Condicional para quitar la parte imaginaria cuando es m�s peque�a que 1e-6.
a=real(Z(kr-1));
b=abs(imag(Z(kr-1)));
if b < 1e-6
    Z(kr-1)=a;
end 
    
    
    
    
    
    
    











% --- Executes on selection change in iteraciones.
function iteraciones_Callback(hObject, eventdata, handles)
% hObject    handle to iteraciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns iteraciones contents as cell array
%        contents{get(hObject,'Value')} returns selected item from iteraciones


% --- Executes during object creation, after setting all properties.
function iteraciones_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteraciones (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function grado_Callback(hObject, eventdata, handles)
% hObject    handle to grado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of grado as text
%        str2double(get(hObject,'String')) returns contents of grado as a double


% --- Executes during object creation, after setting all properties.
function grado_CreateFcn(hObject, eventdata, handles)
% hObject    handle to grado (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)



function po_Callback(hObject, eventdata, handles)
% hObject    handle to vinicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vinicial as text
%        str2double(get(hObject,'String')) returns contents of vinicial as a double


% --- Executes during object creation, after setting all properties.
function po_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vinicial (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function qo_Callback(hObject, eventdata, handles)
% hObject    handle to qo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of qo as text
%        str2double(get(hObject,'String')) returns contents of qo as a double


% --- Executes during object creation, after setting all properties.
function qo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to qo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to ingreso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ingreso as text
%        str2double(get(hObject,'String')) returns contents of ingreso as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ingreso (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)


columna=str2double(get(handles.grado,'string'));

matr=cell(1,columna+1);
matr(:,:)={''};
set(handles.uitable1,'Data',matr);
set(handles.uitable1,'ColumnEditable',true(1,columna+1));

set(handles.uitable1,'Visible','on');
