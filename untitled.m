function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 30-May-2017 23:04:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in btnBrowser.
function btnBrowser_Callback(hObject, eventdata, handles)
% hObject    handle to btnBrowser (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filesTrain;
dirTrainName = uigetdir();
set(handles.editTrain, 'String', dirTrainName);

% Get files from directory name
dirData = dir(dirTrainName);      %# Get the data for the current directory
dirIndex = [dirData.isdir];  %# Find the index for directories
filesTrain = {dirData(~dirIndex).name}';  %'# Get a list of the files
if ~isempty(filesTrain)
  filesTrain = cellfun(@(x) fullfile(dirTrainName,x),...  %# Prepend path to files
                filesTrain,'UniformOutput',false);
end
subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirName,subDirs{iDir});    %# Get the subdirectory path
    filesTrain = [filesTrain; getAllFiles(nextDir)];  %# Recursively call getAllFilesend
end

allFileName = strjoin(filesTrain, '\n');
set(handles.editFileList, 'String', allFileName);

function editTrain_Callback(hObject, eventdata, handles)
% hObject    handle to editTrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTrain as text
%        str2double(get(hObject,'String')) returns contents of editTrain as a double


% --- Executes during object creation, after setting all properties.
function editTrain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTrain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editFileList_Callback(hObject, eventdata, handles)
% hObject    handle to editFileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editFileList as text
%        str2double(get(hObject,'String')) returns contents of editFileList as a double


% --- Executes during object creation, after setting all properties.
function editFileList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFileList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editTest_Callback(hObject, eventdata, handles)
% hObject    handle to editTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editTest as text
%        str2double(get(hObject,'String')) returns contents of editTest as a double


% --- Executes during object creation, after setting all properties.
function editTest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnBrowserTest.
function btnBrowserTest_Callback(hObject, eventdata, handles)
% hObject    handle to btnBrowserTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filesTest;
dirNameTest = uigetdir();
set(handles.editTest, 'String', dirNameTest);

% Get files from directory name
dirData = dir(dirNameTest);      %# Get the data for the current directory
dirIndex = [dirData.isdir];  %# Find the index for directories
filesTest = {dirData(~dirIndex).name}';  %'# Get a list of the files
if ~isempty(filesTest)
  filesTest = cellfun(@(x) fullfile(dirNameTest,x),...  %# Prepend path to files
                filesTest,'UniformOutput',false);
end
subDirs = {dirData(dirIndex).name};  %# Get a list of the subdirectories
validIndex = ~ismember(subDirs,{'.','..'});  %# Find index of subdirectories
                                               %#   that are not '.' or '..'
for iDir = find(validIndex)                  %# Loop over valid subdirectories
    nextDir = fullfile(dirNameTest,subDirs{iDir});    %# Get the subdirectory path
    filesTest = [filesTest; getAllFiles(nextDir)];  %# Recursively call getAllFilesend
end

allFileTestName = strjoin(filesTest, '\n');
set(handles.editResult, 'String', allFileTestName);


function editResult_Callback(hObject, eventdata, handles)
% hObject    handle to editResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editResult as text
%        str2double(get(hObject,'String')) returns contents of editResult as a double


% --- Executes during object creation, after setting all properties.
function editResult_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editResult (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnStart.
function btnStart_Callback(hObject, eventdata, handles)
% hObject    handle to btnStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filesTrain;
global filesTest;

f_arr=[];

for k=1:length(filesTrain)
    
	path = filesTrain(k, 1)
	strPath = strjoin(path);
	a = audioread(strPath);
	b = mfcc(a);
	g1_0 = gNew(12, 50, 'diag');
	g2_0 = gInit(g1_0, b, 100);
	g3_0 = gRE(g2_0, b, 100);
	f_arr =[f_arr; g3_0];
end

strResult = '';
dem = 0;

RealValue = 1;
n = 1;

for p=1:length(filesTest)
 
    pathTest = filesTest(p, 1);
    strPathTest = strjoin(pathTest)
    x_w = audioread(strPathTest);
    x = mfcc(x_w);
    max = 0;
    index = 1;
    for k=1:length(f_arr)
        
       GMM = mean(gPr(f_arr(k), x))
       if GMM > max
            max = GMM;
            index = k;
       end
   end
    
    if index == RealValue
        dem = dem + 1;
    end
    
    max
    
    result = strcat(strcat('Redicted value: ',num2str(index)), strcat('  - Real value: ', num2str(RealValue)));
    strResult = sprintf('%s\n%s',strResult, result);
    
    n = n + 1;
    if n > 20
        RealValue = RealValue + 1;
        n = 1;
    end
end

ratio = strcat('Ratio:  ', num2str((double(dem)*100)/length(filesTest)));
ratio = strcat(ratio, '%');
set(handles.txtRatio, 'String', ratio);
set(handles.editResult, 'String', strResult);


% --- Executes during object creation, after setting all properties.
function btnBrowserTest_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnBrowserTest (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
