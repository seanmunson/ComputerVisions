function morphed_im = morph(im1, im2, im1_pts, im2_pts, tri, warp_frac, dissolve_frac);

    warp_img = zeros(size(im1));
    diff_pts = im2_pts-im1_pts;
    diff_pts = diff_pts * warp_frac;
    warp_pts = im1_pts + diff_pts;
    
    % the x,y -> 1,2 on im1, 3,4 on im2
    warp_map=zeros([size(im1),4]);
    

    tcount = size(tri);
    for t=1:tcount;
    
        p1 = [im1_pts(tri(t,1),:),1];
        p2 = [warp_pts(tri(t,1),:),1];
        p3 = [im1_pts(tri(t,2),:),1];
        p4 = [warp_pts(tri(t,2),:),1];
        p5 = [im1_pts(tri(t,3),:),1];
        p6 = [warp_pts(tri(t,3),:),1];


        M = xFormMatrix(p2,p1,p4,p3,p6,p5); % build transform matrix from 
        B = boundingBox(p2,p4,p6);  % get bounding box in warped image 
        
        for dx =B(1,1) : B(2,1)
            for dy = B(1,2) : B(2,2)
                
                if (inTriangle(p2,p4,p6,[dx,dy]) ==1)
                   C= M *[dx,dy,1]; 
                   warp_img(dx,dy) = im1(floor(C(1)),floor(C(2)));
                end
            end
        end
    end
    
    
    
    morphed_im = warp_img;
    
    % blends the two images; 
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

