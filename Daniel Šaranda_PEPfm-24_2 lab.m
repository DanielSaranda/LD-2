clear all
clc
close all

x = 0.1:1/22:1;
y = (1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x)) / 2;
figure(1)
plot(x, y);
grid on

%Pirmas sluoksnis-8 perceptronai
w11_1 = randn(1);
w21_1 = randn(1);
w31_1 = randn(1);
w41_1 = randn(1);
w51_1 = randn(1);
w61_1 = randn(1);
w71_1 = randn(1);
w81_1 = randn(1);
%bias
b1_1 = randn(1);
b2_1 = randn(1);
b3_1 = randn(1);
b4_1 = randn(1);
b5_1 = randn(1);
b6_1 = randn(1);
b7_1 = randn(1);
b8_1 = randn(1);

%Antro sluksnio  svoriai is pirmo sluoksnio perceptronu
w11_2 = randn(1);
w12_2 = randn(1);
w13_2 = randn(1);
w14_2 = randn(1);
w15_2 = randn(1);
w16_2 = randn(1);
w17_2 = randn(1);
w18_2 = randn(1);

b1_2 = randn(1);%biad antro sluoksnio

e = zeros(20, 1);
eta = 0.1;
Y = zeros(1, length(x));

%Treneravimas
for j = 1:30000
    for i = 1:length(x)
        %isvestis
        v1_1 = x(i) * w11_1 + b1_1;
        v2_1 = x(i) * w21_1 + b2_1;
        v3_1 = x(i) * w31_1 + b3_1;
        v4_1 = x(i) * w41_1 + b4_1;
        v5_1 = x(i) * w51_1 + b5_1;
        v6_1 = x(i) * w61_1 + b6_1;
        v7_1 = x(i) * w71_1 + b7_1;
        v8_1 = x(i) * w81_1 + b8_1;

%Aktyvavimo funkcijos
        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        y5_1 = tanh(v5_1);
        y6_1 = tanh(v6_1);
        y7_1 = tanh(v7_1);
        y8_1 = tanh(v8_1);
%Antras sluoksnis
        v1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + y6_1*w16_2 + y7_1*w17_2 + y8_1*w18_2 + b1_2;
        y1_2 = v1_2;
        Y(i) = y1_2;
%Klaidu skaiciavimas
        e = y(i) - y1_2;
        delta1_2 = e; %klaidos gradientas antram sluoksnyje
%Klaidos gradiento skaiciavimas
delta1_1=(1 - tanh(v1_1)^2) * delta1_2 * w11_2;
delta2_1=(1 - tanh(v2_1)^2) * delta1_2 * w12_2;
delta3_1=(1 - tanh(v3_1)^2) * delta1_2 * w13_2;
delta4_1=(1 - tanh(v4_1)^2) * delta1_2 * w14_2;
delta5_1=(1 - tanh(v5_1)^2) * delta1_2 * w15_2;
delta6_1=(1 - tanh(v6_1)^2) * delta1_2 * w16_2;
delta7_1=(1 - tanh(v7_1)^2) * delta1_2 * w17_2;
delta8_1=(1 - tanh(v8_1)^2) * delta1_2 * w18_2;
%Atnaujinami koeficientai 2 sluoksnyje
w11_2=w11_2 + eta * delta1_2 * y1_1;
w12_2=w12_2 + eta * delta1_2 * y2_1;
w13_2=w13_2 + eta * delta1_2 * y3_1;
w14_2=w14_2 + eta * delta1_2 * y4_1;
w15_2=w15_2 + eta * delta1_2 * y5_1;
w16_2=w16_2 + eta * delta1_2 * y6_1;
w17_2=w17_2 + eta * delta1_2 * y7_1;
w18_2=w18_2 + eta * delta1_2 * y8_1;
b1_2=b1_2 + eta * delta1_2;

%Atnaujinami koeficientai 1 sluoksnyje
w11_1=w11_1 + eta * delta1_1 * x(i);
w21_1=w21_1 + eta * delta2_1 * x(i);
w31_1=w31_1 + eta * delta3_1 * x(i);
w41_1=w41_1 + eta * delta4_1 * x(i);
w51_1=w51_1 + eta * delta5_1 * x(i);
w61_1=w61_1 + eta * delta6_1 * x(i);
w71_1=w71_1 + eta * delta7_1 * x(i);
w81_1=w81_1 + eta * delta8_1 * x(i);
        
b1_1=b1_1 + eta * delta1_1;
b2_1=b2_1 + eta * delta2_1;
b3_1=b3_1 + eta * delta3_1;
b4_1=b4_1 + eta * delta4_1;
b5_1=b5_1 + eta * delta5_1;
b6_1=b6_1 + eta * delta6_1;
b7_1=b7_1 + eta * delta7_1;
b8_1=b8_1 + eta * delta8_1;
    end
end

hold on
plot(x, Y)
hold off
legend('Target', 'Predicted')

%%%Testavimas

xt = 0.1:1/222:1;

for j = 1:30000
    for i = 1:length(xt)
        %isvestis
        v1_1 = xt(i) * w11_1 + b1_1;
        v2_1 = xt(i) * w21_1 + b2_1;
        v3_1 = xt(i) * w31_1 + b3_1;
        v4_1 = xt(i) * w41_1 + b4_1;
        v5_1 = xt(i) * w51_1 + b5_1;
        v6_1 = xt(i) * w61_1 + b6_1;
        v7_1 = xt(i) * w71_1 + b7_1;
        v8_1 = xt(i) * w81_1 + b8_1;

        y1_1 = tanh(v1_1);
        y2_1 = tanh(v2_1);
        y3_1 = tanh(v3_1);
        y4_1 = tanh(v4_1);
        y5_1 = tanh(v5_1);
        y6_1 = tanh(v6_1);
        y7_1 = tanh(v7_1);
        y8_1 = tanh(v8_1);
%Antras sluoksnis
        tv1_2 = y1_1*w11_2 + y2_1*w12_2 + y3_1*w13_2 + y4_1*w14_2 + y5_1*w15_2 + y6_1*w16_2 + y7_1*w17_2 + y8_1*w18_2 + b1_2;
        Yt(i) = tv1_2;
    end
end
figure(2)
plot(x, y,'b-');
hold on
plot(xt,Yt,'r--')
hold off
title('Istestuota funkcija nuo 0 iki 1 per 200 zingsniu')
legend('Funkcija', 'Istestuota')
