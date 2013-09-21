% -2:0.5:1
%   load('LightField4D.mat');
%   drawLightField4D(lightField);
%   imshow(refocusLightField(lightField,-2));
%   animateLightField

function [Iout lightFieldOut] = refocusLightField(lightField, pixels)
    
    Iout = zeros([size(lightField,3) size(lightField,4) 3]);
    
    [XX YY] = meshgrid(1:size(lightField,4), 1:size(lightField,3));
    
    for ky=1:size(lightField,1)
        for kx=1:size(lightField,2)


            II = reshape(lightField(ky,kx,:,:,:), [size(lightField,3) size(lightField,4) 3] );
            for k=1:3
                I(:,:,k) = interp2(XX,YY,II(:,:,k), XX + pixels*(kx-(floor(size(lightField,2)/2)+1)), YY - pixels*(ky-(floor(size(lightField,1)/2)+1)), 'linear', 1);
            end
            Iout = Iout + (1/(size(lightField,2)*size(lightField,1))) .* I;
            
            if nargout>1
                lightFieldOut(ky,kx,:,:,:) = reshape(I, [1 1 size(lightField,3) size(lightField,4) 3]);
            end
        end
    end
    
end
