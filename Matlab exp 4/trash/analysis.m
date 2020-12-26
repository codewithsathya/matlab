function [energy,zerocrossings,nfrm]=analysis(xin,L,R,fs)
%
% function to compute log energy and zero crossing contours of speech file
%
% Inputs:
%   xin=input speech array
%   L=size of analysis frame in samples
%   R=size of analysis frame shift in samples
%   fs=speech signal sampling frequency in Hertz
%
% Outputs:
%   energy=log energy contour of full utterance
%   zerocrossings = normalized (per 10 msec) zero crossings contour for utterance
%   nfrm=number of frames in original utterance

% perform computation of short-time log energy and zero crossing rate
    nsamples=length(xin);
    ss=1;
    energy=[];
    zerocrossings=[];
    while (ss+L-1 <= nsamples)
        frame=xin(ss:ss+L-1).*hamming(L);
        energy=[energy 10*log10(sum(frame.^2))];
        zerocrossings=[zerocrossings sum(abs(diff(sign(frame))))];
        ss=ss+R;
    end
    nfrm=length(energy);
    zerocrossings=zerocrossings*fs/(200*L);
end