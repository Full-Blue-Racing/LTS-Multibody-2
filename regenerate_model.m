% regenerate_model.m — regenerates the Simscape model from the XML assembly
% WARNING: This overwrites the existing model and loses manual edits.
% Only run this when CAD has been updated with new STEP files.
% Run setup.m first.

warning('=== WARNING ===');
warning('This will regenerate FBR25_model.slx from scratch.');
warning('Any manual edits to the model will be LOST.');
response = input('Type YES to continue: ', 's');

if ~strcmp(response, 'YES')
    disp('Aborted.');
    return;
end

% Change into models directory so generated files land there
cd(MODELS_DIR);

% Run smimport pointed at the XML
xml_file = fullfile(ASSEMBLY_DIR, 'FBR25forVD.xml');
% Run smimport
smimport(xml_file, 'modelName', 'FBR25_model');

save_system('FBR25_model', fullfile(MODELS_DIR, 'FBR25_model.slx'));
close_system('FBR25_model', 0); % 0 = don't save again on close

disp('=== Import complete ===');
disp('Model saved to models/FBR25_model.slx');
disp('Commit the updated .slx and _DataFile.m to GitHub.');

% run(fullfile(PROJECT_ROOT, 'fix_step_paths.m'));