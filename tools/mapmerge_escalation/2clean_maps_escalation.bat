cd ../../maps/coldwar-2bunks

FOR /R %%f IN (*.dmm) DO (
  java -jar ../../tools/mapmerge_escalation/MapPatcher.jar -clean %%f.backup %%f %%f
)

pause
