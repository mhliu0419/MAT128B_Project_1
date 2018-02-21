% x (real(c))
dx=0.01; % step
x1=-2;
x2=2;

% y (imag(c))
dy=0.01; % step
y1=-1.5;
y2=1.5;

x=x1:dx:x2;
y=y1:dy:y2;

[X,Y] = meshgrid(x,y); % for vectorized calculation

c=X+1i*Y;

R=5; % if abs(z)>R then z is considered as infinity
n=50; % maximal number of iterations, 100 is close to infinity
z=zeros(size(c)); % starts from zeros

I=zeros(size(c));
for nc=1:n
    z=z.^2+c; % vectorized
    bw=abs(z)<R;
    I(bw)=nc;
end

imagesc(x,y,I);
set(gca,'YDir','normal');
xlabel('Re(c)');
ylabel('Im(c)');
    
    