% Read in image, convert to black and white - Link comes from your image posted here
I = imread('af91.png');
%imshow(I);
%imBW = im2bw(im, 0.3); %// Specify manual threshold of 0.3

% Invert intensities and fill in holes
%imBWFilled = imfill(~imBW, 'holes');

% Count how many unique objects there are
%[L,num] = bwlabel(imBWFilled);

% Show final image and display number of objects counted in the title
%imshow(imBWFilled);
%title(['Total number of objects: ' num2str(num)]);
BW = im2bw(I);
%outputImage = xor(BW , bwareaopen(BW , 800)); 
                 % BW being the binary image
                 % it will discard objects with area greater then threshArea
 J = imcomplement(BW);
 BW2 =  xor(BW , bwareaopen(J, 500));%2800
imshow(BW2)
B = bwboundaries(BW2);


text(80,10,strcat('\color{red}Objects Found:',num2str(length(B))))
hold on

for k = 1:length(B)
boundary = B{k};
plot(boundary(:,2), boundary(:,1), 'r', 'LineWidth', 0.1)
end


%LB = 10;
%UB = 30;

%Iout = xor(bwareaopen(I,LB),  bwareaopen(I,UB));
%figure, imshow(Iout);