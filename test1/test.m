clear all
%%
source_path = 'file_1\depth\';
re_path = 'result\image\';


obj = VideoWriter('result\video.avi','Grayscale AVI');


if ~exist(re_path,'dir')
    mkdir(re_path)
end

index = 0;

lamda = [0.001,0.1,0.01];                                                  
alpha = 0.01;
beta = 0.001;
thresh = 1e-3;
iter = 2900;

global uk

open(obj);

while true
    index_str = num2str(index);
    im_name = ['depth',index_str,'.png'];
    im_path = [source_path,im_name];
    result_name = ['reuslt',index_str,'.png'];
    result_path = [re_path,result_name];
    
    if exist(im_path,'file')==2
        index = index +1;
        
        u = double(imread(im_path));
        non_mask = u;
        non_mask(u ~= 255) = 1;
        non_mask(u==255) = 0;
        [height,width] = size(u);
       
        if index>1
            iter = 100;
        end
        
        [error,i] = tv12inpaint(u,non_mask,alpha,beta,lamda,iter,thresh);
        
        result = uint8(gather(uk));
        imwrite(result,result_path);
        writeVideo(obj,result)
    else
        
        break
    end
end

close(obj)