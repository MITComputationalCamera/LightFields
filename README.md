LightField Photography
======================


Please read the Lightfield Camera papers very carefully.
http://graphics.stanford.edu/papers/CameraArray/


Digital refocusing using photos taken by an array of cameras is easy. If you compute an average of all the photos, the digital focus is at infinity. If you shift each photo cumulatively, e.g. shift each photo a pixel with respect to its immediate left neighbor, and then compute an average, the focus plane is closer. This simple shift+add strategy is sufficient to achieve reasonable refocusing effects.



Homework Assignment
===================

For this assignment, you will be showing refocussing and see-thru effects by using multiple image lightfields. See examples at http://lightfield.stanford.edu/lfs.html (click on 'View Lightfield Online')
http://lightfield.stanford.edu/aperture.html

(a) To start and test the code provided, you can use the photos from: http://web.media.mit.edu/~gordonw/SyntheticLightFields/DragonAndBunnies_camera.zip as input. Use only images along the horizontal translation. You will test your code on this dataset.

(b) For the assignment, you will use your own images. Translate a camera and take photos at fixed distance intervals (try 5-7 photos). Place the camera on a ruler for precise positioning. You are trying to imitate a camera array. 

You will be doing all of this in MATLAB. Be sure to use high depth complexity, colorful, point specular (spherical) objects in your images.

Be creative with camera configurations, maybe with very large baseline or with a microscope. 

You can also use unstrcutured positions and use a calibration target (or structure from motion or photosynth software) to find the positions.
(More projects http://graphics.stanford.edu/projects/lightfield/ )

Tasks
-----
Please use the code hosted above (You will not need to write huge blocks of code. Simply tweak the existing code as you see fit to perform the tasks below).

Part 1: Programmable focus and with your OWN images (60 pts):
Using the attached MATLAB code, compute images with planes of focus at different depths (shift each photo by a specific amount successively and compute an average).
- A) Digitally focus at infinity (simply take the average of all photos)
- B) Digitally focus on back plane (simply shift some and average)
- C) Digitally focus on front plane (simply shift more and average)
This is the key part of this assignment: The Output2 should demonstrate a see-thru effects.


Part 2: OPTIONAL Extra Credit (+8pts)
- A) Implement these concepts as an Android app


Part 3: OPTIONAL additional activities (+2 each)
- A) Find depth of each pixel using max-contrast operator
- B) See-thru effect by elminating foreground color pixels
For rejecting a given plane, instead of taking average of 16 values, take the majority vote.
Median of 16 values will work in some cases, but the most common value will be a more robust choice.
If there is no clear majority, i.e. if the most common count is say below 5, set the pixel to black.
- C) Compute images with variable depth of field (Use fewer photos picked from near the center position. Fewer photos means a larger depth of field.)
- D) Compute images with slanted plane of focus
(scheimpflug principle http://en.wikipedia.org/wiki/Scheimpflug_principle )
http://graphics.stanford.edu/papers/shear-warp/
- E) Create new bokeh (point spread function)


Submission
==========
MIT/Skoltech Students:
Submit all output for each part above on Stellar (Label the file with the "Part" number, e.g. Part1a, Part1b, etc.). Also post your final images to the FB page.

Online Students:
Post your final images to the FB Page
