function [ FrameSet ] = multimorph( Img1, Img2, Pts1,Pts2, NumberofFrames )

    Pointset = Pts1;
    n= size(Pointset(:,1));
    n = squeeze(n);
    S = size(Img1);
    max_y = S(1);
    max_x = S(2);
    
    % Append corner & side points to the point set to 
    % ensure that the the whole of the image is triangu
    corners = [1,1;1,max_y;max_x,1;max_x,max_y;1,max_y/3;1,max_y*2/3;max_x,max_y/3;max_x,max_y*2/3;max_x/3,1;max_x *2/3,1;max_x/3,max_y;max_x *2/3,max_y];
    c = size(corners);
    
    for i = 1:c(1)
        Pts1(n+i,1) = corners(i,1);
        Pts1(n+i,2) = corners(i,2);
        Pts2(n+i,1) = corners(i,1);
        Pts2(n+i,2) = corners(i,2);
    end
    MedianPoints = (Pts1 + Pts2) * .5;
    DT = delaunay(MedianPoints);
    FrameSet = zeros([NumberofFrames,S]);
    ep = 1/NumberofFrames;
    
    for i=1:NumberofFrames
        Frameset(i,:,:) =  morph(Img1, Img2, Pts1, Pts2, DT, ep*i, ep*i);
    end
    
    

end

