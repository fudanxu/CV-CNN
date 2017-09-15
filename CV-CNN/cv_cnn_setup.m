function net = cv_cnn_setup(net, x, y)  
    inputmaps = 6;  %nchan 
    mapsize = size(squeeze(x(:, :, 1)));  
    
   for l = 1 : numel(net.layers)  
        if strcmp(net.layers{l}.type, 's') 
            mapsize = floor(mapsize / net.layers{l}.scale);  
            for j = 1 : inputmaps 
               net.layers{l}.b{j} = 0; 
            end  
       end  
       if strcmp(net.layers{l}.type, 'c') 
           mapsize = mapsize - net.layers{l}.kernelsize + 1;  
           fan_out = net.layers{l}.outputmaps * net.layers{l}.kernelsize ^ 2;  
           for j = 1 : net.layers{l}.outputmaps    
               fan_in = inputmaps * net.layers{l}.kernelsize ^ 2;  
               for i = 1 : inputmaps  
                   re1 = (rand(net.layers{l}.kernelsize) - 0.5) * 2 * sqrt(6 / (fan_in + fan_out)); 
                   im1 = (rand(net.layers{l}.kernelsize) - 0.5) * 2 * sqrt(6 / (fan_in + fan_out)); 
                   net.layers{l}.k{i}{j} = complex(re1,im1);
               end  
                net.layers{l}.b{j} = 0; 
           end  
           inputmaps = net.layers{l}.outputmaps;   
        end  
    end  
     
    fvnum = prod(mapsize) * inputmaps;  
     
    onum = size(y, 1);  
  
    
    net.ffb = zeros(onum, 1);  
  
    re2 = (rand(onum, fvnum) - 0.5) * 2 * sqrt(6 / (onum + fvnum));  
    im2= (rand(onum, fvnum) - 0.5) * 2 * sqrt(6 / (onum + fvnum));
    net.ffW = complex(re2,im2);
end  
