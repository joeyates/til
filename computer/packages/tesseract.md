# Other

http://www.free-ocr.com/

# Training

## Setup

* libicu-dev
* libpango1.0-dev
* libcairo2-dev

https://github.com/tesseract-ocr/tesseract/wiki/TrainingTesseract-4.00

# Font Training

* https://github.com/tesseract-ocr/tesseract/wiki/Fonts
  * package: tesseract-ocr
* BBC Micro font: https://fontstruct.com/fontstructions/show/63444


First attempt:
$ tesseract images/LEXIS-10-182.png ocr/lexis

Indicate page segmentation mode:
$ tesseract images/LEXIS-10-182.png ocr/lexis --psm 6
