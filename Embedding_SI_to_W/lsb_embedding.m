function lsb_img = lsb_embedding(cover_img, secret_msg)
    % Get the size of the cover image
    [rows, cols] = size(cover_img);
    
    % Convert the secret message to a binary string
    msg_bin = '';  % Initialize an empty string for binary message
    for i = 1:length(secret_msg)
        msg_bin = [msg_bin, dec2bin(secret_msg(i), 8)];  % Convert each character to 8 bits
    end
    
    % Get the length of the message in binary (16 bits)
    msg_length = length(msg_bin);
    msg_length_bin = dec2bin(msg_length, 16);  % Convert the message length to 16-bit binary
    
    % Initialize the image for embedding
    lsb_img = cover_img;  % Start with the cover image
    
    % Embed the first 8 bits of the message length into the first pixel
    for i = 1:8
        % Set the i-th bit of the first pixel in the LSB
        lsb_img(1, 1) = bitset(lsb_img(1, 1), i, str2double(msg_length_bin(i)));
    end
    
    % Embed the second 8 bits of the message length into the second pixel
    for i = 1:8
        % Set the i-th bit of the second pixel in the LSB
        lsb_img(1, 2) = bitset(lsb_img(1, 2), i, str2double(msg_length_bin(i+8)));
    end
    
    % Embed the message itself into the least significant bits of the image pixels
    bit_idx = 1;  % Initialize bit index for the message
    for i = 1:rows
        for j = 1:cols
            if bit_idx <= length(msg_bin)
                % Get the current pixel value
                current_pixel = lsb_img(i, j);
                % Embed the message bit into the least significant bit of the pixel
                current_pixel = bitset(current_pixel, 1, str2double(msg_bin(bit_idx)));
                % Update the image with the new pixel value
                lsb_img(i, j) = current_pixel;
                bit_idx = bit_idx + 1;
            else
                break;  % Exit the loop once all message bits are embedded
            end
        end
    end
end
