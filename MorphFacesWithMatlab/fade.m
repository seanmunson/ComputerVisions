function [ morphed_im ] = fade( im1, im2, im1_pts, im2_pts, tri, warp_frac, dissolve_frac )
 
    [height,width,c] = size(im2);
    morphed_im=zeros([height,width,c]);
    for y=1:height
        for x=1:width
            for z=1:c
                alpha = im1(y,x,z)* dissolve_frac ;
                beta = im2(y,x,z)* (1-dissolve_frac);
                morphed_im(y,x,z)=alpha+beta;
            end 
        end
    end
end

