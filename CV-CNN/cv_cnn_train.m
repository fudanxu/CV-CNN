function net = cv_cnn_train(net, x, y, opts)  
    m = size(x, 4); % number of training samples
    numbatches = m / opts.batchsize;  
  
    if rem(numbatches, 1) ~= 0  
        error('numbatches not integer');  
    end  
      
    net.rL = [];  
    for i = 1 : opts.numepochs          
        disp(['epoch ' num2str(i) '/' num2str(opts.numepochs)]);  
        tic;   % timing
        kk = randperm(m);  
        for l = 1 : numbatches  
            batch_x = x(:, :, :,kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize));  
            batch_y = y(:,    kk((l - 1) * opts.batchsize + 1 : l * opts.batchsize));  
            % Feedforward 
            net = cv_cnn_ff(net, batch_x);  
            % Backpropagation  
            net = cv_cnn_bp(net, batch_y); 
            % update
            net = cv_cnn_applygrads(net, opts);  
           if isempty(net.rL)  
                net.rL(1) = net.L; 
            end  
           net.rL(end + 1) = 0.99 * net.rL(end) + 0.01 * net.L;   
        end  
        toc;  
    end  
      
end  
