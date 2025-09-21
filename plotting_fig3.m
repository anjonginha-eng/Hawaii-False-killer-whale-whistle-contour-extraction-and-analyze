clc;
clear;
close all;

load("HPF.mat");
load('sample1.mat');

[sig,fs2]=audioread('1705_20171103_000635_105.flac');


resample_rate = 10;
data2 = resample(sig(:,1),1,resample_rate);
data3 = filter(HPF,1,data2);
fs=fs2/resample_rate;
[s,f,t] = spectrogram((data3),4096,4000,4096,fs);

for idx = 1:6

figure(idx);imagesc(t,f,mag2db(abs(s)));colormap jet;
set(gca, 'YDir', 'normal');
colormap winter;
%
if idx == 1
% flat
axis([18.4 18.7 4e3 6.5e3]);
caxis([-25 -5]);
colorbar;
xticks([18.4 18.55 18.7]);
xticklabels({'18.4','18.55','18.7'});
yticks([4e3 5.25e3 6.5e3]);
yticklabels({'4','5.25','6.5'});
xlabel('Time (s)');
ylabel('Frequency (kHz)')
set(gca, 'FontSize', 12);

elseif idx == 2
% sin
axis([36.9 37.6 7.8e3 8.7e3]);
caxis([-25 -5]);
colorbar;
xticks([36.9 37.3 37.6]);
xticklabels({'36.9','37.3','37.6'});
yticks([7.8e3 8.2e3 8.7e3]);
yticklabels({'7.8','8.2','8.7'});
xlabel('Time (s)');
ylabel('Frequency (kHz)')
set(gca, 'FontSize', 12);

elseif idx == 3
% down
axis([2 2.8 3.5e3 6e3]);
caxis([-25 -5]);
xticks([2 2.4 2.8]);
xticklabels({'2','2.4','2.8'});
yticks([3.5e3 4.75e3 6e3]);
yticklabels({'3.5','4.75','6'});
xlabel('Time (s)');
ylabel('Frequency (kHz)')
set(gca, 'FontSize', 12);

elseif idx == 4
% up
axis([3.6 4.3 4e3 5.2e3]);
caxis([-25 -5]);
xticks([3.6 3.9 4.3]);
xticklabels({'3.6','3.9','4.3'});
yticks([4e3 4.6e3 5.2e3]);
yticklabels({'4','4.6','5.2'});
xlabel('Time (s)');
ylabel('Frequency (kHz)')
set(gca, 'FontSize', 12);

elseif idx == 5
% u
axis([39.5 40.2 8e3 8.6e3]);
caxis([-25 -5]);
xticks([39.5 39.8 40.2]);
xticklabels({'39.5' '39.8' '40.2'});
yticks([8e3 8.3e3 8.6e3]);
yticklabels({'8','8.3','8.6'});
xlabel('Time (s)');
ylabel('Frequency (kHz)')
set(gca, 'FontSize', 12);

elseif idx == 6
%invert - u 
axis([1.7 2.4 5.6e3 7.2e3]);
caxis([-25 -5]);
xticks([1.7 2 2.4]);
xticklabels({'1.7' '2' '2.4'});
yticks([5.6e3 6.4e3 7.2e3]);
yticklabels({'5.6','6.4','7.2'});
xlabel('Time (s)');
ylabel('Frequency (kHz)')
set(gca, 'FontSize', 12);
end

end
