# Linux Processes & Services – Week 1

## Concepts Learned

- Process = running program
- PID = unique process identifier
- PID 1 = systemd (init system)
- Daemon = background process
- Service = systemd-managed daemon
- Unit file = configuration file for a service
- CGroup = kernel feature to group and limit processes
- Signal = software interrupt sent to a process

## Commands Practiced

ps aux
ps -p 1
systemctl status ssh
systemctl stop ssh
systemctl start ssh
journalctl -u ssh
kill <PID>

## Observations

- PID 1 was systemd
- ssh.service was active (running)
- SSH was listening on 0.0.0.0:22
- Ctrl+C sends SIGINT
- systemctl shows runtime + configuration state
