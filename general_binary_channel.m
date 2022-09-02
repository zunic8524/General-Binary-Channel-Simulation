function [output_image] = general_binary_channel(input_image, p, q)
% general_binar ychannel models a general 
% not necessarily symmetric) binary channel.

%% step 1
% Convert input to binary code
binary_input_image = de2bi(input_image);

%% step 2
% change with probability P from 0 to 1
binary_input_image_p = double(binary_input_image);
% replace binary input value 1 by random numbers 
binary_input_image_p(binary_input_image == 1)= rand (size(find(binary_input_image == 1)));
% replace 0 instead of random number when it is less than P
binary_input_image_p(binary_input_image_p < p) = 0;
% replace 1 instead of random number when it is greater than P
binary_input_image_p(binary_input_image_p > p) = 1;

%% step 3
% change with probability P from 0 to 1
binary_input_image_q=binary_input_image_p;
% generate random number instead of 0 in input matrix
binary_input_image_q(binary_input_image == 0) = rand(size(find(binary_input_image == 0)));
% replace 1 instead of random number when it is  greater than 1-q
binary_input_image_q(binary_input_image_q >1-q) = 1;
% replace 0 instead of random number when it is  less than 1-q
binary_input_image_q(binary_input_image_q<1-q) = 0;

%% step 4
% reshape the output image code
output_image = reshape(bi2de(binary_input_image_q),size(input_image));
end
