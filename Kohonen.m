clear all;
close all;
for tot_colors=1:5
    for image_num=[4,8,9]
        %import image
        close all;
        imagename=['Image',num2str(image_num)];
        image=imread([imagename,'.jpg']);
        image=double(image);
        %image=image(:,:,);
        image=image/max(max(max(image)));
        %image2=-image+1;
        image_input=reshape(image,[size(image,1)*size(image,2),3]);
        %Define constants
        n  = 3;
        num_colors=2^(2*tot_colors);
        xdim = sqrt(num_colors);
        ydim = sqrt(num_colors);
        num_patterns=size(image_input,1);
        p=0.85;
        tmax=50;
        num_plots=3^2;
        draw_t=floor([0,5,10,20,40,70,100,150,200]/200*tmax);
        num_print=0;
        view_param=2;
        gif=0;
        gif_1by1=30;
        gif_after=10;
        filename_image = [imagename,'_',num2str(xdim),'x',num2str(ydim),'_featuremap.jpg'];
        filename_imagenew = [imagename,'_',num2str(xdim),'x',num2str(ydim),'.jpg'];
        
        
        t=1;
        InitParameters;
        if not(gif)
            fig=figure('Position', [200 200 1600 1100]);
            if (isempty(draw_t) || ismember(0,draw_t))
                t=0;
                num_print=1;
                Draw;
            end
        end
        t=1;
        while t<tmax
            Update;
            UpdateParameters;
            if gif && (t<=gif_1by1 || mod(t,gif_after)==0)
                num_print=num_print+1;
                DrawGif;
            else
                if ((isempty(draw_t) && (t==1 || ((num_print-1)*tmax/(num_plots-2)>=t-1 && (num_print-1)*tmax/(num_plots-2)<t))) || ismember(t,draw_t))
                    num_print=num_print+1;
                    Draw;
                end
            end
            t=t+1;
        end
        num_print=num_print+1;
        if gif
            DrawGif;
        else
            Draw;
            saveas(fig,filename_image);
        end
        DrawImages;
        figure;
        subplot(1,2,1);
        imshow(image);
        subplot(1,2,2);
        imshow(imagenew);
        imwrite(imagenew,filename_imagenew,'JPEG');
        DrawMap;
    end
end
