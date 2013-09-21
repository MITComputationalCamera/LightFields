%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Draw a light field as a 2D array of 2D images. If mode is 0 or no 
%   arguments are given, this will be plotted so that the individual 
%   subplots show the different views. If mode is 1 the subplots will show
%   the different directions at some spatial location.
%
%   Currently, the version where we see all directions per pixel is
%   aliased, this should be 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function lfImage = drawLightField4D(lightField, mode, pixelSpacing)
    
    % use full resolution
    bFullResolution = true;

    % get resolution of light field
    bMonochrome = false;
    lightFieldResolution = size(lightField);
    if numel(lightFieldResolution) < 5
        lightFieldResolution = [lightFieldResolution 1];
        bMonochrome = true;
    end

    if nargin < 2
        mode            = 1;        
    end
    if nargin < 3
        pixelSpacing    = 0;
    end

	subplotSize     = [lightFieldResolution(1) lightFieldResolution(2)];
    columnOffset    = 0;
            
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % mode 1 - draw individual views in subplots
    
    if mode == 1
        
        % initialize output image if desired
        if nargout > 0
            
            % number of super-pixels in the image
            if ~bFullResolution
                subplotResolution = floor([lightFieldResolution(3)/lightFieldResolution(1) lightFieldResolution(4)/lightFieldResolution(2)]);                        
            else
                subplotResolution = [lightFieldResolution(3) lightFieldResolution(4)];                        
            end
            
            % initialize image
            lfImage = zeros( [  subplotResolution(1)*lightFieldResolution(1) + (lightFieldResolution(1)+1)*pixelSpacing ... 
                                subplotResolution(2)*lightFieldResolution(2) + (lightFieldResolution(2)+1)*pixelSpacing ...
                                lightFieldResolution(5)] );
        end
    
        % keep track of current subplot index
        subplotIndex    = 1+columnOffset;

        for ky=1:lightFieldResolution(1)
            for kx=1:lightFieldResolution(2)      
                
                % extract current view
                if ~bMonochrome
                    currentView = reshape(lightField(ky,kx,:,:,:), [lightFieldResolution(3) lightFieldResolution(4) lightFieldResolution(5)]);
                else
                    currentView = reshape(lightField(ky,kx,:,:), [lightFieldResolution(3) lightFieldResolution(4)]);
                end

                % draw it here if no output arguments are desired, otherwise 
                % populate the resulting image
                if nargout == 0
                    subplot(subplotSize(1), subplotSize(2), subplotIndex);            
                    imagesc( currentView, [0 1]);                    
                    set(gca, 'XTick', [], 'YTick', []);
                    axis equal;                    
                else                    
                    idxYSpacing = (ky-1)*(subplotResolution(1)+pixelSpacing) + 1 + pixelSpacing;
                    idxXSpacing = (kx-1)*(subplotResolution(2)+pixelSpacing) + 1 + pixelSpacing;                    
                    lfImage( idxYSpacing:idxYSpacing+subplotResolution(1)-1, idxXSpacing:idxXSpacing+subplotResolution(2)-1, :) = imresize(currentView, subplotResolution, 'nearest');                    
                end

                % update subplot index for next one
                subplotIndex = subplotIndex + 1;
            end
            subplotIndex = ky*subplotSize(2) + 1 + columnOffset;
        end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % mode 2 - draw all directions for each pixel in a subplot
    
    else
        
        % number of super-pixels in the image
        if ~bFullResolution
            stepSize = [lightFieldResolution(1) lightFieldResolution(2)];
        else
            stepSize = [1 1];
        end
        
        numSubplots = floor([lightFieldResolution(3)/stepSize(1) lightFieldResolution(4)/stepSize(2)]); 
        
        % initialize image
        lfImage = zeros( [  numSubplots(1)*lightFieldResolution(1) + (numSubplots(1)+1)*pixelSpacing ... 
                            numSubplots(2)*lightFieldResolution(2) + (numSubplots(2)+1)*pixelSpacing ...
                            lightFieldResolution(5)] );                       
        count = 1;
        for ky=1:numSubplots(1)
            idxY        = (ky-1)*stepSize(1) + 1;
            idxYSpacing = (ky-1)*(lightFieldResolution(1)+pixelSpacing) + 1 + pixelSpacing;
            for kx=1:numSubplots(2)
                idxX        = (kx-1)*stepSize(2) + 1;
                idxXSpacing = (kx-1)*(lightFieldResolution(2)+pixelSpacing) + 1 + pixelSpacing;
                             
                if ~bMonochrome
                    lfImage( idxYSpacing:idxYSpacing+lightFieldResolution(1)-1, idxXSpacing:idxXSpacing+lightFieldResolution(2)-1, : ) = ...
                        reshape(lightField(:,:,idxY,idxX,:), [lightFieldResolution(1) lightFieldResolution(2) lightFieldResolution(5)]);
                else
                    lfImage( idxYSpacing:idxYSpacing+lightFieldResolution(1)-1, idxXSpacing:idxXSpacing+lightFieldResolution(2)-1 ) = ...
                        reshape(lightField(:,:,idxY,idxX), [lightFieldResolution(1) lightFieldResolution(2)]);
                end
                
                count = count+1;
            end
        end
        
        % draw it here if no output arguments are desired, otherwise just
        % return the image
        if nargout == 0
            imagesc(lfImage);
            set(gca, 'XTick', [], 'YTick', []);
            axis equal;
        end
        
    end
    
    if nargout == 0
        colormap gray;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end