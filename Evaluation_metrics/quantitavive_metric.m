function evaluation_metrics = quantitavive_metric(cover_img, stego_img)
    % MSE
    mse = mean((double(cover_img) - double(stego_img)).^2, 'all');
    
    % PSNR
    max_pixel = 255;
    psnr_value = 10 * log10(max_pixel^2 / mse);
    
    % SSIM
    ssim_value = ssim(stego_img, cover_img);
    
    fprintf('MSE: %.4f\n', mse);
    fprintf('PSNR: %.2f dB\n', psnr_value);
    fprintf('SSIM: %.4f\n', ssim_value);
end 

