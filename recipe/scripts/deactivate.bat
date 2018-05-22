@REM Restore previous env vars if they were set.

@set "UDUNITS2_XML_PATH="
@if defined _CONDA_SET_UDUNITS2_XML_PATH (
  set "UDUNITS2_XML_PATH=%_CONDA_SET_UDUNITS2_XML_PATH%"
  set "_CONDA_SET_UDUNITS2_XML_PATH="
)
