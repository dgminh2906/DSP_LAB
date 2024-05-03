// Load an image
image = imread("image.png");

// Extract RGB Components
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


// Plot histogram
subplot(2,2,1);
plot2d3([0:255], red_hist, 5);
xtitle("Red histogram");

subplot(2,2,2);
plot2d3([0:255], green_hist, 3);
xtitle("Green histogram");

subplot(2,2,3);
plot2d3([0:255], blue_hist, 2);
xtitle("Blue histogram");

subplot(2,2,4);
plot2d3([0:255], gray_hist, 1);
xtitle("Grayscale levels histogram");
