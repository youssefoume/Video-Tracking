function [seq, ground_truth] = load_video_info(video_path)

ground_truth = dlmread([video_path '/HSI/init_rect.txt']);
% ground_truth=ground_truth(11:end,:);

seq.len = size(ground_truth, 1);
seq.init_rect = ground_truth(1,:);

img_path = [video_path '/HSI/'];

img_files = dir(fullfile(img_path, '*.png'));
% img_files = img_files(4:end);
img_files = {img_files.name};
% img_files = [img_path img_files];
% if exist([img_path num2str(1, '%04i.png')], 'file'),
%     img_files = num2str((1:seq.len)', [img_path '%04i.png']);
% elseif exist([img_path num2str(1, '%04i.jpg')], 'file'),
%     img_files = num2str((1:seq.len)', [img_path '%04i.jpg']);
% elseif exist([img_path num2str(1, '%04i.bmp')], 'file'),
%     img_files = num2str((1:seq.len)', [img_path '%04i.bmp']);
% else
%     error('No image files to load.')
% end
% img_files=img_files(11:end);
seq.s_frames = cellstr(img_files);

end

