
#Option 1 - saveas in MS Word

saveas docx to html

saveas docx to rtf and then use rtf2latex2e


#Option 2 - Antiword

```bash
sudo apt-get install antiword
```

```bash

antiword ../myReport.doc > myReport.txt  

pandoc -o myReport.tex myReport.txt  

```

word2lyx

word2tex

# Option 3 - Export Using LibreOffice
Open in Libreoffice and export as odt and then tex

```
sudo apt-get install writer2latex


loffice --headless --convert-to odt msword.doc && cp msword.odt loffice.odt

w2l -ultraclean loffice.odt tweak_this.tex


```

# Conclusion

For any document that has a reasonable amount of complexity, ie figures, tables, equations, and references, there are no good conversion options. 