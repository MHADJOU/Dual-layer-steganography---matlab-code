clc;
clear;

% add necessary folder paths to ensure a smooth execution of the code
%addpath(['..\Embedding_SW_to_CI']);

% Read the cover image
cover_img = imread('../images/W.tiff');  % Use your cover image here

% Convert the cover image to grayscale and resize to 256x256
%cover_img_gray = rgb2gray(cover_img);
cover_img_gray = imresize(cover_img, [256 256]);  % Resize to 256x256
%imwrite(cover_img_gray, './SensativeAnalysis/cg64.tiff');

% Secret message to embed
secret_msg = 'Secret message!';

% Embed the message into the image using LSB
encoded_img = lsb_embedding(cover_img_gray, secret_msg);

% Resize the encoded (stego) image to 256x256 if necessary
encoded_img = imresize(encoded_img, [256 256]);  % Resize to 256x256

% Extract the secret message from the encoded image
extracted_msg = lsb_extraction(encoded_img);

% Assuming after extraction the image is still the same as the original (cover image)
extracted_img = cover_img_gray;  % This can change based on your actual extraction method

% Resize the extracted image to 256x256 if necessary
extracted_img = imresize(extracted_img, [256 256]);  % Resize to 256x256

% Create a figure to display all images and histograms
figure;

% Display the cover image and its histogram
subplot(3,2,1); 
imshow(cover_img_gray);
title('Cover Image (Grayscale)');

subplot(3,2,2); 
imhist(cover_img_gray);
title('Histogram of Cover Image');

% Display the encoded (stego) image and its histogram
subplot(3,2,3); 
imshow(encoded_img);
title('Encoded Image (Stego)');

subplot(3,2,4); 
imhist(encoded_img);
title('Histogram of Encoded Image (Stego)');

% Display the extracted image and its histogram
%subplot(3,2,5); 
%imshow(extracted_img);
%title('Extracted Image');

%subplot(3,2,6); 
%imhist(extracted_img);
%title('Histogram of Extracted Image');

% Save the encoded image (Stego) locally
imwrite(encoded_img, '../images/lsb_stego_W.tiff');

% Save the extracted image (after extraction) locally
%imwrite(extracted_img, 'lsb_extracted_logo.png');

% Display the extracted message
%disp(['Extracted Message: ', extracted_msg]);


function psnr_value = calculate_psnr(cover_image, stego_image)
    mse = mean((double(cover_image) - double(stego_image)).^2, 'all');
    max_pixel = 255; % For 8-bit images
    psnr_value = 10 * log10(max_pixel^2 / mse);
end