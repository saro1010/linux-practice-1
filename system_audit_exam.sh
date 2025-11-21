mkdir -p ~/exam_results/audit/
cd exam_results/audit/
echo "#empty note" >> notes.txt
echo "#current directory" > cwd.txt
pwd >> cwd.txt 
echo "#usernames" > users.txt
cut -d: -f1 /etc/passwd >> users.txt 
echo "#users with /bin/bash" >> bash_users.txt
grep '/bin/bash' /etc/passwd | cut -d: -f1 >> bash_users.txt 
echo "#preview for replacing /usr/bin/zsh instead of bash" > shell_preview.txt
head -n 5 /etc/passwd | sed "s#bin/bash#/usr/bin/zsh#g" >> shell_preview.txt 
echo "#system info and kernel name and kernel version and architecture" > sysinfo.txt
uname -s >> sysinfo.txt 
uname -r >> sysinfo.txt 
arch >> sysinfo.txt 
echo "#/etc/group first 2 line and last 3 line" > group_summmary.txt
head -n 2 /etc/group >> group_summmary.txt && echo "---------" >> group_summmary.txt && tail -n 3 /etc/group >> group_summmary.txt 
clear
echo "#.conf files in /etc" > conf_files.txt
find /etc -type f -name "*.conf" >> conf_files.txt 
sudo find /etc -type f -name "*.conf" >> conf_files.txt 
echo "#top 10 big files in /var/log" > top_logs.txt
sudo du -ah /var/log 2>/dev/null | grep -v "/$" | sort -rh | head -n 10 >>top_logs.txt 
clear
cp /etc/hosts ./hosts.bak
chmod 600 hosts.bak 
ls -l hosts.bak > hosts_perm.txt
