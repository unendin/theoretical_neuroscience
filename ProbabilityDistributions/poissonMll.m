function [ll, grad, hess] = poissonMll(x,y)

    ll   = -sum(y*log(x) - x);
    grad = -sum(y/x - 1);
    hess = -sum(-y/x^2); 

end