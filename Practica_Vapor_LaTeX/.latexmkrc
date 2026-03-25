$out_dir = 'out.nosync';
$pdf_mode = 1;
$bibtex_use = 2;

# Comando compatible con Windows para copiar el archivo
$post_process_pdf = 'cmd /c copy /y out.nosync\\%b.pdf .\\%b.pdf';
