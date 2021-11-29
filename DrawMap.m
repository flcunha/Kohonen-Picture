f1=figure;
for i=1:size(w,1)

    for j=1:size(w,2)
        fill([(i-1)*5,(i-1)*5,(i)*5,(i)*5],[(j-1)*5,(j)*5,(j)*5,(j-1)*5],transpose(squeeze(w(i,j,:))));hold on;
    end
end
saveas(f1,[imagename,'_',num2str(xdim),'x',num2str(ydim),'_Map.jpg'])