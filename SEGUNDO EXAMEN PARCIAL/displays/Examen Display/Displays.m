function varargout = Displays(varargin)
% DISPLAYS MATLAB code for Displays.fig
%      DISPLAYS, by itself, creates a new DISPLAYS or raises the existing
%      singleton*.
%
%      H = DISPLAYS returns the handle to a new DISPLAYS or the handle to
%      the existing singleton*.
%
%      DISPLAYS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DISPLAYS.M with the given input arguments.
%
%      DISPLAYS('Property','Value',...) creates a new DISPLAYS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Displays_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Displays_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Displays

% Last Modified by GUIDE v2.5 27-May-2021 20:39:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Displays_OpeningFcn, ...
                   'gui_OutputFcn',  @Displays_OutputFcn, ...
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


% --- Executes just before Displays is made visible.
function Displays_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Displays (see VARARGIN)

% Choose default command line output for Displays
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Displays wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Displays_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

axes(handles.axes1);
global I;

I = imread('numeros_1.jpg');

R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);

Im_gray = im2gray(R);

Im_m = medfilt2(Im_gray,[4 4]); 
Im_m = Im_m - 40;
bw = ~im2bw(Im_m,0.27);

se = strel('rectangle',[10 5]);
 
closeBW = imclose(bw, se);


se = strel('rectangle',[7 3]);
imerode1 = imdilate(closeBW,se); 



se = strel('square',5);
imerode1 = imerode(imerode1,se); 

global I_final;
I_final = imerode1;
imshow (I_final);


ocrResults = ocr(I_final,'CharacterSet','0123456789.');

%Obtenemos el texto reconocido
recognizedText = ocrResults.Text;

fid = fopen('text.txt', 'wt');

fprintf(fid,'%s\n',recognizedText);

fclose(fid);

winopen('text.txt');



function pushbutton2_Callback(hObject, eventdata, handles)
axes(handles.axes2);
global I;


I = imread('numeros_2.jpg');
imshow(I);


cmap = rgb2hsv(I);

d1=cmap(:,:,1);  %H
d2=cmap(:,:,2);  %S
d3=cmap(:,:,3);  %V


I_aux = d1;


axes(handles.axes2);



%Mejoramos el contraste de la imagen
I_aux = imadjust(I_aux);


I_aux = im2bw(I_aux, 0.6);% 


g1 = fspecial('gaussian',[5 5],2);
I_aux = imfilter(I_aux,g1);

%Eliminamos pequenias regiones en la imagen
I_aux = bwareaopen(I_aux,30);


I_aux = (imclearborder(I_aux, 4)); 

I_aux = imdilate(I_aux,strel('rectangle',[20 2]));

I_aux = imdilate(I_aux,strel('square',2));


global I_final;
I_final = I_aux;
imshow (I_final);

ocrResults = ocr(I_final,'CharacterSet','0123456789.');


recognizedText = ocrResults.Text;


fid = fopen('text.txt', 'wt');

fprintf(fid,'%s\n',recognizedText);

fclose(fid);

winopen('text.txt');
