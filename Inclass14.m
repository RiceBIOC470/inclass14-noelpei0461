%Inclass 14

%Work with the image stemcells_dapi.tif in this folder

% (1) Make a binary mask by thresholding as best you can
file='stemcells_dapi.tif';
img=imread(file);
img1=im2double(img);
imgbright=uint16((2^16-1)*(img1/max(max(img1))));
imgbright1=im2bw(imgbright,0.5);
imshow(imgbright1,[])
% (2) Try to separate touching objects using watershed. Use two different
% ways to define the basins. (A) With erosion of the mask (B) with a
% distance transform. Which works better in this case?
ime=imerode(imgbright1,strel('disk',1));
L1=watershed(ime);
rgb=label2rgb(L1,'jet',[.5 .5 .5]);
figure
imshow(rgb,'InitialMagnification','fit')
%the watershed of erosion basin.
dist=bwdist(imgbright1);
dist=-dist;
dist(imgbright1)=-Inf;
L2=watershed(dist);
rgb=label2rgb(L2,'jet',[.5 .5 .5]);
figure
imshow(rgb,'InitialMagnification','fit')
%the watershed of distance transform

% Apparently, the distance transform provides a better graph for the
% watershed. That is because the range minimum of erosion is 1 and inthis
% case, it is too large.
