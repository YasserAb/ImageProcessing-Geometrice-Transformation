%% Digital Image Processing Course 
% Prof. H. Pourreza
% Mini Project No 1-Section 3
% Landscape To 360 Degree Pictures Convert  

%FileName = 'D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\BWBar_Vertical.jpg';
%FileName = 'D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\BWBar_Horizontal.jpg';
FileName = 'D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\Im111_1570x250.jpg';
[Pathstr, FName, FExt]= fileparts(FileName);

SourcePic = imread(FileName);
imshow(SourcePic);

[SourcePic_Height, SourcePic_Width, Dimension] = size(SourcePic);


%Algorithem: Converting each line from Source Picture to a Circle in
%Destination. Source Picture Width would be Perimeter of circle of Destination and
%Radius of Destination calculated from Perimeter.

%Mapping SourcePic.Width to 2*pi*R 
DestPic_Radius = round (SourcePic_Width / (2 * pi));

DestinationPic = [];

%Correcting Height of Source Picture, according to R
SourcePic_Height = DestPic_Radius;
Teta_Step_Radian = 1 / SourcePic_Width;

DestinationPic_Center=[DestPic_Radius DestPic_Radius];


for RadiusIndex = DestPic_Radius:-1:1
   for  TetaIndex=Teta_Step_Radian:Teta_Step_Radian:2*pi
       
       %Finding Target Point (Circle Formula)
       DestX = DestinationPic_Center(1) + round(RadiusIndex * cos(TetaIndex));
       DestY = DestinationPic_Center(2) - round(RadiusIndex * sin(TetaIndex));
       
       %Finding Source Point
       SourceX = round(TetaIndex * DestPic_Radius); 
       SourceY = RadiusIndex;

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
        if (SourceY > RadiusIndex)
            SourceY = RadiusIndex;
        end

       DestinationPic(DestY+1 , DestX+1) = SourcePic(SourceY, SourceX);%because it starts from 0
   end
end


figure;
imshow(mat2gray(DestinationPic));
imwrite(mat2gray(DestinationPic), strcat(Pathstr,'\',FName,'_out','.jpg'), 'jpg');

