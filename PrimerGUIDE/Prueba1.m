function varargout = Prueba1(varargin)
% PRUEBA1 MATLAB code for Prueba1.fig
%      PRUEBA1, by itself, creates a new PRUEBA1 or raises the existing
%      singleton*.
%
%      H = PRUEBA1 returns the handle to a new PRUEBA1 or the handle to
%      the existing singleton*.
%
%      PRUEBA1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRUEBA1.M with the given input arguments.
%
%      PRUEBA1('Property','Value',...) creates a new PRUEBA1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Prueba1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Prueba1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Prueba1

% Last Modified by GUIDE v2.5 09-Mar-2021 17:32:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Prueba1_OpeningFcn, ...
                   'gui_OutputFcn',  @Prueba1_OutputFcn, ...
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


% --- Executes just before Prueba1 is made visible.
function Prueba1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Prueba1 (see VARARGIN)

% Choose default command line output for Prueba1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Prueba1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Prueba1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton1 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    axes(handles.axes1);
    I=imread('letras.jpg');
    imshow(I);
    %axes off;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
    % hObject    handle to pushbutton2 (see GCBO)
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    axes(handles.axes2);
    I=imread('letras.jpg');
    [im_Binariza,im_Gray] = fprocesa(I);
    imshow(im_Binariza);
    %axes off;
    axes(handles.axes3);
    imshow(im_Binariza);
    %axes off;
