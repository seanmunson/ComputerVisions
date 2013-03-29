function main( )
%MAIN Summary of this function goes here
%   Detailed explanation goes here

A = imread('1.jpg');
Ap = importdata('1.txt');
B= imread('2.jpg');
Bp = importdata('2.txt');


MOV = multimorph(A,B,Ap,Bp,15);
end

