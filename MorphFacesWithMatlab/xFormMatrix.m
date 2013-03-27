function M = xFormMatrix( p1,p2,p3,p4,p5,p6)
 % given 6 points (3 correspondences) determine the transformation matrix.
 
 J = ones([3,3]);
 J(1,1) = p1(1);
 J(2,1) = p3(1);
 J(3,1) = p5(1);
 J(1,2) = p1(2);
 J(2,2) = p3(2);
 J(3,2) = p5(2);
 
 K = [p2(1), p4(1), p6(1)];
 L = [p2(2), p4(2), p6(2)];
 
 
 A = K/J;
 B = L/J;
 
 M = [A(1),A(2),A(3);B(1),B(2),B(3);0,0,1];
 
 

end

