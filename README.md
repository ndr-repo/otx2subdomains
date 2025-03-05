# otx2subdomains - Passive subdomain discovery via LevelBlue OTX

## Disclaimer

- otx2subdomains is a passive asset discovery scanner. This means it does not interact with the target domain or its hosts while performing a scan. 
- This is done via the free OTX API and validated using Google's public DoH (DNS over HTTPS) resolvers.
- If you decide to interact with a host following a scan, it is **your responsibility** to verify you have the proper jurisdiction. 

**I am not responsible for any legal or criminal proceedings filed against you for using this tool.**

## Getting Started
otx2subdomains is written for Windows and has a few dependencies from [GnuWin32](https://gnuwin32.sourceforge.net/).

Luckily, I wrote a tool for installing everything you need. You can run these scripts [from source](https://github.com/ndr-repo/gnuwin32_Scan-Download/), or use the [compiled executable binary](https://github.com/ndr-repo/gnuwin32_Scan-Download/releases/tag/v1.0.0).

If you would like to download the dependencies ad-hoc, you'll need to install gawk from [here](https://gnuwin32.sourceforge.net/packages/gawk.htm) and grep from [here](https://gnuwin32.sourceforge.net/packages/grep.htm).

**Quickstart Steps**:
1. Download and run my compiled installer for grep, sed, & awk dependancies
2. Verify the tools are added to your [environment variables](https://www.howtogeek.com/787217/how-to-edit-environment-variables-on-windows-10-or-11/)
3. Clone the otx2subdomains repository
4. Run otx2subdomains. If you are having issues accessing the dependencies from your environment vars, verify they are set and reboot your machine.

## Support
- If you find use from this, consider supporting my work on [Ko-fi](https://ko-fi.com/weekndr_sec). 
- As of this release, I'm currently consulting full-time and get paid by the project, not by my time.
