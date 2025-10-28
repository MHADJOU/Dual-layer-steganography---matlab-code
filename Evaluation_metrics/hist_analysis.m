clc;
close all;

% Load images
cover_img = imread('./results/0020.png');
stego_img = imread('./results/ext_lsb_stego_0020.png');

% Convert images to grayscale (optional for overall comparison)
% cover_gray = rgb2gray(cover_img);
% stego_gray = rgb2gray(stego_img);

% Compute histograms for grayscale images
cover_hist = imhist(cover_img);
stego_hist = imhist(stego_img);

% Compute histogram difference
hist_diff = sum(abs(cover_hist - stego_hist));

% Display histograms for visual comparison
figure;
subplot(1, 2, 1);
bar(cover_hist);
title('Stego Watermark Histogram');
xlabel('Pixel Intensity'); ylabel('Frequency');

subplot(1, 2, 2);
bar(stego_hist);
title('Extracted Stego watermark Histogram');
xlabel('Pixel Intensity'); ylabel('Frequency');

% Compute histogram difference
disp(['Histogram Difference: ', num2str(hist_diff)]);

% Compute correlation
hist_correlation = corr2(cover_hist, stego_hist);
disp(['Histogram Correlation: ', num2str(hist_correlation)]);

% Compute Correlation Coefficient (CC)
cover_mean = mean(cover_hist);
stego_mean = mean(stego_hist);
numerator_cc = sum((cover_hist - cover_mean) .* (stego_hist - stego_mean));
denominator_cc = sqrt(sum((cover_hist - cover_mean).^2) * sum((stego_hist - stego_mean).^2));
cc = numerator_cc / denominator_cc;
disp(['Correlation Coefficient (CC): ', num2str(cc)]);

% Compute Normalized Cross-Correlation (NCC)
numerator_ncc = sum(cover_hist .* stego_hist);
denominator_ncc = sqrt(sum(cover_hist.^2) * sum(stego_hist.^2));
ncc = numerator_ncc / denominator_ncc;
disp(['Normalized Cross-Correlation (NCC): ', num2str(ncc)]);


