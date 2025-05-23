clf
hold on
N=500;
x=zeros(1,N);y=x;
for a=2:N
c=randi([0 2]);    
switch c
    case 0    
        x(a)=0.5*x(a-1);
        y(a)=0.5*y(a-1);
    case 1
        x(a)=0.5*x(a-1)+.25;
        y(a)=0.5*y(a-1)+sqrt(3)/4;
    case 2
        x(a)=0.5*x(a-1)+.5;
        y(a)=0.5*y(a-1);
end
   % plot(x,y,'.')
  %  hold on;
  
end
plot(x,y,'.')
for i=1:500
    scatter(x(i),y(i),'filled');
    pause(0.01)
    hold on;
end

% title('Sierpinskiís triangle made in matlab by Paulo Silva')
% legend(sprintf('N=%d Iterations',N))