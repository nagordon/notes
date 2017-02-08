# -*- mode: python -*-
a = Analysis(['combine.py'],
             pathex=['C:\\Users\\neal\\Documents\\PyGUIs\\PySide\\Qt_Tutorials\\combine_all\\design2'],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=None)
pyz = PYZ(a.pure)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='combine.exe',
          debug=False,
          strip=None,
          upx=True,
          console=True )
