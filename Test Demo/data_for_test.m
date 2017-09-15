function [test_img_Flevoland] = data_for_test(train_data,T11L,T12L,T13L,T22L,T23L,T33L,nwin)
%*****************************************************************
%Description: data standardization for train data and test image
% 
%*****************************************************************
T =  train_data;                   
t11 = T(:,:,1,:);
t12 = T(:,:,2,:);
t13 = T(:,:,3,:);
t22 = T(:,:,4,:);
t23 = T(:,:,5,:);
t33 = T(:,:,6,:);
[m,n,p,q] = size(t11);

T11_ave = sum(sum(sum(sum(t11))))/(m*n*p*q);                               
T12_ave = sum(sum(sum(sum(t12))))/(m*n*p*q);
T13_ave = sum(sum(sum(sum(t13))))/(m*n*p*q);
T22_ave = sum(sum(sum(sum(t22))))/(m*n*p*q);
T23_ave = sum(sum(sum(sum(t23))))/(m*n*p*q);
T33_ave = sum(sum(sum(sum(t33))))/(m*n*p*q);

T11_std = sqrt((sum(sum(sum(sum((t11-T11_ave).^2)))))/(m*n*p*q));
T12_std = sqrt((sum(sum(sum(sum((t12-T12_ave).*conj(t12-T12_ave))))))/(m*n*p*q));         
T13_std = sqrt((sum(sum(sum(sum((t13-T13_ave).*conj(t13-T13_ave))))))/(m*n*p*q));
T22_std = sqrt((sum(sum(sum(sum((t22-T22_ave).^2)))))/(m*n*p*q));
T23_std = sqrt((sum(sum(sum(sum((t23-T23_ave).*conj(t23-T23_ave))))))/(m*n*p*q));
T33_std = sqrt((sum(sum(sum(sum((t33-T33_ave).^2)))))/(m*n*p*q));

TT11 = (t11-T11_ave)/T11_std;
TT12 = (t12-T12_ave)/T12_std;
TT13 = (t13-T13_ave)/T13_std;
TT22 = (t22-T22_ave)/T22_std;
TT23 = (t23-T23_ave)/T23_std;
TT33 = (t33-T33_ave)/T33_std;

train_data_s(:,:,1,:) = TT11;
train_data_s(:,:,2,:) = TT12;
train_data_s(:,:,3,:) = TT13;
train_data_s(:,:,4,:) = TT22;
train_data_s(:,:,5,:) = TT23;
train_data_s(:,:,6,:) = TT33;

%% normalize the test image
T11_all = (T11L-T11_ave)/T11_std; T12_all = (T12L-T12_ave)/T12_std; T13_all = (T13L-T13_ave)/T13_std; 
T22_all = (T22L-T22_ave)/T22_std; T23_all = (T23L-T23_ave)/T23_std; T33_all = (T33L-T33_ave)/T33_std;
[row,col] = size(T11L);

k=1;
for i=1:3:row-nwin                % step:3
    for j=1:3:col-nwin
       test_img_Flevoland(:,:,1,k) = T11_all(i:i+nwin-1,j:j+nwin-1);
       test_img_Flevoland(:,:,2,k) = T12_all(i:i+nwin-1,j:j+nwin-1);
       test_img_Flevoland(:,:,3,k) = T13_all(i:i+nwin-1,j:j+nwin-1); 
       test_img_Flevoland(:,:,4,k) = T22_all(i:i+nwin-1,j:j+nwin-1);
       test_img_Flevoland(:,:,5,k) = T23_all(i:i+nwin-1,j:j+nwin-1);
       test_img_Flevoland(:,:,6,k) = T33_all(i:i+nwin-1,j:j+nwin-1);
       k=k+1;
    end
end

end



