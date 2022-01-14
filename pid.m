J = 2.2917E-5;  %Moment of inertia of the rotor
b = 1.5836E-5;  %Motor viscous friction constant
K = 0.004831;  %Electromotive force constant
R = 0.0678;     %Electric resistance
L = 2.75E-6;   %Electric Inductance
s = tf('s');
P_motor = K/(s*((J*s+b)*(L*s+R)+K^2)) %Transfer Function of DC motor
t = 0:0.001:2;
step(P_motor,t) %step input respons for P_motor
sys_cl = feedback(P_motor,1) %closed loop system
%pidTuner(P_motor,'pid')
step(sys_cl,t) %step input respons for closed loop system
damp(sys_cl)
[Wn,zeta,poles] = damp(sys_cl);
%Peak overshoot and 2% settling time
Mp = exp((-zeta(1)*pi)/sqrt(1-zeta(1)^2))
Ts = 4/(zeta(1)*Wn(1))
pidTuner(P_motor,'pid')
Kp = 0.1681;
C = pid(Kp)
T = feedback(C*P_motor,1)
t = 0:0.01:2;
step(T,t)
Kp = 0.1681;
Kd = 0.009296;
C = pid(Kp,0,Kd)
T = feedback(C*P_motor,1);
a=stepinfo(T)
t = 0:0.01:2;
step(T,t)
Kp = 0.1681;
Ki = 0.676;
C = pid(Kp,Ki)
T = feedback(C*P_motor,1)
t = 0:0.01:2;
step(T,t)
Kp = 0.1681;
Ki = 0.676;
Kd = 0.009296;
C = pid(Kp,Ki,Kd)
T = feedback(C*P_motor,1)
t = 0:0.01:2;
step(T,t)
stepinfo(sys_cl)
stepinfo(T)
damp(T)
