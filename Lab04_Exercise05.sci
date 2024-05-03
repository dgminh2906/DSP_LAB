// Load an image
image = imread("image.png");

// Get values of red, green, and blue component
im_red = image(:, :, 1);
im_green = image(:, :, 2);
im_blue = image(:, :, 3);

// Convert image to grayscale
im_gray = rgb2gray(image);

// Get histogram of each component
red_hist = imhist(im_red);
green_hist = imhist(im_green);
blue_hist = imhist(im_blue);
gray_hist = imhist(im_gray);


// Plot each histogram
subplot(221);
plot2d3([0:255], red_hist, 5);
xtitle("Red histogram");

subplot(222);
plot2d3([0:255], green_hist, 3);
xtitle("Green histogram");

subplot(223);
plot2d3([0:255], blue_hist', 2);
xtitle("Blue histogram");

subplot(224);
plot2d3([0:255], gray_hist);
xtitle("Grayscale levels histogram");
