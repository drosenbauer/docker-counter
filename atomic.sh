# From https://gist.github.com/buger/617fe26794c4358460ce69864a61b8a9, thanks @buger

lock() {
  if mkdir $1 &> /dev/null; then
    return 0
  else
    r=$(($2 + 0))
    # timeout after 5 retries
    if [ "$r" -gt "5" ]; then
      echo "Lock failed:" $1
      return 1
    fi

    sleep 0.1
    lock $1 $(($2 + 1))
    return $?
  fi
}

unlock(){
  rm -rf $1
}


lock /tmp/counter-lock

c=$(cat /tmp/counter 2> /dev/null)
c=$((c + 0)) # if counter is empty, initialize it
echo $((c+1)) > /tmp/counter

unlock /tmp/counter-lock

cat /tmp/counter
