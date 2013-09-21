LightField Photography
======================


Please read the Lightfield Camera papers very carefully.
http://graphics.stanford.edu/papers/CameraArray/


Digital refocusing using photos taken by an array of cameras is easy. If you compute an average of all the photos, the digital focus is at infinity. If you shift each photo cumulatively, e.g. shift each photo a pixel with respect to its immediate left neighbor, and then compute an average, the focus plane is closer. This simple shift+add strategy is sufficient to achieve reasonable refocusing effects.



Homework Assignment
===================
Assignment Overview:

(a) Use the photos from: http://web.media.mit.edu/~gordonw/SyntheticLightFields/DragonAndBunnies_camera.zip as input. Use only images along the horizontal translation. You will test your code on this dataset.

(b) Translate camera and take photos at fixed distance intervals. Place the camera on a ruler (or create a Lego Robot) for precise positioning. You are trying to imitate a camera array. Ideally, control the camera using a RemoteCapture software from your computer. Take 16 photos. Choose objects with vibrant bright saturated colors. If you cannt think of a scene, try this. The forground scene is a flat red colored paper with see through vertical stripes creating a FENCE. Background scene is a flat book cover or painting with very little red in it.

(c) Show refocussing and see-thru effects
See examples at http://lightfield.stanford.edu/lfs.html (click on 'View Lightfield Online')
http://lightfield.stanford.edu/aperture.html

You will be doing all of this in MATLAB. Be sure to use high depth complexity, colorful, point specular (spherical) objects in your images.

To create multiple camera views, you can also aim at an array of mirrors, put the camera on a robot or x-y platform.

Be creative with camera configurations, maybe with very large baseline or with a microscope. 

You can also use unstrcutured positions and use a calibration target (or structure from motion or photosynth software) to find the positions.

(More projects http://graphics.stanford.edu/projects/lightfield/ )


You can also create a lightfield with a flatbed scanner+lenticulars (http://groups.csail.mit.edu/graphics/pubs/thesis_jcyang.pdf) or masks (http://raskar.info/Mask)


Tasks
-----

Part 1: Programmable focus (60 pts):
Using the attached MATLAB code, compute images with planes of focus at different depths (shift each photo by a specific amount successively and compute an average).
- Output1: Digitally focus at infinity (average of all photos)
- Output2: Digitally focus on back plane (shift some and average)
- Output3: Digitally focus on front plane (shift more and average)
This is the key part of this assignment: The Output2 should demonstrate a see-thru effects.


Part 2: Extra Credit and Completely Optional (+12pts)
- implement these concepts as an Android app
- Find depth of each pixel using max-contrast operator
- See-thru effect by elminating foreground color pixels
For rejecting a given plane, instead of taking average of 16 values, take the majority vote.
Median of 16 values will work in some cases, but the most common value will be a more robust choice.
If there is no clear majority, i.e. if the most common count is say below 5, set the pixel to black.
- Compute images with variable depth of field (Use fewer photos picked from near the center position. Fewer photos means a larger depth of field.)
- Compute images with slanted plane of focus
(scheimpflug principle http://en.wikipedia.org/wiki/Scheimpflug_principle )
http://graphics.stanford.edu/papers/shear-warp/
- Create new bokeh (point spread function)


Submission
==========
MIT/Skoltech Students:
Submit all input images, source code and output for each part above on Stellar. Also post your final images to the FB page.

Online Students:
Post your final images to the FB Page
