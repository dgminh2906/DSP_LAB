// Define range of frequencies
w=[-%pi:0.01:%pi];

// h(n) amplitude spectrum
subplot(121);
plot2d(w, 1 ./ sqrt((1 + 0.1*cos(w) + 0.2*cos(2*w)).^2 + (-0.1*sin(w) - 0.2*sin(2*w)).^2));
title("Amplitude spectrum of h(n)");
ylabel("Amplitude |H(w)|");
xlabel("Frequency w");

// h(n) phase spectrum
subplot(122);
plot2d(w, -atan((-0.1*sin(w) - 0.2*sin(2*w)) ./ (1 + 0.1*cos(w) + 0.2*cos(2*w))));
title("Phase spectrum of h(n)");
ylabel("Phase angle(H(w))");
xlabel("Frequency w");
