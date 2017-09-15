function [er, bad] = cv_cnn_val(net, x, y)  
   % feedforward  
   net = cv_cnn_ff(net, x); 
   % returns the indices of the maximum amplitude values in vector   
   [~, h] = max(net.o); 
   [~, a] = max(y);    
   bad = find(h ~= a); 
   er = numel(bad) / size(y, 2); 
end  
