# Color Image Quantization via Peak-Picking in Color Space

This MATLAB project implements an **automatic color quantization** method based on **peak-picking in RGB color histograms**, as proposed in the following paper:

> **Taymaz Akan**  
> *Color image quantization with peak-picking and color space*,  
> Journal of Multimedia Systems, 2020  
> [DOI: 10.1007/s00530-020-00682-5](https://doi.org/10.1007/s00530-020-00682-5)

---

##  Overview

This method performs color quantization in the RGB space by:
1. Computing 1D smoothed histograms per channel.
2. Detecting peaks in each histogram.
3. Creating RGB combinations of these peaks.
4. Filtering out non-existent colors based on a 3D histogram.
5. Assigning each image pixel to its nearest peak color.
6. Reconstructing a quantized image using the mean color of each cluster.

---

## 📂 Project Files

- `main.m` — The main script for quantization and evaluation.
- `Hist3D.m` — Computes the 3D RGB histogram.
- `Gaussian_.m` — Applies Gaussian filtering to a specific color channel.
- `FindPeaks.m` — Detects peak positions in 1D histograms.
- `peaks2vec.m` — Forms RGB peak combinations from channel-wise peaks.
- `im2vec.m` / `Vec2im.m` — Converts image <-> vector.
- `NumUniqColor.m` — Computes the number of unique colors in an image.
- `DrawRGBhist.m` — Plots RGB histograms with peaks.
- `DrawPalette.m` — Visualizes quantized color palette.
- (Ensure all dependencies are in the same folder as `main.m`)

---

## ▶️ How to Run

1. Open MATLAB and navigate to the project folder.
2. Run:
   ```matlab
   main
