function varargout = TheLittleIndy(varargin)
% THELITTLEINDY MATLAB code for TheLittleIndy.fig
%      THELITTLEINDY, by itself, creates a new THELITTLEINDY or raises the existing
%      singleton*.
%
%      H = THELITTLEINDY returns the handle to a new THELITTLEINDY or the handle to
%      the existing singleton*.
%
%      THELITTLEINDY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THELITTLEINDY.M with the given input arguments.
%
%      THELITTLEINDY('Property','Value',...) creates a new THELITTLEINDY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TheLittleIndy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TheLittleIndy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TheLittleIndy

% Last Modified by GUIDE v2.5 10-Jun-2021 13:14:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TheLittleIndy_OpeningFcn, ...
                   'gui_OutputFcn',  @TheLittleIndy_OutputFcn, ...
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


% --- Executes just before TheLittleIndy is made visible.
function TheLittleIndy_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for TheLittleIndy
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TheLittleIndy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TheLittleIndy_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
list = dir('*.jpg');
number_of_files = size(list);

for i= 1: number_of_files(1,1)
    filename = list(i).name;
    I = imread(filename);
    imGray = rgb2gray(I);   

    imagen = process(imGray);

    [L,n] = bwlabel(imagen,4);  

    for i=1:n

        R = L==i;

        m = HuMom(R); 
        %stats = regionprops(R, 'all')  (NO JALA)
        %disp(m);    
     
        if(m(1)>0.21 && m(1)<0.22) % INDY_1.jpg
            set(handles.text1,'string','El pequeño INDY esta completo');
            texto = 'El pequeño INDY esta completo';
        end


        if((m(1)>0.18 && m(1)<0.21))
            
            if((m(7)>0) && m(2)>=0.0087 && m(2)<=0.0088)  % INDY_6.jpg   
                set(handles.text1,'string','El pequeño INDY no tiene cabeza, pierna ni mano');
                texto = 'El pequeño INDY no tiene cabeza, pierna ni mano';
            else% INDY_2.jpg
                set(handles.text1,'string','El pequeño INDY no tiene sombrero ni mano');
                texto = 'El pequeño INDY no tiene sombrero ni mano';
                if(m(2)>0.0035 && m(2)<0.0036) % INDY_3.jpg
                    set(handles.text1,'string','El pequeño INDY no tiene cara, sombrero ni pierna');
                    texto = 'El pequeño INDY no tiene cara, sombrero ni pierna';
                end
            end 
            
            if(m(3)==0.0011 || (m(7)<0) || m(3)==0.0020)
                if(m(2)<0.0021 && m(2)>0.0020)% INDY_5.jpg
                    set(handles.text1,'string','El pequeño INDY no tiene sombrero, cara ni piernas');
                    texto = 'El pequeño INDY no tiene sombrero, cara ni piernas';
                end
            end
            
            if((m(1)>0.193 && m(1)<0.207) && m(7)<0)% INDY_10.jpg % INDY_12.jpg
                set(handles.text1,'string','El pequeño INDY no tiene sombrero, cara ni manos');
                texto = 'El pequeño INDY no tiene sombrero, cara ni manos';
                if(m(2)>0.0105 && m(2)<0.0106)
                    set(handles.text1,'string','El pequeño INDY no tiene sombrero, cara ni pierna');
                    texto = 'El pequeño INDY no tiene sombrero, cara ni pierna';
                end
                if(m(2)>0.0039 && m(2)<0.0040)
                    set(handles.text1,'string','El pequeño INDY no tiene cara ni mano');
                    texto = 'El pequeño INDY no tiene cara ni mano';
                end
            end
        else
            if(m(6)<0 && (m(1)>0.218 || m(1)<0.243) )
                set(handles.text1,'string','El pequeño INDY no tiene pierna ni mano');
                texto = 'El pequeño INDY no tiene pierna ni mano';
            end   
            if(m(7)<0 && m(6)<0 && (m(1)>0.2195 || m(1)<0.2205) &&  m(2)<0.0251);
                 set(handles.text1,'string','El pequeño INDY no tiene cara ni pierna');
                 texto = 'El pequeño INDY no tiene cara ni pierna';
            end
        end
    imshow(I);                     
    axes(handles.axes2);
    NET.addAssembly('System.Speech');
    obj = System.Speech.Synthesis.SpeechSynthesizer;
    obj.Volume = 100;
    Speak(obj, texto);
    pause(2);

    end

end
