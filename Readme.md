# Brain Tumor Segmentation Using Digital Image Processing Techniques

This repository includes source code for brain tumor segmentation and its area calculation. Database of testing images is provided too. Download following files.

  - SourceCode2.m
  - database.rar
  

# Learning Outcomes!

  - Reading an image
  - Thresholding using Otsu's method
  - Region props
  - Morphological operations
  - Density and area calculation of the Mass part in image
  - Segmentation of tumor



### Abstract
Cerebrum Tumor is a deadly illness which can't be unquestionably identified without MRI. In the venture, it is attempted to recognize whether patient's cerebrum has tumor or not from MRI picture utilizing MATLAB reenactment. To prepare for morphological activity on MRI picture, it was resized and using a limit esteem picture was changed over to a high contrast picture physically. This essential channel the conceivable areas for tumor nearness. On this semi prepared picture morphological tasks have been applied and data on strength and territories of the conceivable areas was acquired. A base estimation of both of this characters has been resolved from measurable normal of various MRI pictures containing tumor. At that point it was utilized to convey last location result. In spite of the fact that this recreation routine can give right outcome more often than not, it neglects to perform when tumor's size is excessively little or tumor is empty. The bigger objective of the task is to fabricate an information base of 2D picture information of tumor from the MRI pictures taken from various edge of a specific human and by examining them to call attention to the careful 3D area of the tumor. To satisfy this, 2D tumor recognition and division have been created to better precision with the goal that 3D identification can be increasingly dependable. This is the essential objective of the task.


### Methodology

> 1) Taking an MRI Image as input
> 2) Thresholding the image using  Basic Global algorithm & Otsu’s Method
> 3) Processing image  properties in detail using  regionprops and Morphological Operation
> 4) Confirmation of tumor based on density and area
> 5) If no Tumor end processing
> 6) Else segmentation of tumor in the image by particular border and calculate area

