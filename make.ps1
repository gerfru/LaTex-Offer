# Build Script for Windows
# Precondition: MikTex or other Tex-Distribution installed

Clear-Host

$fileToCheck = "Offer_XX"
$fileToGen = $fileToCheck + ".tex"
$fileToOpen = $fileToCheck + ".pdf"

#function GeneratePDF {
    "--- Generation started, please wait --- "
    pdflatex $fileToGen #| Out-Null
    "--- PDF finished ---"
    "--- Generate BiB ---"
    bibtex $fileToCheck | Out-Null
    "--- BiB finished ---"
    "--- Generate PDF Package ---"
    pdflatex $fileToGen | Out-Null
    pdflatex $fileToGen | Out-Null
    
    "--- Clean up Folder ---"
    Remove-Item * -Include *.aux, *.log, *.backup, *.bak, *.lof, *.dvi, *.out, *.gz, *.fls, *.bbl, *.blg, *.xml, *.toc, *bcf, *.fdb_latexmk, *.tdo, *.ptc, *.idx
    
    "--- Done, that was hell of a work. I'll open the PDF for you ---"
    if (Test-Path $fileToOpen -PathType leaf) {  
        Start-Process $fileToOpen
        }
    else {
        "Uff something went wrong. Maybe during Compiling. Sorry Bro / Sis."
        }
#    }