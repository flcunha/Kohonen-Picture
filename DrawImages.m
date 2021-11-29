imagenew=zeros(size(image,1),size(image,2)*2,size(image,3));

imagenew(:,1:size(image,2),:)=image;
for i=1:size(image,1)
    for a=size(image,2)+1:size(imagenew,2)
        j=a-size(image,2);
        win_x=0;
        win_y=0;
        dmin=inf;
        for x=1:xdim
            for y=1:ydim
                d=0;
                for c=1:n
                    d=d+(image(i,j,c)-w(x,y,c))^2;
                end
                if dmin>d
                    win_x=x;
                    win_y=y;
                    dmin=d;
                end
            end
        end
        imagenew(i,a,:)=w(win_x,win_y,:);
    end
end


