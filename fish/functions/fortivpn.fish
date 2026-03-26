function fortivpn --wraps='forticlient-cli vpn' --description 'alias fortivpn forticlient-cli vpn'
    forticlient-cli vpn $argv
end
