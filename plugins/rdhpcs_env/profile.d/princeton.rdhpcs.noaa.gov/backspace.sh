if [[ "$-" =~ "i" ]]
then
  # Settings for interactive sessions only to be done here
  # Correct the backspace key
  stty erase ^?
fi

