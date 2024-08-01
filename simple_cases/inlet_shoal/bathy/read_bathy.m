clearvars, clc;
% Assuming the data is stored in a text file 'data.txt'
% and it is read column by column

% Open the file for reading
fileID = fopen('dep_shoal_inlet.txt', 'r');

% Define Mglob and Nglob
Mglob = 512; 
Nglob = 1024; 

% Initialize the Depth array
Depth = zeros(Mglob, Nglob);

% Read the data column by column
for J = 1:Nglob
    for I = 1:Mglob
        Depth(I, J) = fscanf(fileID, '%f', 1);
    end
end

% Close the file
fclose(fileID);

% Display the Depth array
disp(Depth);

% Plots >>

% >>>> imagesc
% imagesc(Depth);
% 
% % Add a color bar to indicate the scale
% colorbar;
% 
% % Add labels and title
% xlabel('Y');
% ylabel('X');
% title('Matrix Visualization using imagesc');


% % >>>>> surf: Plot the matrix as a 3D surface (surf) 
% surf(Depth);
% 
% % Add labels and title
% xlabel('Column Index');
% ylabel('Row Index');
% zlabel('Depth Value');
% title('Matrix Visualization using surf');


% % >>>> contour: Plot the matrix as a contour plot
% contour(Depth);
% 
% % Add labels and title
% xlabel('Column Index');
% ylabel('Row Index');
% title('Matrix Visualization using contour');

% >>>> pcolor Plot the matrix as a pseudocolor plot

pcolor(Depth);

% Add a color bar to indicate the scale
colorbar;

% Add labels and title
xlabel('Column Index');
ylabel('Row Index');
title('Matrix Visualization using pcolor');

% h.EdgeColor = 'none';
shading interp;


% % >>>> heatmap: Plot the matrix as a heatmap
% heatmap(Depth);
% 
% % Add labels and title
% xlabel('Column Index');
% ylabel('Row Index');
% title('Matrix Visualization using heatmap');




% Plots <<
