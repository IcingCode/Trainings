## Nmap Commands[](https://highon.coffee/blog/nmap-cheat-sheet/#nmap-commands)

Basic Nmap scanning command examples, often used at the first stage of enumeration.

| Nmap Command | Description |
| --- | --- |
| nmap -sP &lt;target&gt; | Ping scan to check if the target host is up. |
| nmap -sS &lt;target&gt; | TCP SYN scan to determine open ports on the target system. |
| nmap -sU &lt;target&gt; | UDP scan to determine open UDP ports on the target system. |
| nmap -A &lt;target&gt; | Aggressive scan to identify OS version, software version, and open ports. |
| nmap -O &lt;target&gt; | OS detection to identify the operating system running on the target system. |
| nmap -v &lt;target&gt; | Verbose output to show detailed scan results. |
| nmap -T4 &lt;target&gt; | Set timing template to balance speed and accuracy during the scan. |
| nmap -p &lt;port&gt; &lt;target&gt; | Scan a specific port or range of ports on the target system. |
| nmap -oN &lt;output file&gt; &lt;target&gt; | Output the scan results to a file in normal format. |
| nmap -oX &lt;output file&gt; &lt;target&gt; | Output the scan results to a file in XML format. |

## Nmap scan from file[](https://highon.coffee/blog/nmap-cheat-sheet/#nmap-scan-from-file)

| Nmap Command | Description |
| --- | --- |
| nmap -iL &lt;input file&gt; | Scan targets from a file containing a list of IP addresses or hostnames. |
| nmap -iR &lt;num hosts&gt; | Scan a random selection of &lt;num hosts&gt; hosts from the internet. |
| nmap -iX &lt;input file&gt; | Scan targets from an XML file containing a list of IP addresses or hostnames. |
| nmap -iR &lt;num hosts&gt; –exclude &lt;exclude file&gt; | Scan a random selection of &lt;num hosts&gt; hosts from the internet, excluding those specified in the &lt;exclude file&gt;. |
| nmap -iL &lt;input file&gt; -Pn | Scan targets from a file without pinging them first. |
| nmap -iL &lt;input file&gt; -oA &lt;output file&gt; | Output the scan results to multiple formats (normal, XML, and grepable) for targets in the &lt;input file&gt;. |

These commands can be useful for scanning a large number of targets or for scanning targets listed in an external file or source. It’s important to use Nmap carefully and only on systems that you have permission to scan, as it can potentially cause unintended consequences or trigger security alerts.

### Nmap Nikto Scan[](https://highon.coffee/blog/nmap-cheat-sheet/#nmap-nikto-scan)

| COMMAND | DESCRIPTION |
| --- | --- |
| `nmap -p80 10.0.1.0/24 -oG - \| nikto.pl -h -` | Scans for http servers on port 80 and pipes into Nikto for scanning. |
| `nmap -p80,443 10.0.1.0/24 -oG - \| nikto.pl -h -` | Scans for http/https servers on port 80, 443 and pipes into Nikto for scanning. |

# ====Nmap Cheatsheet====[](https://highon.coffee/blog/nmap-cheat-sheet/#nmap-cheatsheet)[](https://highon.coffee/blog/nmap-cheat-sheet/#what-does-nmap-do)

## Target Specification

Target specification is a critical component of any Nmap scan, as it determines which hosts or networks to scan.

| Switch | Example | Description |
| --- | --- | --- |
| IP address | `nmap 192.168.0.1` | Scan a single IP address |
| Hostname | `nmap example.com` | Scan a single hostname |
| IP range | `nmap 192.168.0.1-20` | Scan a range of IP addresses |
| CIDR notation | `nmap 192.168.0.0/24` | Scan a range of IP addresses using CIDR notation |
| Target list file | `nmap -iL targets.txt` | Read targets from a list file |
| Exclusion | `nmap 192.168.0.0/24 --exclude 192.168.0.1` | Exclude a specific IP address from the scan |
| Random targets | `nmap -iR 10` | Scan 10 random IP addresses |

## **Nmap Scan** **Techniques**

Nmap scan techniques refer to the methods that Nmap uses to scan for open ports and identify the services running on a host.

| Scan Technique | Switch | Example | Description |
| --- | --- | --- | --- |
| TCP SYN scan | `-sS` | `nmap -sS 192.168.0.1` | Also known as “half-open scanning,” this technique sends a SYN packet to the target and waits for a response. If a SYN/ACK packet is received, the port is considered open. If a RST packet is received, the port is considered closed. |
| TCP connect scan | `-sT` | `nmap -sT 192.168.0.1` | This technique completes the full TCP three-way handshake, establishing a connection with the target. If the connection is successful, the port is considered open. If the connection is unsuccessful, the port is considered closed. |
| UDP scan | `-sU` | `nmap -sU 192.168.0.1` | This technique sends UDP packets to the target and waits for a response. If a response is received, the port is considered open. If no response is received, the port is considered closed or filtered. |
| TCP ACK scan | `-sA` | `nmap -sA 192.168.0.1` | This technique sends an ACK packet to the target and waits for a response. If a RST packet is received, the port is considered unfiltered. If no response is received, the port is considered filtered. |
| TCP NULL scan | `-sN` | `nmap -sN 192.168.0.1` | This technique sends a packet with no flags set to the target and waits for a response. If a RST packet is received, the port is considered unfiltered. If no response is received, the port is considered filtered. |
| TCP FIN scan | `-sF` | `nmap -sF 192.168.0.1` | This technique sends a packet with the FIN flag set to the target and waits for a response. If a RST packet is received, the port is considered closed. If no response is received, the port is considered open or filtered. |
| TCP XMAS scan | `-sX` | `nmap -sX 192.168.0.1` | This technique sends a packet with the FIN, URG, and PUSH flags set to the target and waits for a response. If a RST packet is received, the port is considered closed. If no response is received, the port is considered open or filtered. |
| ICMP echo scan | `-PE` | `nmap -PE 192.168.0.1` | This technique sends ICMP echo requests to the target and waits for a response. If a response is received, the target is considered online. |
| ARP scan | `-PR` | `nmap -PR 192.168.0.0/24` | This technique sends ARP requests to the targets and waits for a response. If a response is received, the target is considered online. |

## **Host Discovery**

Host discovery is the process of identifying active hosts on a network. It is the first step in any Nmap scan and is critical for determining which hosts to target. Nmap uses several techniques for host discovery.

| Switch | Example | Description |
| --- | --- | --- |
| Ping scan | `-sn` | `nmap -sn 192.168.0.0/24` |
| TCP SYN ping | `-PS` | `nmap -PS 192.168.0.1` |
| TCP ACK ping | `-PA` | `nmap -PA 192.168.0.1` |
| ICMP echo ping | `-PE` | `nmap -PE 192.168.0.1` |
| ICMP timestamp ping | `-PP` | `nmap -PP 192.168.0.1` |
| ICMP address mask ping | `-PM` | `nmap -PM 192.168.0.1` |
| UDP ping | `-PU` | `nmap -PU 192.168.0.1` |
| ARP ping | `-PR` | `nmap -PR 192.168.0.0/24` |
| IP protocol ping | `-PO` | `nmap -PO 192.168.0.1` |
| SCTP INIT ping | `-PI` | `nmap -PI 192.168.0.1` |

## Script Scan

Script Scan is a feature in Nmap that allows users to execute scripts to gather additional information about the target host or network. This feature is particularly useful for identifying vulnerabilities or misconfigurations on a target system.

| Nmap Script Scan Command | Description |
| --- | --- |
| nmap -sV –script=smb-vuln-* &lt;target&gt; | Scan for SMB vulnerabilities on the target system. |
| nmap -sU –script=dns-recursion &lt;target&gt; | Scan for DNS recursion on the target system. |
| nmap -sV –script=http-enum &lt;target&gt; | Scan for HTTP enumeration on the target system. |
| nmap -sV –script=ftp-proftpd-backdoor &lt;target&gt; | Scan for the ProFTPd backdoor vulnerability. |
| nmap -sV –script=ssl-heartbleed &lt;target&gt; | Scan for the OpenSSL Heartbleed vulnerability. |
| nmap -sV –script=snmp-netstat &lt;target&gt; | Scan for SNMP Netstat information on the target system. |

These are just a few examples of the many script scan options available in Nmap, which can be used to identify vulnerabilities, enumerate services, and gather information about a target system or network. It’s important to use script scans carefully and only on systems that you have permission to scan, as some scripts may cause unintended consequences or trigger security alerts.

In addition to the built-in scripts, users can also create their own scripts or download third-party scripts from the Nmap Scripting Engine (NSE) community. However, it’s important to note that some scripts may be considered intrusive or may trigger security alerts, so it’s essential to use them with caution and only on systems that you have permission to scan.[](https://highon.coffee/blog/nmap-cheat-sheet/#script-scan)

## **Port Specification**

Port specification in Nmap refers to the process of specifying the ports that Nmap should scan on a target host or network. Nmap supports several methods for specifying ports, including:

1.  Single port: Users can specify a single port number to scan, such as `nmap -p 80 targethost.com`.
2.  Port range: Users can specify a range of ports to scan, such as `nmap -p 1-100 targethost.com`.
3.  Multiple ports: Users can specify multiple individual ports to scan, separated by commas, such as `nmap -p 22,80,443 targethost.com`.
4.  Port lists: Users can specify a list of ports to scan, separated by a hyphen, such as `nmap -p 1,3,5,7-10 targethost.com`.
5.  All ports: Users can specify to scan all 65,535 TCP ports using `-p-`, or all 1,024 UDP ports using `-sU -p U:`.

| Switch | Example | Description |
| --- | --- | --- |
| Top ports | `-Top` | `nmap -Top 100 192.168.0.1` |
| Service name | `-p` | `nmap -p http 192.168.0.1` |
| Service and version detection | `-sV` | `nmap -sV 192.168.0.1` |
| Exclude ports | `--exclude-ports` | `nmap --exclude-ports 22,80 192.168.0.1` |
| Random ports | `-r` | `nmap -r 192.168.0.1` |
| Scan all TCP ports | `-sT` | `nmap -sT 192.168.0.1` |
| Scan all UDP ports | `-sU` | `nmap -sU 192.168.0.1` |
| Scan all TCP and UDP ports | `-sS` | `nmap -sS 192.168.0.1` |
| Scan specified protocols | `-sO` | `nmap -sO 192.168.0.1` |
| Scan for firewalls | `-sF` | `nmap -sF 192.168.0.1` |

It’s important to note that scanning all ports or a large number of ports can be time-consuming and may generate a significant amount of network traffic. In addition, some ports may be blocked by firewalls or other security measures, which could cause false positives or negatives in the scan results.

Therefore, it’s recommended to use targeted port scans based on the specific needs of the scan, such as scanning only the ports associated with a particular service or application, or scanning a limited range of ports based on known vulnerabilities or attack vectors.

## **Service and Version Detection**

Service and version detection is a feature in Nmap that allows users to determine the types of services running on the target host or network, as well as the software versions of those services. This information can be valuable for identifying potential vulnerabilities or misconfigurations that could be exploited in a cyberattack.

| Switch | Example | Description |
| --- | --- | --- |
| -sV | nmap -sV target | Enables service and version detection during the scan. |
| –version-intensity | nmap –version-intensity 3 target | Increases the intensity of version detection. Valid options are 0-9, with 9 being the most intense. |
| –version-light | nmap –version-light target | Decreases the intensity of version detection. |
| –version-all | nmap –version-all target | Attempts to detect the version of all services, rather than just the most common ones. |
| –version-trace | nmap –version-trace target | Shows detailed debugging information about the version detection process. |
| –version-db | nmap –version-db /path/to/file target | Specifies a custom file to use as the service and version detection database. By default, Nmap uses its own built-in database. |

## **OS Detection**

OS detection is a feature in Nmap that allows users to determine the operating system running on the target host or network. This information can be valuable for identifying potential vulnerabilities or misconfigurations that could be exploited in a cyberattack.

| Switch | Example | Description |
| --- | --- | --- |
| -O  | nmap -O target | Enables OS detection during the scan. |
| -O1 | nmap -O1 target | Enables OS detection using a more aggressive approach. |
| -O2 | nmap -O2 target | Enables OS detection using an even more aggressive approach. |
| –osscan-guess | nmap –osscan-guess target | Attempts to guess the OS even when there is not enough information for a definitive match. |
| –osscan-limit | nmap –osscan-limit target | Limits the number of OS detection probes sent. |
| –osscan-passive | nmap –osscan-passive target | Enables passive OS detection, which attempts to detect the OS without sending any packets to the target. |

## **Timing and Performance**

Timing and performance are critical factors when using Nmap for network scanning. Nmap provides several options for users to control the timing and performance of their scans, allowing them to balance the need for speed with the risk of detection and accuracy.

| Switch | Example | Description |
| --- | --- | --- |
| -T0 | nmap -T0 target | Sets the timing template to paranoid. This is the slowest and most stealthy option, which can be useful for avoiding detection by network intrusion detection systems (NIDS). |
| -T1 | nmap -T1 target | Sets the timing template to sneaky. This is a slower and more cautious option, which can also be useful for avoiding detection. |
| -T2 (default) | nmap -T2 target | Sets the timing template to polite. This is the default option and balances speed and stealth. It’s usually a good choice for general-purpose scanning. |
| -T3 | nmap -T3 target | Sets the timing template to aggressive. This option increases the speed of the scan and can help to find open ports and services more quickly. |
| -T4 | nmap -T4 target | Sets the timing template to insane. This is the fastest and most aggressive option, which can help to find open ports and services quickly. However, it’s also the most likely to be detected by NIDS or cause performance issues on the target network. It’s not recommended for general-purpose scanning. |
| –max-parallelism | nmap –max-parallelism 100 target | Sets the maximum number of parallel probes to send. This can help to speed up the scan, but can also cause performance issues on the target network. |
| –min-parallelism | nmap –min-parallelism 10 target | Sets the minimum number of parallel probes to send. This can help to avoid overloading the target network, but can also slow down the scan. |
| –min-hostgroup | nmap –min-hostgroup 32 target | Sets the minimum number of hosts to scan at the same time. This can help to balance speed and performance on the target network. |
| –max-hostgroup | nmap –max-hostgroup 256 target | Sets the maximum number of hosts to scan at the same time. This can help to speed up the scan, but can also cause performance issues on the target network. |

Note: When using Nmap for scanning, it’s important to use appropriate timing and performance settings that balance speed and stealth while minimizing the impact on the target network. Always use these settings ethically and with permission from the target network owner.

## **NSE Scripts**

| Switch | Example | Description |
| --- | --- | --- |
| -sC | nmap -sC target | Runs a default set of NSE scripts. |
| -sV | nmap -sV target | Enables version detection and runs version-related NSE scripts. |
| -sU | nmap -sU target | Enables UDP scanning and runs UDP-related NSE scripts. |
| –script | nmap –script=http-enum target | Runs a specific NSE script by name. |
| –script-args | nmap –script-args=passdb.lst target | Specifies arguments to be passed to the NSE script. |
| –script-updatedb | nmap –script-updatedb | Updates the NSE script database. |
| –script-help | nmap –script-help=ftp-anon.nse | Displays help information for a specific NSE script. |
| –script-trace | nmap –script-trace target | Enables script tracing to show detailed information about the scripts being run. |
| –script-trace-all | nmap –script-trace-all target | Enables tracing for all NSE scripts, including ones that are run implicitly. |
| –script-trace-output | nmap –script-trace-output=trace.log target | Specifies a file to output the script tracing information to. |
| –script-args-file | nmap –script-args-file=passdb.lst target | Specifies a file containing arguments to be passed to the NSE script. |
| –script-args-file-append | nmap –script-args-file-append=passdb.lst target | Specifies a file containing arguments to be passed to the NSE script, which are appended to any arguments already specified using –script-args. |
| –script-args-file-remove | nmap –script-args-file-remove=passdb.lst target | Removes arguments from the list of arguments to be passed to the NSE script. |
| –script-args-file-list | nmap –script-args-file-list target | Lists the files containing arguments to be passed to NSE scripts. |
| –script-trace-summary | nmap –script-trace-summary target | Displays a summary of script tracing information. |

## **Useful NSE Script Examples**

| Script Name | Switch | Example | Description |
| --- | --- | --- | --- |
| smb-vuln-ms17-010 | –script smb-vuln-ms17-010 | `nmap -p445 --script smb-vuln-ms17-010 <target>` | Checks for the MS17-010 vulnerability on Windows systems, which was exploited by the WannaCry ransomware. |
| http-vuln-cve2015-1635 | –script http-vuln-cve2015-1635 | `nmap --script http-vuln-cve2015-1635 <target>` | Checks for the HTTP.sys vulnerability on Windows systems. |
| ssl-heartbleed | –script ssl-heartbleed | `nmap --script ssl-heartbleed <target>` | Tests for the Heartbleed vulnerability in SSL/TLS servers. |
| smb-os-discovery | –script smb-os-discovery | `nmap --script smb-os-discovery <target>` | Identifies the operating system of Windows hosts and provides additional information such as workgroup/domain name, system architecture, and SMB version. |
| dns-brute | –script dns-brute | `nmap --script dns-brute <target>` | Performs a brute-force DNS enumeration of subdomains. |
| ftp-anon | –script ftp-anon | `nmap --script ftp-anon <target>` | Checks for anonymous FTP login on FTP servers. |
| ssh2-enum-algos | –script ssh2-enum-algos | `nmap --script ssh2-enum-algos <target>` | Enumerates the supported algorithms on SSH servers. |
| snmp-brute | –script snmp-brute | `nmap --script snmp-brute <target>` | Performs a brute-force enumeration of SNMP community strings. |
| mysql-empty-password | –script mysql-empty-password | `nmap --script mysql-empty-password <target>` | Checks for MySQL servers with empty root passwords. |
| http-title | –script http-title | `nmap --script http-title <target>` | Retrieves the titles of web pages served by HTTP servers. |

Note that these are just a few examples, and there are many more NSE scripts available for various tasks such as service detection, vulnerability scanning, and information gathering. You can use the `--script-help` switch to view the available scripts and their descriptions. Additionally, you can create your own custom scripts using the Lua programming language.

## **Firewall / IDS Evasion and Spoofing**

Firewalls and intrusion detection/prevention systems (IDS/IPS) are designed to detect and prevent unauthorized access to a network or system. To bypass these security measures, attackers may use various techniques to evade or spoof their traffic, such as:

| Technique | Description |
| --- | --- |
| Fragmentation | Breaking up a packet into smaller fragments that can pass through a firewall or IDS/IPS undetected. |
| Source IP address spoofing | Falsifying the source IP address of a packet to make it appear as if it originated from a trusted source. |
| TCP sequence number prediction | Predicting the next sequence number of a TCP connection to hijack it or inject malicious data. |
| Protocol tunneling | Encapsulating traffic within another protocol that is allowed through a firewall or IDS/IPS. |
| Covert channels | Using covert channels to send hidden messages or data within legitimate traffic to avoid detection. |

Nmap has some built-in options and scripts that can be used for firewall/IDS evasion and spoofing. However, it’s important to note that using these techniques without permission is illegal and unethical.

Here are some general examples of how these techniques might be implemented:

| Technique | Example |
| --- | --- |
| Fragmentation | `nmap -f <target>` |
| Source IP address spoofing | `nmap -S <spoofed_IP> <target>` |
| TCP sequence number prediction | `nmap --script tcp-seq-enum <target>` |
| Protocol tunneling | `nmap --data <data> --data-string <protocol> <target>` |
| Covert channels | `nmap --script http-covert-tunnel <target>` |

Again, please note that these techniques should only be used for legitimate security testing purposes with proper authorization and permission.

## **Output**

| Option | Switch | Example | Description |
| --- | --- | --- | --- |
| Verbose output | -v  | `nmap -v <target>` | Enables verbose output, which provides more detailed information about the scan. |
| Output to a file | -oN | `nmap -oN scan_results.txt <target>` | Saves the scan results to a file in normal format. |
| Output to a grepable file | -oG | `nmap -oG scan_results.gnmap <target>` | Saves the scan results to a file in grepable format, which can be used with tools like grep or awk. |
| Output to XML | -oX | `nmap -oX scan_results.xml <target>` | Saves the scan results to an XML file, which can be used for further analysis or processing. |
| Output to HTML | -oA | `nmap -oA scan_results <target>` | Saves the scan results in three formats: normal, grepable, and XML, with a common filename prefix. |
| Output to JSON | -oJ | `nmap -oJ scan_results.json <target>` | Saves the scan results to a JSON file, which can be used for further analysis or processing. |
| Output to Zenmap | –stylesheet | `nmap --stylesheet=zenmap.xml <target>` | Saves the scan results in a format that can be viewed in Zenmap, a graphical user interface for Nmap. |
| Output to a database | -oX | `nmap -oX scan_results.xml --dbfile nmap_db.xml <target>` | Saves the scan results to an XML file and updates a database file with the same information. |

Note that there are many other output options available in Nmap, including options for customizing the output format and specifying output levels. You can view the complete list of options by using the `--help` switch.

## **Miscellaneous Nmap Flags**

| Flag | Switch | Example | Description |
| --- | --- | --- | --- |
| Skip host discovery | -Pn | `nmap -Pn <target>` | Skips the host discovery phase of the scan, assuming that the target host(s) are up. |
| Disable DNS resolution | -n  | `nmap -n <target>` | Disables DNS resolution during the scan, which can speed up the scan for targets with slow or unresponsive DNS servers. |
| Treat all hosts as online | -P0 | `nmap -P0 <target>` | Treats all hosts as online, regardless of whether they respond to ping requests or other probes. |
| Disable port scanning | -sn | `nmap -sn <target>` | Performs a host discovery scan only, without port scanning. |
| Timing template | -T  | `nmap -T4 <target>` | Specifies a timing template for the scan, which controls the speed and aggressiveness of the scan. |
| Randomize target order | -r  | `nmap -r <target>` | Randomizes the order in which targets are scanned, which can help evade some IDS/IPS systems. |
| Limit rate of sending probes | –max-rate | `nmap --max-rate 100 <target>` | Limits the rate at which Nmap sends probes, which can help avoid network congestion or triggering IDS/IPS alarms. |
| Trace packets | –packet-trace | `nmap --packet-trace <target>` | Enables packet tracing during the scan, which shows the raw packets sent and received during the scan. |
| Stop the scan early | Ctrl+C | `nmap <target> [Ctrl+C]` | Stops the scan early by sending an interrupt signal to Nmap, which can be useful if the scan is taking too long or if the user needs to exit the scan. |
