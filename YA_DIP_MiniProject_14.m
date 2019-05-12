%% Digital Image Processing Course 
% Prof. H. Pourreza
% Mini Project No 1-Section 4
% Scaling Picture to 250x1570

Desired_Width = 1570;
Desired_Height = 250;

FileName = 'D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\Im111.tif';
[Pathstr, FName, FExt]= fileparts(FileName);

SourcePic = imread(FileName);
imshow(SourcePic);

[SourcePic_Height, SourcePic_Width, Dimension] = size(SourcePic);


%Finding Scale Factors
Cx = Desired_Width / SourcePic_Width;
Cy = Desired_Height / SourcePic_Height;
DestinationPic=[];

for YIndex = 1:Desired_Height
   for  XIndex=1:Desired_Width
       
       %Finding Source Point
       SourceX = round(XIndex / Cx); 
       SourceY = round(YIndex / Cy);

       %Checking for not exceed the sourceImage bound
        if (SourceX < 1)
            SourceX = 1;
        end
        if (SourceX > SourcePic_Width)
            SourceX = SourcePic_Width;
        end
        if (SourceY < 1);
            SourceY = 1;
        end
        if (SourceY > SourcePic_Height)
            SourceY = SourcePic_Height;
        end

       DestinationPic(YIndex , XIndex) = SourcePic(SourceY, SourceX);
   end
end


figure;
imshow(mat2gray(DestinationPic));
imwrite(mat2gray(DestinationPic), strcat(Pathstr,'\',FName,'_',int2str(Desired_Width),'x', int2str(Desired_Height),'.jpg'), 'jpg');

