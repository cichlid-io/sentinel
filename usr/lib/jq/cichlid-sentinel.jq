
def convert(base):
  def stream:
    recurse(if . >= base then ./base|floor else empty end) | . % base ;
  [stream] | reverse
  | if   base <  10 then map(tostring) | join("")
    elif base <= 36 then map(if . < 10 then 48 + . else . + 87 end) | implode
    else error("base too large")
    end;

def lpad(n):
  if (n > length) then ((n - length) * "0") + . else . end;

def oid(timestamp; machine; process; counter):
  {
    "$oid": "\(timestamp | convert(16))\(machine | convert(16) | lpad(6))\(process | convert(16) | lpad(4))\(counter | convert(16) | lpad(6))"
  };
