function colormandelbrot
WIDTH = 1000; %number of points in x axis
HEIGHT = 1000; %number of points in y axis

% fractal x y range
X_MIN = -2;   X_MAX = 1;
Y_MIN = -1.5; Y_MAX = 1.5;

MAX_ITERATION = 200;

% Generate linearly spaced points from X_MIN to X_MAX and Y_MIN to Y_MAX
xx = linspace(X_MIN, X_MAX, WIDTH);
yy = linspace(Y_MIN, Y_MAX, HEIGHT);
[x,y] = meshgrid(xx,yy);

% Allocate space for output
c = x + 1i * y;
z = zeros(size(c));
mdiverge = zeros(size(c));
the_waitbar = waitbar(0,'Please  wait...');

tic %start timer
for m = 1:MAX_ITERATION
    z = z.^2 + c;
    mdiverge(abs(z) > 2 & mdiverge == 0) = MAX_ITERATION - m;
    waitbar(m/MAX_ITERATION, the_waitbar);
end 
toc  %stop timer

mandelbrotset = c(~mdiverge); %this is the set that are in the mandelbrot set

close(the_waitbar);
figure;
imagesc(mdiverge);
colormap summer;
axis square;