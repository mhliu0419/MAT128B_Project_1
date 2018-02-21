function newtonjulia

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 1000; %number of points in x axis
HEIGHT = 1000; %number of points in y axis

% fractal x y range
Y_MIN = -2;
Y_MAX = 2;
X_MIN = -2;
X_MAX = 2;

MAX_ITERATION = 1000;

% Generate linearly spaced points from X_MIN to X_MAX
x = linspace(X_MIN, X_MAX, WIDTH);
% Generate linearly spaced points from Y_MIN to Y_MAX
y = linspace(Y_MIN, Y_MAX, HEIGHT);

max_value = 10;  % highest degree of our polynomial
error = 10^(-6);  % tolerance of error
f = @(z) z.^(max_value) - 1;  % define function f
df = @(z) max_value*(z.^(max_value-1)); % derivative of f

colormap([0 0 1;1 0 1;0 1 1;1 1 1]); 
            % manually add more colors as n increases
            % add white as (n+1)th color
            % big down side of the generality of this program

z_value = zeros(HEIGHT, WIDTH); % create vector to store roots
the_waitbar = waitbar(0,'Please  wait...');

%This for loop is to calculates and stores the roots 
for a = 1:max_value
    z_value(a) = cos(a*2*pi/max_value) + 1i*sin(a*2*pi/max_value);
end

%create matrix
M = 2*ones(500,500);

tic %time start
for n = 1:WIDTH
    for m = 1:HEIGHT
        k = 0;
        z = x(n) + 1i*y(m);
        if x(n) > 0
             theta = atan(y(m)/x(n));
         elseif x(m) < 0
             theta = pi + atan(y(m)/x(n));
         else
             theta = pi / 2;
         end
         theta = theta / 2;
         r = sqrt(x(n) * x(n) + y(m) * y(m));
        zgneration = z; % assign value to zgeneration
        
        while k <= MAX_ITERATION && abs(f(zgneration)) > error
            zgneration = zgneration - f(zgneration)/df(zgneration);
            k = k + 1;
        end
        if k > MAX_ITERATION
            M(n,m) = max_value + 1; 
            % after MAX_ITERATION = 200 iterations, the function will diverage
            % the diverage part will be white
        else
            for b = 1:max_value
                %This if condiction is to assign root convergence color
                if abs(zgneration - z_value(b)) < error
                    M(n, m) = b;
                end
            end
        end
    end
    waitbar(n/WIDTH, the_waitbar);
end
toc %time stop
close(the_waitbar);%close the waitbar

image([X_MIN, X_MAX], [Y_MIN, Y_MAX], M); % all the roots of unity will be here
axis xy