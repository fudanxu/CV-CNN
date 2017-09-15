%*****************************************************************
%Description: classification result based on CV-CNN 
%input: test result from CV_CNN--test_img_oo.mat
%output: classification result:class_img.mat
%        classification image: ImageRGB.mat
%Note: This code is taking Flevoland dataset as an example.
%*****************************************************************
function [class_img,ImageRGB] = test_imaging(test_img_oo)
test = test_img_oo;
[~,col] = size(test);
B = zeros(1,col);
G = zeros(1,col);
R = zeros(1,col);
class = zeros(1,col);
for i = 1:col
    m = max(real(test(:,i))+imag(test(:,i)));
    pos = find( real(test(:,i))+imag(test(:,i)) == m );
    % color is corresponding to the legend
    if pos == 1                     % Potato
        R(:,i) = 255/255;
        G(:,i) = 128/255;
        B(:,i) = 0/255;
        class(1,i) = 1;
    elseif  pos == 2                % Fruit
        R(:,i) = 138/255;
        G(:,i) = 42/255;
        B(:,i) = 116/255;
        class(1,i) = 2;
    elseif pos == 3                 % Oats
        R(:,i) = 0/255;
        G(:,i) = 0/255;
        B(:,i) = 255/255;
        class(1,i) = 3;
    elseif pos == 4                 % Beet
        R(:,i) = 255/255;
        G(:,i) = 0/255;
        B(:,i) = 0/255;
        class(1,i) = 4;
    elseif pos == 5                 % Barley
        R(:,i) = 120/255;
        G(:,i) = 178/255;
        B(:,i) = 215/255;
        class(1,i) = 5;
    elseif pos == 6                 % Onions
        R(:,i) = 0/255;
        G(:,i) = 102/255;
        B(:,i) = 255/255;
        class(1,i) = 6;
    elseif pos == 7                 % Wheats
        R(:,i) = 251/255;
        G(:,i) = 232/255;
        B(:,i) = 45/255;
        class(1,i) = 7;
    elseif pos == 8                 % Beans
        R(:,i) = 0/255;
        G(:,i) = 255/255;
        B(:,i) = 0/255;
        class(1,i) = 8;
    elseif pos == 9                 % Peas 
        R(:,i) = 204/255;
        G(:,i) = 102/255;
        B(:,i) = 255/255;
        class(1,i) = 9; 
    elseif pos == 10                % Maize
        R(:,i) = 0/255; 
        G(:,i) = 204/255;
        B(:,i) = 102/255;
        class(1,i) = 10;
    elseif pos == 11                % Flax
        R(:,i) = 204/255;
        G(:,i) = 255/255;
        B(:,i) = 204/255;  
        class(1,i) = 11;
    elseif pos == 12                % Rapeseed
        R(:,i) = 204/255;
        G(:,i) = 1/255;
        B(:,i) = 102/255;
        class(1,i) = 12;
    elseif pos == 13                % Grass
         R(:,i) = 255/255;
         G(:,i) = 204/255;
         B(:,i) = 204/255;
         class(1,i) = 13;
    elseif pos == 14                % Luceme
        R(:,i) = 102/255;
        G(:,i) = 0/255;
        B(:,i) = 204/255;
        class(1,i) = 14;
    end
end

row1 = ceil((1024-12)/3); col1 = ceil((1020-12)/3);
R = reshape(R,row1,col1);
G = reshape(G,row1,col1);
B = reshape(B,row1,col1);
class = reshape(class,row1,col1);
m=1;n=1;
for i=1:size(R,1)
    for j=1:size(R,2)
        R_ex(m:m+2,n:n+2) = repmat(R(i,j),3,3);     % 3:sampling step, 2 = 3-1
        G_ex(m:m+2,n:n+2) = repmat(G(i,j),3,3);
        B_ex(m:m+2,n:n+2) = repmat(B(i,j),3,3);
        class_img(m:m+2,n:n+2) = repmat(class(i,j),3,3);
        n = n+3;
    end
    n=1;
    m = m+3;
end
class_img = class_img';
ImageRGB(:,:,1) = R_ex';
ImageRGB(:,:,2) = G_ex';
ImageRGB(:,:,3) = B_ex';
figure
imshow(ImageRGB); title('Classification Image');

%% classification reslut overlaid ground truth area 
load label.mat;

[row2,col2,~] = size(ImageRGB);
mask = zeros(row2,col2);
for i = 1:row2
    for j = 1:col2
        if (label(i,j) ~= 0)
            mask(i,j) = 1;
        else 
            mask(i,j) = 0;
        end
    end
end

R = mask.*ImageRGB(:,:,1);
G = mask.*ImageRGB(:,:,2);
B = mask.*ImageRGB(:,:,3);

ImageRGB_overlaid(:,:,1) = R;
ImageRGB_overlaid(:,:,2) = G;
ImageRGB_overlaid(:,:,3) = B;
figure
imshow(ImageRGB_overlaid); title('Classification Image overlaid Ground Truth');

end

