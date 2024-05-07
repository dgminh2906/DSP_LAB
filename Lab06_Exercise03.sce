// Define range of frequencies
w=[-%pi:0.01:%pi];

// x_1(n) amplitude spectrum
subplot(221);
plot2d(w, sqrt((1 - 0.1*cos(w)).^2 + (-0.1*sin(w)).^2) ./ (1 - 0.2*cos(w) + 0.01));
title("Amplitude Spectrum of x_1(n)");
ylabel("Amplitude |X_1(w)|");
xlabel("Frequency w");

// x_1(n) phase spectrum
subplot(222);
plot2d(w, atan((-0.1*sin(w)) ./ (1 - 0.1*cos(w))));
title("Phase Spectrum of x_1(n)");
ylabel("Phase angle(X_1(w))");
xlabel("Frequency w");

// x_2(n) amplitude spectrum
subplot(223);
plot2d(w, sqrt((1 + cos(w) + cos(2*w) + cos(3*w)).^2 + (-(sin(w) + sin(2*w) + sin(3*w))).^2));
title("Amplitude Spectrum of x_2(n)");
ylabel("Amplitude |X_2(w)|");
xlabel("Frequency w");

// x_2(n) phase spectrum
subplot(224);
plot2d(w, atan(-((sin(w) + sin(2*w) + sin(3*w)) ./ (1 + cos(w) + cos(2*w) + cos(3*w)))));
title("Phase Spectrum of x_2(n)");
ylabel("Phase angle(X_2(w))");
xlabel("Frequency w");
