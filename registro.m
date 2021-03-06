function varargout = registro(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @registro_OpeningFcn, ...
                   'gui_OutputFcn',  @registro_OutputFcn, ...
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


% --- Executes just before registro is made visible.
function registro_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = registro_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
    user= get(handles.text5,'String' );
    if isempty(user)
        warndlg('Ingrese el nombre del usuario', 'Mensaje');
    else 
        ruta = strcat('grabaciones/',user, '.wav') 

        % Preparando para grabar sonido. 
        
        tiempo_grabacion = 2;
        frecuencia_sonido = 44100;
        %frecuencia_sonido = 22050;
        grabacion = audiorecorder(frecuencia_sonido, 24, 1); 

        % Mensajes por consola para marcar inicio y final de la grabacion
      %  grabacion.StartFcn = 'disp('' iniciando grabación '')';
       % grabacion.StopFcn = 'disp('' grabación finalizada '')';

        %input ('Presione enter para grabar la primera senal');
        
        set(handles.text6,'String','Grabando...' );

        recordblocking(grabacion, tiempo_grabacion);
        set(handles.text6,'String','Terminado' );

        sonido1 = grabacion.getaudiodata();

        % Guarda el sonido en formato wav
        audiowrite (ruta, sonido1, frecuencia_sonido );

        %which 'grabacion1.wav'; % Muestra la ubicacion del archivo
        %input ('Senal capturada');   
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%Cierra la ventana    
close
base;



% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
