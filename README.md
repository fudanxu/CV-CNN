Complex-Valued Convolutional Neural Network and Its Application in PoSAR Image Classification   

Requirements:   
Matlab   

Experimental steps:     
The test demo is on Flevoland dataset acquired by the AIRSAR sensor with L band.   
run ./Test Demo/TestDemo.m to evaluate the performance of the CV-CNN in PolSAR image classification    
    
The CV-CNN folder stores the implementation process of CV-CNN.    

Reference: This CV-CNN code is created based on the DeepLearnToolbox, which is a real CNN open source toolbox.     
https://github.com/rasmusbergpalm/DeepLearnToolbox    

Datatsets:
The datasets adopted in our paper "Complex-Valued Convolutional Neural Network and Its Application in PoSAR Image Classification" can be downloaded by the website "https://earth.esa.int/web/polsarpro/data-sources/sample-datasets".
Meanwhile, the corresponding ground truth has been uploaded in this project.

Remark: The ground truth of Flevoland-1989 containing 14 classes is Label_Flevoland_14cls.mat     
        The ground truth of Flevoland-1991 containing 15 classes is Label_Flevoland_15cls.mat     
        The ground truth of Oberpfaffenhofen, Germany is Label_Germany.mat
