netsh interface tcp set global autotuning=high
netsh int ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Ethernet" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh int ipv4 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh int ipv6 set subinterface "Bluetooth" mtu=1500 store=persistent
netsh interface ipv4 show subinterfaces
netsh interface ipv6 show subinterfaces
timeout /t 30