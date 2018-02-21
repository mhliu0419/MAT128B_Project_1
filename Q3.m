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
z_value = zeros(HEIGHT, WIDTH);
z = 0+0i;
c = 0.36;
h_wait = waitbar(0,'Please  wait...');
k=0;
Z_set = zeros(1,200);  %To produce a Julia set for Question 4
                       %It stores all values of z

tic %start timer
for m = 1:WIDTH
    for n = 1:HEIGHT
         k = 0;
         z = x(m)+y(n)*i;
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
            
            Z_set(k+1) = z; %For each loop, store each z value
            
            k = k+1;
         end
         z_value(n,m) = k;   
    end
    waitbar(m/WIDTH, h_wait);
end 
toc  %stop timer

%Z_set                  %We do not need this command here. When we need the set, we
                        %print and use it
close(h_wait);
min_z = min(z_value(:));
max_z = max(z_value(:));
cmap = parula(max_z);
colormap(cmap);
imagesc(z_value);
end
