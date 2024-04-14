#!/bin/bash

# 定义变量file
file="scan"

# 判断文件是否存在
if [ ! -f "$file" ]; then
    echo "该文件不存在"
else
    # 文件存在，判断文件是否有可执行权限
    if [ -x "$file" ]; then
        # 有可执行权限，执行文件
        ./"$file"
    else
        # 没有可执行权限，尝试添加权限
        chmod 777 "$file" || {
            echo "给予权限失败，正在将文件复制到/data/scan目录..."
            # 复制文件到/data/scan目录
            cp "$file" /data/scan || {
                echo "复制文件失败"
                exit 1
            }
            # 在/data/scan目录下给文件添加可执行权限
            chmod 777 /data/scan || {
                echo "给予权限失败"
                exit 1
            }
            # 执行/data/scan目录下的文件
            /data/scan
        }
         ./"$file"
    fi
fi