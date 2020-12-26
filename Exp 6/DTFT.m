function y = DTFT(x, w, n)
    for i = 1 : length(w)
        y(i)=0;
        for k = 1 : length(x)
              y(i) = y(i) + x(k) * exp(-1i * w(i) * (n(k)));
        end
    end
end