# 使用适当的基础镜像，例如 PHP 和 Apache
FROM php:7.4-apache

# 安装额外的 PHP 扩展
RUN docker-php-ext-install pdo pdo_mysql

# 启用 Apache mod_rewrite
RUN a2enmod rewrite

# 复制 DzzOffice 项目文件到容器内的 Web 根目录
COPY ./dzzoffice /var/www/html

# 设置工作目录
WORKDIR /var/www/html

# 给所需目录设置权限
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# 暴露服务端口（通常是 80）
EXPOSE 80

# 启动 Apache
CMD ["apache2-foreground"]
