function X=rg_trf(x,f,n)
    % X=rg_trf(x,F,n)
    % Computation of the Fourier Transform
    
    Lx=length(x); % Number of values of x[n] signal
    
    if nargin<3 % For less than 3 input parameters, creation of n vector
        n=0:Lx-1;
    end
    if nargin<2 % For less than 2 input parameters, creation of F norm. freq.
        f=-0.5:1/1000:0.5;
    end
    
    Lf=length(f); % Number of values for computing the Fourier Transform
    x=x(:)'; % x (row)
    f=f(:)'; % F (row)
    n=n(:); % n (column)

    X=x*exp(-j*2*pi*n*f);
end 