%%
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

n = 100; %resolution
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
theta=0:0.01:2*pi;    
figure(1)
hold on;
plot0 = plot([0 100], [0 -100*tan(phi)],'k','linewidth',1);

plot1 = plot([xa(1,1) xa(1,4)],[ya(1,1) ya(1,4)],'k','linewidth',1);

plot2 = plot([xb(1,1) xb(1,4)],[yb(1,1) yb(1,4)],'k','linewidth',1);

plot3 = plot([xc(1,1) xc(1,4)],[yc(1,1) yc(1,4)],'k','linewidth',1);



axis equal;
axis xy;
xlabel('x [m]');
ylabel('z [m]');
set(gca,'FontName','Times New Roman');
set(gca,'Color','none');
set(gcf,'Color','w');
    % set(gcf,'unit','centimeters','position',[3 3 34 10])
    set(gca, 'fontsize', 18)

for i=1000:80:length(Time)
    axis([10 11 -1.7 -0.8]);


plot1 = plot([xa(i,1) xa(i,4)],[ya(i,1) ya(i,4)],'color','#05B9E2','linewidth',1);

plot2 = plot([xb(i,1) xb(i,4)],[yb(i,1) yb(i,4)],'color','#32B897','linewidth',1);

plot3 = plot([xc(i,1) xc(i,4)],[yc(i,1) yc(i,4)],'color','#F27970','linewidth',1);

end
set(gca,'looseInset',[0 0 0.01 0.01])
box on
 %% movie save
% Video = VideoWriter('wsw0.avi');
% Video.Quality = 100;
% open(Video)
% writeVideo(Video,movie)
% close(Video)
