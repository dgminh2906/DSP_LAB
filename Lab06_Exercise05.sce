// Define range of frequencies
w=[-%pi:0.01:%pi];

// y(n) amplitude spectrum
subplot(121);
plot2d(w, sqrt((0.5 + 0.5*cos(w)).^2 + (-1.5*sin(w)).^2) ./ (1.25 - cos(w)));
title("Amplitude spectrum of y(n)");
ylabel("Amplitude |Y(w)|");
xlabel("Frequency w");

// y(n) phase spectrum
subplot(122);
plot2d(w, atan((-1.5*sin(w)) ./ (0.5 + 0.5*cos(w))));
title("Phase spectrum of y(n)");
ylabel("Phase angle(Y(w))");
xlabel("Frequency w");
