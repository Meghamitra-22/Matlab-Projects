s = tf('s');                       % Define 's' as Laplace variable
W = 1 / (s * (s + 2) * (s + 3));   % Define the transfer function W(s)

numW = W.Numerator{1};             % Extract numerator coefficients of W(s)
denW = W.Denominator{1};           % Extract denominator coefficients of W(s)

Kc = 10;                           % Controller gain set to 10
