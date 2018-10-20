let log2int n = 
  let count = ref 0 and v = ref n in 
  while !v > 1 do
    count := !count + 1;
    v := !v/2
  done;
  !count;;

log2int 16;;
log2int 1024;;
log2int 1000000;;
