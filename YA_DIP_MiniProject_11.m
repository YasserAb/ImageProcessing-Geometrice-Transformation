%% Digital Image Processing Course 
% Prof. H. Pourreza
% Mini Project No #1
% 360 Degree Pictures Convert To Landscape ( stereographic projection.  “uncurl” the fisheye image)

FileName = 'D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\Im113.jpg';
%FileName = 'D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\Im112.png';
[Pathstr, FName, FExt]= fileparts(FileName);

SourcePic = imread(FileName);
imshow(SourcePic);

[SourcePic_Height, SourcePic_Width, Dimension] = size(SourcePic);

%Finding Center of Picture
CenterPoint =[fix(SourcePic_Width / 2) fix(SourcePic_Height / 2)];

%Finding Raduis of 360 Input Image + respect to non square pictures
Radius = min(CenterPoint);

%Finding Output Image Size
LandscapeImageHeight = Radius;
LandscapeImageWidth = fix(2 * pi * Radius);
LandscapeImage=[];

%Algorithem : Filling all points of Landscape Image with siutable points of
%360 degree Image by dividing 360 degree image into circles with different
%radius and mapping each circle to a line in Landscape image.

%Scrolling Landscape Image (Output)
for YIndex = LandscapeImageHeight:-1:1
    for XIndex = 1:LandscapeImageWidth
        
        %Finding Radius of desired circle related to the destination Line
        %by suitable Height
        %First Circle is the biggest
        TempRadius = YIndex; %Radius - YIndex;
        
        %Finding Teta on destination width Index (radian Base),for
        %finding desired point in departue
        %Negative in formule because of scrolling clockwise
        Teta =2 * pi * (-XIndex /  LandscapeImageWidth);
        
        SourceX = round(TempRadius * cos(Teta));
        SourceY = round(TempRadius * sin(Teta));
        
        %Adjusting to Source Image Cartesian to find Accurate Indices
        SourceX = SourceX + CenterPoint(1); %Radius; %CenterPointX - SourceX
        SourceY = CenterPoint(2) - SourceY; %Radius - SourceY; %CenterPointY - SourceY

        %Checking for not exceed the sourceImage bound
        if (SourceX < 1)
            SourceX = 1;
        end
        if (SourceX < (CenterPoint(1)-Radius))
            SourceX = CenterPoint(1)-Radius;
        end
        if (SourceX > (CenterPoint(1)+ Radius) )
            SourceX = CenterPoint(1)+ Radius;
        end
        if (SourceY < 1);
            SourceY = 1;
        end
        if (SourceY < (CenterPoint(2)-Radius));
            SourceY = CenterPoint(1)-Radius;
        end
        
        if (SourceY > (CenterPoint(2)+Radius))
            SourceY = CenterPoint(2)+Radius;
        end
            
        %Final Assignment
        LandscapeImage(YIndex, XIndex, :) = SourcePic(SourceY, SourceX, :);
        
    end %YIndex
end %XIndex
    


figure;
imshow(mat2gray(LandscapeImage));
imwrite(mat2gray(LandscapeImage), strcat(Pathstr,'\',FName,'_out','.jpg'), 'jpg');
