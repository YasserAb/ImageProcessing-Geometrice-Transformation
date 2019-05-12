%% Digital Image Processing Course 
% Prof. H. Pourreza
% Mini Project No #1 - Section 2
% building Vertical and Horzontal BW Bars

OutImageWidth = 1570;
OutImageHeight = 250;
OutImage = [];

%Building Vertical BW Bars
CColor = 0;
RColor = 0;
for YIndex= 0:OutImageHeight-1
    CColor = RColor;
    for XIndex = 0:OutImageWidth-1
        if (rem(XIndex, 10) == 0)
            if (CColor == 0) 
                CColor = 255;
            else
                CColor = 0;
            end
        end
       OutImage(YIndex+1, XIndex+1) = CColor; 
    end %XIndex
end %YIndex

figure;
imshow(mat2gray(OutImage));
imwrite(mat2gray(OutImage), strcat('D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\BWBar','_Vertical','.jpg'), 'jpg');

%Building Horizontal BW Bars
OutImage = [];
CColor = 0;
RColor = 0;
for YIndex= 0:OutImageHeight-1
    %CColor = RColor;
        if (rem(YIndex, 10) == 0)
            if (CColor == 0) 
                CColor = 255;
            else
                CColor = 0;
            end
        end

    for XIndex = 0:OutImageWidth-1
       OutImage(YIndex+1, XIndex+1) = CColor; 
    end %XIndex
end %YIndex

figure;
imshow(mat2gray(OutImage));
imwrite(mat2gray(OutImage), strcat('D:\Yasser\University\Courses\Digital Image Processing\MiniProjects\diphmwrk\11\BWBar','_Horizontal','.jpg'), 'jpg');
