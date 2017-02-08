# -*- mode: python -*-

block_cipher = None


a = Analysis(['combine.py'],
             pathex=['C:\\Users\\ngordon\\Desktop\\PyGUIs\\PySide\\combine_bits\\design1'],
             hiddenimports=[],
             hookspath=None,
             runtime_hooks=None,
             cipher=block_cipher)
pyz = PYZ(a.pure,
             cipher=block_cipher)
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
