% Remove <As Machined> from Geometry filenames to match the filenames in
% the model with the filenames in the STEP file
% Run this after regenerate_model.m

model = 'FBR25_model';
load_system(model);

blocks = find_system(model, ...
    'LookUnderMasks', 'all', ...
    'FollowLinks', 'on');

for i = 1:numel(blocks)
    blk = blocks{i};
    try
        fileName = get_param(blk, 'ExtGeomFileName');
        if contains(fileName, '<As Machined>')
            newName = strrep(fileName, '<As Machined>', '');
            set_param(blk, 'ExtGeomFileName', newName);
        end

    catch
        % Skip blocks that do not have ExtGeomFileName
    end
end

save_system(model);