%{
    将ORL人脸数据库的pgm格式批量转换为bmp格式
%}
%袁高腾 2018年6月12日
clc;   
 clear all;
    for i=1:40
        for j=1:10
            image=imread(strcat('F:\Deeplearning\orl_faces\s',int2str(i),'\',int2str(j),'.pgm'));
            imwrite(image,strcat('F:\Deeplearning\orl_faces\s',int2str(i),'\',int2str(j),'.bmp'));
        end
        disp(strcat('s',int2str(i),'转换结束.'));
    end
disp('批量转换结束.');
%%
%读取训练集
DataFace=[];    
for i=1:40
    for j=1:10
      a=imread(strcat('F:\Deeplearning\orl_faces\s',num2str(i),'\',num2str(j),'.pgm'));
      a = imresize(a, [28 28]);
      b=a(1:28*28);                          % b是行矢量 1×N，其中N＝10304，提取顺序是先列后行，即从上到下，从左到右
      b=double(b);
      DataFace=[DataFace; b];             % allsamples 是一个M * N 矩阵，allsamples 中每一行数据代表一张图片，其中M＝400
    end
end

Labels=[];
for i=1:40
    for j=1:10
        Labels=[Labels;i];
    end
end

DataAndLabel=[DataFace, Labels];

Data=DataAndLabel(randperm(numel(DataAndLabel)/785),:);

Images=Data(:,1:784);
Labels=Data(:,785);
save('F:\\Deeplearning\\myData1.mat','Images','Labels');

%%
% DataFaceTrain=DataFaceTrain';
% ImagesTrain = reshape(DataFaceTrain, 112, 92, []);
% %读取测试集
% DataFaceTest=[];    
% for i=1:40
%     for j=9:10
%       a=imread(strcat('F:\Deeplearning\orl_faces\s',num2str(i),'\',num2str(j),'.pgm'));
%       b=a(1:112*92);                          % b是行矢量 1×N，其中N＝10304，提取顺序是先列后行，即从上到下，从左到右
%       b=double(b);
%       DataFaceTest=[DataFaceTest; b];             % allsamples 是一个M * N 矩阵，allsamples 中每一行数据代表一张图片，其中M＝400
%     end
% end
% DataFaceTest=DataFaceTest';
% ImagesTest = reshape(DataFaceTest, 112, 92, []);
% %%
% % y=ImagesTest(:,:,1);
% % figure;imshow(y,[]);
% %制作标签
% LabelsTrain=[];
% for i=1:40
%     for j=1:8
%         LabelsTrain=[LabelsTrain;i];
%     end
% end
% LabelsTest=[];
% for i=1:40
%     for j=1:2
%         LabelsTest=[LabelsTest;i];
%     end
% end
% save('F:\\Deeplearning\\Data.mat','ImagesTest','ImagesTrain','LabelsTest','LabelsTrain');
% a=Images(1,:);
% I= reshape(a, 112, 92);
% imshow(I,[])










