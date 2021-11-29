w=zeros(xdim,ydim,n);
for x=1:xdim
    for y=1:ydim
        for j=1:n
            w(x,y,j)=0.5+(rand*2-1)/5;
%            w(x,y,j)=rand;
        end
    end
end

input=image_input;
UpdateParameters;

