%{
    ��ORL�������ݿ��pgm��ʽ����ת��Ϊbmp��ʽ
%}
%Ԭ���� 2018��6��12��
clc;   
 clear all;
    for i=1:40
        for j=1:10
            image=imread(strcat('F:\Deeplearning\orl_faces\s',int2str(i),'\',int2str(j),'.pgm'));
            imwrite(image,strcat('F:\Deeplearning\orl_faces\s',int2str(i),'\',int2str(j),'.bmp'));
        end
        disp(strcat('s',int2str(i),'ת������.'));
    end
disp('����ת������.');
%%
%��ȡѵ����
DataFace=[];    
for i=1:40
    for j=1:10
      a=imread(strcat('F:\Deeplearning\orl_faces\s',num2str(i),'\',num2str(j),'.pgm'));
      a = imresize(a, [28 28]);
      b=a(1:28*28);                          % b����ʸ�� 1��N������N��10304����ȡ˳�������к��У������ϵ��£�������
      b=double(b);
      DataFace=[DataFace; b];             % allsamples ��һ��M * N ����allsamples ��ÿһ�����ݴ���һ��ͼƬ������M��400
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
% %��ȡ���Լ�
% DataFaceTest=[];    
% for i=1:40
%     for j=9:10
%       a=imread(strcat('F:\Deeplearning\orl_faces\s',num2str(i),'\',num2str(j),'.pgm'));
%       b=a(1:112*92);                          % b����ʸ�� 1��N������N��10304����ȡ˳�������к��У������ϵ��£�������
%       b=double(b);
%       DataFaceTest=[DataFaceTest; b];             % allsamples ��һ��M * N ����allsamples ��ÿһ�����ݴ���һ��ͼƬ������M��400
%     end
% end
% DataFaceTest=DataFaceTest';
% ImagesTest = reshape(DataFaceTest, 112, 92, []);
% %%
% % y=ImagesTest(:,:,1);
% % figure;imshow(y,[]);
% %������ǩ
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










