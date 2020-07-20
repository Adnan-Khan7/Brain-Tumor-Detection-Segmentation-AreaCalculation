    %% CEP:Digital Image Processing
    %% Title: Brain Tumor Detection
    %% Project's Instructor: Dr. Shoaib Azmat
    %% Group Members: Adnan Khan & Faheem Nawaz
    %%                     Code
    %%
    clear all;
    close all;
    clc;
    %%                    Input Image
    %%
    display('Please select the MRI image from poped up menu')
    [I,path]=uigetfile('*.jpg','select a input image');
    str=strcat(path,I);
    s=imread(str);
%%              Thresholding Using Otsu's Method
%%

%     imshow(s)
   bw=ott(s)
%     figure
%     imshow(bw)
    
%%              Thresholding Using Basic Global Method
%%
% if size(s,3)==3
%     s=rgb2gray(s);
% end
% 
% [r1 c1]=size(s)
% t0=50;
% th=t0+((max(s(:))+min(s(:)))./2);
% for i=1:r1
%     for j=1:c1
%         if(s(i,j)>th)
%             bw(i,j)=1;
%         else
%             bw(i,j)=0;
%         end
%     end
% end
%%                  label= labels the 8 connected area
%%
label1=bwlabel(bw,8);
%[r, c]=find(label==3)
%%               Finding measurements for 3 properties of label
%%
stats1=regionprops(label1,'Solidity','Area','BoundingBox');
%%               Solidity= Area/ConvexArea
%%
density1=[stats1.Solidity];
%%       Area=Actual number of pixels in the region, returned as a scalar
%%
area=[stats1.Area];
%%      Extracting the high dense area where the tumor lies
%%
high_dense_area1=density1>0.5;
max_area1=max(area(high_dense_area1));
tumor_label1=find(area==max_area1);
%% Finding the matrix where elements of label are in set of tumor_label
%%
tumor11=ismember(label1,tumor_label1);
%% wantedBox=Smallest rectangle containing the region, returned as a
%% 1-by-Q*2 vector, where Q is the number of image dimensions
box1 = stats1(tumor_label1);
wantedBox = box1.BoundingBox;
hold on;
%% Create rectangle to the current axis,
%% wantedBox is the 5 element vector
rectangle('Position',wantedBox,'EdgeColor','y');

% xMin = ceil(BoundingBox(1))
% xMax = xMin + BoundingBox(3) - 1
% yMin = ceil(BoundingBox(2))
% yMax = yMin + BoundingBox(4) - 1
hold off;
%% Finding area of rectangle
Area111 = abs((wantedBox(1)-wantedBox(2)))* abs((wantedBox(3)-wantedBox(4)))/10^3;
Ar = num2str(Area111);
disp ('Area of tumour = ')
disp (Area111)
%% Dilation
%%
se=strel('square',5);
tumor11=imdilate(tumor11,se);

%%
if max_area1>100
    %go to plotting
else
    h = msgbox('No Tumor!!','status');
    return;
end

%% Plotting together
%% 
figure(2);
subplot(1,3,1);
imshow(s,[]);
title('Brain');
subplot(1,3,2);
imshow(tumor11);
title('Tumor Alone');
[B,L]=bwboundaries(tumor11,'noholes');
subplot(1,3,3);
imshow(s,[]);
hold on
for i=1:length(B)
    plot(B{i}(:,2),B{i}(:,1), 'y' ,'linewidth',1.45);
    title('Detected Tumor')
end
hold off;