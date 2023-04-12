# Images

Images are copied to the SD card using fwup

# Networking

VintageNetWiFi.quick_configure("ssid", "password")

or use nerves_init_gadget

# Modules

Nerves.Runtime.KV.get_all

# Libraries

# nerves_init_gadget

## Network

Ethernet with DHCP:

```elixir
config :nerves_init_gadget,
  node_name: :my_node,
  mdns_domain: "my_host.local",
  address_method: :dhcp,
  ifname: "eth0",
  regulatory_domain: "IT"
```
Static via ethernet:

```elixir
config :nerves_init_gadget,
  node_name: :my_node,
  mdns_domain: "my_host.local",
  address_method: :static,
  ifname: "eth0",
  regulatory_domain: "IT"

config :nerves_network, :default,
  eth0: [
    ipv4_address_method: :static,
    ipv4_address: "192.168.0.45", ipv4_subnet_mask: "255.255.255.0",
    nameservers: ["1.1.1.1", "8.8.4.4"]
  ]
```

Wireless:

```elixir
config :nerves_init_gadget,
  node_name: :my_node,
  mdns_domain: "my_host.local",
  address_method: :dhcp,
  ifname: "wlan0",
  regulatory_domain: "IT"

config :nerves_network, :default,
  wlan0: [
    ssid: "my-ssid",
    psk: "my-passphrase",
    key_mgmt: :"WPA-PSK"
  ]
```

Wireless with no authentication:

```elixir
config :nerves_init_gadget,
  node_name: :my_node,
  mdns_domain: "my_host.local",
  address_method: :dhcp,
  ifname: "wlan0",
  regulatory_domain: "IT"

config :nerves_network, :default,
  wlan0: [
    ssid: "tplink-eap",
    key_mgmt: :NONE
  ]
```
