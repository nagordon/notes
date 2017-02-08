def image_resize():
    """ This program does not use this but may be needed
        picnames ia a list of the full path of images
        do not recommend using this, change the picture size in the AbaqusReportTool function by adjusting
            AbaqusReportTool.VP_edit(myView='Iso', vp_width=225, replaceKeyword = '')
    """
    import glob
    from PIL import Image
    import os

    picnames = glob.glob('*.png')		
    for picname in picnames:
        im1 = Image.open(picname)
        imgscale = 0.1
        width,height = im1.size
        newsize = (int(width*imgscale), int(height*imgscale))
        im1 = im1.resize(newsize, Image.ANTIALIAS)
        os.remove(picname)
        im1.save(picname)
        
image_resize()
