if [[ "$-" =~ "i" ]]
then
  # Set the prompt to something useful.  GFDL workstations
  # have somewhat cryptic host names (e.g. ldt-1467401).  The
  # output of the gfdl_hostname gives a more useful name.
  # Inlucde that name in the PROMPT.
  PS1="\h:$(gfdl_hostname)[\w] \! > "
  PROMPT_IS_SET=true
fi
