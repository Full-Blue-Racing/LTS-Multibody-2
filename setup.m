% setup.m — run this first, every session
% Sets up all project paths relative to this file's location

PROJECT_ROOT = fileparts(mfilename('fullpath'));
ACTIVE_YEAR  = '2025';  % ← update each season

STEP_DIR     = fullfile(PROJECT_ROOT, 'step_files', ACTIVE_YEAR);
ASSEMBLY_DIR = fullfile(PROJECT_ROOT, 'assembly');
MODELS_DIR   = fullfile(PROJECT_ROOT, 'models');

addpath(genpath(PROJECT_ROOT));
cd(PROJECT_ROOT);

disp('=== FBR25 Project Setup ===');
disp(['Project root : ', PROJECT_ROOT]);
disp(['STEP files   : ', STEP_DIR]);
disp(['Assembly dir : ', ASSEMBLY_DIR]);
disp(['Models dir   : ', MODELS_DIR]);
disp('Ready. Open models/FBR25_model.slx or run regenerate_model.m to regenerate.');