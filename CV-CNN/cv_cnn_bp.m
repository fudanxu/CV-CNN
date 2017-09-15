function net = cv_cnn_bp(net, y)  
   n = numel(net.layers);     
   %  Error  
   net.e = (real(net.o) - real(y)).^2 + (imag(net.o) - imag(y)).^2 ;   
   %  MSE loss function  
   net.L = 1/2* sum(net.e(:)) / size(net.e, 2);  
  
   %%  backprop deltas  
   % The residual of the output layer
   net.od = complex(real( y - net.o) .* (real(net.o) .* (1 - real(net.o))),imag(y - net.o) .* (imag(net.o) .* (1 - imag(net.o))));   %  output delta  
   % The residuals are back to the forward layer 
   tem1 = (real(net.ffW.')*real(net.od)+imag(net.ffW.')*imag(net.od));
   tem2 = (imag(net.ffW.')*real(net.od)-real(net.ffW.')*imag(net.od));
   net.fvd = complex((tem1.*real(net.fv ).*(1-real(net.fv ))),-(tem2.*imag(net.fv ).*(1-imag(net.fv )))); %  feature vector delta 
           
   if strcmp(net.layers{n}.type, 'c')         %  only conv layers has sigm function  
       net.fvd = net.fvd .* (net.fv .* (1 - net.fv));  
   end  

   %  reshape feature vector deltas into output map style  
    sa = size(net.layers{n}.a{1}); 
    fvnum = sa(1) * sa(2);  
    for j = 1 : numel(net.layers{n}.a)
        net.layers{n}.d{j} = reshape(net.fvd(((j - 1) * fvnum + 1) : j * fvnum, :), sa(1), sa(2), sa(3));  
    end  
  % The residual of the conv. & pooling layer in CV-CNN
   for l = (n - 1) : -1 : 1  
        if strcmp(net.layers{l}.type, 'c')  
           for j = 1 : numel(net.layers{l}.a)                 
               tem3 = real(expand(net.layers{l + 1}.d{j}, [net.layers{l + 1}.scale net.layers{l + 1}.scale 1]) / net.layers{l + 1}.scale ^ 2);
               tem4 = imag(expand(net.layers{l + 1}.d{j}, [net.layers{l + 1}.scale net.layers{l + 1}.scale 1]) / net.layers{l + 1}.scale ^ 2);
               net.layers{l}.d{j} = complex((real(net.layers{l}.a{j}) .* (1 - real(net.layers{l}.a{j})) .*(tem3+tem4)),(imag(net.layers{l}.a{j}) .* (1 - imag(net.layers{l}.a{j})) .* (tem4-tem3)));  
            end  
        elseif strcmp(net.layers{l}.type, 's')  
            for i = 1 : numel(net.layers{l}.a) 
                z = zeros(size(net.layers{l}.a{1}));  
                for j = 1 : numel(net.layers{l + 1}.a) 
                    tem3 = convn(real(net.layers{l + 1}.d{j}), rot180(real(net.layers{l + 1}.k{i}{j})), 'full')+convn(imag(net.layers{l + 1}.d{j}), rot180(imag(net.layers{l + 1}.k{i}{j})), 'full');  
                    tem4 = convn(real(net.layers{l + 1}.d{j}), rot180(imag(net.layers{l + 1}.k{i}{j})), 'full')-convn(imag(net.layers{l + 1}.d{j}), rot180(real(net.layers{l + 1}.k{i}{j})), 'full');  
                    z = z + complex(tem3,-tem4);
                end  
                net.layers{l}.d{i} = z;  
           end  
        end  
    end  
  
   %%  calc gradients  
  for l = 2 : n  
        if strcmp(net.layers{l}.type, 'c')  
            for j = 1 : numel(net.layers{l}.a)  
               for i = 1 : numel(net.layers{l - 1}.a)  
                    net.layers{l}.dk{i}{j} = convn(flipall(conj(net.layers{l - 1}.a{i})), net.layers{l}.d{j}, 'valid') / size(net.layers{l}.d{j}, 3);  
                end  
               net.layers{l}.db{j} = sum(net.layers{l}.d{j}(:)) / size(net.layers{l}.d{j}, 3);  
            end  
        end  
   end  

    net.dffW = net.od * (conj(net.fv)).' / size(net.od, 2);  
    net.dffb = mean(net.od, 2);  
  
    function X = rot180(X)  
        X = flipdim(flipdim(X, 1), 2);  
    end  
end  
