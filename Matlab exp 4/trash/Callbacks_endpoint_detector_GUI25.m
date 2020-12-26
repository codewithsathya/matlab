function Callbacks_endpoint_detector_GUI25(f,C)
%SENSE COMPUTER AND SET FILE DELIMITER
switch(computer)				
    case 'MACI64',		char= '/';
    case 'GLNX86',  char='/';
    case 'PCWIN',	char= '\';
    case 'PCWIN64', char='\';
    case 'GLNXA64', char='/';
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x=C{1,1};
y=C{1,2};
a=C{1,3};
b=C{1,4};
u=C{1,5};
v=C{1,6};
m=C{1,7};
n=C{1,8};
lengthbutton=C{1,9};
widthbutton=C{1,10};
enterType=C{1,11};
enterString=C{1,12};
enterLabel=C{1,13};
noPanels=C{1,14};
noGraphicPanels=C{1,15};
noButtons=C{1,16};
labelDist=C{1,17};%distance that the label is below the button
noTitles=C{1,18};
buttonTextSize=C{1,19};
labelTextSize=C{1,20};
textboxFont=C{1,21};
textboxString=C{1,22};
textboxWeight=C{1,23};
textboxAngle=C{1,24};
labelHeight=C{1,25};
fileName=C{1,26};
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %PANELS
% for j=0:noPanels-1
% uipanel('Parent',f,...
% 'Units','Normalized',...
% 'Position',[x(1+4*j) y(1+4*j) x(2+4*j)-x(1+4*j) y(3+4*j)-y(2+4*j)]);
% end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAPHIC PANELS
for i=0:noGraphicPanels-1
switch (i+1)
case 1
graphicPanel1 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 2
graphicPanel2 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
case 3
graphicPanel3 = axes('parent',f,...
'Units','Normalized',...
'Position',[a(1+4*i) b(1+4*i) a(2+4*i)-a(1+4*i) b(3+4*i)-b(2+4*i)],...
'GridLineStyle','--');
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%TITLE BOXES
for k=0:noTitles-1
switch (k+1)
case 1
titleBox1 = uicontrol('parent',f,...
'Units','Normalized',...
'Position',[u(1+4*k) v(1+4*k) u(2+4*k)-u(1+4*k) v(3+4*k)-v(2+4*k)],...
'Style','text',...
'FontSize',textboxFont{k+1},...
'String',textboxString(k+1),...
'FontWeight',textboxWeight{k+1},...
'FontAngle',textboxAngle{k+1});
end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%BUTTONS
for i=0:(noButtons-1)
enterColor='w';
if strcmp(enterType{i+1},'pushbutton')==1 ||strcmp(enterType{i+1},'text')==1
enterColor='default';
end
if (strcmp(enterLabel{1,(i+1)},'')==0 &&...
        strcmp(enterLabel{1,(i+1)},'...')==0) %i.e. there is a label
%creating a label for some buttons
uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i)-labelDist-labelHeight(i+1) ...
(m(2+2*i)-m(1+2*i)) labelHeight(i+1)],...
'Style','text',...
'String',enterLabel{i+1},...
'FontSize', labelTextSize(i+1),...
'HorizontalAlignment','center');
end
switch (i+1)
case 1
button1=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button1Callback);
case 2
button2=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button2Callback);
case 3
button3=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button3Callback);
case 4
button4=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button4Callback);
case 5
button5=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button5Callback);
case 6
button6=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button6Callback);
case 7
button7=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button7Callback);
case 8
button8=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button8Callback);
case 9
button9=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button9Callback);
case 10
button10=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button10Callback);
case 11
button11=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button11Callback);
case 12
button12=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button12Callback);
case 13
button13=uicontrol('Parent',f,...
'Units','Normalized',...
'Position',[m(1+2*i) n(1+2*i) (m(2+2*i)-m(1+2*i)) (n(2+2*i)-n(1+2*i))],...
'Style',enterType{i+1},...
'String',enterString{i+1},...
'FontSize', buttonTextSize(1+i),...
'BackgroundColor',enterColor,...
'HorizontalAlignment','center',...
'Callback',@button13Callback);
end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%USER CODE FOR THE VARIABLES AND CALLBACKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Initialize Variables
    curr_file=1;
    fs=8000;
    directory_name='abcd';
    wav_file_names='abce';
    fin_path='filename';
    fname='output';
    fileName='out_endpt.wav';
    nsamp=1;
    Lm=40;
    L=800;
    Rm=10;
    R=200;
    ethresh=30;
    zcthresh=50;
    beginf=1;
    endf=10;
    xin=[];
    y=[];

% Name the GUI
    set(f,'Name','endpoints');

% CALLBACKS
% Callback for button1 -- Get Speech Files Directory
 function button1Callback(h,eventdata)
          %% ***** modified below **************************************************************************
     if isempty(getpref('SpeechApps'))
         url = sprintf('%s%s',...
             'http://www.mathworks.com/matlabcentral/fileexchange/',...
             'submissions/45293/v/1/download/zip');
         [saveloc, ~, ~] = fileparts(pwd); %save to one level up from current folder
         % Create a waitbar during download
         h = waitbar(0.35,'This may take several minutes...',...
             'Name','Downloading Speech Files...');
         % Download the zipped file
         [filestr,status] = urlwrite(url,[saveloc filesep 'speech_files.zip'],...
             'Timeout',10);
         if status
             delete(h);
             hh1= helpdlg('Downloaded. Select a location to UNZIP the speech files.');
             uiwait(hh1);
             unziploc = uigetdir(saveloc,'Select a location to unzip the speech files');
             h2 = waitbar(0.2,'This may take a minute...',...
                 'Name','Unzipping the Speech Files to Location Selected...');
             unzip(filestr,unziploc);
             delete(h2)
             addpref('SpeechApps','path',unziploc);
             hh2= helpdlg('Ready. Select the speech_files folder in the next window');
             uiwait(hh2);
         else
             warndlg('No Internet Connection to MATLAB Central!');
         end
         
     else
     end
     directory_name = uigetdir(getpref('SpeechApps','path'));
%% ***** modified above *******************************************
     A=strvcat(strcat((directory_name),[char,'*.wav']));
     struct_filenames=dir(A);
     wav_file_names={struct_filenames.name};
     set(button2,'String',wav_file_names);
     
% once the popupmenu/drop down menu is created, by default, the first
% selection from the popupmenu/drop down menu id not called
    indexOfDrpDwnMenu=1;
    
% by default first option from the popupmenu/dropdown menu will be loaded
    [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
 end

% Callback for button2 -- Choose speech file for play and plot
 function button2Callback(h,eventdata)
     indexOfDrpDwnMenu=get(button2,'val');
     [curr_file,fs]=loadSelection(directory_name,wav_file_names,indexOfDrpDwnMenu);
 end

%*************************************************************************
% function -- load selection from designated directory and file
%
function [curr_file,fs]=loadSelection(directory_name,wav_file_names,...
    indexOfDrpDwnMenu);
%
% read in speech/audio file
% fin_path is the complete path of the .wav file that is selected
    fin_path=strcat(directory_name,char,strvcat(wav_file_names(indexOfDrpDwnMenu)));
    
% clear speech/audio file
    clear curr_file;
    
% read in speech/audio signal into curr_file; sampling rate is fs 
    [curr_file,fs]=wavread(fin_path);
    
% create title information with file, sampling rate, number of samples
    fname=wav_file_names(indexOfDrpDwnMenu);
    FS=num2str(fs);
    nsamp=num2str(length(curr_file));
    file_info_string=strcat('  file: ',fname,', fs: ',FS,' Hz, nsamp:',nsamp);
    
% read in filename (fname) from cell array
    fname=wav_file_names{indexOfDrpDwnMenu};
end

% Callback for button9 -- Play Speech File
    function button9Callback(h,eventdata)
        soundsc(curr_file,fs);
    end

% Callback for button3 -- Lm: analysis frame length in msec
 function button3Callback(h,eventdata)
     Lm=str2num(get(button3,'string'));
     if (Lm < 1 || Lm > 100)
        waitfor(errordlg('The value of frame duration must be between 1 and 100'));
        return;
    end
 end

% Callback for button4 == Rm: analysis frame shift in msec
 function button4Callback(h,eventdata)
     Rm=str2num(get(button4,'string'));
     if (Rm < 1 || Rm > 100)
        waitfor(errordlg('The value of frame shift must be between 1 and 100'));
        return;
    end
 end

% Callback for button5 -- ethresh: log energy threshold
 function button5Callback(h,eventdata)
     ethresh=str2num(get(button5,'string'));
     if (ethresh < 20 || ethresh > 40)
          waitfor(errordlg('The value of log energy threshold must be between 20 and 40 decibels'));
          return;
    end
 end

% Callback for button6 -- zcthresh: zero-crossings threshold
 function button6Callback(h,eventdata)
     zcthresh=str2num(get(button6,'string'));
     if (zcthresh < 20 || zcthresh > 80)
          waitfor(errordlg('The value of zero-crossings threshold must be between 20 and 80'));
          return;
    end
 end

% Callback for button10 -- Record Speech
    function button10Callback(h,eventdata)
        
% define recording parameters fs: sampling rate, nsec: number of seconds
% for recording, ch: number of recording channels
    fs=10000;
    nsec=4;
    ch=1;
    N=fs*nsec;

% Begin recording after hitting OK on msg box
    uiwait(msgbox('Ready to Record -- Hit OK to Begin','Record','modal'));
   
% recording code
    clear y; clear xin;
    % y=wavrecord(N,fs,ch,'double');
    recobj=audiorecorder(fs,16,1);
    recordblocking(recobj,nsec);
    y=getaudiodata(recobj);
    
    ymin=min(y);
    ymax=max(y);
    ym=max(ymax,-ymin);
    xin=y/ym*32767;
    
% highpass filter to eliminate dc offset and 60 Hz hum and play out results
    y=highpass_filter_signal_GUI(y,fs); 
    curr_file=y;
    curr_file=curr_file';
    
% endpoint newly recorded speech file
    button7Callback(h,eventdata)
    end

% Callback for button7 -- run endpoints
 function button7Callback(h,eventdata)
     
 % check editable buttons for changes
    button3Callback(h,eventdata);  % Lm -- frame length in msec
    button4Callback(h,eventdata);  % Rm -- frame shift in msec
    button5Callback(h,eventdata);  % ethresh -- log energy threshold
    button6Callback(h,eventdata);  % zcthresh -- zero crossing threshold
    
% scale input signal to 32767 range
    xin=curr_file*32768;
    
% setup the endpoint detector with log energy and zero crossings
    setup_endpoints(xin,fs,Lm,Rm,ethresh,zcthresh,fname);
 end

%***********************************************************************
% function to setup the endpoint detector
    function setup_endpoints(xin,fs,Lm,Rm,ethresh,zcthresh,fname)
% analysis parameters; 
% Lmsec is analysis frame window duration in msec (40); L is analysis frame
% window duration in samples (computed from sampling rate)
% Rmsec is analysis frame window shift in msec (10); R is analysis frame
% window shift in samples (computed from sampling rate)
    L=round(Lm*fs/1000);
    R=round(Rm*fs/1000);
    
% compute log energy and zero crossings contours
    [loge,zc,nfrm]=analysis(xin,L,R,fs);
    
% compute endpoints
    [beginf,endf]=endpoints(nfrm,loge,zc,fname,xin,fs,R,L,ethresh,zcthresh);
    end

% Callback for button11 -- play out speech samples between beginning and ending frames
    function button11Callback(h,eventdata)
    s1=(beginf-1)*R+1;
    e1=(endf-1)*R+L-1;
    y=xin(s1:e1);
    soundsc(y,fs);
    end

%**********************************************************************
% function to find endpoints of a speech file
function [beginf,endf]=endpoints(nfrm,loge,zc,fullPAth,y,fs,R,L,ethresh,zcthresh);
%
% function to find endpoints of a speech utterance
%
% Inputs
%   nfrm: number of frames in log energy and zero crossings parameters
%   loge: log energy contour (1:nfrm)
%   zc: zero crossing rate contour (1:nfrm)
%   fullPAth: full path to current speech file
%   y: input speech (highpass filtered)
%   fs: sampling rate in Hz
%   R=frame shift in samples
%   L=frame duration in samples
%   ethresh=initial threshold on log energy contour
%   zcthresh=threshold on zero crossing rate contour
%
% Outputs
%   beginf: estimate of initial frame
%   endf: estimate of final frame

% clear peak1 and peak2 arrays
    clear peak1 peak2;

% normalize log energy contour so that peak is at 0 db
    logem=max(loge);
    loge(find(loge < logem - 60))=logem-60;
    logen=loge-logem;
    
% force first frame to be below threshold
    if (logen(1) > -ethresh-1) logen(1)=-ethresh-1;
    end
    
% force last frame to be below threshold
    if (logen(nfrm) > -ethresh-1) logen(nfrm)=-ethresh-1;
    end
    
% using threshold of 0 (dB) -thresh, find the strongest centroid and zero
% out the region for future checks
% peak1 is the lower peak, peak2 is the higher peak
    peak=find(logen == 0);
    peaklow=find(logen(1:peak(1)-1) < -ethresh);
    peak1(1)=peaklow(length(peaklow));
    peakhi=find(logen(peak(1)+1:nfrm) < -ethresh);
    peak2(1)=peakhi(1)+peak(1);
    
% zero out the energy pulse region
    logen(peak1(1):peak2(1))=-100;
    
% save regions in terms of peak1 and peak2
    isav=1;
    iend=0;
    
% iterate search for additional energy centroids
    while (iend == 0)
        logem=max(logen);
        if (logem < -ethresh) iend=1;
        else
            isav=isav+1;
            peak=find(logen == logem);
            peaklow=find(logen(1:peak(1)-1) < -ethresh);
            peak1(isav)=peaklow(length(peaklow));
            
            peakhi=find(logen(peak(1)+1:nfrm) < -ethresh);
            peak2(isav)=peakhi(1)+peak(1);
            
            if (peak2(isav)-peak1(isav) < 5)
                peak1(isav)=0;
                peak2(isav)=0;
                isav=isav-1;
                iend=1;
            else
                logen(peak1(isav):peak2(isav))=-100;
            end
        end
    end
    
% search for high zero crossings regions
    iend=0;
    isav1=isav;
    zcs=zc;
    while (iend == 0)
        zcm=max(zcs);
        peak=find(zcs == zcm);
        if (zcm < zcthresh || peak(1) < 5 || peak(1) > nfrm-5) 
            iend=1;
        else
            isav=isav+1;
            peaklow=find(zcs(1:peak(1)-1) < zcthresh);
            peak1(isav)=peaklow(length(peaklow));
            peakhi=find(zcs(peak(1)+1:nfrm) < zcthresh);
            peak2(isav)=peakhi(1)+peak(1);
            if (peak2(isav)-peak1(isav) < 5)
                peak1(isav)=0;
                peak2(isav)=0;
                isav=isav-1;
                iend=1;
            else
                zcs(peak1(isav):peak2(isav))=0;
            end
        end
    end
    
% determine final endpoints
    peak1s=sort(peak1(1:isav));
    peak2s=sort(peak2(1:isav));
    beginf=peak1s(1);
    endf=peak2s(isav);
    
% plot waveform, log energy, zero crossings, endpoints
% clear graphics Panel 3
    reset(graphicPanel3);
    axes(graphicPanel3);
    cla;
    
% titleBox1 displays fname and signal processing parameters
    fname=fullPAth;
    fname(find(fname == '_'))=' ';
    s1=sprintf('file:%s,fs:%d, L,R: %d, %d,',fname,fs,L,R);
    s2=sprintf(' ethresh:%d, zcthresh:%d ',ethresh,zcthresh);
    s3=sprintf(', beginf: %d, endf: %d ',beginf,endf);
    stitle=strcat(s1,s2,s3);
    
% setup textBox1
    stitle1=strcat('Endpoint Detector -- ',stitle);
	set(titleBox1,'String',stitle1);
	set(titleBox1,'FontSize',16);
    
% normalize speech signal to range [-1 +1]
    ym=max(abs(y));
    y=y/ym;
    
% align samples of waveform with frames of representation
    ss1=L/2+1-R;
% check that ss1 doesn't go negative; check that es1 doesn't exceed length
% of speech file
    if (ss1 < 1) ss1=1; end
    es1=L/2+1+nfrm*R;
    if (es1 > length(y)) es1=length(y); end

    xpp=['Time in Samples; fs=',num2str(fs),' samples/second'];
    plot(ss1:es1,y(ss1:es1),'b'),xlabel(xpp),...
        ylabel('amplitude'),grid on, axis tight;
    hold on; ssbeg=(beginf-1)*R+L/2+1; ssend=(endf-1)*R+L/2+1;
    xx=[ssbeg ssbeg]; yy=[min(y) max(y)]; plot(xx,yy,'k','LineWidth',2);
    xx=[ssend ssend]; plot(xx,yy,'k','LineWidth',2);
    axis([ss1 es1 min(y) max(y)]);

% clear graphics Panel 2
    reset(graphicPanel2);
    axes(graphicPanel2);
    cla;
    
% plot log energy contour in graphics Panel 2
    plot(1:nfrm,loge,'r','LineWidth',2),xlabel('Frame Number'),...
        ylabel('log energy (dB)'),hold on,grid on;
    
% plot each log energy centroid beginning and ending frames
        for index=1:isav1
            xx=[peak1(index) peak1(index)];
            yy=[max(loge) min(loge)];
            plot(xx,yy,'g:','LineWidth',2);
            xx=[peak2(index) peak2(index)];
            plot(xx,yy,'b:','LineWidth',2);
        end
    
% plot beginning and ending frame lines
        xx=[beginf beginf];
        plot(xx,yy,'k','LineWidth',2);
        xx=[endf endf];
        plot(xx,yy,'k','LineWidth',2);
 
% plot log energy threshold
        xx=[1 nfrm];
        yy=[max(loge)-ethresh max(loge)-ethresh];
        plot(xx,yy,'r:','LineWidth',2); axis tight;
        axis([0 nfrm+1 min(loge) max(loge)]);
        
% clear graphics Panel 1
    reset(graphicPanel1);
    axes(graphicPanel1);
    cla;
    
% plot zero crossings rate contour in graphics Panel 1
    plot(1:nfrm,zc,'r','LineWidth',2),xlabel('Frame Number'),...
        ylabel('zc rate'),hold on,grid on;
    
% plot each zero crossing centroid beginning and ending frames
    for index=isav1+1:isav
        xx=[peak1(index) peak1(index)];
        yy=[max(zc) min(zc)];
        plot(xx,yy,'g:','LineWidth',2);
        xx=[peak2(index) peak2(index)];
        plot(xx,yy,'b:','LineWidth',2);
    end
    
% plot beginning and ending frame lines
        xx=[beginf beginf];
        yy=[max(zc) min(zc)];
        plot(xx,yy,'k','LineWidth',2);
        xx=[endf endf];
        plot(xx,yy,'k','LineWidth',2);
        
% plot zero crossing threshold
        xx=[1 nfrm];
        yy=[zcthresh zcthresh];
        plot(xx,yy,'r:','LineWidth',2);
        axis([0 nfrm+1 min(zc) max(zc)]);
end

% Callback for button13 -- file for saving endpointed speech
    function button13Callback(h,eventdata)
        fileName=get(button13,'string');
    end

% Callback for button12 -- Save Endpointed Speech in file fileName.wav;
% scale file so that peak is less than 1.0 (avoid saturation of quantizer)
    function button12Callback(h,eventdata)
        
% use uigetdir to choose directory in which to save the speech file
%   newFolder: directory in which to save the speech file
%   oldFolder: directory in which current code exists
        newFolder=uigetdir(cd);
        oldFolder=cd(newFolder);
        y=y/max(abs(y))*0.99;
        wavwrite(y,fs,16,fileName);
        cd(oldFolder);
    end

% Callback for button8 -- close GUI
 function button8Callback(h,eventdata)
     close(gcf);
 end
end