function varargout = LissajousFigureGUI(varargin)
% LISSAJOUSFIGUREGUI MATLAB code for LissajousFigureGUI.fig
%      LISSAJOUSFIGUREGUI, by itself, creates a new LISSAJOUSFIGUREGUI or raises the existing
%      singleton*.
%
%      H = LISSAJOUSFIGUREGUI returns the handle to a new LISSAJOUSFIGUREGUI or the handle to
%      the existing singleton*.
%
%      LISSAJOUSFIGUREGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LISSAJOUSFIGUREGUI.M with the given input arguments.
%
%      LISSAJOUSFIGUREGUI('Property','Value',...) creates a new LISSAJOUSFIGUREGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before LissajousFigureGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to LissajousFigureGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help LissajousFigureGUI

% Last Modified by GUIDE v2.5 25-Sep-2017 21:46:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @LissajousFigureGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @LissajousFigureGUI_OutputFcn, ...
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


% --- Executes just before LissajousFigureGUI is made visible.
function LissajousFigureGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to LissajousFigureGUI (see VARARGIN)

% Create the data to plot.
handles.A=1; handles.B=1; handles.a=1; handles.b=1; handles.phi=0;
handles.t = 0:(pi/1000):2*pi;
x = handles.A*sin(handles.a*handles.t);
y = handles.B*sin(handles.b*handles.t+handles.phi);
plot(x, y);
grid on;
set(gca, 'XLim', [-1, 1], 'YLim', [-1, 1], 'xticklabel',[],'yticklabel',[],...
    'xtick', [-1,-0.5,0,0.5,1.0], 'ytick', [-1,-0.5,0,0.5,1.0]);

% Choose default command line output for LissajousFigureGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes LissajousFigureGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = LissajousFigureGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function f_x_Callback(hObject, eventdata, handles)
% hObject    handle to f_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.a = round(get(hObject,'Value')*100);
x = handles.A*sin(handles.a*handles.t);
y = handles.B*sin(handles.b*handles.t+handles.phi);
plot(x, y);
grid on
set(gca, 'XLim', [-1, 1], 'YLim', [-1, 1], 'xticklabel',[],'yticklabel',[],...
    'xtick', [-1,-0.5,0,0.5,1.0], 'ytick', [-1,-0.5,0,0.5,1.0])
handles.f_ratio.String = strcat(num2str(handles.a),':',num2str(handles.b));
% Save the handles structure.
guidata(hObject,handles)



% --- Executes during object creation, after setting all properties.
function f_x_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_x (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function f_y_Callback(hObject, eventdata, handles)
% hObject    handle to f_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.b = round(get(hObject,'Value')*100);
x = handles.A*sin(handles.a*handles.t);
y = handles.B*sin(handles.b*handles.t+handles.phi);
plot(x, y);
grid on
set(gca, 'XLim', [-1, 1], 'YLim', [-1, 1], 'xticklabel',[],'yticklabel',[],...
    'xtick', [-1,-0.5,0,0.5,1.0], 'ytick', [-1,-0.5,0,0.5,1.0])
handles.f_ratio.String = strcat(num2str(handles.a),':',num2str(handles.b));
% Save the handles structure.
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function f_y_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f_y (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function phi_Callback(hObject, eventdata, handles)
% hObject    handle to phi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.phi = get(hObject,'Value')*10;
x = handles.A*sin(handles.a*handles.t);
y = handles.B*sin(handles.b*handles.t+handles.phi);
plot(x, y);
grid on
set(gca, 'XLim', [-1, 1], 'YLim', [-1, 1], 'xticklabel',[],'yticklabel',[],...
    'xtick', [-1,-0.5,0,0.5,1.0], 'ytick', [-1,-0.5,0,0.5,1.0])
handles.phase.String = num2str(handles.phi);
% Save the handles structure.
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function phi_CreateFcn(hObject, eventdata, handles)
% hObject    handle to phi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
