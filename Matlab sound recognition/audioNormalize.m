function out = audioNormalize(in, ampMax)
    out = zeros(length(in),1);
    if( ampMax > 1 || ampMax < 0 )
        fprintf('(ampMax) out of bound.');
    else
        if max(in) > abs(min(in))
            out = in*(ampMax/max(in));
        else
            out = in*((-ampMax)/min(in));
        end
    end

end