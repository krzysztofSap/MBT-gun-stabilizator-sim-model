%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%             STAŁE I ZMIENNE POMOCNICZE DLA MODELU                 %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Stałe dla modelu symulacyjnego osi pionowej %%%

% stałe konstrukcyjne [m]:
l = 0.12;
l_0 = 0.4; 
l_1 = 0.32;
l_2 = 0.44;
r_t = 0.05; %promień trzpienia armaty

% wyliczenie stałej q_0:
q_0 = acos((l_1^2+l_2^2-l_0^2)/(2*l_1*l_2)); 
% l_e długość elektrocylindra 

% moment bezwładności armaty
J = 3400; %kg*m^2
% masa armaty
m = 2000; %kg
% stała przyspieszenia ziemskiego
g = 9.81; %m/s^2
% momement bezwładności wału silnika elektrocylindra
J_m = 0.002; %kg*m^2
% współczynnik tarcia wiskotycznego elektrocylindra
B_m = 0.0015; %N*m*s/rad
% współczynnik momentu obrotowego silnika
k_t = 1.54; % N*m/A
% współczynnik przeciwstawnej siły elektromotorycznej silnika
k_e = 0.89; % V*s/rad
% rezystancja uzwojenia silnika
R = 0.41; % Ohm
% współczynnik redukcji przekładni elektrocylindra
N = 5;
% sprawność całkowita elektrocylindra
ni = 0.85;
% skok przekładni śrubowej
p_h = 0.016; %m

% stałe pomocnicze:
f_const = (4*pi^2*ni*N^2*l_1*l_2)/(p_h^2); % stała pojawiająca się przed funkcjami f
mgl = m*g*l; % moment siły działa, względem sworznia głównego
mg = m*g; % ciężar działa
g1_const = (2*k_t*pi*ni*N)/(p_h*R); % stała dla funkcji g1
g3_const = f_const*(k_t*k_e)/(R+B_m); % stała dla funkcji g3
g4_const = f_const*J_m;

u_s = 0.12; %współczynnik tarcia statycznego sworzni
u_k = 0.04; % współczynnik tarcia kinetyczneho sworzni
C1 = 10e4; C2 = 3; % stałe modelu tarcia

%%% Stałe dla modelu symulacyjnego osi poziomej stabilizacji %%%

R_z = 0.08; %Pinion Pitch Circle Radius (m)
l_a = 0.9; %Turret rotation center to Turret-Gun Joint Distance
R_w = 1.2; %Turret Ring Gear Pitch Circle Radius (m)
mw = 17000; % Masa wieży (kg)
J_w = mw*R_w^2; % moment bezwładności wieży (kg.m^2)
% masa armaty
ma = 2000; %kg
% moment bezwładności armaty
J_a = ma*l_a^2; %kg*m^2
% sprawność całkowita przekładni zębatej
nih = 0.97;
% momement bezwładności wału silnika BLDC
J_mw =  0.000595; %kg*m^2
% całkowity moment bezwałdności osi poziomej
Jh= J_w + J_a + J_mw*nih*R_z*(1/R_w); %kg*m^2

% współczynnik tarcia wiskotycznego silnika
Bmh = 0.0015; %N*m*s/rad
% współczynnik momentu obrotowego silnika
kh_t = 0.54; % N*m/A
% współczynnik przeciwstawnej siły elektromotorycznej silnika
kh_e = 0.401; % V*s/rad
% rezystancja uzwojenia silnika
R_h = 0.01437; % Ohm
mwag = g*(mw+ma); % siła nacisku wieży na łożysko wieńcowe łączące ją z kadłubem
uw_s = 0.0025; % współczynnik tarcia statycznego łożyska
uw_k = 0.0015; % współczynnik tarcia kinetycznego łożyska
C1 = 10e4; C2 = 3; % stałe modelu tarcia