clear all;
close all;
clc

%Before running code! Plase, dowload the x4fun.mat in our github. If you
%cant find it, then go to Canvas under the projecy folder in EE23

%Conclusion: Incrementing the eigen value, reduces the noise. However, the
%bigger the eigen value, the lower the Amplitude of the signal.

load('x4fun.mat')

N_SAMP = 1024;
N = 11;

w = linspace(0, 2 * pi * (1 - 1 / N_SAMP), N_SAMP);
w = transpose(w);

h_n = zeros(N_SAMP, 1);
h_n(1 : 11) = 1;

%PArt1, a)
y_n = conv(x, h_n);

Y_jw = fft(y_n, N_SAMP);

H_jw = fft(h_n, N_SAMP);

% Replace H_jw_inv with Wiener filter!
eigen = linspace(0, 1000, 6); 
noise_n = 0.01 * randn(N_SAMP, 1);
noise_jw = fft(noise_n);
Y_jw_noise = Y_jw + noise_jw;

% Try multiple values of eigen
for i = 1 : length(eigen)
    H_w_jw = conj(H_jw) ./ ((abs(H_jw) .^ 2) + eigen(i));
    X_jw = Y_jw_noise .* H_w_jw;
    x_d2 = ifft(X_jw,N_SAMP);
    figure(i)
    plot(x_d2);
end
