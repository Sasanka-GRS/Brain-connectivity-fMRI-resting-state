function plotting_circle(W,top,node)

N = size(W);
N = N(1);

theta = 0:2*pi/N:2*pi*(N-1)/N;
Layout = [5*cos(theta); 5*sin(theta)]';

scatter(Layout(:,1),Layout(:,2),40,'o','filled'); % Plot nodes
for i = 1:N
    %scatter(Layout(i,1),Layout(i,2),20,'o','filled');
    text(Layout(i,1)+0.2,Layout(i,2)+0.2,node(i),'FontSize',10);
end
hold on

for i=1:N
    for j=1:N
        if top(i,j)~=0
            x=[Layout(i,1),Layout(j,1)];
            y=[Layout(i,2),Layout(j,2)]';
            plot(x,y,'r-',LineWidth=1.5);
        else
            if W(i,j)~=0
                x=[Layout(i,1),Layout(j,1)];
                y=[Layout(i,2),Layout(j,2)]';
                plot(x,y,'black-');
            end
        end
    end
end

hold off

end