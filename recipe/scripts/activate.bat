:: Store existing env vars and set to this conda env
:: so other installs don't pollute the environment.

@if defined UDUNITS2_XML_PATH (
    set "_CONDA_SET_UDUNITS2_XML_PATH=%UDUNITS2_XML_PATH%"
)

@set "UDUNITS2_XML_PATH=%CONDA_PREFIX%\Library\share\udunits\udunits2.xml"
