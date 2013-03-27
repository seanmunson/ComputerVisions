function  plotpoints( Pointset, Img)
%PLOTPOINTS Summary of this function goes here
%   shows a picture, its data points and the Delaunay triangulation
    clf();
    n= size(Pointset(:,1));
    n = squeeze(n);
    S = size(Img);
    max_y = S(1);
    max_x = S(2);
    corners = [1,1;1,max_y;max_x,1;max_x,max_y;1,max_y/3;1,max_y*2/3;max_x,max_y/3;max_x,max_y*2/3;max_x/3,1;max_x *2/3,1;max_x/3,max_y;max_x *2/3,max_y];
    T = size(corners);
    for k=1:T(1)
        Pointset(n+k,1) = corners(k,1);
        Pointset(n+k,2) = corners(k,2);
    end
    
    
    D = delaunay(Pointset);
    
    
    imshow(Img);
    hold on;
    for i=1:n
        plot(Pointset(i,1),Pointset(i,2),'-o');
    end
    t = size(D);
    for j=1:t(1)
        
        ax = Pointset(D(j,1),1);
        ay = Pointset(D(j,1),2);
        
        bx = Pointset(D(j,2),1);
        by = Pointset(D(j,2),2);
        
        cx = Pointset(D(j,3),1);
        cy = Pointset(D(j,3),2);

        line([ax,bx,cx,ax],[ay,by,cy,ay]);
        
    end
    


end

