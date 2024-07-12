clear all
fdir='/Users/polselli/Code/funwave/FUNWAVE-TVD/simple_cases/surface_wave_1d/output_files_reg/';

m=1024;
dx=1.0;
SLP=0.05;
Xslp = 800.0;

% bathy
x=[0:m-1]*dx;
dep=zeros(m)+10.0;
dep(x>Xslp)=10.0-(x(x>Xslp)-Xslp)*SLP;

% wavemaker and sponge
wd=10;
x_wm=[250-wd 250+wd 250+wd 250-wd 250-wd];
x_sponge=[0 180 180 0 0]; 
yy=[-10 -10 10 10 -10];

wid=8;
len=4;
set(gcf,'units','inches','paperunits','inches','papersize', [wid len],'position',[1 1 wid len],'paperposition',[0 0 wid len]);
clf

outputDir = [fdir '../postprocessing/output/m'];
files = dir(strcat(fdir, 'eta_*'));

close all;
for i = 1:numel(files)
    fig = figure;
    disp(['Processing file ', num2str(i), ': ', files(i).name]);
    eta=load([fdir files(i).name], "-ascii");
    plot(x,-dep,'k',x,eta,'b','LineWidth',2)
    hold on
    plot(x_wm,yy,'r')
    text(x_wm(2),0.6,'wavemaker','Color','r','LineWidth',2)
    plot(x_sponge,yy,'k')
    text(x_sponge(1)+20,0.6,'sponge layer','Color','k','LineWidth',2)
    axis([0 1024 -1 1])
    grid
    xlabel('x(m)')
    ylabel('eta(m)')
    outputFile = fullfile(outputDir, sprintf('eta_1d_wave_%s.png', files(i).name));
    saveas(fig, outputFile);
    %close(fig);
end