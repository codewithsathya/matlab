function y=highpass_filter_signal(x,fsout);
%
% function to utilize a pre-designed highpass filter to eliminate DC
% offset and 60 Hz hum in a speech or audio recording
%
% Inputs:
%   x: input signal to be filtered
%   fsout: sampling rate of signal
%
% Output:
%   y: highpass filtered speech
    
% determine name of .mat file with filter coefficients and load filter
% coefficients
    if (fsout == 6000) n=200;
    elseif (fsout == 6667) n=250;
    elseif (fsout == 8000) n=300;
    elseif (fsout == 10000) n=350;
    elseif (fsout == 16000) n=600;
    elseif (fsout == 20000) n=700;
    else
        fprintf('sampling rate incorrect \n');
        pause
    end
    filter_file=['hpf_fsout_',num2str(fsout),'_n_',num2str(n),'_fstop_',...
        num2str(100),'.mat'];
    load (filter_file);
    
% append zeros to signal input of length the same as the filter
    xin=[x' zeros(1,n)];
    
% filter input signal with filter coefficients
    xout=filter(b,1,xin);
    
% offset output samples by length of filter impulse response, n
    nl=length(x);
    y(1:nl)=xout(n:n+nl-1);
end
    

    