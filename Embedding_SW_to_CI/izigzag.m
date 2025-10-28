function output_matrix = izigzag(input_vector, rows, cols)
    % Check if rows and cols are compatible with the input length
    if length(input_vector) ~= rows * cols
        error('Input vector length does not match specified matrix dimensions.');
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
    
    % Reconstruct the matrix from the vector using the zigzag order
    output_matrix = zeros(rows, cols);
    for i = 1:rows
        for j = 1:cols
            output_matrix(i, j) = input_vector(order(i, j));
        end
    end
end
