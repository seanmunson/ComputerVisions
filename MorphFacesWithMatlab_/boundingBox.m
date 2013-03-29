function  B  = boundingBox( P1, P2, P3 )
% determines the bounding box for a triangle
% returns [Minx, Miny, Maxx, Maxy]
B = [P1(1),P1(2);P1(1),P1(2)];

% Xvalues : 
if (P2(1) < B(1,1))
        B(1,1) = P2(1);
else
    if(P2(1) > B(2,1))
        B(2,1) = P2(1);
    end 
end

if (P3(1) < B(1,1))
        B(1,1) = P3(1);
else
    if(P3(1) > B(2,1))
        B(2,1) = P3(1);
    end 
end
% Yvalues : 

if (P2(2) < B(1,2))
        B(1,2) = P2(2);
else
    if(P2(2) > B(2,2))
        B(2,2) = P2(2);
    end 
end

if (P3(2) < B(1,2))
        B(1,2) = P3(2);
else
    if(P3(2) > B(2,2))
        B(2,2) = P3(2);
    end 
end

B=floor(B);


end

