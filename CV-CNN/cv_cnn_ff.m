function net = cv_cnn_ff(net, x)  
   n = numel(net.layers);  
  inputmaps = 6;      %nchan
   for i=1:inputmaps
        net.layers{1}.a{i} = reshape(x(:,:,i,:),size(x,1),size(x,2),size(x,4)); 
   end
    
    for l = 2 : n   %  for each layer  
        if strcmp(net.layers{l}.type, 'c')  
            for j = 1 : net.layers{l}.outputmaps   %  for each output map  
               %  create temp output map  
                z = zeros(size(net.layers{l - 1}.a{1}) - [net.layers{l}.kernelsize - 1 net.layers{l}.kernelsize - 1 0]);  
               for i = 1 : inputmaps   %  for each input map  
                   %  convolve with corresponding kernel and add to temp output map  
                   z = z + convn(net.layers{l - 1}.a{i}, net.layers{l}.k{i}{j}, 'valid');  
                end  
                %  add bias, pass through nonlinearity  
               net.layers{l}.a{j} = complex(sigm(real(z + net.layers{l}.b{j})),sigm(imag(z + net.layers{l}.b{j})));  
            end  
            %  set number of input maps to this layers number of outputmaps  
           inputmaps = net.layers{l}.outputmaps;  
        elseif strcmp(net.layers{l}.type, 's')   
            %  downsample  
            for j = 1 : inputmaps   
               z = convn(net.layers{l - 1}.a{j}, ones(net.layers{l}.scale) / (net.layers{l}.scale ^ 2), 'valid');  
               net.layers{l}.a{j} = z(1 : net.layers{l}.scale : end, 1 : net.layers{l}.scale : end, :);  
           end  
        end  
    end  
  
    %  concatenate all end layer feature maps into vector  
   net.fv = [];  
    for j = 1 : numel(net.layers{n}.a) 
        sa = size(net.layers{n}.a{j}); 
        net.fv = [net.fv; reshape(net.layers{n}.a{j}, sa(1) * sa(2), sa(3))];  
    end  
    %  feedforward into output perceptrons  
   net.o = complex(sigm(real(net.ffW * net.fv + repmat(net.ffb, 1, size(net.fv, 2)))),sigm(imag(net.ffW * net.fv + repmat(net.ffb, 1, size(net.fv, 2)))));  
  
   
   function X = sigm(P)
    X = 1./(1+exp(-P));
   end
end  
