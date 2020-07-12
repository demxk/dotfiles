function select
  read --local --array --null arr
  echo $arr[$argv]
end
