if length(time)>length(result)
   time(1)=[]; 
end


ii = 1;
for i = 1:length(time)
    if time(i) >= 0.001*(ii-1) 
        Time(ii) = time(i);
        Result(ii,:) = result(i,:);
        ii = ii + 1;
    end
end

n = 100; 
x = zeros(length(Time),8);
y = zeros(length(Time),8);

for i=1:length(Time)
    xa(i,1) = Result(i,1); 
    ya(i,1) = Result(i,2);
    xa(i,2) = xa(i,1)+Ls*sin(Result(i,3)); 
    ya(i,2) = ya(i,1)+Ls*cos(Result(i,3));
    xa(i,3) = xa(i,1)+(L-Ls)*sin(Result(i,3)); 
    ya(i,3) = ya(i,1)+(L-Ls)*cos(Result(i,3));
    xa(i,4) = xa(i,1)+L*sin(Result(i,3));
    ya(i,4) = ya(i,1)+L*cos(Result(i,3));

    xb(i,1) = Result(i,4); 
    yb(i,1) = Result(i,5);
    xb(i,2) = xb(i,1)+Ls*sin(Result(i,6)); 
    yb(i,2) = yb(i,1)+Ls*cos(Result(i,6));
    xb(i,3) = xb(i,1)+(L-Ls)*sin(Result(i,6)); 
    yb(i,3) = yb(i,1)+(L-Ls)*cos(Result(i,6));
    xb(i,4) = xb(i,1)+L*sin(Result(i,6));
    yb(i,4) = yb(i,1)+L*cos(Result(i,6));

    xc(i,1) = Result(i,7); 
    yc(i,1) = Result(i,8);
    xc(i,2) = xc(i,1)+Ls*sin(Result(i,9)); 
    yc(i,2) = yc(i,1)+Ls*cos(Result(i,9));
    xc(i,3) = xc(i,1)+(L-Ls)*sin(Result(i,9)); 
    yc(i,3) = yc(i,1)+(L-Ls)*cos(Result(i,9));
    xc(i,4) = xc(i,1)+L*sin(Result(i,9));
    yc(i,4) = yc(i,1)+L*cos(Result(i,9));
    
end

figure(1)
hold on;

axis equal;
axis xy;
xlabel('x [m]');
ylabel('z [m]');
set(gca,'FontSize',11);
set(gca,'FontName','Times New Roman');
set(gca,'Color','none');
set(gcf,'Color','w');

ii = 1;
for i=1:33:length(Time)
    gg=1;
    cla
    land = plot([0 100], [0 -100*tan(phi)],'k','linewidth',1);

    axis([(xa(i,1)+xa(i,4)+xb(i,1)+xb(i,4)+xc(i,1)+xc(i,4))/6-0.8,(xa(i,1)+xa(i,4)+xb(i,1)+xb(i,4)+xc(i,1)+xc(i,4))/6+0.8,(ya(i,1)+ya(i,4)+yb(i,1)+yb(i,4)+yc(i,1)+yc(i,4))/6-0.8,(ya(i,1)+ya(i,4)+yb(i,1)+yb(i,4)+yc(i,1)+yc(i,4))/6+0.8]);
  
    set(gcf,'Color','w');

    hexagonVertices = fun6(xa(gg*i,1), ya(gg*i,1), xa(gg*i,4), ya(gg*i,4));
    leg1=patch(hexagonVertices(:,1),hexagonVertices(:,2),'red');

    hexagonVertices = fun6(xb(gg*i,1), yb(gg*i,1), xb(gg*i,4), yb(gg*i,4));
    leg2=patch(hexagonVertices(:,1),hexagonVertices(:,2),'green');

    hexagonVertices = fun6(xc(gg*i,1), yc(gg*i,1), xc(gg*i,4), yc(gg*i,4));
    leg3=patch(hexagonVertices(:,1),hexagonVertices(:,2),'blue');

    title({'RTW',sprintf('Time = %.2f[s]',Time(i))},'Color','k');
    movie(ii) = getframe(gcf);
    ii = ii+1;
end

 %% movie save
% Video = VideoWriter('video5','MPEG-4');
% Video.Quality = 100;
% open(Video)
% writeVideo(Video,movie)
% close(Video)
