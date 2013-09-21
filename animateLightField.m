lightFieldResolution = size(lightField);
    

% indices for animation
centerY     = round(lightFieldResolution(1)/2);
indicesY    = centerY:-1:1;
indicesY    = [indicesY 2:lightFieldResolution(1)];
indicesY    = [indicesY lightFieldResolution(1)-1:-1:centerY];

centerX     = round(lightFieldResolution(2)/2);
indicesX    = centerX:-1:1;
indicesX    = [indicesX 2:lightFieldResolution(2)];
indicesX    = [indicesX lightFieldResolution(2)-1:-1:centerX];

numColorChannels = 1;
if numel(lightFieldResolution) > 4
    numColorChannels = lightFieldResolution(5);
end

frameCount = 1;
pauseTime = 0.1;

for kx=indicesX   
    
    I = reshape(lightField(centerY,kx,:,:,:), [lightFieldResolution(3) lightFieldResolution(4) numColorChannels]);
    imshow(I);
    
    drawnow;
    pause(pauseTime);    
    
    frameCount=frameCount+1;
end

for ky=indicesY
    
    I = reshape(lightField(ky,centerX,:,:,:), [lightFieldResolution(3) lightFieldResolution(4) numColorChannels]);

    imshow( I );
    
    drawnow;
    pause(pauseTime);   
    
    frameCount=frameCount+1;
end

