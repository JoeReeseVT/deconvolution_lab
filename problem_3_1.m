N_SAMP = 1024;

w = linspace(0, 2 * pi * (1 - 1 / N_SAMP), N_SAMP); 

h_n = zeros(N_SAMP, 1);
h_n(1 : 11) = 1;

x_n = zeros(N_SAMP, 1);
x_n(N_SAMP / 2 - 50 : N_SAMP / 2 + 50) = 1;

y_n = conv(x_n, h_n);
Y_jw = fft(y_n, N_SAMP);

H_jw = fft(h_n, N_SAMP);

H_jw_inv = 1 ./ H_jw;

% Previously we tried first doing IFFT of H_jw_inv (to get h_n_inv) and 
% convolving that with y_n, but that didn't work. So instead we multiply
% in the fourier domain and THEN do the IFFT. That works correctly.
deconv = ifft(Y_jw .* H_jw_inv); 

figure(1)
plot(x_n, 'Marker', 'o', 'LineStyle', 'none');

figure(2)
plot(h_n, 'Marker', 'o', 'LineStyle', 'none');

figure(3)
plot(y_n, 'Marker', 'o', 'LineStyle', 'none');

figure(4)
plot(deconv, 'Marker', 'o', 'LineStyle', 'none');
