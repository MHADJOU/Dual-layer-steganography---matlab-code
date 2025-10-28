clc;
close all;

fprintf('Between stego-watermark and extracted stego-watermark\n');

cover_img = imread('./SensativeAnalysis/4.2.07.tiff');
stego_img = imread('./SensativeAnalysis/4.2.07.tiff');

quantitavive_metric(cover_img, stego_img);

fprintf('between initial watermark and stego-watermark image\n');

stego_watermark = imread('./SensativeAnalysis/4.2.07.tiff');
stego_image = imread('./SensativeAnalysis/stego_cg64.tiff');

%
quantitavive_metric(stego_watermark, stego_image);