cd ../../maps/coldwar-2bunks

FOR /R %%f IN (*.dmm) DO (
  copy %%f %%f.backup
)

pause
