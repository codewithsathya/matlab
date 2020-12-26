function y = sss18_convolute(x, h)
    lengthOfX = length(x);
    lengthOfH = length(h);
    lengthOfY = lengthOfX + lengthOfH - 1;
    
    y = zeros(1,lengthOfY);
    x = [x, zeros(1, lengthOfY - lengthOfX)];
    h = [h, zeros(1, lengthOfY - lengthOfH)];
    for n = 1 : lengthOfY
        for k = 1 : n
            y(n) = y(n) + x(k) .* h(n - k + 1);
        end
    end
    
    figure;
    subplot(3,1,1);
    plot(x);
    title("Input");
    grid on;xlabel("n");ylabel("X[n]");
    
    subplot(3,1,2);
    plot(h);
    title("Frequency response");
    grid on;xlabel("n");ylabel("H[n]");
    
    subplot(3,1,3);
    plot(y);
    title("Output");
    grid on;xlabel("n");ylabel("Y[n]");
end

