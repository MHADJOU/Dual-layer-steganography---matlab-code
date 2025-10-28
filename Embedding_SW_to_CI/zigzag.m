function output = zigzag(input_matrix)
    % Ensure input is a square matrix (for an 8x8 example)
    [rows, cols] = size(input_matrix);
    if rows ~= 8 || cols ~= 8
        error('Input matrix must be 8x8 for this zigzag implementation');
    end

    % Define the zigzag order for an 8x8 matrix
    order = [
        1  2  6  7 15 16 28 29;
        3  5  8 14 17 27 30 43;
        4  9 13 18 26 31 42 44;
        10 12 19 25 32 41 45 54;
        11 20 24 33 40 46 53 55;
        21 23 34 39 47 52 56 61;
        22 35 38 48 51 57 60 62;
        36 37 49 50 58 59 63 64;
    ];
    
    % Rearrange elements in zigzag order
    output = zeros(1, rows * cols);
    for i = 1:rows
        for j = 1:cols
            output(order(i, j)) = input_matrix(i, j);
        end
    end
end
