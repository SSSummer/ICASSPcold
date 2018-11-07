%Just run this file 'runMe',you can obtain the result.
%       Calculates each speakers's recognition rate in different templates over
% time and plot all results;
%
% Loads:    
%   
%   - gmm2s/5s/10s  : We have trained GMM models using 2s(5s/10s) voice data
%   - allName.mat   : A structure array of all speakers'name
%
% Outputs:
%   - The figure of the mean recognition rate based on the different model(gmm2s~gmm10s);

%	Yifeng Wang, 20181101

clear
clc


load gmm5s
load gmm10s
load gmm2s
load allName.mat

waveDir='.\test2res';%The directory contains the mfcc parameters of each speaker we have obtained.
sentenceNumPerSpeaker=1000;				
fprintf('Get info of all wave files...\n');
resData=speakerDataRead(waveDir, sentenceNumPerSpeaker);
fprintf('Read wave files and plot the fig...\n');
typeNum=length(resData);
fprintf('Read wave files and plot the fig...\n');
for i=1:typeNum
	fprintf('%d/%d: Plot fig from  recordings by\n', i, typeNum);
    %res2~10 is used to store the mean recognition rate of 9 people over time under
    %the model(gmm2s~gmm10s);
    res2=zeros(length(allName),21);
    res5=zeros(length(allName),21);
    res10=zeros(length(allName),21);
    
    perSeconDir = dir([waveDir,'\',resData(i).name,'/*.mat']);
	for j=1:length(perSeconDir)  
       targetFile=[waveDir,'\',resData(i).name,'\',perSeconDir(j).name]
       load([targetFile]);
       fprintf('Start the %d th speaker...\n',j);
       
       %% Caculate the recognition rates based on the different model(gmm2s~gmm10s);
       [testReswyf5s]=speakerIdentifyPer_wyf(j,testData(),allName(), gmm5s());
       [testReswyf2s]=speakerIdentifyPer_wyf(j,testData(),allName(), gmm2s());
       [testReswyf10s]=speakerIdentifyPer_wyf(j,testData(),allName(), gmm10s());
       
      
       res5(j,:)=cat(1,testReswyf5s.rightRate);    
       res2(j,:)=cat(1,testReswyf2s.rightRate);           
       res10(j,:)=cat(1,testReswyf10s.rightRate);    
       
    end  
end
 %% Caculate the mean recognition rate of 9 speakers.
allDayMean2=mean(res2);
allDayMean5=mean(res5);
allDayMean10=mean(res10);

%% Plot the mean recognition rate based on the different model(gmm2s~gmm10s);
figure;

p(1)=plot(allDayMean2);
hold on;
p(2)=plot(allDayMean5);
hold on;
p(3)=plot(allDayMean10);
xlabel('Days from the template registration');
ylabel('Recognition rate of nine speakers over time');
p(1).LineWidth=2;
p(1).Marker='*';
p(2).LineWidth=2;
p(2).Marker='o';
p(3).LineWidth=2;
p(3).Marker='s';

xlim([0,22]);
tick={'0' '4' '8' '12' '16' '20' '24' '28' '32' '36' '40' '44'};
set(gca,'XTickLabel',{'0' '4' '8' '12' '16' '20' '24' '28' '32' '36' '40' '44'});
legend('2s','5s','10s');
set(gca,'FontSize',20);

fprintf('All Done!!\n');


