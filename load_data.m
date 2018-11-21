a = prnist([0:9],[1:40:1000]);

%%
train = a(2:2:250)
test = a(1:2:250);
%x = im_features(test,test,{'Area','Perimeter','Eccentricity'});

%test = seldat(test,[1:2]); % select the classes 3,6,9,12,15 and 18
%preproc = im_box([],0,1)*im_gray*im_rotate*im_resize([],[30 30])*im_box([],2,0); %Preprocess images
preproc = im_box([],0,1)*im_gray*im_rotate*im_resize([],[20 20])*im_box([],2,0);
figure(2); show(test*preproc);
showfigs
train = train*preproc;
test = test*preproc;
%%
feature_selected = {'Eccentricity','Area','Orientation','FilledArea'};
trained_features = im_features(train,train,feature_selected);
test_features = im_features(test,test,feature_selected);
scatterd(trained_features)

%%
c_1 = knnc(trained_features(:,1:2),5)*classc;
c_2 = knnc(trained_features(:,3:4),5)*classc;
%classifier = knnc(pr_dataset(train),5)
c_3 = knnc(pr_dataset(train),5)*classc;
c_4 = pr_dataset(train)*svc*classc;

combined_classifier = [c_3;c_4]*meanc
%%
%d_classifier*testc
%pr_dataset(test)*classifier*testc
t_1 = test_features(:,1:2)
t_2 =test_features(:,3:4)
t_3 = pr_dataset(test);
t_3*c_4*testc
t_2*c_2*testc
%[t_3 t_3]*combined_classifier*testc
