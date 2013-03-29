function v = getTriangleId(tri, tri_count, warp_pts,x,y)
    
    v=0;
    for i=1:tri_count
        inTr = intriangle([warp_pts(tri(i,1),:),0], [warp_pts(tri(i,2),:),0],[warp_pts(tri(i,3),:),0],[x,y,0]);
        if(inTr==1)
            v=i;
        end    
    end

end

