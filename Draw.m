 subplot(sqrt(num_plots),sqrt(num_plots),num_print);
 %printa input (pontos azuis)
 %printa neighborhood horizontal
 view(-30,10)
 view(3);
 for i=1:size(w,1)
     plot3(w(i,:,1),w(i,:,2),w(i,:,3),'Color','k','Marker','o','MarkerSize',max(5,min(20,70/sqrt(xdim*ydim))),'MarkerEdgeColor','k','MarkerFaceColor','k');hold on;
 end
 
 %printa neighborhood vertical
 for i=1:size(w,2)
     plot3(w(:,i,1),w(:,i,2),w(:,i,3),'Color','k','Marker','o','MarkerSize',max(5,min(20,70/sqrt(xdim*ydim))),'MarkerEdgeColor','k','MarkerFaceColor','k');hold on;
 end
 for i=1:size(w,1)
     for j=1:size(w,2)
         plot3(w(i,j,1),w(i,j,2),w(i,j,3),'Color','r','Marker','o','MarkerSize',max(5,min(20,70/sqrt(xdim*ydim))),'MarkerEdgeColor','k','MarkerFaceColor',squeeze(w(i,j,:)));hold on;
     end
 end
 %scatter3(input(:,1),input(:,2),input(:,3),0.00001,'filled','Marker','.','MarkerEdgeColor','b');hold on;
 box on;
 grid on;
 title(['iter = ',num2str(t),'   -   neighborhood = ', num2str(neigh)])
 plot3(0,0,0,'LineStyle','none','Color',[1,1,1],'Marker','.');hold on;
 plot3(1,1,1,'LineStyle','none','Color',[1,1,1],'Marker','.');hold on;
 view(80,20);