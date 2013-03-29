function morphed_im = twist(im1,  im1_pts, im2_pts, tri, warp_frac);

% returns im1 twisted to conform to triangualtion in imp2_pts by warp_frac


warp_pts_diff= (im2_pts - im1_pts)* warp_frac;

morphed_im = zeros(size(im1));

tSize= size(tri);

for t=1:tSize(1);

    input_points =[im2_pts(tri(t,1),1),im2_pts(tri(t,1),2); im2_pts(tri(t,2),1),im2_pts(tri(t,2),2); im2_pts(tri(t,3),1), im2_pts(tri(t,3),2)];
    base_points =  [im1_pts(tri(t,1),1),im1_pts(tri(t,1),2); im1_pts(tri(t,2),1),im1_pts(tri(t,2),2); im1_pts(tri(t,3),1), im1_pts(tri(t,3),2)];
    X = cp2tform(input_points,base_points,'affine');
    I = imtransform(im1,X);
    B = boundingBox(input_points(1,:),input_points(2,:),input_points(3,:));
    for dx =B(1,1):B(1,2)
        for dy =B(2,1):B(2,2)
            if (inTriangle([input_points(1,:),0],[input_points(2,:),0],[input_points(3,:),0],[dx,dy,0])==t)
                
                morphed_im(dx,dy) = I(dx,dy);
            end 
        end
    end
end;


    



end

