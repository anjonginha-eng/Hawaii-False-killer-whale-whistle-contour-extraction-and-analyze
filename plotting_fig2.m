clc;
clear;
close all;

load("HPF.mat");
load('sample1.mat');

[sig,fs2]=audioread('1705_20171103_000635_105.flac');


resample_rate = 10;

for idx = 1:6
data2 = resample(sig(:,idx),1,resample_rate);
data3(:,idx) = filter(HPF,1,data2);

fs=fs2/resample_rate;

[s,f,t] = spectrogram((data3(:,1)),4096,4000,4096,fs);
figure(idx);imagesc(t,f,mag2db(abs(s)));colormap jet;
set(gca, 'YDir', 'normal');
colormap winter;
caxis([max(max(mag2db(abs(s))))-30 max(max(mag2db(abs(s))))-10]);

for idx1 = 1:length(data)

    array_id = data(idx1).array;
   if array_id == idx
    t0 = data(idx1).time;
    f0 = data(idx1).freq;
    Q0 = data(idx1).Quality;
    
      if Q0(1) == 'A'
        hold on;figure(idx);plot(t0,f0,':r',LineWidth=2);
      elseif Q0(1) == 'D'
        hold on;figure(idx);plot(t0,f0,':r',LineWidth=2);
      end
   end
end

axis([43 45 2e3 15e3]);
colorbar;
caxis([-30 -5]);
xlabel('Time (s)');
ylabel('Frequency (s)');

yticks([5e3  1e4  1.5e4 2e4])
yticklabels({'5','10','15','20'})

xticks([43 44 45])
xticklabels({'43','44','45'})
end
