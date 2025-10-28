# Dual-layer-steganography---matlab-code
You will find the associated code to our research paper, titled “Enhanced Data Security through Dual-Layer Steganography: Integrating LSB and DCT Techniques“, and accessible for free. This repository includes comprehensive documentation and step-by-step instructions to facilitate the replication of our work.

# Description
--------
This code is developed to train the experimental aims of this research. To evaluate the Dual-layer embedding process. The related work, titled "...........................", involve two different layers and combine the concept of watermark and steganography.

## Running this code
Note that for each layer the coder should be run in the following order:
	1.Layer one: secret data (S) into the Watermark (W)
	  Make sure all following files are included in the same folder.
	   - lsb_main.m
	   - lsb_embedding.m : this code is designed to embed the secret data into the chosen watermark.
	   - lsb_extraction.m : this code is deigned to extract the secret message from the extracted 
       stego-watermark (SW) in the first layer extraction process of this approach.
       
  2.  Layer two: Stego-watermark (SW) into the Cover image (CI)
	  Make sure all following files are included in the same folder.
	   - EncodingImage.m
    	   - Embedding.m
    	   - Converting.m
    	   - Decoding.m
    	   - Displaying.m
    	   But make sure that all the files are in the same folder including 
    	   - CosineTransform.m
    	   - InverseCosineTransform.m
	   - zigzag.m
	   - izigzag.m
      
  3. Evaluation metric: To evaluate the outcomes of each layer and the various test involved in our
     research, run the following files to learn more about our results.
	Make sure all presented files are including on the same folder
	   - print_metrics.m
	   - quantitative_metric.m
	   - hist_analysis.m

## Acknowledgment
----------

## Datasets Links
-------
DIV2K Datasets: https://www.kaggle.com/datasets/joe1995/div2k-dataset/
MISC Dataset: https://github.com/orukundo/Modified-USC-SIPI-Image-Database/

		
