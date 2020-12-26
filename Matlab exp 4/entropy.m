function [H] = entropy(X)

num_bins = ceil(sqrt(length(X)));


bins = linspace(min(X), max(X), num_bins);
bins(end) = bins(end) + 1; % eliminates the edge case by setting max(X) < bins(end)

X = sort(X);
p = zeros(1,length(bins)-1);
for i = 1:(length(bins)-1)
    p(i) = sum((X>=bins(i)) & (X<bins(i+1)));
end

p = p/sum(p);   % normalize to PDF
p(p==0) = [];   % eliminate empty bins


H = sum(-p.*log2(p));
