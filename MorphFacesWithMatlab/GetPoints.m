function C = GetPoints(  )
%GETPOINTS Summary of this function goes here
%   Detailed explanation goes here
I = imread('wide.jpg');
figure(1);
imshow(I);
C = ginput(43);

end

