%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author : Hari Kumar Ganesh           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear all;clc;

img=imread('cameraman.tif');                    %storing the  image in variable img
matf=fspecial('gaussian',21,11);                %genearting the blur filter(normalising the matrix)

surf(matf);                                     %surface plotting the filter matrix

face=drawcircle('Center',[117,61],'Radius',21); %mapping the face in the image to a circle
BW= createMask(face,img);                       %creating a mask (over this area filter will be applied
filtered_img=roifilt2(matf,img,BW);             %applying the filter over region of interest

imshow(filtered_img);                           %displaying the filtered image
