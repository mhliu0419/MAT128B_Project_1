function Julia 
% Julia set fractal
% c=0.36

% ouput image resolution, WIDTHxHEIGHT
WIDTH = 1000; %number of points in x axis
HEIGHT = 1000; %number of points in y axis

% fractal x y range
Y_MIN = -2;
Y_MAX = 2;
X_MIN = -2;
X_MAX = 2;

MAX_ITERATION = 200;

% Generate linearly spaced points from X_MIN to X_MAX
x = linspace(X_MIN, X_MAX, WIDTH);
% Generate linearly spaced points from Y_MIN to Y_MAX
y = linspace(Y_MIN, Y_MAX, HEIGHT);

% Allocate space for output
zval = zeros(HEIGHT, WIDTH);
z = 0+0i;
c = 0.36;
h_wait = waitbar(0,'Please  wait...');

tic %start timer
for m = 1:WIDTH
    for n = 1:HEIGHT
         k = 0;
         z = x(m)+y(n)*i;
         %wx = x(m) - c;
         %wy = y(n) - c;
         if x(m) > 0
             theta = atan(y(n)/x(m));
         elseif x(m) < 0
             theta = pi + atan(y(n)/x(m));
         else
             theta = pi / 2;
         end
         theta = theta / 2;
         r = sqrt(x(m) * x(m) + y(n) * y(n));
        
         
         while (k < MAX_ITERATION) && (abs(z) < 2)
            z = z^2 + c;
            k = k+1;
         end
         zval(n,m) = k;   
    end
    waitbar(m/WIDTH, h_wait);
end 
toc  %stop timer

close(h_wait);
min_z = min(zval(:));
max_z = max(zval(:));
cmap = flag(max_z);
colormap(cmap);
imagesc(zval);
imwrite(zval,cmap,'julia.png','png');
end