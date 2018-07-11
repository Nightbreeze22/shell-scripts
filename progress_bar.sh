#!/bin/sh
MAX_ITERATIONS=10
WHILE_ITERATOR=0
while [ $WHILE_ITERATOR -le $MAX_ITERATIONS ]

# __Add call to process checking script here.__

do
  # Appending hashtags to progress bar string.
  PROGRESS_BAR="["
  HASHTAGS=$WHILE_ITERATOR
  HASHTAGS_ITERATOR=0
  while [ $HASHTAGS_ITERATOR -le $HASHTAGS ]
  do

    # Accounting for first pass through outer loop.
    if [ $WHILE_ITERATOR -eq 0 ]; then
    PROGRESS_BAR+=" #"
    else
    PROGRESS_BAR+="#"
    fi
    HASHTAGS_ITERATOR=$((HASHTAGS_ITERATOR+1))
  done

  # Appending trailing spaces to progress bar string.
  SPACES=$((MAX_ITERATIONS-WHILE_ITERATOR-1))
  SPACES_ITERATOR=0
  while [ $SPACES_ITERATOR -le $SPACES ]
  do
    PROGRESS_BAR+=" "
    SPACES_ITERATOR=$((SPACES_ITERATOR+1))
  done

  # Closing progress bar screen and adding return esc char.
  PROGRESS_BAR+="]\r"

  # Setting echo -n to run properly on Unix & Mac
  if [ "`echo -n`" = "-n" ]; then
  n=""
  c="\c"
  else
  n="-n"
  c=""
  fi

  # Print the progress bar without \n; reprints in place.
  echo $n "$PROGRESS_BAR" $c
  sleep 1
  WHILE_ITERATOR=$((WHILE_ITERATOR+1))
done

# Print final iteration of progress bar string.
echo "$PROGRESS_BAR"
