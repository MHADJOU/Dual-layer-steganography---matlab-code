function extracted_msg = lsb_extraction(encoded_img)
    % Extract the size of the image
    [rows, cols] = size(encoded_img);

    % Extract the binary representation of the message length
    msg_length_bin = '';
    for i = 1:8
        msg_length_bin = [msg_length_bin, num2str(bitget(encoded_img(1, 1), i))]; % First pixel, first 8 bits
    end
    for i = 1:8
        msg_length_bin = [msg_length_bin, num2str(bitget(encoded_img(1, 2), i))]; % Second pixel, next 8 bits
    end

    % Convert the binary message length to decimal
    msg_length = bin2dec(msg_length_bin);

    % Extract the binary message
    msg_bin = '';  % Initialize binary message string
    bit_idx = 1;   % Start bit index
    for i = 1:rows
        for j = 1:cols
            if bit_idx > msg_length
                break;  % Stop when all message bits are extracted
            end
            % Get the least significant bit of the current pixel
            msg_bin = [msg_bin, num2str(bitget(encoded_img(i, j), 1))];
            bit_idx = bit_idx + 1;
        end
        if bit_idx > msg_length
            break;
        end
    end

    % Convert the binary message to characters
    extracted_msg = '';  % Initialize extracted message string
    for i = 1:8:length(msg_bin)
        if i+7 <= length(msg_bin)
            % Convert 8 bits to a character
            extracted_msg = [extracted_msg, char(bin2dec(msg_bin(i:i+7)))];
        end
    end
end
