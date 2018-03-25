function varargout = SV(varargin)
% SV MATLAB code for SV.fig
%      SV, by itself, creates a new SV or raises the existing
%      singleton*.
%
%      H = SV returns the handle to a new SV or the handle to
%      the existing singleton*.
%
%      SV('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SV.M with the given input arguments.
%
%      SV('Property','Value',...) creates a new SV or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SV_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SV_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SV

% Last Modified by GUIDE v2.5 14-Jun-2016 00:35:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SV_OpeningFcn, ...
                   'gui_OutputFcn',  @SV_OutputFcn, ...
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


% --- Executes just before SV is made visible.
function SV_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SV (see VARARGIN)

% Choose default command line output for SV
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SV wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SV_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
if(handles.m==1)
    t1=str2num (get(handles.edit1,'String'));
    dt=str2num (get(handles.edit3,'String'));
    t2=str2num (get(handles.edit2,'String'));
    f=str2num (get(handles.edit4,'String'));
    t=t1:dt:t2;
    y=sin(2*pi*f*t);
file=fopen('testsin.dat','w');
fprintf(file,'\n%f',y);
fclose(file);
end
if(handles.o==1)
    y=handles.b;
    Num=[-0.000919 -0.002718 -0.002487 0.003661 0.013651 0.017351 0.007665 -0.006555 -0.007697 0.006105 0.013874 0.000351 -0.016909 -0.008906 0.017441 0.020745 -0.012296 -0.034241 -0.001035 0.04779 0.027363 -0.05938 -0.082307 0.067187 0.310015 0.430048 0.310015 0.067187 -0.082307 -0.05938 0.027363 0.04779 -0.001035 -0.034241 -0.012296 0.020745 0.01744 -0.008906 -0.016909 0.000351 0.013874 0.006105 -0.007697 -0.006555 0.007665 0.017351 0.013651 0.003661 -0.002487 -0.002718 -0.000919];
file=fopen('testsin.dat','w');
fprintf(file,'\n%f',y);
fclose(file);
file=fopen('testNum.dat','w');
fprintf(file,'\n%f',Num);
fclose(file);
end
if(handles.n==1)
 t=0:0.1:2;
f=9*10^14;
y=sin(2*pi*f*t);
file=fopen('testsin.dat','w');
fprintf(file,'\n%f',y);
fclose(file);
Num=[-0.000919 -0.002718 -0.002487 0.003661 0.013651 0.017351 0.007665 -0.006555 -0.007697 0.006105 0.013874 0.000351 -0.016909 -0.008906 0.017441 0.020745 -0.012296 -0.034241 -0.001035 0.04779 0.027363 -0.05938 -0.082307 0.067187 0.310015 0.430048 0.310015 0.067187 -0.082307 -0.05938 0.027363 0.04779 -0.001035 -0.034241 -0.012296 0.020745 0.01744 -0.008906 -0.016909 0.000351 0.013874 0.006105 -0.007697 -0.006555 0.007665 0.017351 0.013651 0.003661 -0.002487 -0.002718 -0.000919];
file=fopen('testNum.dat','w');
fprintf(file,'\n%f',Num);
fclose(file);
end    
load testNum.dat
load testsin.dat
SV = conv(testNum, testsin);
file=fopen('testsin.dat','w');
fprintf(file,'\n%f',testsin);
fclose(file);
file=fopen('testNum.dat','w');
fprintf(file,'\n%f',testNum);
fclose(file);
axes(handles.axes1);
plot(SV)
grid on

% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function pushbutton1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
uiopen('D:\dsp\itog.exe',1)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
load testsv.dat
axes(handles.axes2);
plot(testsv)
grid on
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)

  
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in uipanel2.
function uipanel2_SelectionChangeFcn(hObject, eventdata, handles)
handles.m=get(handles.radiobutton2,'Value');
handles.n=get(handles.radiobutton1,'Value');
handles.o=get(handles.radiobutton3,'Value');
guidata(gcbo,handles);
if(handles.m==1)
  set(handles.edit1,'Enable', 'on'); 
  set(handles.edit2,'Enable', 'on'); 
  set(handles.edit3,'Enable', 'on');
  set(handles.edit4,'Enable', 'on');
elseif(handles.m==0)
  set(handles.edit1,'Enable', 'off'); 
  set(handles.edit2,'Enable', 'off'); 
  set(handles.edit3,'Enable', 'off');
  set(handles.edit4,'Enable', 'off');
end
 if(handles.o==1)
  set(handles.pushbutton4,'Enable', 'on'); 
  set(handles.pushbutton5,'Enable', 'on'); 
  set(handles.pushbutton6,'Enable', 'on'); 
  elseif(handles.m==0)
  set(handles.pushbutton4,'Enable', 'off'); 
  set(handles.pushbutton5,'Enable', 'off');
  set(handles.pushbutton6,'Enable', 'off');
 end

% hObject    handle to the selected object in uipanel2 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.a=audiorecorder(5000,8,1);
guidata(gcbo,handles);
record(handles.a)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.a); 
handles.b=getaudiodata(handles.a);
guidata(gcbo,handles);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
sound(handles.b)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
