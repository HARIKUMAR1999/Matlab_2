%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author : Hari Kumar Ganesh           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;clc;

img=imread('images/Bus_Color.jpg');                     %reading the image from source
img_resized=imresize(img,0.25);                         %resizing the image
%imshow(img_resized);                                    %display the resized image

img_y=rgb2ycbcr(img_resized);                           %converting image from rgb to ycbcr

%imshow(img_y);                                          %display the YCrBr image

matf=fspecial('gaussian',51,20);                        %genearting the blur filter(normalising the matrix)

face1=drawcircle('Center',[117,163],'Radius',50);       %mapping the first face in the image to a circle
BW1= createMask(face1,img_resized);                     %creating a mask (over this area filter will be applied)
face2=drawcircle('Center',[337,167],'Radius',60);       %mapping the Second face in the image to a circle
BW2= createMask(face2,img_resized);                     %creating a mask (over this area filter will be applied
face3=drawcircle('Center',[415,167],'Radius',25);       %mapping the third face in the image to a circle
BW3= createMask(face3,img_resized);                     %creating a mask (over this area filter will be applied

A=imadd(BW1,BW2);                                       %combining mask 1 and mask 2
C=imbinarize(A);                                        %binarizing the combined mask so it can be added to third mask
B=imadd(C,BW3);                                         %combining the third mask

img_filt1(:,:,1)=roifilt2(matf,img_y(:,:,1),B);         %appyying filter to faces
img_filt1(:,:,2)=roifilt2(matf,img_y(:,:,2),B);         %applying filter to faces
img_filt1(:,:,3)=roifilt2(matf,img_y(:,:,3),B);         %applying filter to faces

final_img=ycbcr2rgb(img_filt1);                         %converting the ycbcr image to rgb (the final result)
imshow(final_img);                                      %displaying the final filterd image
