function [ IN ] = inTriangle( A,B,C, p)

    ab = cross((A-B), (A-p));
    bc = cross((B-C), (B-p));
    ca = cross((C-A), (C-p));
    
    IN=0;
    
    v=0;
    if ab(3) >0
        v=v+1;
    else
        v=v-1;
    end
    if bc(3)>0
        v=v+1;
    else
        v=v-1;
    end
    if ca(3)  >0
        v=v+1;
    else
        v=v-1;
    end

    if (abs(v)==3)
        IN=1;
    end
end

