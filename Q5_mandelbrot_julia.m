function mandelbrot
WIDTH = 1000; %number of points in x axis
HEIGHT = 1000; %number of points in y axis

% fractal x y range
X_MIN = -2;   X_MAX = 1;
Y_MIN = -1.5; Y_MAX = 1.5;

MAX_ITERATION = 200;

% Generate linearly spaced points from X_MIN to X_MAX and Y_MIN to Y_MAX
[x,y] = meshgrid(linspace(X_MIN, X_MAX, WIDTH), linspace(Y_MIN, Y_MAX, HEIGHT));

% Allocate space for output
c = x + 1i * y;
z = zeros(size(c));
k = zeros(size(c));
h_wait = waitbar(0,'Please  wait...');

tic %start timer
for m = 1:MAX_ITERATION
    z = z.^2 + c;
    k(abs(z) > 100 & k == 0) = MAX_ITERATION - m;
    waitbar(m/MAX_ITERATION, h_wait);
end 
toc  %stop timer

close(h_wait);
figure;
imagesc(k);
colormap hot;
axis square;