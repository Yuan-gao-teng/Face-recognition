clear ;

load('myData1.mat');
Images=Images';
Images= mapminmax(Images); 
Images = reshape(Images, 28, 28, []);
% Labels=Labels;

% a=Images(:,:,1);
% rng(1);
% Learning
%
% W1 = 0.003*randn([31 31 40]);
% W5 = 0.002*randn(100, 50840) ;
% Wo = 0.002*randn(40, 100);

W1 = 1e-2*randn([9 9 20]);
W5 = (2*rand(100, 2000) - 1) * sqrt(6) / sqrt(360 + 2000);
Wo = (2*rand( 40,  100) - 1) * sqrt(6) / sqrt( 40 +  100);

X = Images(:, :, 1:350);
D = Labels(1:350);
   
for epoch = 1:15
  epoch
  [W1, W5, Wo] = MnistConv(W1, W5, Wo, X, D);
end
% save('F:\\Deeplearning\\netWork2.mat','epoch','W1','W5','Wo');