clc;clear all; close all;
image_input = imread('remote_sensing_image.jpg');
imshow(image_input);
% Error probability q and p from 0 to 1 
p = 0:0.1:1;
q = 0:0.1:1;
% Initialize image_results cell
image_memory = cell(size(p,2),size(q,2));
for q_i =q % error probability q from 0 to 1
    % Create figure for each case of p
    figure('Name','Images','units','normalized','outerposition',[0 0 1 1]);
    % Initial position in subplot
    axes_position = 1;
    for p_i = p % error probability of P from 1 to 0 
        image_output = uint8(general_binary_channel(image_input, p_i, q_i));
        % store the image result into image memory cell
        image_memory{find(q_i == q),find(p_i == p)} = image_output;
        % Plot the images
        subplot(3,4,axes_position);
        imshow( image_output);
        title_txt = ['p = ',num2str(q_i),', q = ',num2str(p_i)];
        title(title_txt);
        % Update axes position   
        axes_position = axes_position + 1;
    end
end
