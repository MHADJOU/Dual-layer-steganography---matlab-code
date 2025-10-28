
% Order of Running These Codes
% 1) EncodingImage.m
% 2) Converting.m
% 3) Embedding.m
% 4) Decoding.m
% 5) Displaying.m

figure;
subplot(2, 5, 1), imshow(Input_Image), title("lsb\_SW");
subplot(2, 5, 2), imshow(Cover_Image), title("CI");
subplot(2, 5, 3), imshow(round(Quantized_Image)/255), title("Quantized Image");
subplot(2, 5, 4), imshow(Final_Steganographed_Image), title("SI");
subplot(2, 5, 5), imshow(Obtained_Image), title('extracted\_lsb\_SW');

subplot(2, 5, 6), imhist(Input_Image);
subplot(2, 5, 7), imhist(Cover_Image);
subplot(2, 5, 8), imhist(round(Quantized_Image)/255);
subplot(2, 5, 9), imhist(Final_Steganographed_Image);
subplot(2, 5, 10), imhist(Obtained_Image);

%figure 
%tiledlayout(3,3)

%nexttile
%imshow(Input_Image)
%title("Image To be Hidden");

%nexttile
%imshow(Cover_Image)
%title("Cover Image");

%nexttile
%imshow(round(Quantized_Image)/255)
%title("Quantized Image");

%nexttile
%imshow(Final_Steganographed_Image)
%title("Steganographed Image");

%nexttile
%imshow(Obtained_Image)
%title('Decoded Hidden Image');
