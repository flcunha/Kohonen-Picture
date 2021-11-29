fig=figure('visible','off');
if n==2
    plot(input(:,1),input(:,2),'LineStyle','none','Color',[0,0.5,1],'Marker','.');hold on;
    plot(0,0,'LineStyle','none','Color',[0,0.5,1],'Marker','.');hold on;
    plot(1,1,'LineStyle','none','Color',[0,0.5,1],'Marker','.');hold on;
    for i=1:size(w,1)
        plot(w(i,:,1),w(i,:,2),'Color','r','Marker','o','MarkerSize',70/sqrt(xdim*ydim),'MarkerEdgeColor','k','MarkerFaceColor','r');hold on;
    end
    for i=1:size(w,2)
        plot(w(:,i,1),w(:,i,2),'Color','r','Marker','o','MarkerSize',70/sqrt(xdim*ydim),'MarkerEdgeColor','k','MarkerFaceColor','r');hold on;
    end
    title(['iter = ',num2str(t),'   -   neighborhood = ', num2str(neigh)])
end
if n==3
    %printa input (pontos azuis)
    %printa neighborhood horizontal
    for i=1:size(w,1)
        plot3(w(i,:,1),w(i,:,2),w(i,:,3),'Color','r','Marker','o','MarkerSize',70/sqrt(xdim*ydim),'MarkerEdgeColor','k','MarkerFaceColor','r');hold on;
    end
    
    %printa neighborhood vertical
    for i=1:size(w,2)
        plot3(w(:,i,1),w(:,i,2),w(:,i,3),'Color','r','Marker','o','MarkerSize',70/sqrt(xdim*ydim),'MarkerEdgeColor','k','MarkerFaceColor','r');hold on;
    end
    scatter3(input(:,1),input(:,2),input(:,3),2,'filled','Marker','.','MarkerEdgeColor','b');
    box on;
    grid on;
    view(-30,10)    
    title(['iter = ',num2str(t),'   -   neighborhood = ', num2str(neigh)])
    plot3(0,0,0,'LineStyle','none','Color',[1,1,1],'Marker','.');hold on;
    plot3(1,1,1,'LineStyle','none','Color',[1,1,1],'Marker','.');hold on;
    view(view_param);
end

frame = getframe(fig);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
if num_print == 1
    imwrite(imind,cm,filename_gif,'gif', 'Loopcount',inf);
else
    imwrite(imind,cm,filename_gif,'gif','WriteMode','append');
end
