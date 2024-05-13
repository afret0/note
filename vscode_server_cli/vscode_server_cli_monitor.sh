#!/bin/bash

# 设置内存和CPU的使用上限
MAX_CPU_USAGE=80  # CPU使用率上限，单位为%
MAX_MEM_USAGE=3145728  # 内存使用上限，单位为KB (3GB)

# 日志文件位置
LOG_FILE="/var/log/vscode-server-monitor.log"

# 获取VSCode Server CLI的进程ID
function get_vscode_pid {
    pgrep -f 'server-main.js' | head -n 1
}

# 启动VSCode Server CLI
function start_vscode_server {
    ulimit -u $MAX_CPU_USAGE
    ulimit -m $MAX_MEM_USAGE
    code -t tunnel &
    echo "[$(date)] VSCode Server CLI started with resource limits." | tee -a $LOG_FILE
}

# 检查并管理VSCode Server CLI的资源使用
function check_and_manage_resources {
    local VSCODE_PID=$(get_vscode_pid)

    if [[ ! -z "$VSCODE_PID" ]]; then
        # 获取当前CPU和内存使用情况
        read CPU_USAGE MEM_USAGE < <(ps -p $VSCODE_PID -o %cpu,rss --no-headers)

        # 记录当前使用情况
        echo "[$(date)] CPU Usage: $CPU_USAGE%, Memory Usage: $MEM_USAGE KB" | tee -a $LOG_FILE

        # 检查是否超出设定的上限
        if (( $(echo "$CPU_USAGE > $MAX_CPU_USAGE" | awk '{print ($1 > $2)}') )) || [[ "$MEM_USAGE" -gt "$MAX_MEM_USAGE" ]]; then
            echo "[$(date)] Exceeded resource limits. Restarting VSCode Server CLI..." | tee -a $LOG_FILE
            # 重启VSCode Server CLI
            if ! kill -9 $VSCODE_PID; then
                echo "[$(date)] Failed to kill process $VSCODE_PID. Retrying..." | tee -a $LOG_FILE
                kill -9 $VSCODE_PID
            fi
            sleep 2  # 等待进程完全停止
            start_vscode_server
        fi
    else
        echo "[$(date)] VSCode Server CLI is not running. Starting..." | tee -a $LOG_FILE
        start_vscode_server
    fi
}

# 主循环，每分钟检查一次
while true; do
    check_and_manage_resources
    sleep 30
done
