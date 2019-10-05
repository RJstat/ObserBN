function varargout = ObserBN(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ObserBN_OpeningFcn, ...
                   'gui_OutputFcn',  @ObserBN_OutputFcn, ...
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

function ObserBN_OpeningFcn(hObject, eventdata, handles, varargin)

clr=[0.84,0.84,0.84];
set(gcf,'Color',clr);
set(gcf, 'Units','characters');
set(handles.OK,'BackgroundColor',clr);
set(handles.Data,'BackgroundColor',clr);
set(handles.Data2,'BackgroundColor',clr);
set(handles.Output,'BackgroundColor',clr);
set(handles.Clear,'BackgroundColor',clr);


% Choose default command line output for FVGWASgui
handles.output = hObject;

set(hObject, 'Name','Observability Determination of Boolean Network');




% Update handles structure
guidata(hObject, handles);



function varargout = ObserBN_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

% --- Executes on button press in Data.
function Data_Callback(hObject, eventdata, handles)

button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
DataFn_str = uigetfile({'*.mat';'*.txt'},'Select data file');
    if DataFn_str~=0
       set(handles.Data,'UserData',DataFn_str);
    end
end

% --- Executes on button press in Data2.
function Data2_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
DataFn_str2 = uigetfile({'*.mat';'*.txt'},'Select data file');
    if DataFn_str2~=0
       set(handles.Data2,'UserData',DataFn_str2);
    end
end
% hObject    handle to Data2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Data2


% --- Executes on button press in Output.
function Output_Callback(hObject, eventdata, handles)

button_state = get(hObject,'Value');
if button_state == get(hObject,'Max')
OutputDir= uigetdir(' ','Select Output folder');
    if OutputDir~=0
       set(handles.Output,'UserData',OutputDir);
    end
end
guidata(hObject,handles);

% Hint: get(hObject,'Value') returns toggle state of Output


DataName= get(handles.Data,'UserData');
if isempty(DataName)
   warndlg('Please select the Data file by pressing "Data" button')
  return;
end 

DataName2= get(handles.Data2,'UserData');
if isempty(DataName2)
   warndlg('Please select the Data file by pressing "Data2" button')
  return;
end 


Output= get(handles.Output,'UserData');
if isempty(Output)
   warndlg('Please select the output folder by pressing "Output Directory" button')
  return;
end   




Lcal;
fprintf('+++++++Your job is finished!!+++++++\n');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



guidata(hObject,handles);

% --- Executes on button press in Clear.
function Clear_Callback(hObject, eventdata, handles)

set(handles.Data,'UserData','');
guidata(hObject,handles);
% Hint: get(hObject,'Value') returns toggle state of Clear

% --- Executes on button press in OK.
function OK_Callback(hObject, eventdata, handles)
% hObject    handle to OK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of OK

% --- Executes during object creation, after setting all properties.
%function observ_CreateFcn(hObject, eventdata, handles)
% hObject    handle to observ (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: place code in OpeningFcn to populate observ

% --- Executes during object creation, after setting all properties.
function Data_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

function Data2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



% --- Executes during object creation, after setting all properties.
%function axes7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
%imshow('Obsever.jpg');
% Hint: place code in OpeningFcn to populate axes7




