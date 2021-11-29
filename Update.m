permutation=randperm(num_patterns);
for a=1:num_patterns
    i=permutation(a);    
    win_x=0;
    win_y=0;
    dmin=inf;
    for x=1:xdim
        for y=1:ydim
            d=0;
            for j=1:n
                d=d+(input(i,j)-w(x,y,j))^2;
            end
            if dmin>d
                win_x=x;
                win_y=y;
                dmin=d;
            end
        end
    end    
    for x=max(win_x-neigh,1):min(win_x+neigh,size(w,1))
        for y=max(win_y-neigh,1):min(win_y+neigh,size(w,2))
            for j=1:n
                w(x,y,j)=w(x,y,j)+alpha*(input(i,j)-w(x,y,j));
            end
        end
    end

end

