clear all;
close all;
clc;

disp(string(datetime('now')));

Input_Image = imread('../images/lsb_stego_W.tiff');
% Convert to grayscale if the image is RGB
if size(Input_Image, 3) == 3
    Input_Image = rgb2gray(Input_Image);
end

% Since we are embedding only grayscale images
Image_Dimensions = [256 256]; 
Input_Image = imresize(Input_Image, [Image_Dimensions(1) Image_Dimensions(2)]);

%imwrite(Input_Image, "Finalised_lsb_stego_watermark.tiff");

% Now converting this image into a row vector to perform Huffman Encoding
Input_Image_Data = reshape(Input_Image, [1, Image_Dimensions(1) * Image_Dimensions(2)]);
Row_Vector_Dimensions = size(Input_Image_Data);

Hash_Table = zeros(1, 256);
for i = 1:1:Row_Vector_Dimensions(2)
    Hash_Table(Input_Image_Data(i) + 1) = Hash_Table(Input_Image_Data(i) + 1) + 1;
end

Unique_Elements = [];
Frequency_Elements = [];
for i = 1:1:length(Hash_Table)
    if Hash_Table(i) ~= 0
        Unique_Elements = [Unique_Elements, i - 1];
        Frequency_Elements = [Frequency_Elements, Hash_Table(i) / Row_Vector_Dimensions(2)];
    end
end

% BUBBLE SORT - USE BETTER SORTING METHODS FOR BETTER PERFORMANCE
for i = 1:1:length(Frequency_Elements) - 1
    for j = i + 1:1:length(Frequency_Elements)
        if Frequency_Elements(j) > Frequency_Elements(i)
            T1 = Frequency_Elements(i);
            Frequency_Elements(i) = Frequency_Elements(j);
            Frequency_Elements(j) = T1;
            T1 = Unique_Elements(i); 
            Unique_Elements(i) = Unique_Elements(j);
            Unique_Elements(j) = T1;
        end
    end
end 

% The Frequency Elements Could add sem noise because very less repeating elements probability has gone to zero 
[Huffman_Dictionary, Average_Length] = huffmandict(Unique_Elements, Frequency_Elements);
Huffman_Code_Obtained = huffmanenco(Input_Image_Data, Huffman_Dictionary);

% HuffmanCode should be embedded in LSB Bit form to Cover_Image
Binary_Information = Huffman_Code_Obtained(:);
Embedding_size = size(Binary_Information);
Embedding_Length = Embedding_size(1);
